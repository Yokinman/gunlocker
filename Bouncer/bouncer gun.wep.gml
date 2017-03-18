#define init
global.sprBouncerGun = sprite_add_weapon("../Sprites/Bouncer/BouncerGun.png",-2,3);

#define weapon_name
return "BOUNCER GUN"; // Name 

#define weapon_type
return 1; // Bullet Wep

#define weapon_area
return 4; // L0 1-3+

#define weapon_load
return 5; // 0.17 Seconds

#define weapon_swap
return sndSwapPistol; // Swap Sound

#define weapon_fire
sound_play(sndBouncerSmg); // Sound
weapon_post(4, -6, 3);

with instance_create(x,y,Shell){ // Empty Bullet Casing
	motion_add(other.gunangle + other.right*100 + random_range(-25,25),3+random(2));
}

with instance_create(x,y,BouncerBullet){ // Bouncer Bullet
    motion_add(other.gunangle + (random_range(-4, 4) * other.accuracy), 6);
    team = other.team;
	creator = other;
}

#define weapon_sprt
return global.sprBouncerGun; // Wep Sprite

#define weapon_text
return "DO A TRICK SHOT"; // Loading Tip