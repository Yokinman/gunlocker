#define init
	global.sprBazookaCannon = sprite_add_weapon("../Sprites/Bazooka/BazookaCannon.png", 12, 6);

#define weapon_name
	return "BAZOOKA CANNON"; // Name

#define weapon_type
	return 4; // Explosive Wep

#define weapon_cost
	return 6; // 6 Ammo

#define weapon_area
	return 14; // L0 7-1+

#define weapon_load
	return 43; // 1.43 Seconds

#define weapon_swap
	return sndSwapExplosive; // Swap Sound

#define weapon_fire
	 // Sound:
	sound_play(sndSuperBazooka);
	sound_play(sndRocket);

	 // Kick, Shift, Shake:
	weapon_post(15, -70, 15);

	 // Big Rocket:
	with mod_script_call("mod", "bazooka_tools", "bigrocket_create", x + lengthdir_x(6,gunangle), y + lengthdir_y(6,gunangle)){
		motion_add(other.gunangle, 3);
		image_angle = direction;
		image_yscale = other.right;
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.sprBazookaCannon; // Wep Sprite

#define weapon_text
	return "TOO MUCH?"; // Loading Tip