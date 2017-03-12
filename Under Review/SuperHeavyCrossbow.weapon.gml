#define init
global.sprSuperHeavyCrossbow = sprite_add_weapon("../Sprites/HeavyBolt/HeavySuperCrossbow.png", 8, 8)

#define weapon_name
return "SUPER HEAVY CROSSBOW"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_load
return 74; // 2.46 Seconds

#define weapon_cost
return 10; // 10 Ammo

#define weapon_sprt
return global.sprSuperHeavyCrossbow; // Wep Sprite

#define weapon_area
return 10; // L0 7-1+

#define weapon_swap
return sndSwapBow; // Swap sound

#define weapon_fire
sound_play(sndHeavyCrossbow); //Fire sound

fireAngle = 0 //Angle variable
repeat(5) //Fire 5 times
{
    with instance_create(x+lengthdir_x(16,point_direction(x,y,mouse_x,mouse_y)),y+lengthdir_y(16,point_direction(x,y,mouse_x,mouse_y)),HeavyBolt)
    {
        motion_add(point_direction(x, y, mouse_x[other.index], mouse_y[other.index])-20+other.fireAngle+random(6)-3,24)
        creator = other;
        image_angle = direction
        team = other.team
    }
    fireAngle += 10 //Change fire angle
}
wkick = 4;

#define weapon_text
return "HARD TO CARRY"; // Loading Tip