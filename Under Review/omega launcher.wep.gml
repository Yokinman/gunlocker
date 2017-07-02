#define init
global.sprOmegaLaunch = sprite_add_weapon("../Sprites/HeavyGrenade/OmegaLauncher.png",2,3);

#define weapon_name
return "OMEGA LAUNCHER"; // Name 

#define weapon_type
return 4; // Explosive Wep

#define weapon_cost
return 10; // 10 Ammo

#define weapon_area
return 18; // L1 1-2+

#define weapon_load
return 12; // 0.40 Seconds

#define weapon_swap
return sndSwapExplosive; // Swap Sound

#define weapon_auto
return 1; // Automatic

#define weapon_fire
 // Sound:
sound_play(sndClusterLauncher);
sound_play(sndHeavyNader);

weapon_post(8, -6, 8);

 // HeavyNades:
var ang = gunangle - (15 * accuracy);
repeat(4){
    with instance_create(x+lengthdir_x(8,other.gunangle),y+lengthdir_y(8,other.gunangle),HeavyNade){
        motion_set(ang + random_range(-3,3), 10);
        image_angle = direction;
        team = other.team;
		creator = other;
    }
	ang += 10 * accuracy;
}

#define weapon_sprt
return global.sprOmegaLaunch; // Wep Sprite