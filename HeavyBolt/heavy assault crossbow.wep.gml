#define init
	global.sprHeavyAssaultCrossBow = sprite_add_weapon("../Sprites/HeavyBolt/HeavyAssaultCrossBow.png", 4, 5);

#define weapon_name
	return "HEAVY ASSAULT CROSSBOW"; // Name

#define weapon_type
	return 3; // Bolt Wep

#define weapon_cost
	return 6; // 6 Ammo

#define weapon_load
	return 70; // 2.33 Seconds

#define weapon_area
	return 13; // L0 6-1+

#define weapon_swap
	return sndSwapBow; // Swap Sound

#define weapon_fire
	repeat(3) if instance_exists(self){
		sound_play(sndHeavyCrossbow);	// Sound
		weapon_post(10, -10, 10);		// Kick, Shift, Shake
		motion_add(gunangle + 180, 2);	// Knockback

		 // Bolts:
		with instance_create(x, y, HeavyBolt){
			motion_add(other.gunangle + (random_range(-6, 6) * other.accuracy), 16);
			image_angle = direction;
			hitid = [sprite_index, "HEAVY BOLT"];
			team = other.team;
			creator = other;
		}
		
		wait 4;
	}

#define weapon_sprt
	return global.sprHeavyAssaultCrossBow; // Wep Sprite

#define weapon_text
	return "INCOMING"; // Loading Tip