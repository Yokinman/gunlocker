#define init 
global.sprHeavyAssaultSlugger = sprite_add_weapon("../Sprites/HeavySlug/HeavyAssaultSlugger.png", 5, 4);

#define weapon_name
return "HEAVY ASSAULT SLUGGER"; // Name

#define weapon_type
return 2; // Shell Wep

#define weapon_cost
return 6; // 6 Ammo

#define weapon_area
return 11; // L0 5-3+

#define weapon_load
return 20; // 0.67 Seconds

#define weapon_swap
return sndSwapShotgun; // Swap Sound

#define weapon_fire
repeat(3) if instance_exists(self) {
	sound_play(sndHeavySlugger); // Sound

	weapon_post(8, -20, 15);

	with instance_create(x+lengthdir_x(6,gunangle), y+lengthdir_y(6, gunangle), HeavySlug){ // Heavy Slug
		motion_add(other.gunangle + (6 * random_range(-1, 1) * other.accuracy), 13);
		image_angle = direction;
		team = other.team;
		creator = other;
	}
	wait(4);
}

#define weapon_sprt
return global.sprHeavyAssaultSlugger; // Wep Sprite