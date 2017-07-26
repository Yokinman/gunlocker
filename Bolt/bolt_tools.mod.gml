#define init
	global.sprHyperBolt = sprite_add("../Sprites/Projectiles/Bolt/HyperBolt.png", 1, 8, 4);

#define hyperbolt_create(_x, _y)
	 // Hyper Bolt:
	with(instance_create(_x, _y, CustomProjectile)){
		name = "Hyper Bolt";
		sprite_index = global.sprHyperBolt;
		mask_index = mskBolt;
		hitid = [sprite_index, "HYPER BOLT"];
		damage = 25;
		force = 12;
		tries = 1500;
		typ = 1;
		on_hit = ["mod", "gunlocker_tools", "blank"];
		saveVars = ["tries"];
		
		if(fork()){
			wait 1;
			while(instance_exists(self) && tries > 0){
				tries -= 1;
				x += lengthdir_x(1, direction);
				y += lengthdir_y(1, direction);

				 // Home On Enemies W/ Bolt Marrow:
				if(skill_get(21)){
					var _home = instance_nearest(x,y,enemy);
					if(distance_to_object(_home) < 12 && projectile_canhit_melee(_home)){
						with instance_create(x,y,BoltTrail){ // Trail
							image_angle = other.direction;
							image_xscale = point_distance(other.x, other.y, _home.x, _home.y);
							image_yscale = min(1.4 + (point_distance(other.x, other.y, other.xstart, other.ystart) / 360), 2);
							image_angle = point_direction(other.x, other.y, _home.x, _home.y);
						}
						x = _home.x;
						y = _home.y;
					}
				}

				 // Trail (This makes a loooot of bolttrail objects, and i don't feel like optimizing it):
				with instance_create(x,y,BoltTrail){
					image_angle = other.direction;
					image_yscale = min(1.4 + (point_distance(x, y, other.xstart, other.ystart) / 360), 2);
				}
				
				 // Enemy Collisions:
				if(place_meeting(x,y,hitme)) with(hitme){
					if(place_meeting(x,y,other) && team != other.team){
						 // Piercing Health:
						if(my_health >= 10) other.tries = 0;

						 // Damage:
						projectile_hit(self, other.damage, other.force, other.direction);
						if("lasthit" in self) lasthit = other.hitid;

						 // Stick In Enemies:
						if(my_health > 0){
							other.tries = 0;
							var _ang = point_direction(other.creator.x, other.creator.y, other.x, other.y);
							with instance_create(x,y,BoltStick){
								sprite_index = global.sprHyperBolt;
								image_angle = _ang;
								target = other;
							}
						}
					}
				}
				
				 // Wall Collisions:
				if(place_meeting(x,y,Wall)){
					tries = 0;
					sound_play(sndBoltHitWall);
					with instance_create(x + lengthdir_x(7, direction), y + lengthdir_y(7, direction), Bolt){
						team = other.team;
						direction = other.direction;
						image_angle = direction;
						sprite_index = other.sprite_index;
						mask_index = mskNone;
						alarm0 = 30;
					}
				}
				
				 // Melee Collisions:
				mod_script_call("mod", "gunlocker_tools", "hyper_collide_melee");
			}

			if(instance_exists(self)){
				 // Screenshake:
				view_shake_at(x, y, 4);

				 // Dust Visual:
				repeat(5) with instance_create(x + lengthdir_x(8, direction), y + lengthdir_y(8, direction), Dust){
					motion_add(other.direction + choose(90, -90) + random_range(-10, 10), 2 + random(1));
				}

				instance_destroy();
			}
			exit;
		}

		return id;
	}
