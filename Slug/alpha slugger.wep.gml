#define init
global.spr_AlphaSlug = sprite_add_weapon("../Sprites/Slug/AlphaSlugger.png", 5, 5);

#define weapon_name
return "ALPHA SLUGGER"; // Name 

#define weapon_type
return 2; // Shell Wep

#define weapon_cost
return 5; // 5 Ammo

#define weapon_area
return 13; // L0 6-1+

#define weapon_load
return 9; // 0.30 Seconds

#define weapon_swap
return sndSwapShotgun; // Swap Sound

#define weapon_auto
return 1; // Automatic

#define weapon_fire
 // Sound:
sound_play(sndHyperSlugger);
sound_play(sndSuperSlugger);

weapon_post(8, -15, 5);

var ang = gunangle - (15 * other.accuracy);
repeat(4){
    with instance_create(x, y, Slug){
        motion_set(ang + random_range(-4,4), 18);
        image_angle = direction;
        team = other.team;
		creator = other;
    }
	ang += (10 * other.accuracy);
}

motion_add(gunangle - 180, 1.5); // Push Player Backwards

#define weapon_sprt
return global.spr_AlphaSlug; // Wep Sprite

#define weapon_text
return "BRUTE FORCE"; // Loading Tip