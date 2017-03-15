#define init
global.sprPlasmaAssaultRifle = sprite_add_weapon("../Sprites/Plasma/AssaultPlasmaRifle.png", 5, 5)

#define weapon_name
return "PLASMA ASSAULT RIFLE"; // Name

#define weapon_type
return 5; // Energy

#define weapon_load
return 25; // 0.83 Seconds

#define weapon_cost
return 6; // 6 Ammo

#define weapon_sprt
return global.sprPlasmaAssaultRifle; // Wep Sprite

#define weapon_area
return 6; // L0 3-2+

#define weapon_swap
return sndSwapEnergy; // Swap sound

#define weapon_fire
repeat(3) { //Fire 3 times
	if instance_exists(self) { // If the player isn't dead
		//Different fire sound depending on if the player has laser brain or not
		if(skill_get(17))
		sound_play(sndPlasmaUpg)
		else
		sound_play(sndPlasma)

		//Create the plasma
		with instance_create(x,y,PlasmaBall)
		{
			motion_add(point_direction(x,y,mouse_x,mouse_y)+(random(8)-4),2)
			creator = other;
			image_angle = direction
			team = other.team
		}
		wkick += 3;
		wait 2;
	}
}