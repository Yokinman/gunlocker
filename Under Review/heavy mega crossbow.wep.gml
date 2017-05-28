#define init
global.sprHeavyMegaCrossbow = sprite_add_weapon("../Sprites/HeavyBolt/HeavyMegaCrossbow.png", 8, 13)

#define weapon_name
return "HEAVY MEGA CROSSBOW"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_load
return 114; // 3.80 Seconds

#define weapon_cost
return 18; // 18 Ammo

#define weapon_sprt
return global.sprHeavyMegaCrossbow; // Wep Sprite

#define weapon_area
return 15; // L0 7-3+

#define weapon_swap
return sndSwapBow; // Swap sound

#define weapon_fire
sound_play(sndSuperCrossbow); //Fire sound

fireAngle = -45+random(6)-3 //Angle variable
repeat(10) //Fire 10 times
{
    with instance_create(x+lengthdir_x(16,point_direction(x,y,mouse_x,mouse_y)),y+lengthdir_y(16,point_direction(x,y,mouse_x,mouse_y)),HeavyBolt)
    {
        motion_add(point_direction(x, y, mouse_x[other.index], mouse_y[other.index])+other.fireAngle,24)
        creator = other;
        image_angle = direction
        team = other.team
    }
    fireAngle += 10 //Change fire angle
}
wkick = 4;