#define init 
	global.sprDoubleMinibow = sprite_add_weapon("../Sprites/Bolt/DoubleMinibow.png", 7, 11);

#define weapon_name
	return "DOUBLE MINIBOW"; // Name

#define weapon_type
	return 3; // Bolt Wep
	
#define weapon_cost
	return 2; // 2 Ammo

#define weapon_area
	return 20; // L1 2-1+

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
	repeat(2) with instance_create(x,y,Bolt){
		motion_add(other.gunangle + (random_range(-20, 20) * other.accuracy), 24)
		image_angle = direction;
		hitid = [sprite_index, "BOLT"];
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.sprDoubleMinibow; // Wep Sprite

#define weapon_text
	return "10*2 BOLTS PER SECOND"; // Loading Tip