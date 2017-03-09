#define init 
global.sprHyperDiscGun = sprite_add_weapon("../Sprites/Disc/HyperDiscGun.png",-1,5);
global.spr_HyperDisc = sprite_add("../Sprites/Projectiles/Disc/HyperDisc.png",2,6,6);

#define weapon_name
return "HYPER DISC GUN"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_cost
return 2; // 2 Ammo

#define weapon_area
return 10; // L0 5-1+

#define weapon_load
return 7; // 0.23 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapBow; // Swap Sound

#define weapon_fire
sound_play(sndDiscgun) // Sound
weapon_post(6, -15, 6);

with instance_create(x,y,Disc){ // Hyper Disc
	motion_add(other.gunangle + (random_range(-4, 4) * other.accuracy),18)
	image_angle = direction;
	sprite_index = global.spr_HyperDisc;
	damage = 10;
	traildist = 4;
	team = other.team;
	creator = other;
	
	 // Smoke Effect
	repeat(5) with instance_create(x + lengthdir_x(5,direction),y + lengthdir_y(5,direction),Smoke){
		motion_add(other.direction,1+random(1));
	}
	
	while instance_exists(self){
		 // Hyper Trail:
		with instance_nearest(x,y,DiscTrail) instance_destroy();
		repeat(2){
			traildist *= -1;
			with instance_create(x + lengthdir_x(traildist,image_angle - 90),y + lengthdir_y(traildist,image_angle - 90),BoltTrail){
				image_angle = other.direction;
				image_xscale = other.speed;
			}
		}
		if(instance_exists(Wall)){
			if(distance_to_object(Floor) > 1) direction -= 180;
			if(distance_to_object(Floor) > 10) instance_destroy();
		}
		wait 1;
	}
}

#define weapon_sprt
return global.sprHyperDiscGun; // Wep Sprite

#define weapon_text
return "UNDODGEABLE"; // Loading Tip