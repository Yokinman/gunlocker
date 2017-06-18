#define init
global.sprDoublePlasmaMinigun = sprite_add_weapon("../Sprites/Plasma/DoublePlasmaMinigun.png", 7, 4);

#define weapon_name
return "DOUBLE PLASMA MINIGUN"; // Name

#define weapon_type
return 5; // Energy Wep

#define weapon_cost
return 4; // 4 Ammo

#define weapon_load
return 3; // 0.10 Seconds

#define weapon_area
return 15; // L0 7-3+

#define weapon_swap
return sndSwapEnergy; // Swap sound

#define weapon_auto
return 1; // Automatic

#define weapon_fire
sound_play(sndPlasmaMinigun); // Sound
weapon_post(6, -4, 2);
//Different fire sound depending on if the player has laser brain or not
if(skill_get(17))
sound_play(sndPlasmaUpg)
else
sound_play(sndPlasma)
//Create the plasma
repeat(2) {
	with instance_create(x,y,PlasmaBall)
	{
		motion_add(other.gunangle+random_range(-18, 18),2)
		creator = other;
		image_angle = direction
		team = other.team
	}
}

motion_add(gunangle - 180,0.6); // Push Player Backwards A Bit

#define weapon_sprt
return global.sprDoublePlasmaMinigun; // Wep Sprite

#define weapon_text
return "WHO NEEDS AMMO#WHEN YOU HAVE PLASMA"; // Loading Tip