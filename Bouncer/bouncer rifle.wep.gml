#define init
global.sprBouncerRifle = sprite_add_weapon("../Sprites/Bouncer/BouncerRifle.png",5,2);

#define weapon_name
return "BOUNCER RIFLE"; // Name 

#define weapon_type
return 1; // Bullet Wep

#define weapon_area
return 5; // L0 2-1+

#define weapon_load
return 4; // 0.13 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapPistol; // Swap Sound

#define weapon_fire
sound_play(sndBouncerSmg); // Sound
weapon_post(5, -10, 6);

with instance_create(x,y,Shell){ // Empty Bullet Casing
	motion_add(other.gunangle + other.right*100 + random_range(-25,25),3+random(2));
}

with instance_create(x,y,BouncerBullet){ // Bouncer Bullet
    motion_add(other.gunangle + (random_range(-8, 8) * other.accuracy), 6);
    team = other.team;
	creator = other;
}

#define weapon_sprt
return global.sprBouncerRifle; // Wep Sprite

#define weapon_text
return "RICOCHET"; // Loading Tip