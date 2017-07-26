#define init
	global.sprDoubleHeavyMinigun = sprite_add_weapon("../Sprites/HeavyBullet/DoubleHeavyMinigun.png", 5, 8);

#define weapon_name
	return "DOUBLE HEAVY MINIGUN"; // Name

#define weapon_type
	return 1; // Bullet Wep

#define weapon_area
	return 20; // L1 1-3+

#define weapon_cost
	return 4; // 4 Ammo

#define weapon_auto
	return 1; // Automatic

#define weapon_swap
	return sndSwapMachinegun; // Swap sound

#define weapon_fire
	 // Sound:
	sound_play(sndHyperRifle);
	sound_play(sndDoubleMinigun);

	 // Kick, Shift, Shake:
	weapon_post(8, -15, 8);

	 // Knockback:
	motion_add(gunangle + 180, 1);

	for(var i = -8; i <= 8; i += 16){
		 // Empty Heavy Bullet Casings:
		scrShells(100, 40, 3 + random(2), sprHeavyShell);

		 // Heavy Bullets:
		with instance_create(x,y,HeavyBullet){
			move_contact_solid(other.gunangle, 6);
			motion_add(other.gunangle + i + (random_range(-8, 8) * other.accuracy), 16);
			image_angle = direction;
			hitid = [sprite_index, "HEAVY BULLET"];
			team = other.team;
			creator = other;
		}
	}

#define scrShells(_angle, _spread, _speed, _sprite)
	mod_script_call("mod", "gunlocker_tools", "scrShells", _angle, _spread, _speed, _sprite);

#define weapon_sprt
	return global.sprDoubleHeavyMinigun; // Weapon Sprite

#define weapon_text
	with(Player){
		if(race = "steroids"){
			if(wep = argument0 && bwep = argument0) return "THE DREAM"; // Double Roids Tip
			else return "A DREAM"; // Single Roids Tip
		}
		else return "IT EXISTS"; // Standard Tip
	}