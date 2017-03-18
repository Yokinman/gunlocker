#define init
global.sprHyperHammerWep = sprite_add_weapon("../../Sprites/Melee/Hyper/HyperHammer.png", 8, 9);
global.sprHyperHammerBGN = sprite_add("../../Sprites/Projectiles/Melee/Hyper/HyperSlashStart.png", 3, 26, 24);
global.sprHyperHammerMID = sprite_add("../../Sprites/Projectiles/Melee/Hyper/HyperSlashMiddle.png", 3, 0, 24);
global.sprHyperHammerEND = sprite_add("../../Sprites/Projectiles/Melee/Hyper/HyperSlashEnd.png", 3, 0, 24);

#define weapon_name
return "HYPER HAMMER"; // Name

#define weapon_area
return 19; // L1 1-2+

#define weapon_load
return 15; // 0.50 Seconds

#define weapon_swap
return sndSwapHammer; // Swap Sound

#define weapon_fire
 // Sound:
sound_play(sndHammer);
sound_play(sndHyperRifle);
sound_play(sndHyperSlugger);

wepangle = -wepangle; // Flip Wep To Other Side

 // Heavy Hyper Swingaroo:
with(instance_create(x, y, CustomProjectile)){
	motion_add(other.gunangle,2 + (skill_get(13)*3));
	friction = 0.10;
	image_angle = direction;
	team = other.team;
	creator = other;
	damage = 25;
	typ = 0;
	sprite_index = mskSlash;
	tries = 90 + (skill_get(13)*50);
	
	on_hit = hh_hit;
	
	var trail1 = instance_create(x, y, CustomObject);
	with(trail1){
		sprite_index = global.sprHyperHammerBGN;
		image_speed = 0.4;
		motion_add(other.direction,2 + (skill_get(13)*3));
		friction = 0.10;
		image_angle = direction;
	}
	
	var trail2 = instance_create(x, y, CustomObject);
	with(trail2){
		sprite_index = global.sprHyperHammerMID;
		image_speed = 0.4;
		motion_add(other.direction,2 + (skill_get(13)*3));
		friction = 0.10;
		image_angle = direction;
	}
	
	var trail3 = instance_create(x, y, CustomObject);
	with(trail3){
		sprite_index = global.sprHyperHammerEND;
		image_speed = 0.4;
		motion_add(other.direction,2 + (skill_get(13)*3));
		friction = 0.10;
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
		
		 // Deflect/Break Projectiles:
		if(distance_to_object(projectile) <= 0) with(projectile){
			if(distance_to_object(other) <= 0 && team != other.team){
				if(typ = 1){
					with instance_create(x,y,Deflect) image_angle = direction;
					direction = other.direction;
					image_angle = direction;
					team = other.team;
				}
				if(typ = 2) instance_destroy();
			}
		}

		 // Hurt Enemies/Props:	
		if(distance_to_object(hitme) <= 0) with(hitme){
			if(distance_to_object(other) <= 0 && my_health > 0 && team != other.team && sprite_index != spr_hurt){
				my_health -= other.damage;
				sound_play(snd_hurt);
				image_index = 0;
				sprite_index = spr_hurt;
				motion_add(other.direction, 4);
			}
		}

		 // Break Walls:
		var walls = 0;
		if(distance_to_object(Wall) <= 0){
			var walls = 0;
			with(Wall) if(distance_to_object(other) <= 0) walls += 1;
			if(walls >= 3) tries = 0;
			else with(Wall) if(distance_to_object(other) <= 0){
				sound_play(sndMeleeWall);
				instance_create(x, y, FloorExplo);
				instance_destroy();
			}
		}
	}
	
	x += lengthdir_x(32, direction);
	y += lengthdir_y(32, direction);

	if(distance_to_object(Wall) <= 0) sound_play(sndMeleeWall);
	with instance_create(x,y,PortalClear){
		image_angle = other.direction;
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
motion_add(direction, (2*pdist) * (skill_get(13)+3));
weapon_post(8, pdist * 1.5, 15);

#define hh_hit

#define weapon_sprt
return global.sprHyperHammerWep; // Wep Sprite

#define weapon_text
return "BLUNT FORCE TRAUMA";