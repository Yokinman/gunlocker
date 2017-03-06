#define init
sprSuperFlakthrower = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABUAAAAPCAYAAAALWoRrAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QISCDEKuYcR5wAAAB1pVFh0Q29tbWVudAAAAAAAQ3JlYXRlZCB3aXRoIEdJTVBkLmUHAAABXklEQVQ4y7WTv2rCUBjFf0az9R+tIGQoSjGBiINLEF+hUOcOfYA+QZ+hnYU+gN0EwaEvkMGha+nQBrEKLRQUWtpNk6/DNUFjqnXwwiXnnnzfuYfkfLCFlVrzXjasX1skRs6MDu8fL/E+ScArNeUynZZyyZGmrotrI66tuJlAxMUxQOYv1XPL5y1v0cpbALTHTbB8hkONq+OA2p6qc20ivOobytnphUyrRE6nVUTu9mVaRU53tOgcciFOcirlkkMhb9F/fYZdKMyctoB2o7lxCsTImWLkTCmXHDFypri24uadurZy6trItKr2PA6danH1x6eH6E8fZQ+4MStUvh38xhcA9z/BWoeZhMikABl4OuPDT+qjHjVNo1uEgacDE/UsTgAWcFw0zFqUsW6gHHWyJ3SAa68fcd0gAE9fwjAhKVLxCaI+6qnmOe7W9xdqwsvWpV8A/jlRS1O6ldnfyvoFAz2229JJEOoAAAAASUVORK5CYII=", 3, 5)
global.sprFlameFlak = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACAAAAAQCAYAAAB3AH1ZAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QIYEjAwGJw/1gAAAUJJREFUSMftVcuNgzAQfcCe4z5CAwQpEtRBC+kh0AMlJHWwChLZBlKIOWPNHsDgMca7Kw67h33SyJI9n2d7NC/ISsxoruPaxqD0AIauB84vBACQV8v+e4ldeDOL68LpAYgugjmmtYQ6gboeaF4ITBK7CTRXQJ3G4nPhQjLHCIIRaZ5+EkMCYoU+xtdbgQh4HEFDAqKbICL47SZoSECPI4honY/lMkzHOAmsi2+Bk7AJeC+yQSJsY5sVeX6Mn9mx8xcWcvI1rJCILgJ2c//g9u5XcOfxxFpxIX4Z/wQcnfuNHtjoaH+e9f8DQKjH64LAQ5ef2bFdD6haAncx+Rp2F1C1RNf/tUGUlcswYoGOwjqRHkJZ6R/Fpnm1IK+A5omgjUFpLdns11DTvlbFr8Roc/ZvqWFejSo3y3EtnXJ8tuR4Lz4BraH3XU2dqCQAAAAASUVORK5CYII=",2,8,8)
global.sprSuperFlameFlak = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAEAAAAAgCAYAAACinX6EAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QIYFCQRftaEbwAAAbpJREFUaN7tWdFthDAMjdP/Zo+boOpHF7kVOk5HOBa5jxuhe3DfrdIPBHUSHOLEBk6cJYSERJ79/JxgA4Zp15Pxxhjz/ho+v92H+8e3AfNABqVBxwEv2e3+GGQAN/CXT5dd8PerVyVCWoFQGvwU+LnPr9i5hAgJEjgq5ODBElhx4AtE1JLAUWGN+mAx+NnAfTmfnasmYTYRuWR0LiGDhXk9Gf/zNlz+4rz3Bl1cQ+9e3LTuWMM6vjRgygbf5hDtCxOXQ4J88HkSeME3YC+QYPHRUl7rHPPZ4yy2dP/xbdjnfto/yFOkTW71sqSyL+tHiBsTb/f0VZZmSF6BMYYdGaGPPGFDksTZKD0dJL8mMwrQ8KVsTZnaz+8FgQK4TY6W5Nf0A2Ptag/Ywp4EHJ6AsY/ewjD2mn5gLNswKNIYPg1dXOeEfYCgKw0UMLaK/8DKhhzBbeqa4zOMtas9IC0DEFdejGHxw1AFIC//aDhCZUZcjYTqJgJo+YFa7VOYaTJArPbnSLc0sAQJQI7GcvU5TwIwcYE/jjviSOzwQ9HnWLwU+FA/RmrYb8lCzTBD/ddYLftagWsZbJ2Bre0PU0lAS1GQrXQAAAAASUVORK5CYII=",2,16,16)

#define weapon_name
return "SUPER FLAKTHROWER"; // Name

#define weapon_type
return 2; // Shell Wep

#define weapon_load
return 68; // 2.26 Seconds

#define weapon_cost
return 8; // 8 Ammo

#define weapon_sprt
return sprSuperFlakthrower; // Wep Sprite

#define weapon_area
return 9; // L0 5-1+

#define weapon_swap
return sndSwapShotgun; // Swap sound

//BasicCannonProjectile
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

//SuperProjectile
#define ProWall2
//Explode when colliding with wall
sound_play(sndHitWall)
instance_destroy()

#define ProHit2
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

#define ProStep2
//Create smoke:
if random(3) < 1
{
    with instance_create(x,y,Smoke)
    motion_add(random(360),random(2))
}

//Create flames: 
if random(4) < 1 {
    with instance_create(x,y,Flame) {
        creator = other;
        team = other.team
        move_contact_solid(direction,14)
    }
}

image_speed = speed/12

//If it stops it explodes
if speed = 0
instance_destroy()

#define ProDed2
qDir = 0 //Direction
repeat(5) { //Fire 5 projectiles
    with (instance_create(x,y,CustomProjectile)) { //Flame flaks
        creator = other;
        //Set some shit
        friction = 0.4
        typ = 1 //Reflectable
        team = other.team;
        motion_add(other.qDir,11+random(2));
        image_angle = direction;
        sprite_index = global.sprFlameFlak;
        image_speed = 1;
        on_wall = ProWall;
        on_hit = ProHit;
        on_step = ProStep;
        on_destroy = ProDed;
        on_draw = ProDraw;
    }
    qDir += 360/5 //Change fire angle
}

//Create flames
repeat(16) {
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

#define ProDraw2
//Glow effect
draw_sprite_ext(sprite_index,image_index,x,y,2,2,image_angle,c_white,0.5)
draw_self()

#define weapon_fire
//Fire sound
sound_play(sndSuperFlakCannon)
sound_play(sndFireShotgun)
pointing = point_direction(x, y, mouse_x[index], mouse_y[index]) //Short point_direction variable

with (instance_create(x+lengthdir_x(14, other.pointing),y+lengthdir_y(14, other.pointing),CustomProjectile)) { //Create super flak
    //Set some shit
    creator = other;
    friction = 0.4
    typ = 1 //Reflectable
    team = other.team;
    motion_add(point_direction(x, y, mouse_x[other.index], mouse_y[other.index])-4+random(8),11+random(2));
    image_angle = direction;
    sprite_index = global.sprSuperFlameFlak;
    mask_index = sprFlakBullet;
    image_speed = 1;
    on_wall = ProWall2;
    on_hit = ProHit2;
    on_step = ProStep2;
    on_destroy = ProDed2;
    on_draw = ProDraw2;
}