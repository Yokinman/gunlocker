#define init 
global.sprAutoDiscGun = sprite_add_weapon("../Sprites/Disc/AutoDiscGun.png",2,2);

#define weapon_name
return "AUTO DISC GUN"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_area
return 8; // L0 3-3+

#define weapon_load
return 5; // 0.17 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapBow; // Swap Sound

#define weapon_fire
sound_play(sndDiscgun) // Sound
weapon_post(3, -10, 8);

with instance_create(x,y,Disc){ // Disc
	motion_add(other.gunangle + (random_range(-10, 10) * other.accuracy),5)
	image_angle = direction;
	team = other.team;
	creator = other;
}

#define weapon_sprt
return global.sprAutoDiscGun; // Wep Sprite

#define weapon_text
return "USE AT YOUR OWN RISK"; // Loading Tip