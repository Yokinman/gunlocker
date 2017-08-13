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
			index = other.index
			sprite_index = global.sprAlphaNuke
			motion_add(other.gunangle+other.fireAngle*other.accuracy,2) // Set motion
			creator = other // Set creator
			image_angle = direction // Set image angle
			team = other.team // Set team
		}
		exit;
	}
    fireAngle += 32 //Change fire angle
}