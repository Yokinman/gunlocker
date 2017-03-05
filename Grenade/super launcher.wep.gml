#define init
global.spr_SupLaunch = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABYAAAANCAYAAACtpZ5jAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAB3RJTUUH4QMBFgEKD7V4rwAAAOFJREFUOMtjYKA++M/AwMDAgk+SAGAkR/K/T1gsw7PHDxmkZOXhNAxsWbWYoK24XMygoKKOlWZgYGAwsrRjkJKVRxFDBlPaajAM/k9KYD64c5MoF/+P11djYGBgYLjMJUHQ0GePH2IVP3f8EIrBcENhkrCwxWcILNyRgwRqMCPcxQ9evWVQEBNmWHjxFtwwiCI7OI2s2cjSDsNimGthLv5vLynMwMDAADOUkdiwRk4pEIMRKY2FzDSM4gtklyKnY7iLDz5/S6yLGZHjBcmnBNMxI1HJ7dVb/DaTaiCOYEPRCwDOPFqBMfMz4AAAAABJRU5ErkJggg==",2,5);

#define weapon_name
return "SUPER LAUNCHER"; // Name 

#define weapon_type
return 4; // Explosive Wep

#define weapon_cost
return 5; // 5 Ammo

#define weapon_area
return 11; // L0 5-2+

#define weapon_load
return 24; // 0.80 Seconds

#define weapon_swap
return sndSwapExplosive; //Switch sound

#define weapon_fire
wkick = 8;

 // Sound:
sound_play(sndHeavyNader);
sound_play(sndGrenade);

 // Fixed Grenade Spread:
ang = gunangle - (20 * accuracy);
repeat(5){
	with instance_create(x,y,Grenade){
		team = other.team;
		creator = other;
		motion_set(creator.ang, 10);
		image_angle = direction;
	}
	ang += 10 * accuracy;
}

#define weapon_sprt
return global.spr_SupLaunch; // Wep Sprite

#define weapon_text
return "AIMING NOT REQUIRED"; // Loading Tip