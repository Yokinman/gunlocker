#define init
	global.sprGatlingLauncher = sprite_add_weapon("../Sprites/Grenade/GatlingLauncher.png", 5, 2)

#define weapon_name
	return "GATLING LAUNCHER"; // Name

#define weapon_type
	return 4; // Explosive Wep

#define weapon_load
	return 9; // 0.30 Seconds

#define weapon_cost
	return 1; // 1 Ammo

#define weapon_area
	return 6; // L0 3-2+

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
	with instance_create(x,y,Grenade){
		motion_set(other.gunangle + (random_range(-8, 8) * other.accuracy), 10);
		image_angle = direction;
		hitid = [sprite_index, "GRENADE"];
		team = other.team;
		creator = other;
	}
	
#define weapon_sprt
	return global.sprGatlingLauncher; // Wep Sprite