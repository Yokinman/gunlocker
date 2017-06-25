#define init
global.sprAutoLaserShotgun = sprite_add_weapon("../Sprites/Laser/AutoLaserShotgun.png",4,6);

#define weapon_name
return "AUTO LASER SHOTGUN"; // Name 

#define weapon_type
return 5; // Energy Wep

#define weapon_cost
return 6; // 6 Ammo

#define weapon_area
return 11; // L0 5-3+

#define weapon_load
return 13; // 0.43 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapEnergy; // Swap Sound

 // Create Charge Up Object:
#define weapon_fire
if skill_get(17) sound_play_pitch(sndLaserUpg,0.75); // Laser Brain Sound
else sound_play_pitch(sndLaser,0.75); // Normal Sound
	
 // Laser Shotgun Spread:
repeat(6) with instance_create(other.x,other.y,Laser){
	alarm0 = 1;
	team = other.team;
	creator = other;
	image_yscale = 1.7 + (skill_get(17)*0.6);
	image_angle = ((14*random_range(-1,1)) * creator.accuracy) + creator.gunangle;
}
weapon_post(6, -10, 8);

#define weapon_sprt
return global.sprAutoLaserShotgun; // Wep Sprite