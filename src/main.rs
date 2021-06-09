use macroquad::prelude::*;
use macroquad::ui::{hash, root_ui, widgets};

use starsoldier_bytecode as bytecode;

use starsoldier_bytecode_playground as playground;

fn set_render_target_camera(rt: RenderTarget) {
    let w = rt.texture.width();
    let h = rt.texture.height();

    set_camera(&Camera2D {
        target: vec2(w / 2., h / 2.),
        offset: vec2(0., 0.),
        zoom: vec2(1. / w * 2., 1. / h * 2.),
        rotation: 0.,
        render_target: Some(rt),
    });
}

fn window_conf() -> Conf {
    Conf {
        window_title: "Star Soldier bytecode playground".to_owned(),
        window_width: 1024,
        window_height: 768,
        ..Default::default()
    }
}

#[macroquad::main(window_conf)]
async fn main() -> eyre::Result<()> {
    let mut game = playground::Game::default();
    let mut spawner = None;
    let mut enemys = vec![];

    let screen = render_target(256, 240);

    let preset_variants = make_preset_variants();
    let preset_variants = preset_variants
        .iter()
        .map(AsRef::as_ref)
        .collect::<Vec<_>>();
    let mut preset_idx = Some(0);

    let mut sprite_idx_base_str: String;
    let mut assembly: String;
    let mut spawn_interval_str: String;
    let mut spawn_count_str: String;
    let mut entrypoints_str: String;
    let mut rank_str = "0".to_owned();

    macro_rules! load_preset {
        () => {{
            let preset = &playground::ENEMY_GROUP_PRESETS[preset_idx.unwrap()];
            sprite_idx_base_str = format!("{:#04X}", preset.sprite_idx_base);
            assembly = preset.assembly.to_owned();
            spawn_interval_str = preset.spawn_interval.to_string();
            spawn_count_str = preset.spawn_count.to_string();
            entrypoints_str = entrypoints_format(preset.entrypoints);
        }};
    }

    macro_rules! build_enemy_spawner {
        () => {{
            macro_rules! try_ {
                ($res:expr, $msg:expr) => {{
                    if let Err(e) = $res {
                        break Err(format!("{}: {}", $msg, e));
                    }
                    $res.unwrap()
                }};
            }
            loop {
                let spawn_interval = try_!(
                    parse_int::parse::<usize>(&spawn_interval_str),
                    "cannot parse spawn interval"
                );
                let spawn_count = try_!(
                    parse_int::parse::<usize>(&spawn_count_str),
                    "cannot parse spawn count"
                );
                let entrypoints = try_!(
                    entrypoints_parse(&entrypoints_str, spawn_count),
                    "entrypoints error"
                );
                let sprite_idx_base = try_!(
                    parse_int::parse::<u8>(&sprite_idx_base_str),
                    "cannot parse sprite index base"
                );
                let program = try_!(bytecode::asm(assembly.as_bytes()), "assemble failed");
                let rank = try_!(rank_parse(&rank_str), "cannot parse rank");
                let enemy_init = playground::EnemyInit {
                    sprite_idx_base,
                    program,
                    boss: false,
                    difficulty: 1,
                    shot_with_rank: false,
                    accel_shot_with_rank: false,
                    homing_shot_with_rank: false,
                    extra_act_with_rank: false,
                    accel_with_rank: false,
                    rank,
                    x: 0,
                    y: 0,
                };
                break Ok(playground::EnemySpawner::new(
                    spawn_interval,
                    spawn_count,
                    &entrypoints,
                    enemy_init,
                ));
            }
        }};
    }

    load_preset!();

    loop {
        clear_background(GRAY);

        widgets::Window::new(hash!(), vec2(512., 0.), vec2(512., 768.))
            .label("Control")
            .titlebar(true)
            .ui(&mut *root_ui(), |ui| {
                // preset
                ui.combo_box(
                    hash!(),
                    "<- presets", // XXX: ラベルが空だと項目リストが正しく表示されない?
                    &preset_variants,
                    &mut preset_idx,
                );
                if ui.button(None, "Load Preset") {
                    load_preset!();
                }
                ui.separator();

                // enemy init
                ui.input_text(hash!(), "<- sprite base", &mut sprite_idx_base_str);
                ui.editbox(hash!(), vec2(500., 500.), &mut assembly);

                // spawn
                ui.input_text(hash!(), "<- spawn interval", &mut spawn_interval_str);
                ui.input_text(hash!(), "<- spawn count", &mut spawn_count_str);
                ui.input_text(hash!(), "<- entrypoints", &mut entrypoints_str);
                ui.separator();

                // env
                ui.input_text(hash!(), "<- rank", &mut rank_str);

                if ui.button(None, "Play") {
                    match build_enemy_spawner!() {
                        Ok(inner) => spawner = Some(inner),
                        Err(e) => warn!("{}", e),
                    }
                    enemys.clear();
                }
            });

        if let Some(inner) = spawner.as_mut() {
            if let Some(enemy) = inner.step() {
                enemys.push(enemy);
            }
        }

        for enemy in &mut enemys {
            enemy.step(&mut game)?;
        }
        enemys.retain(|enemy| matches!(enemy.state(), bytecode::EnemyState::Alive));

        set_render_target_camera(screen);

        clear_background(BLACK);
        for enemy in &enemys {
            let tex = playground::ENEMY_SPRITES[usize::from(enemy.sprite_index())];
            draw_texture(tex, enemy.x().into(), enemy.y().into(), WHITE);
        }

        set_default_camera();

        draw_texture_ex(
            screen.texture,
            0.,
            0.,
            WHITE,
            DrawTextureParams {
                dest_size: Some(vec2(512., 480.)),
                ..Default::default()
            },
        );

        next_frame().await;
    }
}

fn make_preset_variants() -> Vec<String> {
    playground::ENEMY_GROUP_PRESETS
        .iter()
        .map(|e| format!("{:#04X} {}", e.id, e.name))
        .collect()
}

fn entrypoints_format(entrypoints: &[usize]) -> String {
    itertools::join(entrypoints, ", ")
}

fn entrypoints_parse(entrypoints_str: &str, count: usize) -> eyre::Result<Vec<usize>> {
    let entrypoints = entrypoints_str
        .split(',')
        .map(|s| parse_int::parse::<usize>(s.trim()))
        .collect::<Result<Vec<_>, _>>()?;
    eyre::ensure!(entrypoints.len() == count, "entrypoint count mismatch");

    Ok(entrypoints)
}

fn rank_parse(rank_str: &str) -> eyre::Result<u8> {
    const RANGE: std::ops::RangeInclusive<u8> = 0..=7;

    let rank = parse_int::parse::<u8>(rank_str)?;
    eyre::ensure!(RANGE.contains(&rank), "rank must be within {:?}", RANGE);

    Ok(rank)
}
