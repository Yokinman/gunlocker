#define init
global.sprAlphaNukeLauncher = sprite_add_weapon("../Sprites/Nuke/AlphaNukeLauncher.png", 10, 7)
global.sprAlphaNuke = sprite_add("../Sprites/Projectiles/Nuke/AlphaNuke.png", 1, 8, 6)

#define weapon_name
return "ALPHA NUKE LAUNCHER"; // Name

#define weapon_type
return 4; // Explosive Wep

#define weapon_load
return 11; // 0.37 Seconds

#define weapon_cost
return 12; // 12 Ammo

#define weapon_sprt
return global.sprAlphaNukeLauncher; // Wep Sprite

#define weapon_area
return 17; // L1 1-1+

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapExplosive; // Swap sound

#define weapon_fire
sound_play(sndNukeFire); //Fire sound
weapon_post(15, -10, 10)

fireAngle = -32+random(8)-4 //Angle variable
repeat(3) //Fire 4 times
{
	if(fork()) {
		with instance_create(x,y,Nuke)
		{
			motion_add(other.gunangle+other.fireAngle*other.accuracy,2) // Set motion
			creator = other // Set creator
			image_angle = direction // Set image angle
			team = other.team // Set team
			sprite_index = global.sprAlphaNuke
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
    fireAngle += 32 //Change fire angle
}