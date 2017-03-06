#define init
sprAssaultLauncher = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABYAAAAKCAYAAACwoK7bAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QIZERAxQOXy3gAAAOFJREFUKM9jZMAP/iOxGRlIAEyEFPiExTL4hMXCLPlPhJn/0V2BVZORpR0K/9zxQ8Q4mJEFmWcvKcygICYM51/mkmCQkpVnePb4IYOUrDxU1I7BytENp4lT2moYGBgYGFjQJR68eovgKEgwKKioMzx7/JBBQUWdgYGBgeHZ44cMD+7cJOhkmMH/7SURLj34HGr480NYXffs8UMMMfQgwnAx1FBY2P8/tn8XiqZzxw/Bg+zBq7dwGj3lsGC4kohkdfD5W7j6g8/fMiD7Ft1gRqSUQUySYkSz6D9eBQQyCCn6GAAYkUsHcF3oJgAAAABJRU5ErkJggg==", 5, 3)

#define weapon_name
return "ASSAULT LAUNCHER"; // Name

#define weapon_type
return 4; // Explosive Wep

#define weapon_load
return 28; // 0.93 Seconds

#define weapon_cost
return 3; // 3 Ammo

#define weapon_area
return 6; // L0 3-1+

#define weapon_swap
return sndSwapExplosive; // Swap sound

#define weapon_fire
repeat(3){
    sound_play(sndGrenade); // Sound
    weapon_post(3, -10, 4);

    with instance_create(x,y,Grenade){ // Grenades
        motion_add(other.gunangle + (random_range(-3,3) * other.accuracy),10);
        image_angle = direction;
        team = other.team
        creator = other;
    }

    wait 3;
}

#define weapon_sprt
return sprAssaultLauncher; // Wep Sprite