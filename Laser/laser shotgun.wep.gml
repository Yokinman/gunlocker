#define init
	global.sprLaserShotgun = sprite_add_weapon("../Sprites/Laser/LaserShotgun.png", 4, 3);

#define weapon_name
	return "LASER SHOTGUN"; // Name 

#define weapon_type
	return 5; // Energy Wep

#define weapon_cost
	return 6; // 6 Ammo

#define weapon_area
	return 9; // L0 4-1+

#define weapon_load
	return 23; // 0.77 Seconds

#define weapon_swap
	return sndSwapEnergy; // Swap Sound

#define weapon_fire
	sound_play_pitch(sndLaserCannonCharge, 0.75); // Sound

	 // Laser Shotgun Burst:
	with mod_script_call("mod", "laser_tools", "lasershotburst_create", x, y){
		image_angle = other.gunangle;
		alarm0 = 10; // 10 Frame Charge
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.sprLaserShotgun; // Wep Sprite

#define weapon_text
	return "I CAN'T BELIEVE IT'S NOT ULTRA"; // Loading Tip