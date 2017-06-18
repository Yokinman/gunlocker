#define init
global.sprLightningMinigun = sprite_add_weapon("../Sprites/Lightning/LightningMinigun.png", 7, 6);

#define weapon_name
return "LIGHTNING MINIGUN"; // Name

#define weapon_type
return 5; // Energy Wep

#define weapon_cost
return 1; // 1 Ammo

#define weapon_load
return 3; // 0.10 Seconds

#define weapon_area
return 12; // L0 6-1+

#define weapon_swap
return sndSwapEnergy; // Swap sound

#define weapon_auto
return 1; // Automatic

#define weapon_fire
weapon_post(8, -8, 2);
if skill_get(17) sound_play(sndLightningRifleUpg); // Laser Brain
else sound_play(sndLightningRifle); 
	
with (instance_create(x+lengthdir_x(6,gunangle), y+lengthdir_y(6, gunangle), Lightning)) { // Lightning
	image_angle = other.gunangle+random_range(-8, 8);
	ammo = 14+random(4);
	alarm0 = 1;
	team = other.team;
	creator = other;
}

motion_add(gunangle - 180,0.4); // Push Player Backwards A Bit

#define weapon_sprt
return global.sprLightningMinigun; // Wep Sprite