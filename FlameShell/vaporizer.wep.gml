#define init
	global.sprVaporizer = sprite_add_weapon("../Sprites/FlameShell/Vaporizer.png", 5, 6);

#define weapon_name
	return "VAPORIZER"; // Name

#define weapon_type
	return 1; // Bullet Wep

#define weapon_cost
	return 4; // 4 Ammo

#define weapon_load
	return 2; // 0.07 Seconds

#define weapon_auto
	return 1; // Automatic

#define weapon_area
	return 19; // L1 1-2+

#define weapon_swap
	return sndSwapFlame; // Swap sound

#define weapon_fire
	sound_play(sndIncinerator);		// Sound
	weapon_post(10, -10, 10);		// Kick, Shift, Shake
	motion_add(gunangle + 180, 1);	// Knockback

	for(var i = -22.5; i <= 22.5; i += 15){
		 // Empty Bullet Casings:
		scrShells(100, 25, 4 + random(3), sprBulletShell);

		 // Flame Shells:
		with instance_create(x, y, FlameShell){
			motion_add(other.gunangle + ((i + random_range(-4, 4)) * other.accuracy), 16);
			image_angle = direction;
			hitid = [sprite_index, "FLAME SHELL"];
			team = other.team;
			creator = other;
		}
	}

#define scrShells(_angle, _spread, _speed, _sprite)
	mod_script_call("mod", "gunlocker_tools", "scrShells", _angle, _spread, _speed, _sprite);

#define weapon_sprt
	return global.sprVaporizer; // Wep Sprite

#define weapon_text
	return "GONE IN AN INSTANT"; // Loading Tip