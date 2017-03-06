#define init
sprSuperHeavyLauncher = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABkAAAAPCAYAAAARZmTlAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAB3RJTUUH4QIXBjYS2OrCTgAAAVdJREFUOMtjYKA9+M9IjCJKbWEmZIFPWCwDD58Ag7GVHcOMS7cY3t6IhPPVtPUZbl29xOATFsvg5h/G8OfPH4bguFQ4bWbrxHDq8D4GFkKuV1BRh9PramsYFFRQxY0s7RgYGBgYHty5yXDu+CEGKVl5OA0D2Cz5H6+vxsDAwMBwmUsCRSKouYVhXW0NhoZnjx8ynDt+iIGBgYFhy6rFKDQDAwMDIy4LGBgYGBZevMXgExbL8OzxQxSXIfOfPX7IwMDAgMKXkpVHtpgR3QI4hgbZfyNLOzhtsUQIhY+NjQVjBteDV28ZDj5/C3MBSsr6NVUHZwqB+MQOqy9YkIPpwau3eJMuW/YVrBadO36I4dxxGBvTAYzYLMHlEzwAb35jQQ4mNAvwJoyFF28RNBwGmEjNvQ9evWV48Ootg72kMNGlASOW8Cfkuv9QC9B9TV5YElmeMTIMBgAAx0qjKqxZy2kAAAAASUVORK5CYII=", 5, 5)

#define weapon_name
return "SUPER HEAVY LAUNCHER"; // Name

#define weapon_type
return 4; // Explosive Wep

#define weapon_load
return 59; // 1.96 Seconds

#define weapon_cost
return 10; // 10 Ammo

#define weapon_sprt
return sprSuperHeavyLauncher; // Wep Sprite

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