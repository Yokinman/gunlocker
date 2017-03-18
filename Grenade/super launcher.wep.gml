#define init
global.spr_SupLaunch = sprite_add_weapon("../Sprites/Grenade/SuperLauncher.png",2,5);

#define weapon_name
return "SUPER LAUNCHER"; // Name 

#define weapon_type
return 4; // Explosive Wep

#define weapon_cost
return 5; // 5 Ammo

#define weapon_area
return 11; // L0 5-2+

#define weapon_load
return 26; // 0.87 Seconds

#define weapon_swap
return sndSwapExplosive; //Switch sound

#define weapon_fire
 // Sound:
sound_play(sndHeavyNader);
sound_play(sndGrenade);

weapon_post(10, -16, 8);

 // Grenades:
ang = gunangle - (20 * accuracy);
repeat(5){
	with instance_create(x,y,Grenade){
		team = other.team;
		creator = other;
		motion_set(creator.ang + random_range(-3,3), 10);
		image_angle = direction;
	}
	ang += 10 * accuracy;
}

#define weapon_sprt
return global.spr_SupLaunch; // Wep Sprite

#define weapon_text
return "WORTH THE DANGER"; // Loading Tip