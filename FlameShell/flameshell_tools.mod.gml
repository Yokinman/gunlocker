#define init
	global.sprFlameFlak = sprite_add("../Sprites/Projectiles/FlameShell/FlameFlak.png", 2, 8, 8);

#define flameflak_create(_x, _y)
	with instance_create(_x, _y, CustomProjectile){
		name = "FlameFlak";
		sprite_index = global.sprFlameFlak;
		mask_index = mskFlakBullet;
		friction = 0.4;
		damage = 8;
		force = 6;
		bonus = 1;
		typ = 1;
		hitid = [sprite_index, "FLAME FLAK"];
		on_step = ff_step;
		on_hit = ff_hit;
		on_draw = ["mod", "gunlocker_tools", "bloom_draw"];
		on_destroy = ff_destroy;

		if(fork()){
			wait 3;
			if(instance_exists(self)) bonus = 0;
			exit;
		}

		return id;
	}

#define ff_step
	 // Slow Down Animation:
	image_speed = speed/16;

	 // Smoke:
	if(random(2) < 1){
		with instance_create(x,y,Smoke) motion_add(random(360), random(2));
	}

	 // Explode:
	if(speed = 0 || place_meeting(x,y,Explosion)) instance_destroy();

#define ff_hit
	if(projectile_canhit(other)){
		projectile_hit(other, damage + (bonus * 2), force, direction);
		instance_destroy();
	}

#define ff_destroy
	 // Sound:
	sound_play(sndFlakExplode);
	sound_play(sndDoubleFireShotgun);

	 // Screenshake:
	view_shake_at(x, y, 20);

	 // Flames & Shells:
	repeat(6){
		with instance_create(x,y,Smoke){ // Smoke
			motion_add(random(360), random(3));
		}
		with instance_create(x,y,Flame){ // Flames
			motion_add(random(360), 3 + random(2));
			hitid = [sprite_index, "FLAME"];
			team = other.team;
			creator = other.creator;
		}
	}
	repeat(14) with instance_create(x,y,FlameShell){ // Shells
		motion_add(random(360), 8 + random(6));
		hitid = [sprite_index, "FLAME SHELL"];
		team = other.team;
		creator = other.creator;
	}