#define init
global.sprSuperNukeLauncher = sprite_add_weapon("../Sprites/Nuke/SuperNukeLauncher.png", 10, 7)

#define weapon_name
return "SUPER NUKE LAUNCHER"; // Name

#define weapon_type
return 4; // Explosive Wep

#define weapon_load
return 63; // 2.10 Seconds

#define weapon_cost
return 12; // 12 Ammo

#define weapon_sprt
return global.sprSuperNukeLauncher; // Wep Sprite

#define weapon_area
return 13; // L0 7-1+

#define weapon_swap
return sndSwapExplosive; // Swap sound

#define weapon_fire
sound_play(sndNukeFire); //Fire sound
weapon_post(15, -20, 25)

fireAngle = -24+random(8)-4 //Angle variable
repeat(4) //Fire 4 times
{
	if(fork()) {
		with instance_create(x,y,Nuke)
		{
			motion_add(other.gunangle+other.fireAngle*other.accuracy,2) // Set motion
			creator = other // Set creator
			image_angle = direction // Set image angle
			team = other.team // Set team
			active = 0;
			wait 8; 
			if instance_exists(self) { // For some reason "active = 1" doesn't work. This is a replacement
				active = 1;
				while(instance_exists(self)) {
					if speed > 5
					speed = 5

					motion_add(point_direction(x,y,mouse_x,mouse_y),0.5)
					motion_add(direction,0.5)
					image_angle = direction
					
					wait 1; 
				}
			}
		}
		exit;
	}
    fireAngle += 16 //Change fire angle
}