#define init
	global.sprHyperSlash[0] = sprite_add("../Sprites/Projectiles/Melee/Hyper/HyperSlashStart.png", 3, 26, 24);
	global.sprHyperSlash[1] = sprite_add("../Sprites/Projectiles/Melee/Hyper/HyperSlashMiddle.png", 3, 0, 24);
	global.sprHyperSlash[2] = sprite_add("../Sprites/Projectiles/Melee/Hyper/HyperSlashEnd.png", 3, 0, 24);
	global.mskHyperSlash[0] = sprite_add("../Sprites/Projectiles/Melee/Hyper/mskHyperSlashStart.png", 3, 26, 24);
	global.mskHyperSlash[1] = sprite_add("../Sprites/Projectiles/Melee/Hyper/mskHyperSlashMiddle.png", 3, 0, 24);
	global.mskHyperSlash[2] = sprite_add("../Sprites/Projectiles/Melee/Hyper/mskHyperSlashEnd.png", 3, 0, 24);
	global.sprHyperShank[0] = sprite_add("../Sprites/Projectiles/Melee/Hyper/HyperShankStart.png", 2, 15, 8);
	global.sprHyperShank[1] = sprite_add("../Sprites/Projectiles/Melee/Hyper/HyperShankMiddle.png", 2, 0, 8);
	global.sprHyperShank[2] = sprite_add("../Sprites/Projectiles/Melee/Hyper/HyperShankEnd.png", 2, 0, 8);

#define scrTrail()
	with(trail[1]) image_xscale = point_distance(other.x, other.y, other.xstart, other.ystart);
	with(trail[2]){
		x = other.x;
		y = other.y;
	}
	for(var i = 0; i < array_length_1d(trail) i++) with(trail[i]){
		motion_add(other.direction, other.speed);
		image_angle = other.direction;
		team = other.team;
		creator = other.creator;
		on_hit = ["mod", "gunlocker_tools", "melee_hit"];
	}

#define scrEnd()
	if(image_index + image_speed >= image_number) instance_destroy();

#define hyperhammerslash_create(_x, _y)
	with instance_create(_x, _y, CustomProjectile){
		name = "HyperHammerSlash";
		mask_index = mskSlash;
		hitid = [sprHeavySlash, "HYPER SLASH"];
		image_speed = 0;
		friction = 0.10;
		creator = noone;
		damage = 25;
		force = 12;
		typ = 0;
		walls = 10;
		tries = 90 + (skill_get(13) * 30);
		trail = [instance_create(x,y,CustomProjectile), instance_create(x,y,CustomProjectile), instance_create(x,y,CustomProjectile)];
		on_hit = ["mod", "gunlocker_tools", "blank"];
		on_wall = ["mod", "gunlocker_tools", "blank"];
		on_destroy = hhs_destroy;
		saveVars = ["tries", "trail", "walls"];

		 // Set Up Trails:
		for(var i = 0; i < array_length_1d(trail); i++) with(trail[i]){
			name = "HEAVY HYPER SLASH TRAIL " + string(i);
			sprite_index = global.sprHyperSlash[i];
			mask_index = mskNone;
			image_speed = 0.4;
			image_index = -image_speed;
			friction = other.friction;
			damage = other.damage;
			force = other.force;
			typ = other.typ;
			visible = 0;
			on_step = hhs_step;
			on_hit = ["mod", "gunlocker_tools", "blank"];
			on_wall = ["mod", "gunlocker_tools", "blank"];
			if(fork()){
				wait 2;
				if(instance_exists(self)) mask_index = global.mskHyperSlash[i];
				exit;
			}
		}

		 // Main Stuff:
		if(fork()){
			wait 1;
			if(instance_exists(self)) with(trail) if(instance_exists(self)) visible = 1;
			while(instance_exists(self) && tries > 0){
				tries -= 1;
				x += lengthdir_x(1, direction);
				y += lengthdir_y(1, direction);

				 // Wall Collisions:
				if(place_meeting(x,y,Wall)){
					with(Wall) if(place_meeting(x,y,other)){
						other.walls -= 1;
						sound_play(sndMeleeWall);
						instance_create(x,y,FloorExplo);
						instance_destroy();
					}
					if(walls <= 0) tries = 0;
				}

				 // Portal/Invisible Wall Collisions:
				if(place_meeting(x,y,Portal) || place_meeting(x,y,InvisiWall)) tries = 0;
			}
			if(instance_exists(self)) instance_destroy();
			exit;
		}

		return id;
	}

