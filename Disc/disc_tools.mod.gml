 // I kinda just remade discs just so i could change their trail ¯\_(ツ )_/¯

#define init
	global.sprMiniDisc = sprite_add("../Sprites/Projectiles/Disc/DiscMini.png", 2, 4, 4);
	global.mskMiniDisc = sprite_add("../Sprites/Projectiles/Disc/mskDiscMini.png", 1, 4, 4);
	global.sprDiscTrailMini = sprite_add("../Sprites/Projectiles/Disc/DiscTrailMini.png", 3, 4, 4);
	global.sprHyperDisc = sprite_add("../Sprites/Projectiles/Disc/HyperDisc.png", 2, 6, 6);
	global.mskHyperDisc = sprite_add("../Sprites/Projectiles/Disc/mskHyperDisc.png", 1, 10, 6);

#define scrTrail(_sprite)
	with instance_create(x,y,DiscTrail) sprite_index = _sprite;

#define scrHome(_dist, _force)
	if(skill_get(21) && speed > 0){
		var _home = instance_nearest(x,y,enemy);
		if(distance_to_object(_home) < _dist){
			x += lengthdir_x(_force, point_direction(x, y, _home.x, _home.y));
			y += lengthdir_y(_force, point_direction(x, y, _home.x, _home.y));
		}
	}

#define scrSafe()
	if(alarm0 >= 0){
		alarm0 -= 1;
		if(alarm0 <= 1 && distance_to_object(Player) <= 24) alarm0 = 1;
		if(alarm0 = 0) team = -1;
	}

#define scrDiscWall(_size)
	if(dist > 0){
		move_bounce_solid(true);
		sound_play(sndDiscBounce);
		with instance_create(x,y,DiscBounce){
			image_angle = other.image_angle;
			image_xscale = _size;
			image_yscale = image_xscale;
		}
	}
	else{
		sound_play(sndDiscDie);
		with instance_create(x,y,DiscDisappear){
			image_xscale = _size;
			image_yscale = image_xscale;
		}
		instance_destroy();
	}

#define minidisc_create(_x, _y)
	with instance_create(_x, _y, CustomProjectile){
		name = "MiniDisc";
		sprite_index = global.sprMiniDisc;
		mask_index = global.mskMiniDisc;
		damage = 4;
		force = 2;
		dist = 100; // Mini Discs Last Twice As Long As Normal Ones
		hitid = [sprite_index, "MINI DISC"];
		alarm0 = 4;
		typ = 1;
		on_step = md_step;
		on_hit = ["mod", "gunlocker_tools", "melee_hit"];
		on_wall = md_wall;
		return id;
	}

#define md_step
	dist -= 1;
	scrTrail(global.sprDiscTrailMini);	// Trail
	scrHome(48, 2);						// Bolt Marrow
	scrSafe();							// Safe Timer

#define md_wall
	scrDiscWall(0.66);

#define hyperdisc_create(_x, _y)
	with instance_create(_x, _y, CustomProjectile){
		name = "HyperDisc";
		sprite_index = global.sprHyperDisc;
		mask_index = global.mskHyperDisc;
		damage = 10;
		force = 8;
		dist = 30;
		hitid = [sprite_index, "HYPER DISC"];
		alarm0 = 2;
		typ = 1;
		on_step = hd_step;
		on_hit = ["mod", "gunlocker_tools", "melee_hit"];
		on_wall = hd_wall;

		 // Smoke Effect
		if(fork()){
			repeat(5) if instance_exists(self){
				for(var i = 0; i < speed; i += speed / 2){
					instance_create(x + lengthdir_x(i, direction), y + lengthdir_y(i, direction), Smoke);
				}
				wait 1;
			}
			exit;
		}

		return id;
	}

#define hd_step
	dist -= 1;

	 // Trail:
	hd_trail(x, y, direction, speed);

	 // Bolt Marrow (Bolt-like homing rather than disc homing):
	if(skill_get(21)){
		var _target = instance_nearest(x,y,enemy);
		if(distance_to_object(_target) <= 16 && projectile_canhit_melee(_target)){
			var _x = x + hspeed, _y = y + vspeed;
			x = _target.x; y = _target.y;

			 // Trail:
			hd_trail(_x, _y, point_direction(_x, _y, x , y), point_distance(_x, _y, x, y));

			x -= hspeed; y -= vspeed;
		}
	}

	scrSafe(); // Safe Timer

#define hd_wall
	scrDiscWall(1);
	if(instance_exists(self)) image_angle = direction;

#define hd_trail(_x, _y, _ang, _scale)
	for(var i = -1; i <= 1; i += 2){
		var _dis = 4 * i;
		var _dir = direction + 90;
		with instance_create(_x + lengthdir_x(_dis, _dir), _y + lengthdir_y(_dis, _dir), BoltTrail){
			image_angle = _ang;
			image_xscale = _scale;
		}
	}