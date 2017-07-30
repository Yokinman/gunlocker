#define init
global.sprHyperSplinterGun = sprite_add_weapon("../Sprites/Splinter/HyperSplinterGun.png", 5, 4);

#define weapon_name
return "HYPER SPLINTER GUN"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_area
return 11; // L0 5-3+

#define weapon_cost
return 3; // 3 Ammo

#define weapon_load
return 15; // 0.50 Seconds

#define weapon_swap
return sndSwapBow; // Swap sound

#define weapon_fire
repeat(15) if instance_exists(self){
	sound_play(sndSplinterGun); // Sound
	with(instance_create(x,y,Splinter)) { // Bouncer Bullets
		motion_add(other.gunangle + (random_range(-3, 3) * other.accuracy), 16);
		image_angle = direction
		team = other.team;
		creator = other;
	}
	motion_add(gunangle - 180, 0.5); // Push Player Backwards A Bit
	weapon_post(10, -12, 10);
	wait 1;
}

#define weapon_sprt
return global.sprHyperSplinterGun; // Weapon Sprite