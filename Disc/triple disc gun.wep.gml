#define init
	global.sprTripleDiscGun = sprite_add_weapon("../Sprites/Disc/TripleDiscGun.png", 4, 6);

#define weapon_name
	return "TRIPLE DISC GUN"; // Name

#define weapon_type
	return 3; // Bolt Wep

#define weapon_cost
	return 3; // 3 Ammo

#define weapon_load
	return 12; // 0.40 Seconds

#define weapon_auto
	return 1; // Automatic

#define weapon_area
	return 9; // L0 4-1+

#define weapon_laser_sight
	return 0; // No Laser Sight
	
#define weapon_swap
	return sndSwapBow; // Swap Sound

#define weapon_fire
	sound_play(sndDiscgun);			// Sound
	weapon_post(8, -8, 8);			// Kick, Shift, Shake
	motion_add(gunangle + 180, 1);	// Knockback

	 // Discs:
	for(var i = -17; i <= 17; i += 17) with instance_create(x,y,Disc){
		move_contact_solid(other.gunangle, 6);
		motion_add(other.gunangle + ((i + random_range(-6, 6)) * other.accuracy), 5);
		image_angle = direction;
		hitid = [sprite_index, "DISC"];
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.sprTripleDiscGun; // Wep Sprite

#define weapon_text
	return "PERSONIFICATION OF DEATH"; // Loading Tip