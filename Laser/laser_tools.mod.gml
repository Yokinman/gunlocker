#define init
	global.sprSuperLaser = sprite_add("../Sprites/Projectiles/Laser/SuperLaser.png", 1, 2, 6);
	global.mskSuperLaser = sprite_add("../Sprites/Projectiles/Laser/mskSuperLaser.png", 1, 2, 4);

#define scrCharge(_charge)
	image_xscale += _charge;
	image_yscale += _charge;

#define scrFollow(_xoffset, _yoffset)
	if(instance_exists(creator)){
		direction = creator.gunangle;
		x = creator.x + lengthdir_x(_xoffset, direction) + lengthdir_x(_yoffset, direction + (90 * creator.right));
		y = creator.y + lengthdir_y(_xoffset, direction) + lengthdir_y(_yoffset, direction + (90 * creator.right));
	}

#define lasershotburst_create(_x, _y)
	with instance_create(_x, _y, CustomProjectile){
		name = "LaserShotgun";
		sprite_index = sprPlasmaBall;
		image_speed = 0;
		image_xscale = 0.2;
		image_yscale = image_xscale;
		hitid = [sprite_index, "LASER CHARGE"];
		creator = noone;
		damage = 3;
		alarm0 = 1;
		force = 6;
		ammo = 7 + skill_get(17);
		subammo = ammo / 2;
		typ = 0;
		saveVars = ["subammo"];
		on_step = ls_step;
		on_hit = ["mod", "gunlocker_tools", "melee_hit"];
		on_wall = ["mod", "gunlocker_tools", "blank"];
		return id;
	}

#define ls_step
	 // Charge Up:
	scrCharge(0.015);

	 // Follow Creator:
	scrFollow(13.5, -1);

	 // Laser Firing:
	if(alarm0 >= 0){
		alarm0 -= 1;
		if(alarm0 = 0){
			 // Sound:
			if(skill_get(17)) sound_play_pitch(sndLaserUpg,	0.75);
						 else sound_play_pitch(sndLaser,	0.75);

			 // Kick, Shift, Shake:
			with(creator) weapon_post(6, -14, 8);

			 // Accuracy Stuff:
			var _accuracy = 1;
			if("accuracy" in creator) _accuracy = creator.accuracy;

			 // Laser Shotgun:
			repeat(ammo) with instance_create(x,y,Laser){
				alarm0 = 1;
				image_angle = other.direction + (random_range(-14, 14) * _accuracy);
				image_yscale = 1.6 + (skill_get(17) * 0.6);
				hitid = [sprite_index, "LASER"];
				team = other.team;
				creator = other.creator;
			}

			instance_destroy();
		}
	}

#define superlasercannon_create(_x, _y)
	with instance_create(_x, _y, CustomProjectile){
		name = "SuperLaserCannon";
		sprite_index = sprPlasmaBallHuge;
		image_speed = 0;
		image_xscale = 0.1;
		image_yscale = image_xscale;
		hitid = [sprite_index, "LASER CHARGE"];
		damage = 10;
		alarm0 = 1;
		force = 10;
		ammo = 12 + (2 * skill_get(17));
		subammo = ammo / 2;
		time = 1;
		typ = 0;
		on_step = slc_step;
		on_hit = ["mod", "gunlocker_tools", "melee_hit"];
		on_wall = ["mod", "gunlocker_tools", "blank"];
		return id;
	}

#define slc_step
	 // Charge Up:
	scrCharge(0.005);

	 // Follow Creator:
	scrFollow(22, 0);

	 // Laser Firing:
	if(alarm0 >= 0){
		alarm0 -= 1;
		if(alarm0 = time + 1){
			 // Sound:
			if(skill_get(17)){ // Laser Brain
				sound_play(sndPlasmaBigUpg);
				sound_play(sndUltraLaserUpg);
			}
			else{ // Normal
				sound_play(sndPlasmaBig);
				sound_play(sndUltraLaser);
			}
		}
		if(alarm0 = 0){
			ammo -= 1;
			alarm0 = time;
			image_xscale /= 2;
			image_yscale /= 2;

			 // More Sound:
			if skill_get(17){ // Laser Brain
				sound_play(sndLaserCannonUpg);
				sound_play(sndLaserUpg);
				sound_play(sndPlasmaMinigunUpg);
			}
			else{ // Normal
				sound_play(sndLaserCannon);
				sound_play(sndLaser);
				sound_play(sndPlasmaMinigun);
			}

			 // Kick, Shift, Shake:
			with(creator) weapon_post(8, -10, 12);

			 // Accuracy Stuff:
			var _accuracy = 1;
			if("accuracy" in creator) _accuracy = creator.accuracy;

			 // Shoot Lasers:
			for(var i = 0; i < floor(subammo - (ammo / 2)) + 1; i++){
				repeat(2){
					with instance_create(x,y,Laser){
						alarm0 = 1;
						sprite_index = global.sprSuperLaser;
						mask_index = global.mskSuperLaser;
						image_angle = other.direction + ((i * 2) * _accuracy);
						image_yscale = 1.6 + (skill_get(17) * 0.6);
						hitid = [sprite_index, "LASER"];
						team = other.team;
						creator = other.creator;
					}
					i *= -1;
				}
			}

			 // Finished Shooting:
			if(ammo <= 0){			
				 // Even More Sound:
				if(skill_get(17)) sound_play(sndUltraLaserUpg); // Laser Brain
				else sound_play(sndUltraLaser); // Normal

				instance_destroy();
			}
		}
	}