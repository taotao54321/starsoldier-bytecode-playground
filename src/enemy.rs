use starsoldier_bytecode as bytecode;

use crate::game::Game;

#[derive(Debug)]
pub struct EnemySpawner {
    spawn_interval: usize,
    spawn_timer: usize,
    spawn_remain: usize,
    entrypoints: Vec<usize>,

    enemy_init: EnemyInit,
}

impl EnemySpawner {
    pub fn new(
        interval: usize,
        count: usize,
        entrypoints: &[usize],
        enemy_init: EnemyInit,
    ) -> Self {
        assert_eq!(count, entrypoints.len());

        Self {
            spawn_interval: interval,
            spawn_timer: interval,
            spawn_remain: count,
            entrypoints: entrypoints.to_vec(),

            enemy_init,
        }
    }

    pub fn step(&mut self) -> Option<Enemy> {
        if self.spawn_remain == 0 {
            return None;
        }

        if self.spawn_timer > 0 {
            self.spawn_timer -= 1;
            return None;
        }

        let pc = self.entrypoints[self.entrypoints.len() - self.spawn_remain];

        self.spawn_timer = self.spawn_interval;
        self.spawn_remain -= 1;

        Some(self.enemy_init.init(pc))
    }
}

#[derive(Debug)]
pub struct EnemyInit {
    pub sprite_idx_base: u8,

    pub program: Vec<u8>,

    pub boss: bool,
    pub difficulty: u8,
    pub shot_with_rank: bool,
    pub accel_shot_with_rank: bool,
    pub homing_shot_with_rank: bool,
    pub extra_act_with_rank: bool,
    pub accel_with_rank: bool,
    pub rank: u8,

    pub x: u8,
    pub y: u8,
}

impl EnemyInit {
    pub fn init(&self, pc: usize) -> Enemy {
        Enemy {
            sprite_idx_base: self.sprite_idx_base,

            interp: bytecode::InterpreterInit {
                program: self.program.clone(),
                pc,

                boss: self.boss,
                difficulty: self.difficulty,
                shot_with_rank: self.shot_with_rank,
                accel_shot_with_rank: self.accel_shot_with_rank,
                homing_shot_with_rank: self.homing_shot_with_rank,
                extra_act_with_rank: self.extra_act_with_rank,
                accel_with_rank: self.accel_with_rank,
                rank: self.rank,

                x: self.x,
                y: self.y,
            }
            .init(),
        }
    }
}

#[derive(Debug)]
pub struct Enemy {
    sprite_idx_base: u8,

    interp: bytecode::Interpreter,
}

impl Enemy {
    pub fn step(&mut self, game: &mut Game) -> bytecode::InterpretResult<()> {
        self.interp.step(game)
    }

    pub fn damage(&mut self, game: &mut Game) {
        self.interp.damage(game);
    }

    pub fn state(&self) -> bytecode::EnemyState {
        self.interp.state()
    }

    pub fn x(&self) -> u8 {
        self.interp.x()
    }

    pub fn y(&self) -> u8 {
        self.interp.y()
    }

    pub fn sprite_index(&self) -> u8 {
        self.sprite_idx_base + self.interp.sprite_index()
    }
}
