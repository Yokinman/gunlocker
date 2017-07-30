#define init
global.spr_HeavyMegaLaunch = sprite_add_weapon("../Sprites/HeavyGrenade/HeavyMegaLauncher.png",5,6);

#define weapon_name
return "HEAVY MEGA LAUNCHER"; // Name 

#define weapon_type
return 4; // Explosive Wep

#define weapon_cost
return 18; // 18 Ammo

#define weapon_area
return 20; // L1 2-1+

#define weapon_load
return 64; // 2.13 Seconds

#define weapon_swap
return sndSwapExplosive; // Swap Sound

#define weapon_fire
 // Sound:
sound_play(sndHeavyNader);
sound_play(sndClusterLauncher);

weapon_post(20, -32, 20);

 // 10 Grenades, Wide Spread:
ang = gunangle - (45 * other.accuracy);
repeat(10){
    with instance_create(x,y,HeavyNade){
        motion_set(other.ang + random_range(-3,3), 10);
        image_angle = direction;
        team = other.team;
		creator = other;
    }
	ang += 10 * accuracy;
}

motion_add(gunangle - 180, 6); // Push Player Backwards

#define weapon_sprt
return global.spr_HeavyMegaLaunch; // Wep Sprite