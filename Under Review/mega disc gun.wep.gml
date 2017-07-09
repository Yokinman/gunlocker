#define init
global.sprMegaDiscGun = sprite_add_weapon("../Sprites/Disc/MegaDiscGun.png", 2, 8)

#define weapon_name
return "MEGA DISC GUN"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_load
return 24; // 0.80 Seconds

#define weapon_cost
return 10; // 10 Ammo

#define weapon_area
return 24; // L1 4-1+

#define weapon_swap
return sndSwapBow; // Swap sound

#define weapon_fire
sound_play(sndDiscgun); //Fire sound
sound_play(sndSuperDiscGun)

fireAngle = -45+random_range(-4, 4) //Angle variable
repeat(10) //Fire 10 times
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
weapon_post(7,-20,5)

#define weapon_sprt
return global.sprMegaDiscGun; // Wep Sprite