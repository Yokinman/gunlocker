#define init
	global.sprHyperPlasmaRifle = sprite_add_weapon("../Sprites/Plasma/HyperPlasmaRifle.png", 4, 4);

#define weapon_name
	return "HYPER PLASMA RIFLE"; // Name

#define weapon_area
	return 13; // L0 6-1+

#define weapon_type
	return 5; // Energy Wep

#define weapon_cost
	return 3; // 3 Ammo

#define weapon_load
	return 10; // 0.33 Seconds

#define weapon_swap
	return sndSwapEnergy; // Swap Sound

#define weapon_fire
	sound_play(sndPlasmaRifle);		// Sound
	weapon_post(8, -20, 5);			// Kick, Shift, Shake
	motion_add(gunangle + 180, 2);	// Knockback

	 // Plasma Trail Visual:
	repeat(16) with hyperplasmatrail_create(x + lengthdir_x(18 - wkick, gunangle), y + lengthdir_y(18 - wkick, gunangle), 45){
		motion_add(other.gunangle + random_range(-10, 10), 1 + random(2));
	}

	 // Hyper Plasma Ball:
	with mod_script_call("mod", "plasma_tools", "hyperplasma_create", x + lengthdir_x(24, gunangle), y + lengthdir_y(24, gunangle)){
		direction = other.gunangle;
		image_angle = direction;
		team = other.team;
		creator = other;
	}

#define hyperplasmatrail_create(_x, _y, _turn)
	return mod_script_call("mod", "plasma_tools", "hyperplasmatrail_create", _x, _y, _turn);

#define weapon_sprt
	return global.sprHyperPlasmaRifle; // Wep Sprite

#define weapon_text
	return "@bHYPER @sFUN"; // Loading Tip