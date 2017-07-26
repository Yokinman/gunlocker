#define init
	global.sprBigNade = sprite_add("../Sprites/Projectiles/Grenade/BigNade.png", 1, 4, 4);
	global.sprBigNadeBlink = sprite_add("../Sprites/Projectiles/Grenade/BigNadeBlink.png", 2, 4, 4);

#define bignade_create(_x, _y)
	with instance_create(_x, _y, CustomProjectile){
		name = "BigNade";
		sprite_index = global.sprBigNade;
		image_speed = 0.4;
		friction = 0.2;
		alarm0 = 60;
		alarm1 = 6;
		damage = 20;
		force = 12;
		typ = 1;
		on_step = bn_step;
		on_hit = bn_hit;
		on_wall = bn_wall;
		on_destroy = bn_destroy;
		return id;
	}

#define bn_step
	 // Slow Down:
	if(alarm1 >= 0) alarm1 -= 1;
	if(alarm1 = 0){
		friction = 0.4;
		repeat(8) with instance_create(x,y,Smoke){
			motion_add(random(360), random(3));
		}
	}

	 // Melee Launching:
	var SlashTypes = [Slash, GuitarSlash, EnergySlash, EnergyHammerSlash, BloodSlash, LightningSlash];
	for(i = 0; i < array_length_1d(SlashTypes); i++){
		with(SlashTypes[i]) if(place_meeting(x,y,other)) with(other){
			motion_set(other.direction, 12);
			friction = 0.2;
			alarm1 = 6;
			view_shake_at(x, y, 5);
			sleep(50);
			with instance_create(x,y,Deflect) image_angle = other.direction;
		}
	}

	 // Blinks & Booms:
	if(alarm0 >= 0) alarm0 -= 1;
	if(alarm0 = 10) sprite_index = global.sprBigNadeBlink;
	if(alarm0 = 0 || place_meeting(x,y,Explosion)) instance_destroy();

#define bn_wall
	 // Bounce:
	if(speed > 0){
		move_bounce_solid(true);
		image_angle = direction;
		speed *= 0.6;
		repeat(3) instance_create(x,y,Dust);
		sound_play(sndGrenadeHitWall);
	}

#define bn_hit
	 // BOI Polyphemus-like Piercing:
	if(projectile_canhit(other)){
		var _dmg = damage - other.my_health;
		projectile_hit(other, damage, force, direction);
		damage = _dmg;
		if(speed <= 0 || damage <= 0) instance_destroy();
	}

#define bn_destroy
	 // Sound:
	sound_play(sndGrenade);
	sound_play(sndClusterOpen);

	 // Create Grenades:
	repeat(8) with instance_create(x,y,Grenade){
		motion_set(random(360), 3 + random(3));
		motion_add(other.direction, other.speed);
		image_angle = direction;
		image_speed = 0.4;
		alarm0 = 20 + random(5);
		alarm1 = 1;
		alarm2 = alarm0 - 10;
		hitid = [sprite_index, "GRENADE"];
		team = other.team;
		creator = other.creator;
	}