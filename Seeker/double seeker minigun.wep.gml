#define init
	global.sprDoubleSeekerMinigun = sprite_add_weapon("../Sprites/Seeker/DoubleSeekerMinigun.png", 5, 6);

#define weapon_name
	return "DOUBLE SEEKER MINIGUN"; // Name 

#define weapon_type
	return 3; // Bolt Wep

#define weapon_cost
	return 2; // 2 Ammo

#define weapon_area
	return 14; // L0 7-1+

#define weapon_load
	return 2; // 0.07 Seconds

#define weapon_auto
	return 1; // Automatic

#define weapon_swap
	return sndSwapBow; // Swap Sound

#define weapon_fire
	sound_play(sndSeekerPistol);		// Sound
	weapon_post(8, -15, 5);				// Kick, Shift, Shake
	motion_add(gunangle + 180, 0.8);	// Knockback

	 // Seekers:
	for(var i = -10; i <= 10; i += 20) with instance_create(x,y,Seeker){
		motion_add(other.gunangle + i + (random_range(-42, 42) * other.accuracy), 8);
		image_angle = direction;
		hitid = [sprite_index, "SEEKER"];
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.sprDoubleSeekerMinigun; // Wep Sprite

#define weapon_text
	return ""; // Loading Tip