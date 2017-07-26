#define init
	global.spr_AlphaSlug = sprite_add_weapon("../Sprites/Slug/AlphaSlugger.png", 5, 5);

#define weapon_name
	return "ALPHA SLUGGER"; // Name 

#define weapon_type
	return 2; // Shell Wep

#define weapon_cost
	return 5; // 5 Ammo

#define weapon_area
	return 13; // L0 6-1+

#define weapon_load
	return 9; // 0.30 Seconds

#define weapon_swap
	return sndSwapShotgun; // Swap Sound

#define weapon_auto
	return 1; // Automatic

#define weapon_fire
	 // Sound:
	sound_play(sndHyperSlugger);
	sound_play(sndSuperSlugger);

	 // Kick, Shift, Shake:
	weapon_post(8, -15, 5);

	 // Knockback:
	motion_add(gunangle + 180, 1.5);

	 // Slugs:
	for(var i = -15; i <= 15; i += 10) with instance_create(x,y,Slug){
		motion_add(other.gunangle + ((random_range(-4, 4) + i) * other.accuracy), 18);
		image_angle = direction;
		hitid = [sprite_index, "SLUG"];
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.spr_AlphaSlug; // Wep Sprite

#define weapon_text
	return "BRUTE FORCE"; // Loading Tip