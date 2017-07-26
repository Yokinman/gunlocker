#define init
	global.sprDoubleHeavyBullgun = sprite_add_weapon("../Sprites/HeavyBullet/DoubleHeavyBullgun.png", 4, 3);

#define weapon_name
	return "DOUBLE HEAVY BULLGUN"; // Name

#define weapon_type
	return 1; // Bullet Wep

#define weapon_cost
	return 32; // 32 Ammo

#define weapon_load
	return 24; // 0.80 Seconds

#define weapon_auto
	return 1; // Automatic

#define weapon_area
	return 14; // L0 7-1+

#define weapon_swap
	return sndSwapShotgun; // Swap sound

#define weapon_fire
	 // Sound:
	sound_play(sndHeavySlugger);
	sound_play(sndHeavyMachinegun);

	 // Kick, Shift, Shake:
	weapon_post(10, -15, 30);

	 // Knockback:
	motion_add(gunangle + 180, 4);

	repeat(16){
		 // Empty Heavy Bullet Casings:
		scrShells(100, 40, 2 + random(3), sprHeavyShell);

		 // Heavy Bullets:
		with instance_create(x, y, HeavyBullet){
			motion_add(other.gunangle + (random_range(-34, 34) * other.accuracy), 14 + random(2));
			image_angle = direction;
			hitid = [sprite_index, "HEAVY BULLET"];
			team = other.team;
			creator = other;
		}
	}

#define scrShells(_angle, _spread, _speed, _sprite)
	mod_script_call("mod", "gunlocker_tools", "scrShells", _angle, _spread, _speed, _sprite);

#define weapon_sprt
	return global.sprDoubleHeavyBullgun; // Wep Sprite

#define weapon_text
	return "FEEL THE FURY"; // Loading Tip