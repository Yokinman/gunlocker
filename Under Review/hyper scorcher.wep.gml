#define init
global.sprHyperScorcher = sprite_add_weapon("../Sprites/FlameShell/HyperScorcher.png", 5, 7);

#define weapon_name
return "HYPER SCORCHER"; // Name

#define weapon_type
return 1; // Bullet Wep

#define weapon_area
return 8; // L0 4-1+

#define weapon_cost
return 5; // 5 Ammo

#define weapon_load
return 3; // 0.10 Seconds

#define weapon_swap
return sndSwapMachinegun; // Swap sound

#define weapon_fire
repeat(5) if instance_exists(self){
	sound_play(sndIncinerator); // Sound
	sound_play(sndPopgun); // Sound x2 combo
	with instance_create(x,y,Shell) { // Empty Bullet Casings
		motion_add(other.gunangle + 180 + random_range(-25,25), 2+random(2))
	}
	with instance_create(x,y,FlameShell){ // Flame Shells
		motion_add(other.gunangle + (random_range(-4, 4) * other.accuracy),15 + random(1));
		team = other.team;
		creator = other;
	}
	motion_add(gunangle - 180, 0.5); // Push Player Backwards A Bit
	weapon_post(6, -8, 5);
	wait 1;
}

#define weapon_sprt
return global.sprHyperScorcher; // Weapon Sprite