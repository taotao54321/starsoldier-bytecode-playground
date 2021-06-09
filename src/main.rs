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
        zoom: vec2(w.recip(), h.recip()),
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

    macro_rules! load_preset {
        () => {{
            let preset = &playground::ENEMY_GROUP_PRESETS[preset_idx.unwrap()];
            sprite_idx_base_str = format!("{:#04X}", preset.sprite_idx_base);
            assembly = preset.assembly.to_owned();
        }};
    }

    macro_rules! build_enemy_spawner {
        () => {{
            macro_rules! unwrap_or_break {
                ($res:expr, $msg:expr) => {{
                    if let Err(e) = $res {
                        break Err(format!("{}: {}", $msg, e));
                    }
                    $res.unwrap()
                }};
            }
            loop {
                let sprite_idx_base = unwrap_or_break!(
                    parse_int::parse::<u8>(&sprite_idx_base_str),
                    "cannot parse sprite index base"
                );
                let program =
                    unwrap_or_break!(bytecode::asm(assembly.as_bytes()), "assemble failed");
                let enemy = playground::EnemyInit {
                    sprite_idx_base,
                    program,
                    boss: false,
                    difficulty: 1,
                    shot_with_rank: false,
                    accel_shot_with_rank: false,
                    homing_shot_with_rank: false,
                    extra_act_with_rank: false,
                    accel_with_rank: false,
                    rank: 0,
                    x: 0,
                    y: 0,
                }
                .init(0);
                break Ok(enemy);
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

                ui.input_text(hash!(), "<- sprite base", &mut sprite_idx_base_str);
                ui.editbox(hash!(), vec2(500., 500.), &mut assembly);

                if ui.button(None, "Play") {
                    match build_enemy_spawner!() {
                        Ok(enemy) => enemys.push(enemy),
                        Err(e) => warn!("{}", e),
                    }
                }
            });

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
