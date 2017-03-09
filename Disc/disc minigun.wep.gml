#define init
global.sprDiscMinigun = sprite_add_weapon("../Sprites/Disc/DiscMinigun.png", 3, 5);
global.sprMiniDisc = sprite_add("../Sprites/Projectiles/Disc/DiscMini.png", 2, 4, 4);
global.mskMiniDisc = sprite_add("../Sprites/Projectiles/Disc/mskDiscMini.png", 1, 4, 4);

#define weapon_name
return "DISC MINIGUN"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_load
return 2; // 0.07 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_area
return 11; // L0 5-2+

#define weapon_swap
return sndSwapMotorized; // Swap sound

#define weapon_fire
sound_play(sndDiscgun); // Sound
weapon_post(4, -8, 5);

with instance_create(x + lengthdir_x(10,gunangle), y + lengthdir_y(10,gunangle), Disc){ // Mini Discs
	motion_add(other.gunangle + (random_range(-18, 18) * other.accuracy), 5);
	image_angle = direction;
	sprite_index = global.sprMiniDisc;
	mask_index = global.mskMiniDisc;
	damage = 4;
	dist = -50; // Mini Discs Last Twice As Long As Normal Ones
	team = other.team;
	creator = other;
}

#define weapon_sprt
return global.sprDiscMinigun; // Wep Sprite

#define weapon_text
return "GET SHREDDED"; // Loading Tip