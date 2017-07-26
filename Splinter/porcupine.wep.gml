#define init
	global.sprPorcupine = sprite_add_weapon("../Sprites/Splinter/Porcupine.png", 7, 6);

#define weapon_name
	return "PORCUPINE"; // Name

#define weapon_type
	return 3; // Bolt Wep

#define weapon_cost
	return 2; // 2 Ammo

#define weapon_load
	return 22; // 0.73 Seconds

#define weapon_area
	return 6; // L0 3-1+

#define weapon_swap
	return sndSwapBow; // Swap sound

#define weapon_fire
	repeat(3) if instance_exists(self){
		sound_play(sndSplinterGun);	// Sound
		weapon_post(6, -20, 3);		// Kick, Shift, Shake

		 // Splinters:
		repeat(3) with instance_create(x - (lengthdir_x(random_range(1, 2), gunangle + 90) * other.right), y - (lengthdir_y(random_range(1, 2), gunangle + 90) * other.right), Splinter){
			motion_add(other.gunangle + (random_range(-6, 6) * other.accuracy), 20 + random(4));
			image_angle = direction;
			hitid = [sprite_index, "SPLINTER"];
			team = other.team
			creator = other;
		}

		wait 3;
	}

#define weapon_sprt
	return global.sprPorcupine; // Wep Sprite

#define weapon_text
	return "SPINY BEAST"; // Loading Tip