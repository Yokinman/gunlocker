#define init
	global.sprBigRocket = sprite_add("../Sprites/Projectiles/Bazooka/BigRocket.png", 1, 12, 6);

#define hyperrocket_create(_x, _y)
	 // Hyper Rocket:
	with instance_create(_x, _y, CustomProjectile){
		name = "HyperRocket";
		sprite_index = sprPopoRocket;
		damage = 30;
		force = 18;
		tries = 3200;
		typ = 1;
		hitid = [sprite_index, "HYPER ROCKET"];
		on_hit = ["mod", "gunlocker_tools", "blank"];
		on_destroy = hr_destroy;
		saveVars = ["tries"];
		
		if(fork()){
			wait 1;
			while(instance_exists(self) && tries > 0){
				tries -= 1;
				x += lengthdir_x(4, direction);
				y += lengthdir_y(4, direction);

				 // Smoke Trail:
				if(random(4) < 1) instance_create(x, y, Smoke);

				 // Enemy Collisions:
				if(place_meeting(x,y,hitme)) with(hitme){
					if(place_meeting(x,y,other) && team != other.team){
						projectile_hit(self, other.damage, other.force, other.direction);
						if("lasthit" in self) lasthit = other.hitid;
						other.tries = 0;
					}
				}

				 // Wall Collisions:
				if(place_meeting(x,y,Wall)) tries = 0;

				 // Melee Collisions:
				mod_script_call("mod", "gunlocker_tools", "hyper_collide_melee");
			}
			
			 // Explode:
			if(instance_exists(self)) instance_destroy();
			exit;
		}

		return id;
	}

#define hr_destroy
	sound_play(sndExplosionL);	// Sound
	view_shake_at(x, y, 10);	// Screenshake

	 // Explosions:
	with instance_create(x,y,Explosion){
		hitid = [sprite_index, "EXPLOSION"];
		creator = other;
	}
	var _ang = random(360);
	for(var i = _ang; i < _ang + 360; i += 120){
		with instance_create(x + lengthdir_x(12, i), y + lengthdir_y(12, i), SmallExplosion){
			hitid = [sprite_index, "SMALL EXPLOSION"];
			creator = other;
		}
	}

#define bigrocket_create(_x, _y)
	with instance_create(_x, _y, CustomProjectile){
		name = "BigRocket";
		sprite_index = global.sprBigRocket;
		hitid = [sprite_index, "BIG ROCKET"];
		damage = 40;
		alarm1 = 5;
		active = 0;
		typ = 2;
		on_step = br_step;
		on_draw = br_draw;
		on_destroy = br_destroy;

		sound_play(sndRocketFly);

		return id;
	}

#define br_step
	 // Active-ness:
	if(alarm1 >= 0){
		alarm1--;
		if(alarm1 = 0){
			active = 1;
			view_shake_at(x, y, 4);
		}
	}

	if(active){
		 // Smoke Trail:
		instance_create(x - lengthdir_x(speed * 2, image_angle), y - lengthdir_y(speed * 2, image_angle), Smoke);

		 // Gradually Speed Up:
		if(speed < 12) speed += 0.5;
		else speed = 10;
	}

	 // Explode From Explosions:
	if(place_meeting(x,y,Explosion)) instance_destroy();

#define br_draw
	 // Draw Rocket Flame:
	if(active){
		draw_sprite_ext(sprRocketFlame, -1, x - lengthdir_x(4,image_angle), y - lengthdir_y(4,image_angle), 1, 1.2, image_angle, c_white, image_alpha);
		draw_set_blend_mode(bm_add);
		draw_sprite_ext(sprRocketFlame, 0, x, y, 2 * image_xscale, 2 * image_yscale, image_angle, c_white, 0.1);
	}
	draw_set_blend_mode(bm_normal);
	draw_self();

#define br_destroy
	sound_play(sndExplosionL); // Sound
	view_shake_at(x, y, 20);   // Screenshake

	 // Explosion:
	var j = random(360);
	for(var i = j; i < j + 360; i += 360/3){
		with instance_create(x + lengthdir_x(4, i), y + lengthdir_y(4, i), Explosion){
			hitid = [sprite_index, "EXPLOSION"];
			creator = other;
			repeat(3) with instance_create(x,y,SmallExplosion){
				hitid = [sprite_index, "SMALL EXPLOSION"];
				creator = other.creator;
			}
		}
	}

	var _x = x;
	var _y = y;
	var _team = team;
	var _creator = creator;

	 // Child Missiles:
	var j = random(360);
	for(var i = j; i < j+360; i += 360/5){
		with instance_create(_x + lengthdir_x(24, i), _y + lengthdir_y(24, i), Rocket){
			hitid = [sprite_index, "ROCKET"];
			team = _team;
			creator = _creator;
			direction = i;
			image_angle = direction;
			
			var _msk = mask_index;
			mask_index = mskNone;
			
			if(fork()){
				wait(5);
				if(instance_exists(self)) mask_index = _msk;
				exit;
			}
		}
	}