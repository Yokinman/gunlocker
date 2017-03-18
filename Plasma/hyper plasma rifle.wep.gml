#define init
global.sprHyperPlasmaRifle = sprite_add_weapon("../Sprites/Plasma/HyperPlasmaRifle.png", 4, 4);

#define weapon_name
return "HYPER PLASMA RIFLE"; // Name

#define weapon_area
return 13; // L0 6-1+

#define weapon_type
return 5; // Energy Wep

#define weapon_cost
return 3; // 3 Ammo

#define weapon_load
return 10; // 0.33 Seconds

#define weapon_swap
return sndSwapEnergy; // Swap Sound

#define weapon_fire
 // Sound:
sound_play(sndPlasmaRifle);

weapon_post(8, -20, 5);
motion_add(gunangle - 180, 4);

 // Plasma Trail Visual:
repeat(16) with instance_create(x + lengthdir_x(18-wkick, gunangle), y + lengthdir_y(18-wkick, gunangle), PlasmaTrail){
	image_speed /= random(3)+1;
	speed = 1+random(2);
	friction = -0.1;
	direction = other.gunangle+10*random_range(-1, 1);
	
	if(fork()){
		var wv = random(360);
		var odir = direction;
		
		while(instance_exists(self)){
			wv += 0.25;
			direction = odir+sin(wv)*45;
			wait 1;
		}
		exit;
	}
}

 // Hyper Plasma Ball:
with instance_create(x+lengthdir_x(24, gunangle), y+lengthdir_y(24, gunangle), CustomProjectile){
	name = "hyperplasma";
	direction = other.gunangle;
	image_angle = direction;
	tries = 3200;
	damage = 5;
	team = other.team;
	creator = other;
	image_xscale = 1 + (skill_get(17) * 0.2);
	image_yscale = image_xscale;
	sprite_index = sprPlasmaBall;
	mask_index = mskPlasma;
	image_index = 1;
	image_speed = 0;
	
	while(instance_exists(self) && tries > 0){
		tries -= 1;
		x += lengthdir_x(4, direction);
		y += lengthdir_y(4, direction);
		
		image_yscale = image_xscale;
		
		var dir = random(360);
		var len = random(8);
		
		 // Plasma Trail Visual:
		with instance_create(x+lengthdir_x(len, dir), y+lengthdir_y(len, dir), PlasmaTrail){
			image_speed /= random(3)+1;
			speed = random(1);
			friction = -0.1;
			direction = other.direction+choose(-90, 90);
			
			if(fork()){
				var wv = random(360);
				var odir = direction;
				
				while(instance_exists(self)){
					wv += 0.25;
					direction = odir+sin(wv)*90;
					wait 1;
				}
				exit;
			}
		}
		
		if(distance_to_object(hitme) <= 0){
			with(hitme) if(distance_to_object(other) <= 0 && my_health > 0 && team != other.team){
				my_health -= other.damage;
				sound_play(snd_hurt);
				sprite_index = spr_hurt;
				image_index = 0;
				with(enemy) motion_add(other.direction, 4);
				other.image_xscale -= 0.10;
			}
		}
		if(place_meeting(x,y,Wall) || image_xscale <= 0.5) tries = 0;
		if(place_meeting(x,y,Slash) || place_meeting(x,y,CrystalShield) || place_meeting(x,y,PopoShield)){
			with(Slash) if(place_meeting(x,y,other) && team != other.team) other.tries = 0;
			with(CrystalShield) if(place_meeting(x,y,other) && team != other.team) other.tries = 0;
			with(PopoShield) if(place_meeting(x,y,other) && team != other.team) other.tries = 0;
		}
	}

	sound_play(sndPlasmaBigExplode);
	instance_create(x,y,PlasmaImpact);
	instance_destroy();
}

#define weapon_sprt
return global.sprHyperPlasmaRifle; // Wep Sprite

#define weapon_text
return "HYPER FUN"; // Loading Tip