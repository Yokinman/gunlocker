#define init
	global.sprBouncerRifle = sprite_add_weapon("../Sprites/Bouncer/BouncerRifle.png", 5, 2);

#define weapon_name
	return "BOUNCER RIFLE"; // Name 

#define weapon_type
	return 1; // Bullet Wep

#define weapon_area
	return 5; // L0 2-1+

#define weapon_load
	return 4; // 0.13 Seconds

#define weapon_auto
	return 1; // Automatic

#define weapon_swap
	return sndSwapPistol; // Swap Sound

#define weapon_fire
	sound_play(sndBouncerSmg);	// Sound
	weapon_post(5, -10, 6);		// Kick, Shift, Shake

	 // Empty Bullet Casing:
	scrShells(100, 25, 3 + random(2), sprBulletShell);

	 // Bouncer Bullet:
	with instance_create(x,y,BouncerBullet){
		motion_add(other.gunangle + (random_range(-8, 8) * other.accuracy), 6);
		image_angle = direction;
		hitid = [sprite_index, "BOUNCER BULLET"];
		team = other.team;
		creator = other;
	}

#define scrShells(_angle, _spread, _speed, _sprite)
	mod_script_call("mod", "gunlocker_tools", "scrShells", _angle, _spread, _speed, _sprite);

#define weapon_sprt
	return global.sprBouncerRifle; // Wep Sprite

#define weapon_text
	return "RICOCHET"; // Loading Tip