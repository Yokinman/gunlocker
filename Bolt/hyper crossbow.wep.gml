#define init
	global.sprHyperCrossbow = sprite_add_weapon("../Sprites/Bolt/HyperCrossbow.png", 2, 4);
	global.sprHyperBolt = sprite_add("../Sprites/Projectiles/Bolt/HyperBolt.png", 1, 8, 4);

#define weapon_name
	return "HYPER CROSSBOW"; // Name

#define weapon_type
	return 3; // Bolt Wep

#define weapon_cost
	return 2; // 2 Ammo

#define weapon_area
	return 15; // L0 7-2+

#define weapon_load
	return 10; // 0.33 Seconds

#define weapon_swap
	return sndSwapBow; // Swap Sound

#define weapon_fire
	 // Sound:
	sound_play(sndUltraCrossbow);
	sound_play(sndHeavyCrossbow);

	 // Kick, Shift, Shake:
	weapon_post(8, -40, 4);

	 // Hyper Bolt:
	with mod_script_call("mod", "bolt_tools", "hyperbolt_create", x + lengthdir_x(6, gunangle), y + lengthdir_y(6, gunangle)){
		direction = other.gunangle;
		image_angle = direction;
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.sprHyperCrossbow; // Wep Sprite

#define weapon_text
	return "FASTER THAN SIGHT"; // Loading Tip