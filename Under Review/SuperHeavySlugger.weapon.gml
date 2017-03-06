#define init
sprSuperHeavySlugger = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABYAAAAQCAYAAAAS7Y8mAAAABmJLR0QAXwAvACaiHGdFAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAB3RJTUUH4QEPCg8qJXsLrgAAAQxJREFUOMvNlDEKwjAUhr9KbyAIFko7iA4OQjcdFBcnZzfxIs6ewAt4DRfRQTfBsdKhIigITh6gDjYhqVarIvgg5PFKvrz8+Rv484jiISP3xqJng26vjwo3X0G9ehPLdgBwSxWWsymNdgdA5svZFLdU0RaaWaEAYeBrc1oNwEg5OgBevfmW0OvVQjKT4GhQK986OJ25uFUs2+Gw32HZjjxuGPh3uZjHoyGAoV5e1CrmtV1UWFLDV2GqULeQl93Oj2e8/e5OS4CDUhe5WlOlkGABjb9Fn+qsuSIB1SQRcmTRV7NbDJSdqmBxeWHgZ5IhzW4P/fyt3Z791loIB4kLn2y2Gs/44tF5FMbPn7srn2iIYt1ZZckAAAAASUVORK5CYII=", 5, 8)

#define weapon_name
return "SUPER HEAVY SLUGGER"; // Name

#define weapon_type
return 2; // Shell Wep

#define weapon_load
return 72; // 2.40 Seconds

#define weapon_cost
return 10; // 10 Ammo

#define weapon_sprt
return sprSuperHeavySlugger; // Wep Sprite

#define weapon_area
return 10; // L0 5-2+

#define weapon_swap
return sndSwapShotgun; // Swap sound

#define weapon_fire
//Firesound
sound_play(sndHeavySlugger);

fireAngle = 0 //Fire angle variable
repeat(5) //Fire 5 times
{
    with instance_create(x+lengthdir_x(16,point_direction(x,y,mouse_x,mouse_y)),y+lengthdir_y(16,point_direction(x,y,mouse_x,mouse_y)),HeavySlug)
    {
        motion_add(point_direction(x, y, mouse_x[other.index], mouse_y[other.index])-30+other.fireAngle+random(6)-3,12)
        creator = other;
        image_angle = direction
        team = other.team
    }
    fireAngle += 15 //Change fireangle
}
wkick = 4;