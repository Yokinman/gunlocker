#define init
global.sprSuperHeavyLauncher = sprite_add_weapon("../Sprites/HeavyGrenade/HeavySuperLauncher.png", 5, 5)

#define weapon_name
return "SUPER HEAVY LAUNCHER"; // Name

#define weapon_type
return 4; // Explosive Wep

#define weapon_load
return 59; // 1.96 Seconds

#define weapon_cost
return 10; // 10 Ammo

#define weapon_sprt
return global.sprSuperHeavyLauncher; // Wep Sprite

#define weapon_area
return 11; // L0 7-2+

#define weapon_swap
return sndSwapExplosive; // Swap Sound

#define weapon_fire
//Fire sound
sound_play(sndHeavyNader);
fireAngle = -20 //Fire angle variable
repeat(5) { //Fire 5 times
    with instance_create(x+lengthdir_x(16,point_direction(x,y,mouse_x,mouse_y)),y+lengthdir_y(16,point_direction(x,y,mouse_x,mouse_y)),HeavyNade)
    {
        motion_add(point_direction(x, y, mouse_x[other.index], mouse_y[other.index])+(random(4)-2)*other.accuracy+other.fireAngle,10)
        image_angle = direction
        creator = other;
        team = other.team
    }
fireAngle += 10 //Change fire angle
}

#define weapon_text
return "ANNIHILATOR"; // Loading Tip