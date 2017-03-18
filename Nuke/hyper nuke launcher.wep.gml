#define init
global.sprHyperNukeLauncher = sprite_add_weapon("../Sprites/Nuke/HyperNukeLauncher.png", 4, 8);

#define weapon_name
return "HYPER NUKE LAUNCHER";

#define weapon_type
return 4; // Explosive Wep

#define weapon_cost
return 5; // 5 Ammo

#define weapon_area
return 18; // L1 1-1+

#define weapon_load
return 17; // 0.57 Seconds

#define weapon_swap
return sndSwapExplosive; // Swap sound

#define weapon_fire
sound_play(sndNukeFire); // Sound
weapon_post(12, -60, 5);

repeat(16) with instance_create(x+lengthdir_x(24, gunangle), y+lengthdir_y(24, gunangle), Smoke){
	motion_set(other.gunangle + (random_range(-48, 48)), random(6));
	motion_add(other.direction, other.speed/4);
}

with instance_create(x, y, CustomProjectile){
	direction = other.gunangle;
	image_angle = direction;
	damage = 70;
	tries = 3200;
	team = other.team;
	creator = other;
	sprite_index = mskNuke;
	on_hit = hn_hit;
	
	 // Check For Collisions:
	while(instance_exists(self) && tries > 0){
		tries -= 1;
		x += lengthdir_x(4, direction);
		y += lengthdir_y(4, direction);
		if(random(2) < 1) instance_create(x, y, Smoke);

		if(place_meeting(x,y,hitme)) with instance_nearest(x,y,hitme){
			if(team != other.team && place_meeting(x,y,other)){
				direction = other.direction;

				 // Hurt Frames:
				image_index = 0;
				sprite_index = spr_hurt;
				
				 // Sound:
				sound_play(snd_hurt);
				
				 // Damage:
				my_health -= other.damage;
				
				other.tries = 0;
			}
		}
		if(place_meeting(x,y,Wall)) tries = 0;
		if(place_meeting(x,y,Slash)){
			with(Slash) if(place_meeting(x,y,other) && team != other.team){
				other.direction = direction;
				other.image_angle = other.direction;
				other.team = team;
			}
		}
	}

	 // Explosion:
	sound_play(sndNukeExplosion);
	var angn = random(360);
	var angs = random(360);
	repeat(8){
		instance_create(x+lengthdir_x(12, angn), y+lengthdir_y(12, angn), Explosion);
		angn += 360/8;
	}
	repeat(7){
		instance_create(x+lengthdir_x(12, angs), y+lengthdir_y(12, angs), SmallExplosion);
		angs += 360/7;
	}

	instance_destroy();
}

#define hn_hit

#define weapon_sprt
return global.sprHyperNukeLauncher; // Wep Sprite

#define weapon_text
return "THIS HITS HARDER THAN A VAN"; // Loading Tip