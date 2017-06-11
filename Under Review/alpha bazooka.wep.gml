#define init
global.sprAlphaBazooka = sprite_add_weapon("../Sprites/Bazooka/AlphaBazooka.png", 10, 7)
global.sprAlphaRocket = sprite_add_weapon("../Sprites/Projectiles/Bazooka/AlphaRocket.png", 4, 3)

#define weapon_name
return "ALPHA BAZOOKA"; // Name

#define weapon_type
return 4; // Explosive Wep

#define weapon_load
return 13; // 0.43 Seconds

#define weapon_cost
return 5; // 5 Ammo

#define weapon_sprt
return global.sprAlphaBazooka; // Wep Sprite

#define weapon_area
return 13; // L0 7-1+

#define weapon_swap
return sndSwapExplosive; // Swap sound

#define weapon_auto
return 1; // Automatic

#define weapon_fire
sound_play(sndRocket); //Fire sound

fireAngle = -15+random(6)-3 //Angle variable
repeat(4) //Fire 4 times
{
    with instance_create(x+lengthdir_x(10,gunangle), y+lengthdir_y(10,gunangle),Rocket)
	{
		creator = other // Set Creator
		motion_add(other.gunangle+other.fireAngle*other.accuracy,2) //Add motion
		sprite_index = global.sprAlphaRocket // Set Alphasprite
		image_angle = direction // Set image angle
		team = other.team // Set team
	}
    fireAngle += 10 //Change fire angle
}
wkick = 13;