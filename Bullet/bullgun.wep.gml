#define init
global.sprBullgun = sprite_add_weapon("../Sprites/Bullet/Bullgun.png", 4, 1);

#define weapon_name
return "BULLGUN"; // Name

#define weapon_type
return 1; // Bullet Wep

#define weapon_cost
return 8; // 8 Ammo

#define weapon_load
return 18; // 0.60 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_area
return 4; // L0 1-3+

#define weapon_swap
return sndSwapMachinegun; // Swap sound

#define weapon_fire
 // Sound:
sound_play(sndShotgun);
sound_play(sndMachinegun);

weapon_post(7, -20, 15);

repeat(8){
	with instance_create(x,y,Shell){ // Empty Bullet Casings
		motion_add(other.gunangle + other.right*100 + random_range(-25,25),2+random(2))
	}
	with (instance_create(x, y, Bullet1)){ // Bullets
		motion_add(other.gunangle + (random_range(-22, 22) * other.accuracy), 14 + random(2));
		image_angle = direction;
		team = other.team;
		creator = other;
	}
}

#define weapon_sprt
return global.sprBullgun; // Wep Sprite

#define weapon_text
return "DINKY"; // Loading Tip