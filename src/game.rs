use starsoldier_bytecode as bytecode;

#[derive(Debug)]
pub struct Game {
    pub second_round: bool,
    pub stage: u8,

    pub hero_x: u8,
    pub hero_y: u8,

    pub rand_idx: u8,
}

impl bytecode::Game for Game {
    fn is_second_round(&self) -> bool {
        self.second_round
    }
    fn stage(&self) -> u8 {
        self.stage
    }

    fn hero_x(&self) -> u8 {
        self.hero_x
    }
    fn hero_y(&self) -> u8 {
        self.hero_y
    }

    fn rand(&mut self) -> u8 {
        // TODO
        0
    }

    fn try_shoot_aim(&mut self, _x: u8, _y: u8, _speed_mask: u8, _force_homing: bool) {
        // TODO
    }

    fn restore_music(&mut self) {
        // TODO
    }
    fn play_sound(&mut self, _sound: u8) {
        // TODO
    }
}

impl Default for Game {
    fn default() -> Self {
        Game {
            second_round: false,
            stage: 1,

            hero_x: 120,
            hero_y: 200,

            rand_idx: 0,
        }
    }
}
