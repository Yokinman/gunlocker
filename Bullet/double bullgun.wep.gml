#define init
	global.sprDoubleBullgun = sprite_add_weapon("../Sprites/Bullet/DoubleBullgun.png", 4, 2);

#define weapon_name
	return "DOUBLE BULLGUN"; // Name

#define weapon_type
	return 1; // Bullet Wep

#define weapon_cost
	return 16; // 16 Ammo

#define weapon_load
	return 24; // 0.80 Seconds

#define weapon_auto
	return 1; // Automatic

#define weapon_area
	return 6; // L0 3-1+

#define weapon_swap
	return sndSwapShotgun; // Swap sound

#define weapon_fire
	 // Sound:
	sound_play(sndDoubleShotgun);
	sound_play(sndMachinegun);

	 // Kick, Shift, Shake:
	weapon_post(10, -15, 30);

	 // Knockback:
	motion_add(gunangle + 180, 3);

	repeat(16){
		 // Empty Bullet Casings:
		scrShells(100, 40, 2 + random(3), sprBulletShell);

		 // Bullets:
		with instance_create(x,y,Bullet1){
			motion_add(other.gunangle + (random_range(-34, 34) * other.accuracy), 14 + random(2));
			image_angle = direction;
			hitid = [sprite_index, "BULLET"];
			team = other.team;
			creator = other;
		}
	}

#define scrShells(_angle, _spread, _speed, _sprite)
	mod_script_call("mod", "gunlocker_tools", "scrShells", _angle, _spread, _speed, _sprite);

#define weapon_sprt
	return global.sprDoubleBullgun; // Wep Sprite

#define weapon_text
	return "BULLETS"; // Loading Tip