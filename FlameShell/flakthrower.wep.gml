#define init
	global.sprFlakthrower = sprite_add_weapon("../Sprites/FlameShell/Flakthrower.png", 4, 4);

#define weapon_name
	return "FLAKTHROWER"; // Name

#define weapon_type
	return 2; // Shell Wep

#define weapon_cost
	return 2; // 2 Ammo

#define weapon_load
	return 26; // 0.87 Seconds

#define weapon_area
	return 7; // L0 3-2+

#define weapon_swap
	return sndSwapFlame; // Swap sound

#define weapon_fire
	 // Sound:
	sound_play(sndFlakCannon);
	sound_play(sndIncinerator);

	 // Kick, Shift, Shake:
	weapon_post(8, -30, 5);

	 // Flame Flak:
	with mod_script_call("mod", "flameshell_tools", "flameflak_create", x, y){
		motion_add(other.gunangle + (random_range(-6, 6) * other.accuracy), 11 + random(2));
		image_angle = direction;
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.sprFlakthrower; // Wep Sprite

#define weapon_text
	return "ADVANCED FLARES"; // Loading Tip