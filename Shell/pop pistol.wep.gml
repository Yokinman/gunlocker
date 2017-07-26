#define init 
	global.sprPopPistol = sprite_add_weapon("../Sprites/Shell/PopPistol.png", 0, 1);

#define weapon_name
	return "POP PISTOL"; // Name

#define weapon_type
	return 1; // Bullet Wep

#define weapon_area
	return 3; // L0 1-2+

#define weapon_load
	return 5; // 0.17 Seconds

#define weapon_swap
	return sndSwapPistol; // Swap Sound

#define weapon_fire
	repeat(2) if instance_exists(self){
		sound_play(sndPopgun);	// Sound
		weapon_post(3, -4, 4);	// Kick, Shift, Shake

		 // Empty Bullet Casing:
		scrShells(100, 25, 2 + random(2), sprBulletShell);

		 // Shell:
		with instance_create(x,y,Bullet2){
			motion_add(other.gunangle + (random_range(-4, 4) * other.accuracy), 15 + random(1));
			image_angle = direction;
			hitid = [sprite_index, "SHELL"];
			team = other.team;
			creator = other;
		}

		wait 2;
	}

#define scrShells(_angle, _spread, _speed, _sprite)
	mod_script_call("mod", "gunlocker_tools", "scrShells", _angle, _spread, _speed, _sprite);

#define weapon_sprt
	return global.sprPopPistol; // Wep Sprite

#define weapon_text
	return "I GUESS IT WORKS"; // Loading Tip