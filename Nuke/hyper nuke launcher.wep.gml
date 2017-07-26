#define init
	global.sprHyperNukeLauncher = sprite_add_weapon("../Sprites/Nuke/HyperNukeLauncher.png", 4, 8);

#define weapon_name
	return "HYPER NUKE LAUNCHER";

#define weapon_type
	return 4; // Explosive Wep

#define weapon_cost
	return 6; // 6 Ammo

#define weapon_area
	return 18; // L1 1-1+

#define weapon_load
	return 17; // 0.57 Seconds

#define weapon_swap
	return sndSwapExplosive; // Swap sound

#define weapon_fire
	sound_play(sndNukeFire);		// Sound
	weapon_post(12, -60, 5);		// Kick, Shift, Shake
	motion_add(gunangle + 180, 4);	// Knockback

	 // Smoke Visual:
	repeat(16) with instance_create(x + lengthdir_x(24, gunangle), y + lengthdir_y(24, gunangle), Smoke){
		motion_set(other.gunangle + random_range(-48, 48), random(6));
		motion_add(other.direction, other.speed / 4);
	}

	 // Hyper Nuke:
	with mod_script_call("mod", "nuke_tools", "hypernuke_create", x + lengthdir_x(10, gunangle), y + lengthdir_y(10, gunangle)){
		direction = other.gunangle;
		image_angle = direction;
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.sprHyperNukeLauncher; // Wep Sprite

#define weapon_text
	return "VAN SLAMMING POWER"; // Loading Tip