#define init
	global.sprHeavyGatlingLauncher = sprite_add_weapon("../Sprites/HeavyGrenade/HeavyGatlingLauncher.png", 5, 2)

#define weapon_name
	return "HEAVY GATLING LAUNCHER"; // Name

#define weapon_type
	return 4; // Explosive Wep

#define weapon_load
	return 9; // 0.30 Seconds

#define weapon_cost
	return 2; // 2 Ammo

#define weapon_area
	return 13; // L0 7-1+

#define weapon_swap
	return sndSwapExplosive; // Swap sound

#define weapon_auto
	return 1; // Automatic

#define weapon_fire
	 // Sound:
	sound_play(sndHeavyNader);
	sound_play(sndGrenade);

	 // Kick, Shift, Shake:
	weapon_post(6, -10, 8);

	 // Grenades:
	with instance_create(x,y,HeavyNade){
		motion_set(other.gunangle + (random_range(-8, 8) * other.accuracy), 10);
		image_angle = direction;
		hitid = [sprite_index, "HEAVY GRENADE"];
		team = other.team;
		creator = other;
	}
	
#define weapon_sprt
	return global.sprHeavyGatlingLauncher; // Wep Sprite