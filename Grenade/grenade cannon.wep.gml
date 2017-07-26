#define init
	global.spr_GrenadeCannon = sprite_add_weapon("../Sprites/Grenade/GrenadeCannon.png",4,4);

#define weapon_name
	return "GRENADE CANNON"; // Name 

#define weapon_type
	return 4; // Explosive Wep

#define weapon_cost
	return 8; // 8 Ammo

#define weapon_area
	return 13; // L0 6-1+

#define weapon_load
	return 50; // 1.67 Second

#define weapon_swap
	return sndSwapExplosive; // Swap Sound

#define weapon_fire
	sound_play(sndHeavyNader);	// Sound
	weapon_post(10, -30, 5);	// Kick, Shift, Shake

	 // Big Nade:
	with mod_script_call("mod", "grenade_tools", "bignade_create", x - lengthdir_x(1,gunangle), y - lengthdir_y(1,gunangle)){
		motion_set(other.gunangle + (random_range(-3, 3) * other.accuracy), 10);
		image_angle = direction;
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.spr_GrenadeCannon; // Wep Sprite

#define weapon_text
	return "CLANK FWOOP BOOM"; // Loading Tip