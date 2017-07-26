#define init
	global.sprBullgun = sprite_add_weapon("../Sprites/Bullet/Bullgun.png", 4, 2);

#define weapon_name
	return "BULLGUN"; // Name

#define weapon_type
	return 1; // Bullet Wep

#define weapon_cost
	return 8; // 8 Ammo

#define weapon_load
	return 18; // 0.60 Seconds

#define weapon_auto
	return 1; // Automatic

#define weapon_area
	return 4; // L0 1-3+

#define weapon_swap
	return sndSwapMachinegun; // Swap sound

#define weapon_fire
	 // Sound:
	sound_play(sndShotgun);
	sound_play(sndMachinegun);

	 // Kick, Shift, Shake:
	weapon_post(7, -20, 15);

	 // Knockback:
	motion_add(gunangle + 180, 3);

	repeat(8){
		 // Empty Bullet Casings:
		scrShells(100, 25, 2 + random(2), sprBulletShell);

		 // Bullets:
		with instance_create(x,y,Bullet1){
			motion_add(other.gunangle + (random_range(-22, 22) * other.accuracy), 14 + random(2));
			image_angle = direction;
			hitid = [sprite_index, "BULLET"];
			team = other.team;
			creator = other;
		}
	}

#define scrShells(_angle, _spread, _speed, _sprite)
	mod_script_call("mod", "gunlocker_tools", "scrShells", _angle, _spread, _speed, _sprite);

#define weapon_sprt
return global.sprBullgun; // Wep Sprite

#define weapon_text
return "DINKY"; // Loading Tip