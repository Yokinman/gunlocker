#define init
sprSuperHeavyCrossbow = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABwAAAAQCAYAAAAFzx/vAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAB3RJTUUH4QIXBgwO6UJAeAAAASZJREFUOMtjYKAzYKSSOf+JNZNqFvqExTIwMDAwbFm1GK/ZjGS69j8Webil+CxmwmaaT1gsA1TzfySMAnKqWjAch2QJuhlYffAfzTAGBgYGhgd3bqK7GG6ggoo6w5S2Grw+RdLLiKzwv5S4GgMDAwODsIgA1jB8++YDTrnLV09hiEmJq8HVv33zgeHZy1sMDAwMjEzYDGZgYGCQ11ZHoWEAXVxeW51BSlyNwScslkFX24zBJywWxTJ0T2D4EJsimCOI9T1MPQwY2ZvDg5UFZvGzl7dQLMUWTAwMEHlo8KCAZy+xJz4FFdQQYiGhYPgvLCIAcwgjoTyJbBFywmIhtgTR1Taj2DJsmjHiEhZ3pFoGtYhgafYfDyZUtP3PqWohqJ7uhTfdAQDcf3ujRt60ewAAAABJRU5ErkJggg==", 6, 8)

#define weapon_name
return "SUPER HEAVY CROSSBOW"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_load
return 74; // 2.46 Seconds

#define weapon_cost
return 10; // 10 Ammo

#define weapon_sprt
return sprSuperHeavyCrossbow; // Wep Sprite

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