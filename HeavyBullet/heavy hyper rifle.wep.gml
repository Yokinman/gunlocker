#define init
global.sprHeavyHyperRifle = sprite_add_weapon("../Sprites/HeavyBullet/HeavyHyperRifle.png", 5, 7);

#define weapon_name
return "HEAVY HYPER RIFLE"; // Name

#define weapon_type
return 1; // Bullet Wep

#define weapon_area
return 11; // L0 5-2+

#define weapon_cost
return 10; // 10 Ammo

#define weapon_load
return 3; // 0.10 Seconds

#define weapon_swap
return sndSwapMachinegun; // Swap sound

#define weapon_fire
repeat(5) if instance_exists(self){
	sound_play(sndTripleMachinegun); // Sound
	with instance_create(x,y,Shell) { // Empty Heavy Bullet Casings
		motion_add(other.gunangle + 180 + random_range(-25,25), 2+random(2))
		sprite_index = sprHeavyShell;
	}
	with(instance_create(x,y,HeavyBullet)) { // Heavy Bullets
		motion_add(other.gunangle + (random_range(-2,2) * other.accuracy), 16);
		image_angle = direction;
		team = other.team;
		creator = other;
	}
	motion_add(gunangle - 180, 0.5); // Push Player Backwards A Bit
	weapon_post(6, -8, 5);
	wait 1;
}

#define weapon_sprt
return global.sprHeavyHyperRifle; // Weapon Sprite

#define weapon_text
return "ON THE MOVE"; // Loading Tip