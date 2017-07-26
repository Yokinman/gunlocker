#define init
	global.sprMegaLauncher = sprite_add_weapon("../Sprites/Grenade/MegaLauncher.png", 5, 6);

#define weapon_name
	return "MEGA LAUNCHER"; // Name 

#define weapon_type
	return 4; // Explosive Wep

#define weapon_cost
	return 10; // 10 Ammo

#define weapon_area
	return 18; // L1 1-1+

#define weapon_load
	return 47; // 1.57 Seconds

#define weapon_swap
	return sndSwapExplosive; // Swap Sound

#define weapon_fire
	 // Sound:
	sound_play(sndHeavyNader);
	sound_play(sndClusterLauncher);

	 // Kick, Shift, Shake:
	weapon_post(14, -50, 16);

	 // Knockback:
	motion_add(gunangle + 180, 6);

	 // 10 Grenades, Wide Spread:
	for(var i = -45; i <= 45; i += 10) with instance_create(x,y,Grenade){
		motion_set(other.gunangle + ((i + random_range(-3, 3)) * other.accuracy), 10);
		image_angle = direction;
		hitid = [sprite_index, "GRENADE"];
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.sprMegaLauncher; // Wep Sprite

#define weapon_text
	return "NOT ENOUGH BARRELS"; // Loading Tip