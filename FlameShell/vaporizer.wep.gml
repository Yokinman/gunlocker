#define init
global.sprVaporizer = sprite_add_weapon("../Sprites/FlameShell/Vaporizer.png", 5, 6);

#define weapon_name
return "VAPORIZER"; // Name

#define weapon_type
return 1; // Bullet Wep

#define weapon_cost
return 4; // 4 Ammo

#define weapon_load
return 2; // 0.07 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_area
return 19; // L1 1-2+

#define weapon_swap
return sndSwapFlame; // Swap sound

#define weapon_fire
weapon_post(10, -10, 10);

var ang = -22.5 * accuracy;
repeat(4){
	sound_play(sndIncinerator); // Sound

	with instance_create(x,y,Shell){ // Empty Bullet Casings
		motion_add(other.gunangle + other.right*100 + random_range(-25,25),4+random(3));
	}
	with (instance_create(x, y, FlameShell)){ // Flame Shells
		motion_add(other.gunangle + ang + (random_range(-4, 4) * other.accuracy), 16);
		image_angle = direction;
		team = other.team;
		creator = other;
	}
	ang += 15 * accuracy;
}

motion_add(gunangle - 180, 0.4); // Push Player Backwards A Bit



#define weapon_sprt
return global.sprVaporizer; // Wep Sprite

#define weapon_text
return "GONE IN AN INSTANT"; // Loading Tip