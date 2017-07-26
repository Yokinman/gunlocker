#define init 
	global.sprHeavySMG = sprite_add_weapon("../Sprites/HeavyBullet/HeavySMG.png", 2, 4);

#define weapon_name
	return "HEAVY SMG"; // Name

#define weapon_type
	return 1; // Bullet Wep

#define weapon_cost
	return 2; // 2 Ammo

#define weapon_area
	return 11; // L0 5-2+

#define weapon_load
	return 3; // 0.10 Seconds

#define weapon_swap
	return sndSwapMachinegun; // Swap Sound

#define weapon_auto
	return 1; // Automatic

#define weapon_fire
	sound_play(sndHeavyMachinegun);	// Sound
	weapon_post(4, 6, 6);			// Kick, Shift, Shake

	 // Empty Heavy Bullet Casing:
	scrShells(100, 25, 2 + random(2), sprHeavyShell);

	 // Heavy Bullet:
	with instance_create(x,y,HeavyBullet){
		move_contact_solid(other.gunangle, 7);
		motion_set(other.gunangle + (random_range(-18, 18) * other.accuracy), 16);
		image_angle = direction;
		hitid = [sprite_index, "HEAVY BULLET"];
		team = other.team;
		creator = other;
	}

#define scrShells(_angle, _spread, _speed, _sprite)
	mod_script_call("mod", "gunlocker_tools", "scrShells", _angle, _spread, _speed, _sprite);

#define weapon_sprt
	return global.sprHeavySMG; // Wep Sprite