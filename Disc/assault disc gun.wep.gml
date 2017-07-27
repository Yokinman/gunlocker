#define init
	global.sprAssaultDiscGun = sprite_add_weapon("../Sprites/Disc/AssaultDiscGun.png", 4, 6);

#define weapon_name
	return "ASSAULT DISC GUN"; // Name

#define weapon_type
	return 3; //  Bolt Wep

#define weapon_cost
	return 3; // 3 Ammo

#define weapon_load
	return 16; // 0.53 Seconds

#define weapon_area
	return 6; // L0 3-1+

#define weapon_laser_sight
	return 0; // No Laser Sight
	
#define weapon_swap
	return sndSwapBow; // Swap Sound

#define weapon_fire
	repeat(3) if instance_exists(self){
		sound_play(sndDiscgun);			// Sound
		weapon_post(6, -6, 6);			// Kick, Shift, Shake
		motion_add(gunangle + 180, 1);	// Knockback

		 // Disc:
		with instance_create(x, y, Disc){
			motion_add(other.gunangle + (random_range(-6, 6) * other.accuracy), 5);
			image_angle = direction;
			hitid = [sprite_index, "DISC"];
			team = other.team;
			creator = other;
		}
		
		wait 4;
	}

#define weapon_sprt
	return global.sprAssaultDiscGun; // Wep Sprite

#define weapon_text
	return "FOLLOW THE LEADER"; // Standard Tip
	