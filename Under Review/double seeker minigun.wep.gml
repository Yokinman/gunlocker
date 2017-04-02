#define init
global.sprDoubleSeekerMinigun = sprite_add_weapon("../Sprites/Seeker/DoubleSeekerMinigun.png", 5, 5);

#define weapon_name
return "DOUBLE SEEKER MINIGUN"; // Name 

#define weapon_type
return 3; // Bolt Wep

#define weapon_cost
return 2; // 1 Ammo

#define weapon_area
return 14; // L0 7-2+

#define weapon_load
return 4; // 0.13 Seconds

#define weapon_sprt
return global.sprDoubleSeekerMinigun; // Wep Sprite

#define weapon_swap
return sndSwapBow; // Swap Sound

#define weapon_auto
return 1; // Automatic

#define weapon_fire
 // Sound:
sound_play(sndSeekerPistol);

weapon_post(8, -15, 5);

repeat(4) {
	with(instance_create(x, y, Seeker)) { // Create seeker
		team = other.team;
		creator = other;
		speed = 2;
		direction = other.gunangle-5+random(10);
	}
}

motion_add(gunangle - 180, 0.8); // Push Player Backwards