#define hhs_step
	 // Projectile Deflections:
	if(place_meeting(x,y,projectile)) mod_script_call("mod", "gunlocker_tools", "melee_deflect");

	scrEnd(); // Destroy Self

#define hhs_destroy
	x += lengthdir_x(32, direction);
	y += lengthdir_y(32, direction);

	 // Wall Collisions:
	if(place_meeting(x,y,Wall)){
		sound_play(sndMeleeWall);
		sound_play(sndExplosionS);
	}
	with instance_create(x,y,PortalClear) image_angle = other.direction;

	 // Trail Biz:
	scrTrail();

	 // Move Creator:
	with(creator){
		direction = gunangle;
		x = other.x;
		y = other.y;
		weapon_post(8, point_distance(other.x, other.y, other.xstart, other.ystart) * 1.5, 15)
		motion_add(direction, 4);
	}

#define hypershank_create(_x, _y)
	with instance_create(_x, _y, CustomProjectile){
		name = "HyperShank";
		mask_index = sprShank;
		hitid = [sprShank, "HYPER SHANK"];
		creator = noone;
		damage = 15;
		force = 9;
		typ = 0;
		tries = 24 + (skill_get(13) * 8);
		trail = [instance_create(x,y,CustomProjectile), instance_create(x,y,CustomProjectile), instance_create(x,y,CustomProjectile)];
		on_hit = ["mod", "gunlocker_tools", "blank"];
		on_wall = ["mod", "gunlocker_tools", "blank"];
		on_destroy = hsh_destroy;
		saveVars = ["tries", "trail"];

		 // Set Up Trails:
		for(var i = 0; i < array_length_1d(trail); i++) with(trail[i]){
			name = "HYPER SHANK TRAIL " + string(i);
			sprite_index = global.sprHyperShank[i];
			mask_index = mskNone;
			image_speed = 0.4;
			image_index = -image_speed;
			friction = other.friction;
			damage = other.damage;
			force = other.force;
			typ = other.typ;
			visible = 0;
			on_step = hsh_step;
			on_hit = ["mod", "gunlocker_tools", "blank"];
			on_wall = ["mod", "gunlocker_tools", "blank"];
			if(fork()){
				wait 2;
				if(instance_exists(self)) mask_index = sprite_index;
				exit;
			}
		}

		 // Main Stuff:
		if(fork()){
			wait 1;
			if(instance_exists(self)) with(trail) if(instance_exists(self)) visible = 1;
			while(instance_exists(self) && tries > 0){
				tries -= 1;
				x += lengthdir_x(1, direction);
				y += lengthdir_y(1, direction);

				 // Portal/Invisible Wall Collisions:
				if(place_meeting(x,y,Portal) || place_meeting(x,y,Wall) || place_meeting(x,y,InvisiWall)) tries = 0;
			}
			if(instance_exists(self)) instance_destroy();
			exit;
		}

		return id;
	}
	
#define hsh_step
	 // Projectile Deflections:
	if(place_meeting(x,y,projectile)) with(projectile) if(place_meeting(x,y,other) && team != other.team){
		instance_destroy();
	}

	scrEnd(); // Destroy Self

#define hsh_destroy
	 // Trail Biz:
	scrTrail();

	 // Move Creator:
	with(creator){
		direction = gunangle;
		if(place_free(other.x, other.y)){
			x = other.x;
			y = other.y;
		}
		weapon_post(-8, 1, 0);

		 // Hold on for dear life:
		if(!place_meeting(x,y,Portal) && fork()){
			var _ang = "image_angle";
			if("sprite_angle" in self) _ang = "sprite_angle";
			variable_instance_set(id, _ang, direction - 90);
			wait 1;
			if(instance_exists(self)) variable_instance_set(id, _ang, 0);
			exit;
		}
	}