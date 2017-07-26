#define init
	global.sprDiscMinigun = sprite_add_weapon("../Sprites/Disc/DiscMinigun.png", 3, 6);

#define weapon_name
	return "DISC MINIGUN"; // Name

#define weapon_type
	return 3; // Bolt Wep

#define weapon_load
	return 2; // 0.07 Seconds

#define weapon_auto
	return 1; // Automatic

#define weapon_area
	return 11; // L0 5-2+

#define weapon_swap
	return sndSwapMotorized; // Swap sound

#define weapon_fire
	sound_play(sndDiscgun);			// Sound
	weapon_post(4, -8, 5);			// Kick, Shift, Shake
	motion_add(gunangle + 180, 1);	// Knockback

	 // Mini Disc:
	with mod_script_call("mod", "disc_tools", "minidisc_create", x, y){
		move_contact_solid(other.gunangle, 8);
		motion_add(other.gunangle + (random_range(-18, 18) * other.accuracy), 5);
		image_angle = direction;
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.sprDiscMinigun; // Wep Sprite

#define weapon_text
	return "GET SHREDDED"; // Loading Tip