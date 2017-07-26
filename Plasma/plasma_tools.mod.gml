#define init

#define hyperplasmatrail_create(_x, _y, _turn)
	with instance_create(_x, _y, PlasmaTrail){
		image_speed /= 1 + random(3);
		friction = -0.1;

		if(fork()){
			wait 1;
			if(instance_exists(self)){
				var _wave = random(360);
				var _odir = direction;
			
				while(instance_exists(self)){
					_wave += 0.25;
					direction = _odir + sin(_wave) * _turn;
					wait 1;
				}
			}
			exit;
		}

		return id;
	}

#define hyperplasma_create(_x, _y)
	with instance_create(_x, _y, CustomProjectile){
		name = "HyperPlasma";
		sprite_index = sprPlasmaBall;
		mask_index = mskPlasma;
		hitid = [sprite_index, "HYPER PLASMA"];
		tries = 3200;
		damage = 5;
		force = 6;
		typ = 2;
		image_xscale = 1 + (skill_get(17) * 0.2);
		image_yscale = image_xscale;
		image_index = 1;
		image_speed = 0;
		on_hit = ["mod", "gunlocker_tools", "blank"];
		on_destroy = hp_destroy;
		saveVars = ["tries"];
		
		if(fork()){
			wait 1;
			while(instance_exists(self) && tries > 0){
				tries -= 1;
				x += lengthdir_x(4, direction);
				y += lengthdir_y(4, direction);

				 // Plasma Trail:
				var _dir = random(360);
				var _len = random(8);
				with hyperplasmatrail_create(x + lengthdir_x(_len, _dir), y + lengthdir_y(_len, _dir), 90){
					motion_set(other.direction + choose(-90, 90), random(1));
				}

				 // Enemy Collisions:
				if(place_meeting(x,y,hitme)) with(hitme){
					if(place_meeting(x,y,other) && team != other.team && my_health > 0){
						projectile_hit(self, other.damage, other.force, other.direction);
						if("lasthit" in self) lasthit = other.hitid;

						 // Shrink Plasma:
						with(other){
							image_xscale -= 0.1;
							image_yscale -= 0.1;
						}
					}
				}

				 // Wall Collisions:
				if(place_meeting(x,y,Wall) || image_xscale <= 0.5) tries = 0;

				 // Melee Collisions:
				mod_script_call("mod", "gunlocker_tools", "hyper_collide_melee");
			}

			if(instance_exists(self)) instance_destroy();
			exit;
		}

		return id;
	}

#define hp_destroy
	sound_play(sndPlasmaBigExplode);	// Sound
	view_shake_at(x, y, 10);			// Screenshake
	instance_create(x,y,PlasmaImpact);	// Plasma Impact