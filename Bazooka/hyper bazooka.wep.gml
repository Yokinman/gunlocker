#define init
	global.sprHyperBazooka = sprite_add_weapon("../Sprites/Bazooka/HyperBazooka.png", 11, 5);

#define weapon_name
	return "HYPER BAZOOKA"; // Name

#define weapon_type
	return 4; // Explosive Wep

#define weapon_cost
	return 3; // 3 Ammo

#define weapon_area
	return 15; // L0 7-2+

#define weapon_load
	return 8; // 0.27 Seconds

#define weapon_swap
	return sndSwapExplosive; // Swap sound

#define weapon_fire
	 // Sound:
	sound_play(sndRocket);
	sound_play(sndHyperLauncher);

	 // Kick, Shift, Shake:
	weapon_post(8, -30, 4);

	 // Smoke Effect:
	repeat(8) with instance_create(x + lengthdir_x(24, gunangle), y + lengthdir_y(24, gunangle), Smoke){
		motion_add(other.gunangle + random_range(-24, 24), random(6));
	}

	 // Hyper Rocket:
	with mod_script_call("mod", "bazooka_tools", "hyperrocket_create", x + lengthdir_x(10,gunangle), y + lengthdir_y(10,gunangle)){
		direction = other.gunangle + (random_range(-2, 2) * other.accuracy);
		image_angle = direction;
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.sprHyperBazooka; // Wep Sprite

#define weapon_text
	return "SKULL BUSTIN'"; // Loading Tip