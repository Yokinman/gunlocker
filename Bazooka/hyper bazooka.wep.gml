#define init
global.sprHyperBazooka = sprite_add_weapon("../Sprites/Bazooka/HyperBazooka.png", 11, 5);

#define weapon_name
return "HYPER BAZOOKA";

#define weapon_type
return 4; // Explosive Wep

#define weapon_cost
return 3; // 3 Ammo

#define weapon_area
return 16; // L0 7-3+

#define weapon_load
return 8; // 0.27 Seconds

#define weapon_swap
return sndSwapExplosive; // Swap sound

#define weapon_fire
 // Sound:
sound_play(sndRocket);
sound_play(sndHyperLauncher);

weapon_post(8, 20, 4);

 // Smoke Effect:
repeat(8) with instance_create(x+lengthdir_x(24, gunangle), y+lengthdir_y(24, gunangle), Smoke){
	speed = random(6);
	direction = other.gunangle+24*random_range(-1, 1);
}

 // Fire Hyper Rocket:
with(instance_create(x,y,CustomProjectile)){
	direction = other.gunangle + (random_range(-2,2) * other.accuracy);
	image_angle = direction;
	sprite_index = sprRocket;
	damage = 30;
	tries = 3200;
	team = other.team;
	creator = other;
	on_hit = hr_hit;
	
	 // Check For Hitscan Collisions:
	while(instance_exists(self) && tries > 0){
		tries -= 1;
		x += lengthdir_x(4, direction);
		y += lengthdir_y(4, direction);
		if(random(4) < 1) instance_create(x, y, Smoke);
		
		if(place_meeting(x,y,hitme)) with instance_nearest(x,y,hitme){
			if(team != other.team && place_meeting(x,y,other)){
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
		if(place_meeting(x,y,Slash)) with(Slash){
			if(place_meeting(x,y,other) && team != other.team){
				other.direction = direction;
				other.image_angle = other.direction;
				other.team = team;
			}
		}
	}
	
	 // Explode:
	sound_play(sndExplosionL);
	ang = random(360);
	instance_create(x,y,Explosion);
	repeat(3){
		instance_create(x + lengthdir_x(12, ang), y + lengthdir_y(12, ang), SmallExplosion);
		ang += 120;
	}
	view_shake_at(x, y, 12);
	instance_destroy();
}

#define hr_hit

#define weapon_sprt
return global.sprHyperBazooka; // Wep Sprite

#define weapon_text
return "THIS HITS LIKE A VAN"; // Loading Tip