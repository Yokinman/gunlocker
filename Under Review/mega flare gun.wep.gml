#define init
global.sprMegaFlareGun = sprite_add_weapon("../Sprites/Flame/MegaFlareGun.png", 4, 6);

#define weapon_name
return "MEGA FLARE GUN"; // Name

#define weapon_type
return 4; // Explosive Wep

#define weapon_cost
return 10; // 10 Ammo

#define weapon_load
return 45; // 1.50 Seconds

#define weapon_area
return 12; // L0 6-1+

#define weapon_swap
return sndSwapFlame; // Swap sound

#define weapon_fire
	sound_play(sndFlare);
	weapon_post(8,-10,10)
	
	fireAngle = -45 + random_range(-6, 6); // Fire angle
	repeat(10) {
		with (instance_create(x, y, Flare)) { // Flares
			motion_add(other.gunangle + (other.fireAngle * other.accuracy), 9);
			image_angle = direction;
			team = other.team;
			creator = other;
		}
		fireAngle += 10;
	}


#define weapon_sprt
return global.sprMegaFlareGun; // Wep Sprite