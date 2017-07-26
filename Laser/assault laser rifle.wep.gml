#define init
	global.sprAssaultLaserRifle = sprite_add_weapon("../Sprites/Laser/AssaultLaserRifle.png", 7, 4);

#define weapon_name
	return "ASSAULT LASER RIFLE"; // Name

#define weapon_type
	return 5; // Energy Wep

#define weapon_cost
	return 3; // 3 Ammo

#define weapon_load
	return 15; // 0.50 Seconds

#define weapon_area
	return 6; // L0 3-1+

#define weapon_swap
	return sndSwapEnergy; // Swap sound

#define weapon_fire
	sound_play(sndLaserCannonCharge); // Sound

	 // Small Laser Cannon Charge:
	with instance_create(x,y,LaserCannon){
		image_angle = other.gunangle;
		ammo = 3 + skill_get(17); // Laser Shots, 3 (+1 Laser Brain)
		alarm0 = 8;	// 8 Frame Charge
		hitid = [sprite_index, "LASER CHARGE"];
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.sprAssaultLaserRifle; // Wep Sprite

#define weapon_text
	return "PEW PEW"; // Loading Tip