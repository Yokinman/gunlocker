#define init 
global.sprAutoToxicBow = sprite_add_weapon("../Sprites/Bolt/AutoToxicBow.png",2,3);

#define weapon_name
return "AUTO TOXIC BOW"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_area
return 9; // L0 4-1+

#define weapon_load
return 9; // 0.30 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapBow; // Swap Sound

#define weapon_fire
sound_play(sndCrossbow); // Sound
weapon_post(6, -30, 15);

with instance_create(x,y,ToxicBolt){ // Toxic Bolt
	motion_add(other.gunangle + (random_range(-6, 6) * other.accuracy),22)
	image_angle = direction;
	team = other.team;
	creator = other;
}

#define weapon_sprt
return global.sprAutoToxicBow; // Wep Sprite

#define weapon_text
return "GREEN THUMB"; // Loading Tip