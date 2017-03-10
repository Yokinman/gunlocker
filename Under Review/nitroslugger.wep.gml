#define init // Define Sprites Using Base64: sprite_add_base64("base64",Frames,XOffset,YOffset)
global.spr_NitroSlug = sprite_add_weapon("../Sprites/Slug/NitroSlugger.png", 3, 9);

#define weapon_name
return "NITRO SLUGGER"; // Weapon Name 

#define weapon_type
return 2; // Shell Weapon!

#define weapon_cost
return 2; // Costs 2 Ammo

#define weapon_area
return 16; // Starts Appearing at L0 7-3

#define weapon_load
return 3; // .1 second

#define weapon_swap
return sndSwapShotgun; // Shell Weapon Swap Sound

#define weapon_auto
return 1;

#define weapon_fire

sound_play(sndSlugger); // Slugger Sounds

ang = gunangle - (8 * other.accuracy) + (6*random_range(-1,1) * other.accuracy);
repeat (2){
    with instance_create(x, y, Slug){
        motion_set(other.ang, 16);
		other.ang += (16 * other.accuracy); //Adds to the angle the next slug will shoot at
        image_angle = direction;
        team = other.team; // Projectile is Friendly (0 = Hostile/Prop, 1 = Enemy, 2 = Player, 3 = I.D.P.D.)
		creator = other; // Useful for Compatibility With Other Mods Among Other Things
    }
}


wkick = 5 // How Much Weapon Moves Back While Firing

#define weapon_sprt
return global.spr_NitroSlug; // Weapon Sprite

#define weapon_text
return "Activate the @rNITRO"; // Loading Screen Tip