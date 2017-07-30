#define init
	global.spr_MassLauncher = sprite_add_weapon("../Sprites/MiniGrenade/MassLauncher.png",4,4);
	global.spr_MassGrenade = sprite_add("../Sprites/Projectiles/MiniGrenade/MassGrenade.png",1,4,4);
	global.spr_MassGrenadeBlink = sprite_add("../Sprites/Projectiles/MiniGrenade/MassGrenadeBlink.png",2,4,4);

	 // Slashes:
	global.Slash[0] = Slash;
	global.Slash[1] = GuitarSlash;
	global.Slash[2] = EnergySlash;
	global.Slash[3] = EnergyHammerSlash;
	global.Slash[4] = BloodSlash;
	global.Slash[5] = LightningSlash;

	 // Shanks:
	global.Shank[0] = Shank;
	global.Shank[1] = EnergyShank;

#define weapon_name
	return "MASS LAUNCHER"; // Name 

#define weapon_type
	return 4; // Explosive Wep

#define weapon_cost
	return 8; // 8 Ammo

#define weapon_area
	return 12; // L0 6-1+

#define weapon_load
	return 40; // 1.33 Second

#define weapon_swap
	return sndSwapExplosive; // Swap Sound

#define weapon_fire
	sound_play(sndHeavyNader); // Sound
	sound_play(sndClusterLauncher);
	weapon_post(10, -30, 5);

	with instance_create(x - lengthdir_x(1,gunangle), y - lengthdir_y(1,gunangle), CustomProjectile){ // Mass Nade
		name = "massnade";
		on_wall = massnade_wall
		on_hit = massnade_hit
		on_step = massnade_step
		on_destroy = massnade_destroy
		motion_set(other.gunangle + (random_range(-3, 3) * other.accuracy), 12);
		image_angle = direction;
		sprite_index = global.spr_MassGrenade;
		friction = 0.4;
		image_speed = 0.4;
		alarm0 = 30;
		damage = 20;
		typ = 1;
		team = other.team;
		creator = other;
	}
	
	
/*
#define massnade_create(_x, _y)
	with instance_create(_x, _y, CustomProjectile){ // Mass Nade
		name = "massnade";
		on_wall = massnade_wall
		on_hit = massnade_hit
		on_step = massnade_step
		on_destroy = massnade_destroy
		sprite_index = global.spr_MassGrenade;
		friction = 0.4;
		image_speed = 0.4;
		alarm0 = 30;
		damage = 20;
		typ = 1;
		team = other.team;
	}
*/

#define massnade_destroy
	 // Sound:
	sound_play(sndGrenade);
	sound_play(sndUltraGrenade)
	 // Create Grenades:
	repeat(5) with instance_create(x,y,ClusterNade){
		motion_set(random(360),6+random(3));
		image_angle = direction;
		sprite_index = sprClusterGrenadeBlink;
		image_speed = 0.4;
		alarm0 = 15;
		team = other.team;
		creator = other.creator;
	}

#define massnade_step
	 // Slashes Make Zoom:
	for(i = 0; i < array_length_1d(global.Slash); i++) if(place_meeting(x,y,global.Slash[i])){
		with instance_place(x,y,global.Slash[i]) if(image_index < image_speed){
			other.direction = direction;
			with(other){
				image_angle = direction;
				with instance_create(x,y,Deflect) image_angle = other.direction;
				speed = 14;
			}
		}
	}

	 // Blinks & Booms:
	alarm0 -= 1;
	if(alarm0 < 10) sprite_index = global.spr_MassGrenadeBlink;
	if(alarm0 <= 0 || place_meeting(x,y,Explosion)) instance_destroy();
	if(instance_exists(self)) for(i = 0; i < array_length_1d(global.Shank); i++){
		if(place_meeting(x,y,global.Shank[i])){
			instance_destroy();
			exit;
		}
	}

#define massnade_wall // Bounce Off Wall
	if(speed > 0){
		move_bounce_solid(true);				// Bounce
		image_angle = direction;				// Correct Image Angle
		speed *= 0.6;							// Less Speed
		repeat(3) instance_create(x,y,Dust);	// Visual
		sound_play(sndGrenadeHitWall);			// Sound
	}

#define massnade_hit // When In Contact With An Enemy
	with(hitme) if(place_meeting(x,y,other) && team != other.team && my_health > 0){
		 // Inv Frames:
		sprite_index = spr_hurt;
		image_index = 0;
		 // Sound:
		sound_play(snd_hurt);
		 // Knockback:
		motion_add(other.direction,4);
		 // Damage / Piercing:
		var newdmg = other.damage;
		newdmg -= my_health;
		my_health -= other.damage;
		with(other){
			if(speed = 0) damage = 0;
			else damage = newdmg;
			if(damage <= 0) instance_destroy();
		}
	}

#define weapon_sprt
	return global.spr_MassLauncher; // Wep Sprite