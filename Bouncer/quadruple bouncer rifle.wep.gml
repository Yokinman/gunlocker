#define init
	global.sprQuadBouncerMachinegun = sprite_add_weapon("../Sprites/Bouncer/QuadrupleBouncerMachinegun.png", 4, 6);

#define weapon_name
	return "QUADRUPLE BOUNCER RIFLE"; // Name

#define weapon_type
	return 1; // Bullet Wep

#define weapon_cost
	return 4; // 4 Ammo

#define weapon_load
	return 4; // 0.13 Seconds

#define weapon_auto
	return 1; // Automatic

#define weapon_area
	return 13; // L0 6-1+

#define weapon_swap
	return sndSwapMachinegun; // Swap Sound

#define weapon_fire
	sound_play(sndBouncerSmg);		// Sound
	weapon_post(8, -6, 6);			// Kick, Shift, Shake
	motion_add(gunangle + 180, 2);	// Knockback

	for(var i = -40; i <= 40; i += 80 / 3){
		 // Empty Bullet Casings:
		scrShells(100, 40, 3 + random(2), sprBulletShell);

		 // Bouncer Bullets:
		with instance_create(x,y,BouncerBullet){
			move_contact_solid(other.gunangle, 6);
			motion_add(other.gunangle + ((i + random_range(-8, 8)) * other.accuracy), 6);
			image_angle = direction;
			hitid = [sprite_index, "BOUNCER BULLET"];
			team = other.team;
			creator = other;
		}
	}

#define scrShells(_angle, _spread, _speed, _sprite)
	mod_script_call("mod", "gunlocker_tools", "scrShells", _angle, _spread, _speed, _sprite);

#define weapon_sprt
	return global.sprQuadBouncerMachinegun; // Wep Sprite

#define weapon_text
	return "NAMES ARE GETTING LONGER"; // Loading Tip