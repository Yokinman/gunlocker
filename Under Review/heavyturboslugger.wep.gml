#define init
global.spr_TurboShlug = sprite_add_weapon("../Sprites/HeavySlug/HeavyTurboSlugger.png", 2, 5);

#define weapon_name
return "HEAVY TURBO SLUGGER"; // Weapon Name 

#define weapon_type
return 2; // Shell Weapon!

#define weapon_cost
return 2; // Costs 2 Ammo

#define weapon_area
return 15; // Starts Appearing at L0 7-2

#define weapon_load
return 2; // .066 seconds

#define weapon_swap
return sndSwapShotgun; // Shell Weapon Swap Sound

#define weapon_auto
return 1;

#define weapon_fire

sound_play_pitchvol(sndHeavySlugger,.8,.5); //Sounds

with instance_create(x, y, HeavySlug){
	motion_add(other.gunangle+((12*random_range(-1, 1))*other.accuracy), 13);
	image_angle = direction;
	team = other.team; // Projectile is Friendly (0 = Hostile/Prop, 1 = Enemy, 2 = Player, 3 = I.D.P.D.)
	creator = other; // Useful for Compatibility With Other Mods Among Other Things
}

wkick = 1 // How Much Weapon Moves Back While Firing

#define weapon_sprt
return global.spr_TurboShlug; // Weapon Sprite

#define weapon_text
return "3 METERS OF DEVASTATION"; // Loading Screen Tip