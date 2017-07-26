#define init
	global.spr_TurboSlug = sprite_add_weapon("../Sprites/HeavySlug/HeavyTurboSlugger.png", 3, 7);

#define weapon_name
	return "HEAVY TURBO SLUGGER"; // Name 

#define weapon_type
	return 2; // Shell Wep

#define weapon_cost
	return 2; // 2 Ammo

#define weapon_area
	return 15; // L0 7-2+

#define weapon_load
	return 4; // 0.13 Seconds

#define weapon_swap
	return sndSwapMotorized; // Swap Sound

#define weapon_auto
	return 1; // Automatic

#define weapon_fire
	 // Sound:
	sound_play(sndHeavySlugger);
	sound_play(sndNadeReload);

	 // Kick, Shift, Shake:
	weapon_post(7, -20, 10);

	 // Knockback:
	motion_add(gunangle + 180, 2);

	 // Heavy Slug:
	with instance_create(x,y,HeavySlug){
		motion_add(other.gunangle + (random_range(-11, 11) * other.accuracy), 14.5);
		image_angle = direction;
		hitid = [sprite_index, "HEAVY SLUG"];
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.spr_TurboSlug; // Wep Sprite

#define weapon_text
	return "CLOSE RANGE DEVASTATION"; // Loading Tip