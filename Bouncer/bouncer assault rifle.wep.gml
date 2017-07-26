#define init
	global.sprBouncerAssaultRifle = sprite_add_weapon("../Sprites/Bouncer/AssaultBouncerRifle.png", 7, 5);

#define weapon_name
	return "BOUNCER ASSAULT RIFLE"; // Name 

#define weapon_type
	return 1; // Bullet Wep

#define weapon_cost
	return 3; // 3 Ammo

#define weapon_area
	return 6; // L0 3-1+

#define weapon_load
	return 11; // 0.37 Seconds

#define weapon_auto
	return 1; // Automatic

#define weapon_swap
	return sndSwapPistol; // Swap Sound

#define weapon_fire
	repeat(3) if instance_exists(self){
		weapon_post(4, -6, 4);		// Kick, Shift, Shake
		sound_play(sndBouncerSmg);	// Sound

		 // Empty Bullet Casings:
		scrShells(100, 25, 3 + random(2), sprBulletShell);

		 // Bouncer Bullets:
		with instance_create(x,y,BouncerBullet){
			motion_add(other.gunangle + (random_range(-3, 3) * other.accuracy), 6);
			image_angle = direction;
			hitid = [sprite_index, "BOUNCER BULLET"];
			team = other.team;
			creator = other;
		}

		wait 2;
	}

#define scrShells(_angle, _spread, _speed, _sprite)
	mod_script_call("mod", "gunlocker_tools", "scrShells", _angle, _spread, _speed, _sprite);

#define weapon_sprt
return global.sprBouncerAssaultRifle; // Wep Sprite