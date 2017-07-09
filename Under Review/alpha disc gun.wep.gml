#define init
global.sprAlphaDiscGun = sprite_add_weapon("../Sprites/Disc/AlphaDiscGun.png", 3, 4)

#define weapon_name
return "ALPHA DISC GUN"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_load
return 7; // 0.23 Seconds

#define weapon_cost
return 5; // 5 Ammo

#define weapon_area
return 24; // L1 4-1+

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapBow; // Swap sound

#define weapon_fire
sound_play(sndSuperDiscGun)

fireAngle = -7.5+random_range(-4, 4) //Angle variable
repeat(4) //Fire 4 times
{
    with instance_create(x+lengthdir_x(16,other.gunangle),y+lengthdir_y(16,other.gunangle),Disc)
    {
        motion_add(other.gunangle+other.fireAngle,5)
        creator = other;
        image_angle = direction
        team = other.team
    }
    fireAngle += 10 //Change fire angle
}
weapon_post(7,-10,4)

#define weapon_sprt
return global.sprAlphaDiscGun; // Wep Sprite