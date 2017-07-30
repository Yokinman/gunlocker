#define init
	global.sprQuadHeavyMachinegun = sprite_add_weapon("../Sprites/HeavyBullet/QuadrupleHeavyMachinegun.png", 4, 8);

#define weapon_name
	return "QUADRUPLE HEAVY MACHINEGUN"; // Name

#define weapon_type
	return 1; // Bullet Wep

#define weapon_cost
	return 8; // 8 Ammo

#define weapon_load
	return 4; // 0.13 Seconds

#define weapon_area
	return 14; // L0 7-1+

#define weapon_auto
	return 1; // Automatic

#define weapon_swap
	return sndSwapMachinegun; // Swap Sound

#define weapon_fire
	 // Sound:
	sound_play(sndQuadMachinegun);
	sound_play(sndDoubleMinigun);

	 // Kick, Shift, Shake: 
	weapon_post(10, -10, 10);

	 // Knockback:
	motion_add(gunangle + 180, 3);

	for(var i = -24; i <= 24; i += 16){
		 // Empty Heavy Bullet Casings:
		scrShells(100, 40, 3 + random(2), sprHeavyShell);

		 // Heavy Bullets:
		with instance_create(x,y,HeavyBullet){
			motion_add(other.gunangle + ((i + random_range(-3, 3)) * other.accuracy), 16);
			image_angle = direction;
			hitid = [sprite_index, "HEAVY BULLET"];
			team = other.team;
			creator = other;
		}
	}

#define scrShells(_angle, _spread, _speed, _sprite)
	mod_script_call("mod", "gunlocker_tools", "scrShells", _angle, _spread, _speed, _sprite);

#define weapon_sprt
	return global.sprQuadHeavyMachinegun; // Wep Sprite

#define weapon_text
	return "BIG GUNS"; // Loading Tip