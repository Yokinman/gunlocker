#define init 
	global.sprCampfireGun = sprite_add_weapon("../Sprites/FlameShell/Campfire.png", 4, 4);

#define weapon_name
	return "CAMPFIRE"; // Name

#define weapon_type
	return 1; // Bullet Wep

#define weapon_area
	return 13; // L0 6-1+

#define weapon_auto
	return 1; // Automatic

#define weapon_swap
	return sndSwapMachinegun; // Swap Sound

#define weapon_fire
	sound_play(sndMinigun);				// Sound
	weapon_post(5, -6, 6);				// Kick, Shift, Shake
	motion_add(gunangle + 180, 0.5);	// Knockback

	 // Empty Bullet Casing:
	scrShells(100, 30, 2 + random(3), sprBulletShell);

	 // Flame Shell:
	with instance_create(x,y,FlameShell){
		move_contact_solid(other.gunangle, 2);
		motion_add(other.gunangle + (random_range(-16, 16) * other.accuracy), 14 + random(2));
		image_angle = direction;
		hitid = [sprite_index, "FLAME SHELL"];
		team = other.team;
		creator = other;
	}

#define scrShells(_angle, _spread, _speed, _sprite)
	mod_script_call("mod", "gunlocker_tools", "scrShells", _angle, _spread, _speed, _sprite);

#define weapon_sprt
	return global.sprCampfireGun; // Wep Sprite

#define weapon_text
	return "SECOND DEGREE BURNS"; // Loading Tip