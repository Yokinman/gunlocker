#define init
global.sprLightningShovel = sprite_add_weapon("../Sprites/Melee/Lightning/LightningShovel.png", 5, 5)

#define weapon_name
return "LIGHTNING SHOVEL"; // Name

#define weapon_type
return 0; // Melee wep

#define weapon_load
return 34; // 1.13 seconds

#define weapon_cost
return 0; // 0 Ammo

#define weapon_area
return 11; // L0 5-3+

#define weapon_swap
return sndSwapEnergy; // Swap Sound

#define weapon_melee
return 1; // Melee

#define weapon_fire
sound_play(sndLightningHammer)

if(skill_get(13)) 
longarms = 1
else
longarms = 0

fireAngle = -60
repeat(3) {
	with instance_create(x+lengthdir_x(20*other.longarms,other.gunangle+other.fireAngle), y+lengthdir_y(20*other.longarms, other.gunangle+other.fireAngle),LightningSlash)
	{
		creator = other
		motion_add(other.gunangle+other.fireAngle*other.accuracy,2+other.longarms)
		image_angle = direction
		damage = 7
		team = other.team
	}
	fireAngle += 60
}

wepangle = -wepangle
motion_add(point_direction(x,y,mouse_x,mouse_y),7) // Push Player Forewards A Bit

weapon_post(-3, 6, 6);

#define weapon_sprt
return global.sprLightningShovel; // Wep sprite