#define init
global.sprAutoSplinterGun = sprite_add_weapon("../Sprites/Splinter/AutoSplinterGun.png", 3, 4);

#define weapon_name
return "AUTO SPLINTER GUN"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_cost
return 1; // 1 Ammo

#define weapon_load
return 10; // 0.33 Seconds

#define weapon_area
return 6; // L0 3-2+

#define weapon_swap
return sndSwapBow; // Swap sound

#define weapon_auto
return 1; // Automatic

#define weapon_fire
sound_play(sndSplinterGun); // Sound
weapon_post(6, -4, 2);
repeat(4) with instance_create(x+lengthdir_x(6,gunangle), y+lengthdir_y(6, gunangle), Splinter){ // Splinters
	motion_add(other.gunangle + (random_range(-16, 16) * other.accuracy), 20 + random(4));
	image_angle = direction;
	team = other.team
	creator = other;
}

#define weapon_sprt
return global.sprAutoSplinterGun; // Wep Sprite