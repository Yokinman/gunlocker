#define init 
	global.sprHeavyMinibow = sprite_add_weapon("../Sprites/HeavyBolt/HeavyMinibow.png", 7, 9);

#define weapon_name
	return "HEAVY MINIBOW"; // Name

#define weapon_type
	return 3; // Bolt Wep
	
#define weapon_cost
	return 2; // 2 Ammo

#define weapon_area
	return 18; // L1 1-3+

#define weapon_load
	return 3; // 0.10 Seconds

#define weapon_auto
	return 1; // Automatic

#define weapon_swap
	return sndSwapBow; // Swap Sound

#define weapon_fire
	sound_play(sndCrossbow);			// Sound
	weapon_post(8, -20, 8);				// Kick, Shift, Shake
	motion_add(gunangle + 180, 1.5);	// Knockback

	 // Innacurate Bolt:
	with instance_create(x,y,HeavyBolt){
		motion_add(other.gunangle + (random_range(-6, 6) * other.accuracy), 24)
		image_angle = direction;
		hitid = [sprite_index, "HEAVY BOLT"];
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.sprHeavyMinibow; // Wep Sprite