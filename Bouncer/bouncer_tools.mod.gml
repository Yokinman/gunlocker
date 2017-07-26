#define init
	global.sprBouncerBall = sprite_add("../Sprites/Projectiles/Bouncer/BouncerBall.png", 2, 12, 12);
	global.mskBouncerBall = sprite_add("../Sprites/Projectiles/Bouncer/mskBouncerBall.png", 1, 12, 12);

#define bouncer_rot
	image_angle += rot;	// Rotate

#define bouncerball_create(_x, _y)
	with instance_create(_x, _y, CustomProjectile){
		name = "BouncerBall";
		sprite_index = global.sprBouncerBall;
		mask_index = global.mskBouncerBall;
		hitid = [sprite_index, "BOUNCER BALL"];
		damage = 12;
		force = 12;
		depth = -2;
		bounce = 0;
		rot = random_range(3, 4) * choose(-1, 1);
		typ = 1;
		on_step = bouncer_rot;
		on_draw = ["mod", "gunlocker_tools", "bloom_draw"];
		on_wall = bb_wall;
		on_destroy = bb_destroy;

		 // Stop Animating:
		if(fork()){
			wait(image_number - 1);
			if(instance_exists(self)) image_speed = 0;
			exit;
		}

		return id;
	}

#define bb_wall
	 // Sound:
	sound_play(sndBouncerBounce);
	sound_play(sndBouncerSmg);

	 // Bounce:
	move_bounce_solid(true);
	repeat(3) instance_create(x, y, Dust); // Dust Visual
	view_shake_at(x, y, 5); // Bit of screenshake

	 // Bounce-Created Bouncers:
	repeat(choose(2, 3)) with instance_create(x, y, BouncerBullet){
		motion_add(random(360), 6);
		image_angle = direction;
		hitid = [sprite_index, "BOUNCER BULLET"];
		team = other.team;
		creator = other.creator;
	}

	 // Shrink A Lil':
	image_xscale -= 0.05;
	image_yscale -= 0.05;

	 // Bounce Less:
	bounce += 1;
	if(bounce > 2) instance_destroy();

#define bb_destroy
	 // Sound:
	sound_play(sndBouncerShotgun);
	sound_play(sndLilHunterBouncer);

	 // Screenshake:
	view_shake_at(x, y, 30);

	 // Destroy Visual:
	var _ang = random(360);
	for(var i = _ang; i < _ang + 360; i += 180) with instance_create(x, y, BulletHit){
		sprite_index = sprHeavyBulletHit;
		image_angle = i;
	}

	 // Bouncer Party:
	for(var i = _ang; i < _ang + 360; i += 18){ // 20 bouncers
		with instance_create(x, y, BouncerBullet){
			motion_add(i, 6);
			image_angle = direction;
			hitid = [sprite_index, "BOUNCER BULLET"];
			team = other.team;
			creator = other.creator;
		}
	}