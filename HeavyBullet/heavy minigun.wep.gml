#define init
	global.sprHeavyMinigun = sprite_add_weapon("../Sprites/HeavyBullet/HeavyMinigun.png", 4, 4);

#define weapon_name
	return "HEAVY MINIGUN"; // Name

#define weapon_type
	return 1; // Bullet Wep

#define weapon_cost
	return 2; // 2 Ammo

#define weapon_area
	return 14; // L0 7-1+

#define weapon_auto
	return 1; // Automatic

#define weapon_swap
	return sndSwapMachinegun; // Swap Sound

#define weapon_fire
	 // Sound:
	sound_play(sndHyperRifle);
	sound_play(sndMinigun);

	 // Kick, Shift, Shake:
	weapon_post(4, -10, 5);

	 // Knockback:
	motion_add(gunangle + 180, 0.6);

	 // Empty Heavy Bullet Casing:
	scrShells(100, 40, 3 + random(2), sprHeavyShell);

	 // Heavy Bullet:
	with instance_create(x, y, HeavyBullet){
		move_contact_solid(other.gunangle, 4);
		motion_add(other.gunangle + (random_range(-13, 13) * other.accuracy), 16);
		image_angle = direction;
		hitid = [sprite_index, "HEAVY BULLET"];
		team = other.team;
		creator = other;
	}

#define scrShells(_angle, _spread, _speed, _sprite)
	mod_script_call("mod", "gunlocker_tools", "scrShells", _angle, _spread, _speed, _sprite);

#define weapon_sprt
	return global.sprHeavyMinigun; // Wep Sprite

#define weapon_text
	return "HEAVY LIFTING"; // Loading Tip