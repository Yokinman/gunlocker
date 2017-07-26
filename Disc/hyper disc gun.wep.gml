#define init 
	global.sprHyperDiscGun = sprite_add_weapon("../Sprites/Disc/HyperDiscGun.png", -1, 5);

#define weapon_name
	return "HYPER DISC GUN"; // Name

#define weapon_type
	return 3; // Bolt Wep

#define weapon_cost
	return 2; // 2 Ammo

#define weapon_area
	return 10; // L0 5-1+

#define weapon_load
	return 7; // 0.23 Seconds

#define weapon_auto
	return 1; // Automatic

#define weapon_swap
	return sndSwapBow; // Swap Sound

#define weapon_fire
	sound_play(sndDiscgun);	// Sound
	weapon_post(6, -15, 6);	// Kick, Shift, Shake

	 // Hyper Disc:
	with mod_script_call("mod", "disc_tools", "hyperdisc_create", x, y){
		motion_add(other.gunangle + (random_range(-4, 4) * other.accuracy), 28);
		image_angle = direction;
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.sprHyperDiscGun; // Wep Sprite

#define weapon_text
	return "UNDODGEABLE"; // Loading Tip