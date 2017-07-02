#define init
global.sprEnergyShovel = sprite_add_weapon("../Sprites/Melee/Energy/EnergyShovel.png", 5, 5)

#define weapon_name
return "ENERGY SHOVEL"; // Name

#define weapon_type
return 5; // Energy wep

#define weapon_load
return 22; // 0.73 seconds

#define weapon_cost
return 5; // 5 Ammo

#define weapon_area
return 10; // L0 5-2+

#define weapon_swap
return sndSwapEnergy; // Swap Sound

#define weapon_melee
return 1; // Melee

#define weapon_fire
if(skill_get(17))
sound_play(sndEnergyHammerUpg)
else
sound_play(sndEnergyHammer)

if(skill_get(13)) 
longarms = 1
else
longarms = 0

fireAngle = -60
repeat(3) {
	with instance_create(x+lengthdir_x(20*other.longarms,other.gunangle+other.fireAngle), y+lengthdir_y(20*other.longarms, other.gunangle+other.fireAngle),EnergyHammerSlash)
	{
		creator = other
		motion_add(other.gunangle+other.fireAngle*other.accuracy,2+other.longarms)
		image_angle = direction
		damage = 33
		team = other.team
	}
	fireAngle += 60
}

wepangle = -wepangle
motion_add(point_direction(x,y,mouse_x,mouse_y),7) // Push Player Forewards A Bit

weapon_post(-3, 6, 6);

#define weapon_sprt
return global.sprEnergyShovel; // Wep sprite