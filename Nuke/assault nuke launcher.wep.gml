#define init
	global.sprAssaultNukeLauncher = sprite_add_weapon("../Sprites/Nuke/AssaultNukeLauncher.png", 8, 5);

#define weapon_name
	return "ASSAULT NUKE LAUNCHER"; // Name

#define weapon_type
	return 4; // Explosive Wep

#define weapon_cost
	return 9; // 9 Ammo

#define weapon_load
	return 100; // 3.33 Seconds

#define weapon_area
	return 10; // L0 5-1+
	
#define weapon_swap
	return sndSwapExplosive; // Swap sound

#define weapon_fire
	repeat(3) if(instance_exists(self)){
		sound_play(sndNukeFire);		// Sound
		weapon_post(10, -15, 15);		// Kick, Shift, Shake
		motion_add(gunangle + 180, 2);	// Knockback

		 // Nuke:
		with instance_create(x, y, Nuke){
			index = other.index;
			motion_add(other.gunangle + (random_range(-6, 6) * other.accuracy), 2);
			image_angle = direction;
			hitid = [sprite_index, "NUKE"];
			team = other.team;
			creator = other;
		}
		
		wait 4;
	}

#define weapon_sprt
	return global.sprAssaultNukeLauncher; // Wep Sprite

#define weapon_text
	return "THIS SEEMS DANGEROUS"; // Loading Tip