#define init 
	global.sprScorcher = sprite_add_weapon("../Sprites/FlameShell/Scorcher.png", 0, 1);

#define weapon_name
	return "SCORCHER"; // Name

#define weapon_type
	return 1; // Bullet Wep

#define weapon_area
	return 5; // L0 2-1+

#define weapon_load
	return 6; // 0.20 Seconds

#define weapon_swap
	return sndSwapPistol; // Swap Sound

#define weapon_fire
	sound_play(sndIncinerator); // Sound

	repeat(2) if instance_exists(self){
		sound_play(sndPopgun); // More Sound
		weapon_post(3, -5, 5); // Kick, Shift, Shake
		
		 // Bullet Casings:
		scrShells(100, 25, 2 + random(2), sprBulletShell);

		 // Flame Shells:
		with instance_create(x,y,FlameShell){
			motion_add(other.gunangle + (random_range(-4, 4) * other.accuracy), 14 + random(2));
			image_angle = direction;
			hitid = [sprite_index, "FLAME SHELL"];
			team = other.team;
			creator = other;
		}

		wait 2;
	}

#define scrShells(_angle, _spread, _speed, _sprite)
	mod_script_call("mod", "gunlocker_tools", "scrShells", _angle, _spread, _speed, _sprite);

#define weapon_sprt
	return global.sprScorcher; // Wep Sprite

#define weapon_text
	return "WARM TO THE TOUCH"; // Loading Tip