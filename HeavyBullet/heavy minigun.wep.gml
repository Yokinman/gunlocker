#define init
global.sprHeavyMinigun = sprite_add_weapon("../Sprites/HeavyBullet/HeavyMinigun.png", 4, 4);

#define weapon_name
return "HEAVY MINIGUN"; // Name

#define weapon_type
return 1; // Bullet Wep

#define weapon_cost
return 2; // 2 Ammo

#define weapon_load
return 1; // 0.03 Seconds

#define weapon_area
return 14; // L0 7-1+

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapMachinegun; // Swap Sound

#define weapon_fire
 // Sound:
sound_play(sndHyperRifle);
sound_play(sndMinigun);

weapon_post(4, -10, 5);

 // Empty Heavy Bullet Casing:
with instance_create(x,y,Shell){
	motion_add(other.gunangle + other.right*100 + random_range(-40,40), 3+random(2))
	sprite_index = sprHeavyShell;
}

 // Heavy Bullet:
with instance_create(x + lengthdir_x(4,gunangle), y + lengthdir_y(4,gunangle), HeavyBullet){
	motion_add(other.gunangle + (random_range(-13,13) * other.accuracy), 16);
	image_angle = direction;
	team = other.team;
	creator = other;
}

motion_add(gunangle - 180, 0.5); // Push Player Backwards

#define weapon_sprt
return global.sprHeavyMinigun; // Wep Sprite

#define weapon_text
return "HEAVY LIFTING"; // Loading Tip