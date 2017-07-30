#define init
	global.sprTripleHeavyMachinegun = sprite_add_weapon("../Sprites/HeavyBullet/TripleHeavyMachinegun.png", 4, 7);

#define weapon_name
	return "TRIPLE HEAVY MACHINEGUN"; // Name

#define weapon_type
	return 1; // Bullet Wep

#define weapon_cost
	return 6; // 6 Ammo

#define weapon_load
	return 4; // 0.13 Seconds

#define weapon_area
	return 11; // L0 5-2+

#define weapon_auto
	return 1; // Automatic

#define weapon_swap
	return sndSwapMachinegun; // Swap Sound

#define weapon_fire
	 // Sound:
	sound_play(sndTripleMachinegun);
	sound_play(sndDoubleMinigun);

	 // Kick, Shift, Shake:
	weapon_post(9, -10, 8);

	 // Knockback:
	motion_add(gunangle + 180, 2);

	for(var i = -17; i <= 17; i += 17){
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
	return global.sprTripleHeavyMachinegun; // Wep Sprite

#define weapon_text
	return "@w" + weapon_get_name(argument0) + "@s, SO MUCH AMMO"; // Loading Tip