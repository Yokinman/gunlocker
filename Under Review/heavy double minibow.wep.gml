#define init 
	global.sprHeavyDoubleMinibow = sprite_add_weapon("../Sprites/HeavyBolt/HeavyDoubleMinibow.png", 8, 14);

#define weapon_name
	return "HEAVY DOUBLE MINIBOW"; // Name

#define weapon_type
	return 3; // Bolt Wep
	
#define weapon_cost
	return 4; // 4 Ammo

#define weapon_area
	return 24; // L1 4-1+

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
	repeat(2) with instance_create(x,y,HeavyBolt){
		motion_add(other.gunangle + (random_range(-10, 10) * other.accuracy), 24)
		image_angle = direction;
		hitid = [sprite_index, "HEAVY BOLT"];
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.sprHeavyDoubleMinibow; // Wep Sprite