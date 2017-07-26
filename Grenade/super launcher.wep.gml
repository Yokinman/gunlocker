#define init
	global.sprSuperLauncher = sprite_add_weapon("../Sprites/Grenade/SuperLauncher.png", 2, 5);

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

	 // Kick, Shift, Shake:
	weapon_post(10, -25, 8);

	 // Grenades:
	for(var i = -20; i <= 20; i += 10) with instance_create(x,y,Grenade){
		motion_set(other.gunangle + ((i + random_range(-3, 3)) * other.accuracy), 10);
		image_angle = direction;
		hitid = [sprite_index, "GRENADE"];
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.sprSuperLauncher; // Wep Sprite

#define weapon_text
	return "WORTH THE DANGER"; // Loading Tip