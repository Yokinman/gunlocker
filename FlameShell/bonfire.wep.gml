#define init 
	global.sprBonfireGun = sprite_add_weapon("../Sprites/FlameShell/Bonfire.png", 5, 6);

#define weapon_name
	return "BONFIRE"; // Name

#define weapon_type
	return 1; // Bullet Wep

#define weapon_cost
	return 2; // 2 Ammo

#define weapon_area
	return 21; // L1 2-1+

#define weapon_auto
	return 1; // Automatic

#define weapon_swap
	return sndSwapMachinegun; // Swap Sound

#define weapon_fire
	sound_play(sndIncinerator);			// Sound
	weapon_post(6, -10, 6);				// Kick, Shift, Shake
	motion_add(gunangle + 180, 0.8);	// Knockback

	for(var i = -8; i <= 8; i += 16){
		 // Empty Bullet Casings:
		scrShells(100, 40, 3 + random(2), sprBulletShell);

		 // Flame Shells:
		with instance_create(x,y,FlameShell){
			move_contact_solid(other.gunangle, 4);
			motion_add(other.gunangle + i + (random_range(-18, 18) * other.accuracy), 14 + random(2));
			image_angle = direction;
			hitid = [sprite_index, "FLAME SHELL"];
			team = other.team;
			creator = other;
		}
	}

#define scrShells(_angle, _spread, _speed, _sprite)
	mod_script_call("mod", "gunlocker_tools", "scrShells", _angle, _spread, _speed, _sprite);

#define weapon_sprt
	return global.sprBonfireGun; // Wep Sprite

#define weapon_text
	return "THIRD DEGREE BURNS"; // Loading Tip