#define init
global.spr_AlphaLaunch = sprite_add_weapon("../Sprites/Grenade/AlphaLauncher.png",5,3);

#define weapon_name
return "ALPHA LAUNCHER"; // Name 

#define weapon_type
return 4; // Explosive Wep

#define weapon_cost
return 5; // 5 Ammo

#define weapon_area
return 13; // L0 6-1+

#define weapon_load
return 11; // 0.37 Seconds

#define weapon_swap
return sndSwapExplosive; // Swap Sound

#define weapon_auto
return 1; // Automatic

#define weapon_fire
 // Sound:
sound_play(sndClusterLauncher);
sound_play(sndGrenade);

weapon_post(8, -6, 8);

 // Nades:
ang = gunangle - (15 * accuracy);
repeat (4){
    with instance_create(x,y,Grenade){
        motion_set(other.ang, 10);
        image_angle = direction;
        team = other.team;
		creator = other;
    }
	ang += 10 * accuracy;
}

#define weapon_sprt
return global.spr_AlphaLaunch; // Wep Sprite

#define weapon_text
return "GRENADES UP THE WAZOO"; // Loading Tip