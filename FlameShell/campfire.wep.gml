#define init 
global.sprCampfireGun = sprite_add_weapon("../Sprites/FlameShell/Campfire.png",4,4);

#define weapon_name
return "CAMPFIRE"; // Name

#define weapon_type
return 1; // Bullet Wep

#define weapon_cost
return 1; // 1 Ammo

#define weapon_area
return 13; // L0 6-1+

#define weapon_load
return 1; // 0.03 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapMachinegun; // Swap Sound

#define weapon_fire
sound_play(sndMinigun); // Sound
weapon_post(5, -6, 6);

with instance_create(x,y,Shell){ // Empty Bullet Casing
	motion_add(other.gunangle + other.right*100 + random_range(-30,30),2+random(3))
}
with instance_create(x+lengthdir_x(2,gunangle), y+lengthdir_y(2, gunangle),FlameShell){ // Flame Shell
	motion_add(other.gunangle + (random_range(-16, 16) * other.accuracy),14+random(2))
	team = other.team;
	creator = other;
}

motion_add(gunangle - 180, 0.4); // Push Player Backwards A Bit

#define weapon_sprt
return global.sprCampfireGun; // Wep Sprite

#define weapon_text
return "MELT DOWN"; // Loading Tip