#define init
sprBouncerAssaultRifle = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABgAAAANCAYAAACzbK7QAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTJDBGvsAAAAdklEQVQ4T2MYBdQA/7FgqoH/UuJq/3W1zeAYxAeJo2MkcbwAQxPIUD/vWDiGWYJsIYwN1YcXwBWja8YlDmLDMEg/xBj8AMMgbD5AxyB9UIwXYNWMjpEth9EgvRAj8ANkl8AxzGBsckiYIkCSK8kFNLeADMDAAADBZIaJMTxyKAAAAABJRU5ErkJggg==",7,5);

#define weapon_name
return "BOUNCER ASSAULT RIFLE"; // Name 

#define weapon_type
return 1; // Bullet Wep

#define weapon_cost
return 3; // 3 Ammo

#define weapon_area
return 6; // L0 3-1+

#define weapon_load
return 11; // 0.37 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapPistol; // Swap Sound

#define weapon_fire

repeat(3) if instance_exists(self){
	weapon_post(3, -6, 4)
	sound_play(sndBouncerSmg); // Sound

	with instance_create(x,y,Shell){ // Bullet Casings
		motion_add(other.gunangle + other.right*100 + random_range(-25,25),3+random(2));
	}	
	with instance_create(x,y,BouncerBullet){ // Bouncer Bullets
		motion_add(other.gunangle + (random_range(-3, 3) * other.accuracy), 6);
		team = other.team;
		creator = other;
	}
	wait(2)
}

#define weapon_sprt
return sprBouncerAssaultRifle; // Wep Sprite