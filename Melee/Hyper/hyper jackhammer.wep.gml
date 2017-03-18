#define init
global.sprHyperJackhammer = sprite_add_weapon("../../Sprites/Melee/Hyper/HyperJackhammer.png", 4, 5);
global.sprHyperHammerBGN = sprite_add("../../Sprites/Projectiles/Melee/Hyper/HyperShankStart.png", 2, 15, 8);
global.sprHyperHammerMID = sprite_add("../../Sprites/Projectiles/Melee/Hyper/HyperShankMiddle.png", 2, 0, 8);
global.sprHyperHammerEND = sprite_add("../../Sprites/Projectiles/Melee/Hyper/HyperShankEnd.png", 2, 0, 8);

#define weapon_name
return "HYPER JACKHAMMER"; // Name

#define weapon_type
return 5; // Explosive Wep

#define weapon_area
return 12; // L0 5-3+

#define weapon_load
return 10; // 0.33 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapMotorized; // Swap Sound

#define weapon_fire
repeat(10) if instance_exists(self){
	sound_play(sndHyperRifle);
	
	with instance_create(x, y, CustomProjectile){
		name = "hypershank";
		motion_add(other.gunangle + (random_range(-15, 15) * other.accuracy), 5 + (skill_get(13)*3));
		image_angle = direction;
		team = other.team;
		creator = other;
		damage = 15;
		typ = 0;
		sprite_index = sprShank;
		tries = 24 + (skill_get(13)*8);
		
		on_hit = hh_hit;
		
		var trail1 = instance_create(x, y, CustomObject);
		with(trail1){
			sprite_index = global.sprHyperHammerBGN;
			image_speed = 0.4;
			motion_add(other.direction, 5 + (skill_get(13)*3));
			image_angle = direction;
		}
		
		var trail2 = instance_create(x, y, CustomObject);
		with(trail2){
			sprite_index = global.sprHyperHammerMID;
			image_speed = 0.4;
			motion_add(other.direction, 5 + (skill_get(13)*3));
			image_angle = direction;
		}
		
		var trail3 = instance_create(x, y, CustomObject);
		with(trail3){
			sprite_index = global.sprHyperHammerEND;
			image_speed = 0.4;
			motion_add(other.direction, 5 + (skill_get(13)*3));
			image_angle = direction;
		}
		
		if(fork()){
			while(instance_exists(trail1)){
				if(trail1.image_index+trail1.image_speed >= trail1.image_number){
					instance_delete(trail1);
					instance_delete(trail2);
					instance_delete(trail3);
				}
				wait(1);
			}
			exit;
		}

		while(instance_exists(self) && tries > 0){
			tries -= 1;
			if(distance_to_object(Portal) > 0){
				x += lengthdir_x(1, direction);
				y += lengthdir_y(1, direction);
			}

			 // Break Projectiles:
			if(distance_to_object(projectile) <= 0){
				with(projectile) if(distance_to_object(other) <= 0 && team != other.team && typ != 0){
					instance_destroy();
				}
			}

			 // Hurt Enemies/Props:
			if(distance_to_object(hitme) <= 0) with(hitme){
				if(distance_to_object(other) <= 0 && team != other.team && sprite_index != spr_hurt){
					my_health -= other.damage;
					sound_play(snd_hurt);
					image_index = 0;
					sprite_index = spr_hurt;
					motion_add(other.direction, 4);
				}
			}

			 // Walls:
			if(place_meeting(x,y,Wall)) tries = 0;
		}

		creator.direction = creator.gunangle;
		if(!instance_exists(Wall) && distance_to_object(Floor) > 0) with instance_nearest(x,y,Floor){
			other.creator.x = x;
			other.creator.y = y;
		}
		else{
			creator.x = x;
			creator.y = y;
		}
		
		var pdist = point_distance(x, y, xstart, ystart);
		trail2.image_xscale = pdist;
		trail3.x = x;
		trail3.y = y;
		
		instance_destroy();
	}
	if("sprite_angle" in self) sprite_angle = direction - 90;
	else image_angle = direction - 90;
	
	weapon_post(-8, 1, 0);
	wait 1;
}
if(instance_exists(self)){
	if("sprite_angle" in self) sprite_angle = 0;
	else image_angle = 0;
}

#define hh_hit

#define weapon_sprt
return global.sprHyperJackhammer; // Wep Sprite

#define weapon_text
return "CONSTRUCTION OF THE FUTURE"; // Loading Tip