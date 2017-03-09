#define init 
global.sprMinibow = sprite_add_weapon("../Sprites/Bolt/Minibow.png",7,7);

#define weapon_name
return "MINIBOW"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_area
return 18; // L1 1-1+

#define weapon_load
return 3; // 0.10 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapBow; // Swap Sound

#define weapon_fire
sound_play(sndCrossbow); // Sound
weapon_post(8, -20, 8);

 // Innacurate Bolt:
with instance_create(x,y,Bolt){
	motion_add(other.gunangle + (random_range(-12, 12) * other.accuracy),24)
	image_angle = direction;
	team = other.team;
	creator = other;
}

motion_add(gunangle - 180,1.2); // Push Player Backwards A Bit

#define weapon_sprt
return global.sprMinibow; // Wep Sprite

#define weapon_text
return "10 BOLTS PER SECOND"; // Loading Tip