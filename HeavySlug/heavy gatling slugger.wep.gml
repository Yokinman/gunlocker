#define init 
	global.sprHeavyGatlingSlugger = sprite_add_weapon("../Sprites/HeavySlug/HeavyGatlingSlugger.png", 5, 4);

#define weapon_name
	return "HEAVY GATLING SLUGGER"; // Name

#define weapon_type
	return 2; // Shell Wep

#define weapon_cost
	return 2; // 2 Ammo

#define weapon_area
	return 13; // L0 6-1+

#define weapon_load
	return 9; // 0.30 Seconds

#define weapon_auto
	return 1; // Automatic

#define weapon_swap
	return sndSwapShotgun; // Swap Sound

#define weapon_fire
	sound_play(sndHeavySlugger);		// Sound
	weapon_post(8, -20, 15);			// Kick, Shift, Shake
	motion_add(gunangle + 180, 2.5);	// Knockback

	 // Heavy Slug:
	with instance_create(x,y,HeavySlug){
		motion_add(other.gunangle + (random_range(-8, 8) * other.accuracy), 14);
		image_angle = direction;
		hitid = [sprite_index, "HEAVY SLUG"];
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.sprHeavyGatlingSlugger; // Wep Sprite

#define weapon_text
	return "STAY CLOSE"; // Loading Tip