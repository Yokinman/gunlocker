#define init
global.sprDoubleLaserMinigun = sprite_add_weapon("../Sprites/Laser/DoubleLaserMinigun.png", 7, 6);

#define weapon_name
return "DOUBLE LASER MINIGUN"; // Name

#define weapon_type
return 5; // Energy Wep

#define weapon_cost
return 2; // 2 Ammo

#define weapon_load
return 2; // 0.07 Seconds

#define weapon_area
return 14; // L0 7-2+

#define weapon_swap
return sndSwapEnergy; // Swap sound

#define weapon_auto
return 1; // Automatic

#define weapon_fire
weapon_post(6, -4, 2);
if skill_get(17) sound_play(sndLaserUpg); // Laser Brain
else sound_play(sndLaser); 
	
repeat(2) with instance_create(other.x,other.y,Laser){
	alarm0 = 1;
	team = other.team;
	creator = other;
	image_yscale = 1.7 + (skill_get(17)*0.6);
	image_angle = (random_range(-20,20) * creator.accuracy) + other.gunangle;
}

motion_add(gunangle - 180,0.4); // Push Player Backwards A Bit

#define weapon_sprt
return global.sprDoubleLaserMinigun; // Wep Sprite