#define init
	global.sprAutoFlareGun = sprite_add_weapon("../Sprites/Flame/AutoFlareGun.png",5,4);

#define weapon_name
	return "AUTO FLARE GUN"; // Name 

#define weapon_type
	return 4; // Explosive Wep

#define weapon_cost
	return 1; // 1 Ammo

#define weapon_area
	return 7; // L0 3-2+

#define weapon_load
	return 10; // 0.33 Seconds

#define weapon_auto
	return 1; // Automatic

#define weapon_swap
	return sndSwapFlame; // Swap Sound

#define weapon_fire
	sound_play(sndFlare);	// Sound
	weapon_post(6, -8, 4);	// Kick, Shift, Shake

	 // Flare:
	with instance_create(x,y,Flare){
		motion_add(other.gunangle + (random_range(-12, 12) * other.accuracy), 10);
		image_angle = direction;
		hitid = [sprite_index, "FLARE"];
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.sprAutoFlareGun; // Wep Sprite

#define weapon_text
	return "RAPID-FIRE S.O.S."; // Loading Tip