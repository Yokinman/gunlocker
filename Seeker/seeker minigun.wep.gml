#define init
	global.sprSeekerMinigun = sprite_add_weapon("../Sprites/Seeker/SeekerMinigun.png", 5, 5);

#define weapon_name
	return "SEEKER MINIGUN"; // Name 

#define weapon_type
	return 3; // Bolt Wep

#define weapon_area
	return 11; // L0 5-2+

#define weapon_load
	return 2; // 0.07 Seconds

#define weapon_auto
	return 1; // Automatic

#define weapon_swap
	return sndSwapBow; // Swap Sound

#define weapon_fire
	sound_play(sndSeekerPistol);	// Sound
	weapon_post(8, -15, 5);			// Kick, Shift, Shake

	 // Seeker:
	with instance_create(x,y,Seeker){
		motion_add(other.gunangle + (random_range(-42, 42) * other.accuracy), 8);
		image_angle = direction;
		hitid = [sprite_index, "SEEKER"];
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.sprSeekerMinigun; // Wep Sprite

#define weapon_text
	return "NOWHERE TO RUN"; // Loading Tip