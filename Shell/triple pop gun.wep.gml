#define init
	global.sprTriplePopgun = sprite_add_weapon("../Sprites/Shell/TriplePopgun.png", 4, 6);

#define weapon_name
	return "TRIPLE POP GUN"; // Name

#define weapon_type
	return 1; // Bullet Wep

#define weapon_cost
	return 3; // 3 Ammo

#define weapon_load
	return 2; // 0.07 Seconds

#define weapon_area
	return 6; // L0 3-1+

#define weapon_auto
	return 1; // Automatic

#define weapon_swap
	return sndSwapMachinegun; // Swap Sound

#define weapon_fire
	 // Sound:
	sound_play(sndPopgun);
	sound_play(sndMinigun);

	 // Kick, Shift, Shake: 
	weapon_post(4, -12, 4);

	 // Knockback:
	motion_add(gunangle + 180, 1);

	for(var i = -17; i <= 17; i += 17){
		 // Empty Bullet Casings:
		scrShells(100, 40, 3 + random(2), sprBulletShell);

		 // Shells:
		with instance_create(x,y,Bullet2){
			move_contact_solid(other.gunangle, 4);
			motion_add(other.gunangle + ((i + random_range(-4, 4)) * other.accuracy), 16);
			image_angle = direction;
			hitid = [sprite_index, "SHELL"];
			team = other.team;
			creator = other;
		}
	}

#define scrShells(_angle, _spread, _speed, _sprite)
	mod_script_call("mod", "gunlocker_tools", "scrShells", _angle, _spread, _speed, _sprite);

#define weapon_sprt
	return global.sprTriplePopgun; // Wep Sprite

#define weapon_text
	return "IT REALLY WORKS"; // Loading Tip