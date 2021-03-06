use starsoldier_bytecode as bytecode;

#[rustfmt::skip]
const RNG_TABLE: [u8; 0x80] = [
    // {{{
    0x1D, 0x9B, 0x9C, 0x2D, 0xD0, 0x54, 0xAF, 0x3E, 0xBF, 0x91, 0x11, 0xCF, 0x75, 0x1F, 0x6D, 0x02,
    0x19, 0x12, 0xE4, 0x2A, 0xA8, 0xB6, 0x7F, 0x86, 0xE9, 0xEE, 0x4D, 0x9C, 0xE5, 0x8E, 0xE0, 0xB8,
    0x80, 0x6F, 0x87, 0x1A, 0xA1, 0x57, 0xA8, 0xD5, 0xB1, 0xE9, 0xA0, 0x73, 0x6C, 0x31, 0x50, 0xD2,
    0x25, 0x92, 0xB0, 0xD9, 0x82, 0x1D, 0x66, 0xFB, 0x0D, 0x94, 0xB8, 0x9D, 0x7B, 0xB1, 0x87, 0xDA,
    0xB1, 0x61, 0x9E, 0x3A, 0x37, 0x11, 0x6F, 0x5A, 0x1E, 0x47, 0x74, 0x95, 0x0D, 0x1A, 0x57, 0x2C,
    0x89, 0x44, 0xED, 0x83, 0x45, 0xE0, 0x9D, 0x6A, 0xE1, 0x1B, 0x5B, 0x8C, 0xD5, 0x5B, 0xBF, 0x7A,
    0xE3, 0xA7, 0x4D, 0xEF, 0x63, 0x5D, 0x65, 0x36, 0xAF, 0x70, 0x34, 0xE5, 0x34, 0xC7, 0xB7, 0x49,
    0xA3, 0x7C, 0xAB, 0x2A, 0xE0, 0xFD, 0x3E, 0xDC, 0x7C, 0x68, 0x71, 0xBA, 0x20, 0x97, 0x74, 0x73,
    // }}}
];

#[derive(Debug)]
pub struct Game {
    pub second_round: bool,
    pub stage: u8,

    pub hero_x: u8,
    pub hero_y: u8,

    pub rng_idx: u8,
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
        let res = RNG_TABLE[usize::from(self.rng_idx & 0x7F)];
        self.rng_idx = self.rng_idx.wrapping_add(1);
        res
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

            rng_idx: 0,
        }
    }
}
