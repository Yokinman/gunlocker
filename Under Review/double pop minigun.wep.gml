#define init 
global.sprDoublePopMinigun = sprite_add_weapon("../Sprites/Shell/DoublePopMinigun.png",5,4);

#define weapon_name
return "DOUBLE POP MINIGUN"; // Name

#define weapon_type
return 1; // Bullet Wep

#define weapon_cost
return 2; // 2 Ammo

#define weapon_area
return 14; // L0 7-2+

#define weapon_load
return 1; // 0.03 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapMachinegun; // Swap Sound

#define weapon_fire
sound_play(sndPopgun) // Sound
weapon_post(2,-6,3);

repeat(2) {
	with instance_create(x,y,Shell){ // Empty Bullet Casing
		motion_add(other.gunangle + other.right*100 + random_range(-25,25),2+random(2))
	}
	with instance_create(x+lengthdir_x(6,gunangle), y+lengthdir_y(6, gunangle),Bullet2){ // Shell
		motion_add(other.gunangle + (random_range(-18, 18) * other.accuracy),15+random(1));
		team = other.team;
		creator = other;
	}
}

motion_add(gunangle - 180,0.4); // Push Player Backwards A Bit

#define weapon_sprt
return global.sprDoublePopMinigun; // Wep Sprite