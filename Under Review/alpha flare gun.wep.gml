#define init
	global.sprAlphaFlareGun = sprite_add_weapon("../Sprites/Flame/AlphaFlareGun.png", 4, 6);

#define weapon_name
	return "ALPHA FLARE GUN"; // Name

#define weapon_type
	return 4; // Explosive Wep

#define weapon_cost
	return 5; // 5 Ammo

#define weapon_load
	return 10; // 0.33 Seconds

#define weapon_area
	return 13; // L0 7-1+

#define weapon_auto
	return 1; // Automatic

#define weapon_swap
	return sndSwapFlame; // Swap sound

#define weapon_fire
	sound_play(sndFlare);
	weapon_post(8,-10,10)
	
	fireAngle = -15 + random_range(-6, 6); // Fire angle
	repeat(4) {
		with (instance_create(x, y, Flare)) { // Flares
			motion_add(other.gunangle + (other.fireAngle * other.accuracy), 9);
			image_angle = direction;
			team = other.team;
			creator = other;
		}
		fireAngle += 10;
	}


#define weapon_sprt
	return global.sprAlphaFlareGun; // Wep Sprite