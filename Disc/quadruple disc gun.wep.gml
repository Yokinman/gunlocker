#define init
	global.sprQuadDiscGun = sprite_add_weapon("../Sprites/Disc/QuadrupleDiscGun.png", 4, 8);

#define weapon_name
	return "QUADRUPLE DISC GUN"; // Name

#define weapon_type
	return 3; // Bolt Wep

#define weapon_cost
	return 4; // 4 Ammo

#define weapon_load
	return 12; // 0.40 Seconds

#define weapon_area
	return 12; // L0 5-3+

#define weapon_auto
	return 1; // Automatic

#define weapon_laser_sight
	return 0; // No Laser Sight
	
#define weapon_swap
	return sndSwapBow; // Swap Sound

#define weapon_fire
	sound_play(sndDiscgun);			// Sound
	weapon_post(8, -8, 8);			// Kick, Shift, Shake
	motion_add(gunangle + 180, 2);	// Knockback

	 // Discs:
	for(var i = -24; i <= 24; i += 16) with instance_create(x,y,Disc){
		move_contact_solid(other.gunangle, 6);
		motion_add(other.gunangle + ((i + random_range(-6, 6)) * other.accuracy), 5);
		image_angle = direction;
		hitid = [sprite_index, "DISC"];
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.sprQuadDiscGun; // Wep Sprite

#define weapon_text
	return "DEATH INCARNATE"; // Loading Tip