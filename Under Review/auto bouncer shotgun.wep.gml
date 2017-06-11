#define init
global.sprAutoBouncerShotgun = sprite_add_weapon("../Sprites/Bouncer/AutoBouncerShotgun.png", 5, 4)

#define weapon_name
return "AUTO BOUNCER SHOTGUN"; // Name

#define weapon_type
return 1; // Bullet Wep

#define weapon_load
return 7; // 0.23 Seconds

#define weapon_cost
return 6; // 6 Ammo

#define weapon_sprt
return global.sprAutoBouncerShotgun; // Wep Sprite

#define weapon_area
return 8; // L0 4-1+

#define weapon_swap
return sndSwapMachinegun; // Swap sound

#define weapon_auto
return 1; // Automatic

#define weapon_fire
sound_play(sndBouncerShotgun); // Sound

fireAngle = -25-10+random(20)

repeat(6) {
	with instance_create(x,y,Shell) {
		motion_add(other.gunangle+other.right*100-30+random(60),2+random(3))
	}
	with instance_create(x+lengthdir_x(10,gunangle), y+lengthdir_y(10,gunangle), BouncerBullet) {
		motion_add(other.gunangle+other.fireAngle*other.accuracy, 6)
		creator = other;
		image_angle = direction;
		team = other.team;
	}
	fireAngle += 10
}

wkick = 7;