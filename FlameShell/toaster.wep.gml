#define init 
	global.sprToaster = sprite_add_weapon("../Sprites/FlameShell/Toaster.png", 5, 2);

#define weapon_name
	return "TOASTER"; // Name

#define weapon_type
	return 1; // Bullet Wep

#define weapon_area
	return 6; // L0 3-1+

#define weapon_load
	return 2; // 0.07 Seconds

#define weapon_auto
	return 1; // Automatic

#define weapon_swap
	return sndSwapMachinegun; // Swap Sound

#define weapon_fire
	 // Sound:
	sound_play(sndIncinerator);
	sound_play(sndPopgun);

	 // Kick, Shift Shake:
	weapon_post(3, -5, 4);

	 // Empty Bullet Casing:
	scrShells(100, 25, 2 + random(3), sprBulletShell);

	 // Flame Shell:
	with instance_create(x,y,FlameShell){
		motion_add(other.gunangle + (random_range(-4, 4) * other.accuracy), 14 + random(2));
		image_angle = direction;
		hitid = [sprite_index, "FLAME SHELL"];
		team = other.team;
		creator = other;
	}

#define scrShells(_angle, _spread, _speed, _sprite)
	mod_script_call("mod", "gunlocker_tools", "scrShells", _angle, _spread, _speed, _sprite);

#define weapon_sprt
	return global.sprToaster; // Wep Sprite

#define weapon_text
	return "FIRST DEGREE BURNS"; // Loading Tip