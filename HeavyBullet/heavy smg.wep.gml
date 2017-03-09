#define init 
global.sprHeavySMG = sprite_add_weapon("../Sprites/HeavyBullet/HeavySMG.png",2,4);

#define weapon_name
return "HEAVY SMG"; // Name

#define weapon_type
return 1; // Bullet Wep

#define weapon_cost
return 2; // 2 Ammo

#define weapon_area
return 11; // L0 5-2+

#define weapon_load
return 3; // 0.10 Seconds

#define weapon_swap
return sndSwapMachinegun; // Swap Sound

#define weapon_auto
return 1; // Automatic

#define weapon_fire
sound_play(sndHeavyMachinegun);

with instance_create(x,y,Shell){ // Empty Heavy Bullet Casing
	motion_add(other.gunangle + other.right*100 + random_range(-25,25),2+random(2));
	sprite_index = sprHeavyShell;
}
with instance_create(x+lengthdir_x(7,gunangle), y+lengthdir_y(7, gunangle),HeavyBullet){ // Heavy Bullet
	motion_set(point_direction(x, y, mouse_x[other.index],mouse_y[other.index])+((18*random_range(-1, 1))*other.accuracy), 16);
	image_angle = direction;
	team = other.team;
	creator = other;
}

weapon_post(4, 6, 6)

#define weapon_sprt
return global.sprHeavySMG; // Wep Sprite

#define weapon_text
return ""; // Loading Tip