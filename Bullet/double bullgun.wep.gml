#define init
global.sprDoubleBullgun = sprite_add_weapon("../Sprites/Bullet/DoubleBullgun.png", 4, 2);

#define weapon_name
return "DOUBLE BULLGUN"; // Name

#define weapon_type
return 1; // Bullet Wep

#define weapon_cost
return 16; // 16 Ammo

#define weapon_load
return 24; // 0.80 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_area
return 6; // L0 3-1+

#define weapon_swap
return sndSwapShotgun; // Swap sound

#define weapon_fire
 // Sound:
sound_play(sndDoubleShotgun);
sound_play(sndMachinegun);

weapon_post(10, -15, 30);

repeat(16){
	with instance_create(x,y,Shell){ // Empty Bullet Casings
		motion_add(other.gunangle + other.right*100 + random_range(-40,40),2+random(3))
	}
	with instance_create(x, y, Bullet1){ // Bullets
		motion_add(other.gunangle + (random_range(-34, 34) * other.accuracy), 14 + random(2));
		image_angle = direction;
		team = other.team;
		creator = other;
	}
}

#define weapon_sprt
return global.sprDoubleBullgun; // Wep Sprite

#define weapon_text
return "BULLETS"; // Loading Tip