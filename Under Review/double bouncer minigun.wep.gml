#define init
global.sprDoubleBouncerMinigun = sprite_add_weapon("../Sprites/Bouncer/DoubleBouncerMinigun.png", 3, 4);

#define weapon_name
return "DOUBLE BOUNCER MINIGUN"; // Name

#define weapon_type
return 1; // Bullet Wep

#define weapon_cost
return 2; // 2 Ammo

#define weapon_area
return 14; // L0 7-2+

#define weapon_load
return 2; // 0.07 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapMachinegun; // Swap sound

#define weapon_fire
weapon_post(8,-10,4)
sound_play(sndBouncerSmg); // Sound

repeat(2) {
	with instance_create(x,y,Shell){ // Empty Bullet Casing
		motion_add(other.gunangle + other.right*100 + random_range(-30,30),2+random(3))
	}
	with instance_create(x + lengthdir_x(10,gunangle), y + lengthdir_y(10,gunangle), BouncerBullet){ // Bouncer Bullet
		motion_add(other.gunangle + (random_range(-33, 33) * other.accuracy), 6);
		image_angle = direction;
		team = other.team;
		creator = other;
	}
}

#define weapon_sprt
return global.sprDoubleBouncerMinigun; // Wep Sprite

#define weapon_text
return "FILL THE UNIVERSE"; // Loading Tip