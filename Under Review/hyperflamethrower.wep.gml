#define init
global.sprHyperFlamethrower = sprite_add_weapon("../Sprites/Flame/HyperFlamethrower.png", 3, 4);

#define weapon_name
return "HYPER FLAMETHROWER";

#define weapon_sprt
return global.sprHyperFlamethrower;

#define weapon_type
return 4; // Explosive Wep

#define weapon_load
return 7; // 0.23 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapFlame; // Swap Sound

#define weapon_fire
 // Start Sound:
if(button_pressed(index, "fire")){
	sound_play(sndDragonStart);
	sound_loop(sndDragonLoop);
}

repeat(7) if instance_exists(self){
	with instance_create(x + lengthdir_x(10,gunangle), y + lengthdir_y(10,gunangle), CustomObject){
		direction = other.gunangle;
		image_angle = random(360);
		tries = 3200;
		team = other.team;
		creator = other;
		sprite_index = sprFireLilHunter;

		 // Check For Collisions:
		while(instance_exists(self) && tries > 0 && button_check(other.index,"fire")){
			tries -= 1;
			targetdir = point_direction(x, y, mouse_x[other.index], mouse_y[other.index]);
			x += lengthdir_x(8, targetdir);
			y += lengthdir_y(8, targetdir);
			
			 // Walls/Cursor:
			if(place_meeting(x,y,Wall) || distance_to_point(mouse_x[other.index] + lengthdir_x(11, targetdir), mouse_y[other.index] + lengthdir_y(11, targetdir)) <= 0) tries = 0;

			 // Melee:
			if(place_meeting(x,y,Slash)){
				noflames = 1;
				tries = 0;
			}
			
			 // Enemies:
			if(place_meeting(x,y,hitme)){
				with(hitme) if(distance_to_object(other) <= 0 && team != other.team){
					other.tries = 0;
				}
			}
		}

		 // Hyper Flame:
		if("noflames" not in self) repeat(2){
			with instance_create(x, y, Flame){
				team = other.team;
				creator = other.creator;
				motion_add(random(360),1 + random(2));
				friction = 0.20;
				sprite_index = sprFireLilHunter;
				damage = 3;
			}
		}

		instance_destroy();
	}
	wait 1;
}
		
 // Stop Sound:
if(!instance_exists(other) || other.wep = "hyperflamethrower" && other.ammo[weapon_get_type(other.wep)] <= 0 || !button_check(other.index,"fire") || other.wep != "hyperflamethrower"){
	sound_stop(sndDragonLoop);
	sound_play(sndDragonStop);
}