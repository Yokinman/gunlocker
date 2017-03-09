#define init 
global.sprToxicMinibow = sprite_add_weapon("../Sprites/Bolt/ToxicMinibow.png",7,7);

#define weapon_name
return "TOXIC MINIBOW"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_cost
return 1; // 1 Ammo

#define weapon_area
return 21; // L1 2-1+

#define weapon_load
return 3; // 0.10 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapBow; // Swap Sound

#define weapon_fire
sound_play(sndCrossbow); // Sound
weapon_post(8, -20, 8);

with instance_create(x,y,ToxicBolt){
	motion_add(other.gunangle + (random_range(-14, 14) * other.accuracy),22)
	image_angle = direction;
	team = other.team;
	creator = other;
}

#define weapon_sprt
return global.sprToxicMinibow; // Wep Sprite

#define weapon_text
return "A SEA OF GREEN"; // Loading Tip