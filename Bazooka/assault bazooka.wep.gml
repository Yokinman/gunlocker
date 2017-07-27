#define init
	global.sprAssaultBazooka = sprite_add_weapon("../Sprites/Bazooka/AssaultBazooka.png", 8, 5);

#define weapon_name
	return "ASSAULT BAZOOKA"; // Name

#define weapon_type
	return 4; // Explosive Wep

#define weapon_cost
	return 3; // 3 Ammo

#define weapon_load
	return 60; // 2.00 Seconds

#define weapon_area
	return 9; // L0 4-1+
	
#define weapon_swap
	return sndSwapExplosive; // Swap Sound

#define weapon_fire
	repeat(3) if instance_exists(self){
		sound_play(sndRocket);			// Sound
		weapon_post(10, -10, 10);		// Kick, Shift, Shake
		motion_add(gunangle + 180, 2);	// Knockback

		 // Rockets:
		with instance_create(x, y, Rocket){
			motion_add(other.gunangle + (random_range(-6, 6) * other.accuracy), 2);
			image_angle = direction;
			hitid = [sprite_index, "ROCKET"];
			team = other.team;
			creator = other;
		}

		wait 4;
	}

#define weapon_sprt
	return global.sprAssaultBazooka; // Wep Sprite

#define weapon_text
	return "SMALL CHAINS"; // Loading Tip