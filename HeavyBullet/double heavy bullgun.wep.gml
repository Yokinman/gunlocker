#define init
global.sprDoubleHeavyBullgun = sprite_add_weapon("../Sprites/HeavyBullet/DoubleHeavyBullgun.png", 4, 3);

#define weapon_name
return "DOUBLE HEAVY BULLGUN"; // Name

#define weapon_type
return 1; // Bullet Wep

#define weapon_cost
return 32; // 32 Ammo

#define weapon_load
return 24; // 0.80 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_area
return 14; // L0 7-1+

#define weapon_swap
return sndSwapShotgun; // Swap sound

#define weapon_fire
 // Sound:
sound_play(sndHeavySlugger);
sound_play(sndHeavyMachinegun);

weapon_post(10, -15, 30);

repeat(16){
	with instance_create(x,y,Shell){ // Empty Heavy Bullet Casings
		motion_add(other.gunangle + other.right*100 + random_range(-40,40),2+random(3))
		sprite_index = sprHeavyShell;
	}
	with instance_create(x, y, HeavyBullet){ // Heavy Bullets
		motion_add(other.gunangle + (random_range(-34, 34) * other.accuracy), 14 + random(2));
		image_angle = direction;
		team = other.team;
		creator = other;
	}
}

#define weapon_sprt
return global.sprDoubleHeavyBullgun; // Wep Sprite

#define weapon_text
return "FEEL THE FURY"; // Loading Tip