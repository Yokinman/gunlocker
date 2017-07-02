#define init
global.sprEnergyJackhammer = sprite_add_weapon("../Sprites/Melee/Energy/EnergyJackhammer.png", 2, 5)

#define weapon_name
return "ENERGY JACKHAMMER"; // Name

#define weapon_type
return 5; // Energy wep

#define weapon_load
return 12; // 0.40 seconds

#define weapon_cost
return 2; // 2 Ammo

#define weapon_area
return 12; // L0 6-1+

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapEnergy; // Swap Sound

#define weapon_fire
if(skill_get(13)) 
longarms = 1
else
longarms = 0

repeat(12) {
	sound_play(sndJackHammer)
	if instance_exists(self) {
		with instance_create(x+lengthdir_x(10*other.longarms,other.gunangle), y+lengthdir_y(10*other.longarms, other.gunangle),EnergyShank)
		{
			creator = other
			motion_add((other.gunangle+random_range(-16,16))*other.accuracy,3+other.longarms)
			image_angle = direction
			damage = 22
			team = other.team
		}
		weapon_post(-6, 6, 0);
		wait(1)
	}
}

#define weapon_sprt
return global.sprEnergyJackhammer; // Wep sprite