#define init
global.spr_NitroShlug = sprite_add_weapon("../Sprites/HeavySlug/HeavyNitroSlugger.png", 3, 9);

#define weapon_name
return "HEAVY NITRO SLUGGER"; // Weapon Name 

#define weapon_type
return 2; // Shell Weapon!

#define weapon_cost
return 4; // Costs 2 Ammo

#define weapon_area
return 19; // Starts Appearing at L1 1-2

#define weapon_load
return 2; // .066 second

#define weapon_swap
return sndSwapShotgun; // Shell Weapon Swap Sound

#define weapon_auto
return 1;

#define weapon_fire

sound_play_pitchvol(sndHeavySlugger,.8,.5); //Sounds

ang = gunangle - (12 * other.accuracy) + (12*random_range(-1,1) * other.accuracy);
repeat (2){
    with instance_create(x, y, HeavySlug){
        motion_set(other.ang, 13);
		other.ang += (24 * other.accuracy); //Adds to the angle the next slug will shoot at
        image_angle = direction;
        team = other.team; // Projectile is Friendly (0 = Hostile/Prop, 1 = Enemy, 2 = Player, 3 = I.D.P.D.)
		creator = other; // Useful for Compatibility With Other Mods Among Other Things
    }
}


wkick = 2 // How Much Weapon Moves Back While Firing

#define weapon_sprt
return global.spr_NitroShlug; // Weapon Sprite

#define weapon_text
return "TO GO EVEN FURTHER BEYOND"; // Loading Screen Tip