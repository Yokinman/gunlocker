#define init
global.sprDoubleLightningMinigun = sprite_add_weapon("../Sprites/Lightning/DoubleLightningMinigun.png", 7, 6);

#define weapon_name
return "DOUBLE LIGHTNING MINIGUN"; // Name

#define weapon_type
return 5; // Energy Wep

#define weapon_cost
return 2; // 2 Ammo

#define weapon_load
return 3; // 0.10 Seconds

#define weapon_area
return 14; // L0 7-2+

#define weapon_swap
return sndSwapEnergy; // Swap sound

#define weapon_auto
return 1; // Automatic

#define weapon_fire
weapon_post(8, -8, 2);
if skill_get(17) sound_play(sndLightningRifleUpg); // Laser Brain
else sound_play(sndLightningRifle); 
	
repeat(2) with (instance_create(x+lengthdir_x(6,gunangle), y+lengthdir_y(6, gunangle), Lightning)) { // Lightning
	image_angle = other.gunangle+random_range(-14, 14);
	ammo = 14+random(4);
	alarm0 = 1;
	team = other.team;
	creator = other;
}

motion_add(gunangle - 180,0.4); // Push Player Backwards A Bit

#define weapon_sprt
return global.sprDoubleLightningMinigun; // Wep Sprite