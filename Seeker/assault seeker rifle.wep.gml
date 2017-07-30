#define init
	global.sprAssaultSeekerRifle = sprite_add_weapon("../Sprites/Seeker/AssaultSeekerRifle.png", 4, 4);

#define weapon_name
	return "ASSAULT SEEKER RIFLE"; // Name

#define weapon_type
	return 3; // Bolt Wep

#define weapon_cost
	return 1; // 1 Ammo

#define weapon_load
	return 25; // 0.83 Seconds

#define weapon_area
	return 7; // L0 3-2+
	
#define weapon_swap
	return sndSwapBow; // Swap Sound

#define weapon_fire
	repeat(3) if(instance_exists(self)){
		sound_play(sndSplinterPistol);	// Sound
		weapon_post(6, -12, 6);			// Kick, Shift, Shake

		 // Seeker:
		with instance_create(x, y, Seeker){
			motion_add(other.gunangle + (random_range(-10, 10) * other.accuracy), 5);
			image_angle = direction;
			hitid = [sprite_index, "Seeker"];
			team = other.team;
			creator = other;
		}
		wait 3;
	}

#define weapon_sprt
	return global.sprAssaultSeekerRifle; // Wep Sprite

#define weapon_text
	return "GO FORTH"; // Loading Tip