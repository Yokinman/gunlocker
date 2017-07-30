#define init
	global.sprHeavyAssaultSlugger = sprite_add_weapon("../Sprites/HeavySlug/HeavyAssaultSlugger.png", 4, 4);

#define weapon_name
	return "HEAVY ASSAULT SLUGGER"; // Name

#define weapon_type
	return 2; // Shell Wep

#define weapon_cost
	return 6; // 6 Ammo

#define weapon_load
	return 26; // 0.87 Seconds

#define weapon_area
	return 13; // L0 6-1+

#define weapon_swap
	return sndSwapShotgun; // Swap Sound

#define weapon_fire
	repeat(3) if instance_exists(self){
		sound_play(sndHeavySlugger);	// Sound
		weapon_post(10, -10, 10);		// Kick, Shift, Shake
		motion_add(gunangle + 180, 1);	// Knockback

		 // Heavy Slug:
		with instance_create(x, y, HeavySlug){
			motion_add(other.gunangle + (random_range(-8, 8) * other.accuracy), 14);
			image_angle = direction;
			hitid = [sprite_index, "HEAVY SLUG"];
			team = other.team;
			creator = other;
		}
		
		wait 4;
	}

#define weapon_sprt
	return global.sprHeavyAssaultSlugger; // Wep Sprite

#define weapon_text
	return "HANDSHAKE THE MONSTERS"; // Loading Tip