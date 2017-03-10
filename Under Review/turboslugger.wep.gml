#define init // Define Sprites Using Base64: sprite_add_base64("base64",Frames,XOffset,YOffset)
global.spr_TurboSlug = sprite_add_weapon("../Sprites/Slug/TurboSlugger.png", 2, 5);

#define weapon_name
return "TURBO SLUGGER"; // Weapon Name 

#define weapon_type
return 2; // Shell Weapon!

#define weapon_cost
return 1; // Costs 1 Ammo

#define weapon_area
return 12; // Starts Appearing at L0 5-3

#define weapon_load
return 3; // .1 second

#define weapon_swap
return sndSwapShotgun; // Shell Weapon Swap Sound

#define weapon_auto
return 1;

#define weapon_fire

sound_play(sndSlugger); // Slugger Sounds


    with instance_create(x, y, Slug){
        motion_add(point_direction(x, y, mouse_x[other.index], mouse_y[other.index])+((12*random_range(-1, 1))*other.accuracy), 16);
        image_angle = direction;
        team = other.team; // Projectile is Friendly (0 = Hostile/Prop, 1 = Enemy, 2 = Player, 3 = I.D.P.D.)
		creator = other; // Useful for Compatibility With Other Mods Among Other Things
    }

wkick = 4 // How Much Weapon Moves Back While Firing

#define weapon_sprt
return global.spr_TurboSlug; // Weapon Sprite

#define weapon_text
return "Not so sluggish now"; // Loading Screen Tip