#define init
	global.spr_TurboSlug = sprite_add_weapon("../Sprites/Slug/TurboSlugger.png", 3, 6);

#define weapon_name
	return "TURBO SLUGGER"; // Name 

#define weapon_type
	return 2; // Shell Wep

#define weapon_area
	return 12; // L0 5-3+

#define weapon_load
	return 3; // 0.10 Seconds

#define weapon_swap
	return sndSwapMotorized; // Swap Sound

#define weapon_auto
	return 1; // Automatic

#define weapon_fire
	 // Sound:
	sound_play(sndSlugger);
	sound_play(sndNadeReload);

	 // Kick, Shift, Shake:
	weapon_post(3, -10, 6);

	 // Knockback:
	motion_add(gunangle + 180, 1.2);

	 // Slug:
	with instance_create(x,y,Slug){
		motion_add(other.gunangle + (random_range(-8, 8) * other.accuracy), 18.5);
		image_angle = direction;
		hitid = [sprite_index, "SLUG"];
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.spr_TurboSlug; // Wep Sprite

#define weapon_text
	return "@rTURBO @sTIME"; // Loading Tip