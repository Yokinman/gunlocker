#define init 
sprBullCannon = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABIAAAAKCAYAAAC5Sw6hAAAABmJLR0QAAAAAAAD5Q7t/AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4AsHARcK1AO/NQAAALJJREFUKM9jYKASYETj/yfXHBZ0kZyqFgYGBgaGKW01DF3T5sHFHz15xvDgzk0GOwdHFPVlWUkMDAwMDOgGMU5pq/nPwMDA4BMWy/DoyTOincSC7q14fTUGBgYGhrcMDAxyMlIoLkKmcRn0315SmEFBTBgusWXVYgzFW1YtZvAJi8Ub2CgGPXj1luHg87cY4QYLO2xmoBgEA0iGMDIwMPzH5gqoixkxXIQnWfwnMulQBwAA9bY2VtZGhJQAAAAASUVORK5CYII=",2,3);

#define weapon_name
return "BULL CANNON"; // Name

#define weapon_type
return 1; // Bullet Wep

#define weapon_cost
return 20; // 20 Ammo

#define weapon_area
return 1; // ???

#define weapon_load
return 20; // 0.67 Seconds

#define weapon_swap
return sndSwapMachinegun; // Swap Sound

#define weapon_fire

with instance_create(x,y,CustomProjectile){
	sprite_index = sprBullet1;
	mask_index = mskBullet1;
	motion_set(point_direction(x, y, mouse_x[other.index],mouse_y[other.index])+((6*random_range(-1, 1))*other.accuracy), 16);
	team = 2;
	damage = 6;
	image_angle = direction;
	while instance_exists(self){
		if image_index = image_number - 1{
			image_speed = 0;
			image_index = image_number - 1;
		}
		trace(on_destroy);
		wait 0.5;
	}
}

#define weapon_sprt
return sprBullCannon; // Wep Sprite

#define weapon_text
return ""; // Loading Tip