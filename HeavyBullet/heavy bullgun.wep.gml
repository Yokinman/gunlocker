#define init
	global.sprHeavyBullgun = sprite_add_weapon("../Sprites/HeavyBullet/HeavyBullgun.png", 4, 3);

#define weapon_name
	return "HEAVY BULLGUN"; // Name

#define weapon_type
	return 1; // Bullet Wep

#define weapon_cost
	return 16; // 16 Ammo

#define weapon_load
	return 18; // 0.60 Seconds

#define weapon_auto
	return 1; // Automatic

#define weapon_area
	return 11; // L0 5-2+

#define weapon_swap
	return sndSwapShotgun; // Swap sound

#define weapon_fire
	 // Sound:
	sound_play(sndSlugger);
	sound_play(sndHeavyMachinegun);

	 // Kick, Shift, Shake:
	weapon_post(7, -20, 15);

	 // Knockback:
	motion_add(gunangle + 180, 3);

	repeat(8){
		 // Empty Heavy Bullet Casings
		scrShells(100, 40, 2 + random(2), sprHeavyShell);

		 // Heavy Bullets:
		with instance_create(x, y, HeavyBullet){
			motion_add(other.gunangle + (random_range(-22, 22) * other.accuracy), 14 + random(2));
			image_angle = direction;
			hitid = [sprite_index, "HEAVY BULLET"];
			team = other.team;
			creator = other;
		}
	}

#define scrShells(_angle, _spread, _speed, _sprite)
	mod_script_call("mod", "gunlocker_tools", "scrShells", _angle, _spread, _speed, _sprite);

#define weapon_sprt
	return global.sprHeavyBullgun; // Wep Sprite

#define weapon_text
	return "HEAVY DUTY"; // Loading Tip