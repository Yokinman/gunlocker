#define init
global.sprHyperCrossbow = sprite_add_weapon("../Sprites/Bolt/HyperCrossbow.png", 2, 4);
global.sprHyperBolt = sprite_add("../Sprites/Projectiles/Bolt/HyperBolt.png", 1, 8, 4);

#define weapon_name
return "HYPER CROSSBOW"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_cost
return 2; // 2 Ammo

#define weapon_area
return 15; // L0 7-2+

#define weapon_load
return 10; // 0.33 Seconds

#define weapon_swap
return sndSwapBow; // Swap Sound

#define weapon_fire
 // Sound:
sound_play(sndUltraCrossbow);
sound_play(sndHeavyCrossbow);

weapon_post(8, -40, 4);

with(instance_create(x + lengthdir_x(4,gunangle), y + lengthdir_y(4,gunangle), CustomProjectile)){
	direction = other.gunangle;
	image_angle = direction;
	damage = 25;
	tries = 3200;
	team = other.team;
	creator = other;
	sprite_index = mskBolt;
	on_hit = hb_hit;
	
	 // Check For Collisions:
	while(instance_exists(self) && tries > 0){
		tries -= 1;
		x += lengthdir_x(1, direction);
		y += lengthdir_y(1, direction);

		 // Home On Enemies W/ Bolt Marrow:
		if(skill_get(21)){
			var dir = instance_nearest(x,y,enemy);
			if(distance_to_object(dir) < 12){
				if("homed" not in self || homed != dir){
					homed = dir;
					with instance_create(x,y,BoltTrail){ // Trail
						image_angle = other.direction;
						image_xscale = point_distance(other.x,other.y,dir.x,dir.y);
						image_yscale = 1.4 + (point_distance(other.x,other.y,other.xstart,other.ystart)/360);
						if(image_yscale > 2) image_yscale = 2;
						image_angle = point_direction(other.x,other.y,dir.x,dir.y);
					}
					x = dir.x;
					y = dir.y;
				}
			}
		}

		 // Trail:
		with instance_create(x,y,BoltTrail){
			image_angle = other.direction;
			image_yscale = 1.4 + (point_distance(x,y,other.xstart,other.ystart)/360);
			if(image_yscale > 2) image_yscale = 2;
		}
		
		 // Hurt Enemies:
		if(place_meeting(x,y,hitme)) with(hitme){
			if(team != other.team && distance_to_object(other) <= 0){
				
				 // Sound:
				sound_play(snd_hurt);
				
				 // Hurt Frames:
				image_index = 0;
				sprite_index = spr_hurt;

				 // Damage:
				if(my_health >= 10) other.tries = 0;
				my_health -= other.damage;
				
				 // Stick In Enemies:
				if(my_health > 0){
					other.tries = 0;
					if(object_index = enemy) speed += 8;
					with(other){
						var pointhere = point_direction(creator.x,creator.y,x,y);
						tries = 0;
					}
					with instance_create(x,y,BoltStick){
						target = other;
						sprite_index = global.sprHyperBolt;
						image_angle = pointhere;
					}
				}
				
				direction = pointhere;
			}
		}
		
		 // Stick In Walls:
		if(place_meeting(x,y,Wall)){
			tries = 0;
			sound_play(sndBoltHitWall);
			with(instance_create(x + lengthdir_x(7, direction), y + lengthdir_y(7, direction), Bolt)){
				team = other.team;
				direction = other.direction;
				image_angle = direction;
				sprite_index = global.sprHyperBolt;
				alarm0 = 30;
			}
		}
		
		 // Melee Deflections:
		if(place_meeting(x,y,Slash)){
			with(Slash) if(team != other.team && place_meeting(x,y,other)) with(other){
				direction = other.direction;
				image_angle = direction;
				team = other.team;
			}
		}
	}
	
	 // After Colliding With Something:
	view_shake_at(x, y, 4);
	repeat(5) with instance_create(x + lengthdir_x(8, direction),y + lengthdir_y(8, direction),Dust){
		motion_add((other.direction + (90 * choose(1, -1))) + random_range(-10,10), 2 + random(1));
	}
	instance_destroy();
}

#define hb_hit

#define weapon_sprt
return global.sprHyperCrossbow; // Wep Sprite

#define weapon_text
return "FASTER THAN SIGHT"; // Loading Tip