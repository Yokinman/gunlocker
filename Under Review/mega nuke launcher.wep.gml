#define init
global.sprMegaNukeLauncher = sprite_add_weapon("../Sprites/Nuke/MegaNukeLauncher.png", 10, 10)

#define weapon_name
return "MEGA NUKE LAUNCHER"; // Name

#define weapon_type
return 4; // Explosive Wep

#define weapon_load
return 84; // 2.80 Seconds

#define weapon_cost
return 24; // 24 Ammo

#define weapon_sprt
return global.sprMegaNukeLauncher; // Wep Sprite

#define weapon_area
return 16; // L1 0-1+

#define weapon_swap
return sndSwapExplosive; // Swap sound

#define weapon_fire
sound_play(sndNukeFire); //Fire sound
weapon_post(25, -25, 40)

fireAngle = -84+random(8)-4 //Angle variable
repeat(8) //Fire 4 times
{
	if(fork()) {
		with instance_create(x,y,Nuke)
		{
			index = other.index
			motion_add(other.gunangle+other.fireAngle*other.accuracy,2) // Set motion
			creator = other // Set creator
			image_angle = direction // Set image angle
			team = other.team // Set team
		}
		exit;
	}
    fireAngle += 24 //Change fire angle
}