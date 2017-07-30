#define init
	global.sprQuadLaserRifle = sprite_add_weapon("../Sprites/Laser/QuadrupleLaserRifle.png", 4, 6);

#define weapon_name
	return "QUADRUPLE LASER RIFLE"; // Name

#define weapon_type
	return 5; // Energy Wep

#define weapon_cost
	return 4; // 4 Ammo

#define weapon_load
	return 7; // 0.23 Seconds

#define weapon_area
	return 12; // L0 5-3+

#define weapon_auto
	return 1; // Automatic
	
#define weapon_swap
	return sndSwapEnergy; // Swap Sound

#define weapon_fire
	 // Sound:
	if(skill_get(17)) sound_play(sndLaserUpg);
	else sound_play(sndLaser);

	 // Kick, Shift, Shake: 
	weapon_post(4, -4, 4);

	 // Lasers:
	for(var i = -18; i <= 18; i += 12) with instance_create(x,y,Laser){
		alarm0 = 1;
		image_angle = other.gunangle + ((i + random_range(-2, 2)) * other.accuracy);
		hitid = [sprite_index, "LASER"];
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.sprQuadLaserRifle; // Wep Sprite

#define weapon_text
	return "PEW PEW PEW PEW"; // Loading Tip