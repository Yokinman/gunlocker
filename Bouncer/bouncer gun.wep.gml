#define init
	global.sprBouncerGun = sprite_add_weapon("../Sprites/Bouncer/BouncerGun.png", -2, 3);

#define weapon_name
	return "BOUNCER GUN"; // Name 

#define weapon_type
	return 1; // Bullet Wep

#define weapon_area
	return 4; // L0 1-3+

#define weapon_load
	return 5; // 0.17 Seconds

#define weapon_swap
	return sndSwapPistol; // Swap Sound

#define weapon_fire
	sound_play(sndBouncerSmg);	// Sound
	weapon_post(5, -6, 3);		// Kick, Shift, Shake

	 // Empty Bullet Casing:
	scrShells(100, 25, 3 + random(2), sprBulletShell);

	 // Bouncer Bullet:
	with instance_create(x, y, BouncerBullet){
		motion_add(other.gunangle + (random_range(-4, 4) * other.accuracy), 6);
		image_angle = direction;
		hitid = [sprite_index, "BOUNCER BULLET"];
		team = other.team;
		creator = other;
	}

#define scrShells(_angle, _spread, _speed, _sprite)
	mod_script_call("mod", "gunlocker_tools", "scrShells", _angle, _spread, _speed, _sprite);

#define weapon_sprt
	return global.sprBouncerGun; // Wep Sprite

#define weapon_text
	return "DO A TRICK SHOT"; // Loading Tip