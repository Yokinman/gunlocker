#define init
global.sprMegaCrossbow = sprite_add_weapon("../Sprites/Bolt/MegaCrossbow.png", 8, 8)

#define weapon_name
return "MEGA CROSSBOW"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_load
return 65; // 2.26 Seconds

#define weapon_cost
return 10; // 10 Ammo

#define weapon_sprt
return global.sprMegaCrossbow; // Wep Sprite

#define weapon_area
return 10; // L0 5-2+

#define weapon_swap
return sndSwapBow; // Swap sound

#define weapon_fire
sound_play(sndSuperCrossbow); //Fire sound

fireAngle = -45+random(8)-4 //Angle variable
repeat(10) //Fire 10 times
{
    with instance_create(x+lengthdir_x(16,point_direction(x,y,mouse_x,mouse_y)),y+lengthdir_y(16,point_direction(x,y,mouse_x,mouse_y)),Bolt)
    {
        motion_add(point_direction(x, y, mouse_x[other.index], mouse_y[other.index])+other.fireAngle,24)
        creator = other;
        image_angle = direction
        team = other.team
    }
    fireAngle += 10 //Change fire angle
}
wkick = 4;