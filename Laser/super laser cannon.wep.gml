#define init
	global.sprSuperLaserCannon = sprite_add_weapon("../Sprites/Laser/SuperLaserCannon.png", 6, 6);

#define weapon_name
	return "SUPER LASER CANNON"; // Name 

#define weapon_type
	return 5; // Energy Wep

#define weapon_cost
	return 24; // 24 Ammo

#define weapon_area
	return 16; // L0 7-3+

#define weapon_load
	return 230; // 7.66 Seconds

#define weapon_swap
	return sndSwapEnergy; // Swap Sound

#define weapon_fire
	sound_play_pitchvol(sndLaserCannonCharge, 0.7, 2); // Sound

	 // Super Laser Cannon:
	with mod_script_call("mod", "laser_tools", "superlasercannon_create", x, y){
		image_angle = other.gunangle;
		alarm0 = 28; // 28 Frame Charge
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.sprSuperLaserCannon; // Wep Sprite

#define weapon_text
	return "YOU MAY FIRE WHEN READY"; // Loading Tip