#define init
sprFlakthrower = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABUAAAAKCAYAAABblxXYAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA7CAAAOwgEVKEqAAAAAB3RJTUUH4QIYEjIdb3UBIQAAAOlJREFUKM/FkjFqw0AQRZ+CewccEOgAKizUCpHCF1jYG+ytfAQXOYcLFWlDAnHjzmCwQFZamZ/CWtmyjJImZGCYz8zOn8/swB9Y0EbdyWukRyP9wYNH1jiscaRJBqD1HJq87+v5hcAa57Gscb42MAGKwlhRGKvJkVbTnjc5SpNMWk1ljevyHvuBk9tV7PYbRWFMUcPz8tibWtRQlhWn5ZHt1yentn6Nb0lplf74EUV9llDUFzkdvlo0gNIkozxUALzMNncJFx/n6N/Onh4pDxW7ffc+GJACvL2/AgyW3xKOXcxQ6S9P7X/sG0tocWhAe6uOAAAAAElFTkSuQmCC", 3, 5)
global.sprFlameFlak = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACAAAAAQCAYAAAB3AH1ZAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QIYEjAwGJw/1gAAAUJJREFUSMftVcuNgzAQfcCe4z5CAwQpEtRBC+kh0AMlJHWwChLZBlKIOWPNHsDgMca7Kw67h33SyJI9n2d7NC/ISsxoruPaxqD0AIauB84vBACQV8v+e4ldeDOL68LpAYgugjmmtYQ6gboeaF4ITBK7CTRXQJ3G4nPhQjLHCIIRaZ5+EkMCYoU+xtdbgQh4HEFDAqKbICL47SZoSECPI4honY/lMkzHOAmsi2+Bk7AJeC+yQSJsY5sVeX6Mn9mx8xcWcvI1rJCILgJ2c//g9u5XcOfxxFpxIX4Z/wQcnfuNHtjoaH+e9f8DQKjH64LAQ5ef2bFdD6haAncx+Rp2F1C1RNf/tUGUlcswYoGOwjqRHkJZ6R/Fpnm1IK+A5omgjUFpLdns11DTvlbFr8Roc/ZvqWFejSo3y3EtnXJ8tuR4Lz4BraH3XU2dqCQAAAAASUVORK5CYII=",2,8,8)

#define weapon_name
return "FLAKTHROWER"; // Name

#define weapon_type
return 2; // Shell Wep

#define weapon_load
return 27; // 0.90 Seconds

#define weapon_cost
return 2; // 2 Ammo

#define weapon_sprt
return sprFlakthrower; // Sprite

#define weapon_area
return 6; // L0 3-2+

#define weapon_swap
return sndSwapShotgun; // Swap sound

#define ProWall
//Collide with wall
sound_play(sndHitWall)
instance_destroy()

#define ProHit
//Collide with enemy
if other.team != team
{
    instance_destroy()
    sound_play(other.snd_hurt)
    with other
    {
        my_health -= 6
        sprite_index = spr_hurt
        image_index = 0
    }
}

#define ProStep
//Create smoke
if random(3) < 1
{
    with instance_create(x,y,Smoke)
    motion_add(random(360),random(2))
}

//Create flame
if random(4) < 1 {
    with instance_create(x,y,Flame) {
        creator = other;
        team = other.team
        move_contact_solid(direction,14)
    }
}

image_speed = speed/12

//Explode if to slow
if speed = 0
instance_destroy()

#define ProDed
//Create flame shell when destroyed
repeat(14)
{
    with instance_create(x,y,FlameShell)
    {
        creator = other;
        motion_add(random(360),8+random(8))
        image_angle = direction
        team = other.team
    }
}

//Create flames
repeat(8) {
    with instance_create(x,y,Flame)
    {
        creator = other;
        motion_add(random(360),6+random(2))
        team = other.team
        move_contact_solid(direction,14)
    }
}

//Create smoke
repeat(6)
{
    with instance_create(x,y,Smoke)
    motion_add(random(360),random(3))
}

#define ProDraw
//Glow effect
draw_sprite_ext(sprite_index,image_index,x,y,2,2,image_angle,c_white,0.5)
draw_self()

#define weapon_fire
//Fire sounds
sound_play(sndFlakCannon)
sound_play(sndFireShotgun)
pointing = point_direction(x, y, mouse_x[index], mouse_y[index]) //Shorter variable for point_direction

//Create flame flak
with (instance_create(x+lengthdir_x(8, other.pointing),y+lengthdir_y(8, other.pointing),CustomProjectile)) {
    //Set some shit:
    friction = 0.4
    typ = 1 //Reflectable
    team = other.team;
    motion_add(point_direction(x, y, mouse_x[other.index], mouse_y[other.index])-4+random(8),11+random(2));
    creator = other;
    image_angle = direction;
    sprite_index = global.sprFlameFlak;
    image_speed = 1;
    on_wall = ProWall;
    on_hit = ProHit;
    on_step = ProStep;
    on_destroy = ProDed;
    on_draw = ProDraw;
}