#define init 
global.sprTriplePopGun = sprite_add_weapon("../Sprites/Shell/TriplePopGun.png",5,4);

#define weapon_name
return "TRIPLE POP GUN"; // Name

#define weapon_type
return 1; // Bullet Wep

#define weapon_cost
return 3; // 3 Ammo

#define weapon_area
return 4; // L0 2-1+

#define weapon_load
return 2; // 0.07 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapMachinegun; // Swap Sound

#define weapon_fire
sound_play(sndPopgun) // Sound
weapon_post(2,-6,3);
fireAngle = -20+random_range(-5, 5)

repeat(3) {
	with instance_create(x,y,Shell){ // Empty Bullet Casing
		motion_add(other.gunangle + other.right*100 + random_range(-25,25),2+random(2))
	}
	with instance_create(x+lengthdir_x(6,gunangle), y+lengthdir_y(6, gunangle),Bullet2){ // Shell
		motion_add(other.gunangle + other.fireAngle * other.accuracy,15);
		team = other.team;
		creator = other;
	}
	fireAngle += 20
}

motion_add(gunangle - 180,0.4); // Push Player Backwards A Bit

#define weapon_sprt
return global.sprTriplePopGun; // Wep Sprite