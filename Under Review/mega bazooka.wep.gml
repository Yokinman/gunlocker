#define init
global.sprMegaBazooka = sprite_add_weapon("../Sprites/Bazooka/MegaBazooka.png", 8, 13)

#define weapon_name
return "MEGA BAZOOKA"; // Name

#define weapon_type
return 4; // Explosive Wep

#define weapon_load
return 65; // 2.16 Seconds

#define weapon_cost
return 10; // 10 Ammo

#define weapon_sprt
return global.sprMegaBazooka; // Wep Sprite

#define weapon_area
return 14; // L0 7-2+

#define weapon_swap
return sndSwapExplosive; // Swap sound

#define weapon_fire
sound_play(sndRocket); //Fire sound

fireAngle = -45+random(6)-3 //Angle variable
repeat(10) //Fire 10 times
{
    with instance_create(x+lengthdir_x(10,gunangle), y+lengthdir_y(10,gunangle),Rocket)
	{
		creator = other // Set Creator
		motion_add(other.gunangle+other.fireAngle*other.accuracy,2) //Add motion
		image_angle = direction // Set image angle
		team = other.team // Set team
	}
    fireAngle += 10 //Change fire angle
}
wkick = 13;