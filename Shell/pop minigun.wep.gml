#define init 
	global.sprPopMinigun = sprite_add_weapon("../Sprites/Shell/PopMinigun.png", 5, 4);

#define weapon_name
	return "POP MINIGUN"; // Name

#define weapon_type
	return 1; // Bullet Wep

#define weapon_area
	return 7; // L0 3-2+

#define weapon_auto
	return 1; // Automatic

#define weapon_swap
	return sndSwapMachinegun; // Swap Sound

#define weapon_fire
	sound_play(sndPopgun);				// Sound
	weapon_post(2, -7, 3);				// Kick, Shift, Shake
	motion_add(gunangle + 180, 0.6);	// Knockback

	 // Empty Bullet Casing:
	scrShells(100, 25, 2 + random(3), sprBulletShell);

	 // Shell:
	with instance_create(x,y,Bullet2){
		motion_add(other.gunangle + (random_range(-16, 16) * other.accuracy), 16 + random(2));
		image_angle = direction;
		hitid = [sprite_index, "SHELL"];
		team = other.team;
		creator = other;
	}

#define scrShells(_angle, _spread, _speed, _sprite)
	mod_script_call("mod", "gunlocker_tools", "scrShells", _angle, _spread, _speed, _sprite);

#define weapon_sprt
	return global.sprPopMinigun; // Wep Sprite

#define weapon_text
	return "LET'S GET TO WORK"; // Loading Tip