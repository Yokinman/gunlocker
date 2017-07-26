#define init
	global.sprAutoSeekerShotgun = sprite_add_weapon("../Sprites/Seeker/AutoSeekerShotgun.png", 2, 4);

#define weapon_name
	return "AUTO SEEKER SHOTGUN"; // Name

#define weapon_type
	return 3; // Bolt Wep

#define weapon_cost
	return 3; // 3 Ammo

#define weapon_load
	return 12; // 0.40 Seconds

#define weapon_auto
	return 1; // Automatic

#define weapon_area
	return 12; // L0 5-3+

#define weapon_swap
	return sndSwapBow; // Swap sound

#define weapon_fire
	sound_play(sndSeekerShotgun);	// Sound
	weapon_post(5, 10, 6);			// Kick, Shift, Shake

	 // Seekers:
	for(var i = -60; i <= 60; i += 30) with instance_create(x, y, Seeker){
		motion_add(other.gunangle + ((i + random_range(-30, 30)) * other.accuracy), 8);
		image_angle = direction;
		hitid = [sprite_index, "SEEKER"];
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.sprAutoSeekerShotgun; // Wep Sprite

#define weapon_text
	return "THEY HAVE NO CHANCE"; // Loading Tip