#define init
global.spr_MegaShlug = sprite_add_weapon("../Sprites/HeavySlug/HeavyMegaSlugger.png", 3, 8);

#define weapon_name
return "MEGA HEAVY SLUGGER"; // Weapon Name 

#define weapon_type
return 2; // Shell Weapon!

#define weapon_cost
return 20; // Costs 20 Ammo

#define weapon_area
return 20; // Starts Appearing at L1 1-1

#define weapon_load
return 30; // 1 second

#define weapon_swap
return sndSwapShotgun; // Shell Weapon Swap Sound

#define weapon_auto
return 0;

#define weapon_fire

sound_play(sndSuperSlugger); //Sounds
sound_play(sndHeavySlugger);

ang = gunangle - (50 * other.accuracy) + (2*random_range(-1,1) * other.accuracy);
repeat (10){
    with instance_create(x, y, HeavySlug){
        motion_set(other.ang, 13);
		other.ang += (10 * other.accuracy); //Adds to the angle the next slug will shoot at
        image_angle = direction;
        team = other.team; // Projectile is Friendly (0 = Hostile/Prop, 1 = Enemy, 2 = Player, 3 = I.D.P.D.)
		creator = other; // Useful for Compatibility With Other Mods Among Other Things
    }
}


wkick = 10 // How Much Weapon Moves Back While Firing

#define weapon_sprt
return global.spr_MegaShlug; // Weapon Sprite

#define weapon_text
return "SO @qHEAVY"; // Loading Screen Tip