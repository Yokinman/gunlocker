#define init
global.sprHeavyMinigun = sprite_add_weapon("../Sprites/HeavyBullet/HeavyMinigun.png", 6, 4);

#define weapon_name
return "HEAVY MINIGUN"; // Name

#define weapon_type
return 1; // Bullet Wep

#define weapon_cost
return 2; // 2 Ammo

#define weapon_load
return 2; // 0.06 Seconds

#define weapon_sprt
return global.sprHeavyMinigun; // Weapon Sprite

#define weapon_auto
return 1; // Automatic

#define weapon_area
return 11; // L0 5-2+

#define weapon_swap
return sndSwapMachinegun; // Swap sound

#define weapon_fire
sound_play_pitchvol(sndMinigun,0.8,2);
view_shake_at(x,y,10); // Screen shake

with instance_create(x,y,Shell) { // Heavy bullet shell
		motion_add(other.gunangle + other.right*100 + random_range(-40,40),2+random(2))
		sprite_index = sprHeavyShell;
}

with (instance_create(x,y,HeavyBullet)) {
	motion_add(point_direction(x,y,mouse_x,mouse_y)+(random(24)-12)*other.accuracy,16);
	image_angle = direction;
	team = other.team;
	creator = other;
}

motion_add(point_direction(x,y,mouse_x,mouse_y)+180,1)	
wkick = 4;
