#define init
global.spr_MegaLaunch = sprite_add_weapon("../Sprites/Grenade/MegaLauncher.png",5,6);

#define weapon_name
return "MEGA LAUNCHER"; // Name 

#define weapon_type
return 4; // Explosive Wep

#define weapon_cost
return 10; // 10 Ammo

#define weapon_area
return 18; // L1 1-1+

#define weapon_load
return 47; // 1.57 Seconds

#define weapon_swap
return sndSwapExplosive; // Swap Sound

#define weapon_fire
 // Sound:
sound_play(sndHeavyNader);
sound_play(sndClusterLauncher);

weapon_post(14, -32, 16);

 // 10 Grenades, Wide Spread:
ang = gunangle - (45 * other.accuracy);
repeat(10){
    with instance_create(x,y,Grenade){
        motion_set(other.ang, 10);
        image_angle = direction;
        team = other.team;
		creator = other;
    }
	ang += 10 * accuracy;
}

motion_add(gunangle - 180, 6); // Push Player Backwards

#define weapon_sprt
return global.spr_MegaLaunch; // Wep Sprite

#define weapon_text
return "NOT ENOUGH BARRELS"; // Loading Tip