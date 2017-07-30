#define init
global.sprHyperLaserRifle = sprite_add_weapon("../Sprites/Laser/HyperLaserRifle.png", 6, 4);

#define weapon_name
return "HYPER LASER RIFLE"; // Name

#define weapon_type
return 5; // Energy Wep

#define weapon_cost
return 5; // 5 Ammo

#define weapon_load
return 5; // 0.17 Seconds

#define weapon_area
return 10; // L0 5-2+

#define weapon_swap
return sndSwapEnergy; // Swap sound

#define weapon_fire
repeat(5) {
	weapon_post(10, -5, 5);
	if skill_get(17) sound_play(sndLaserUpg); // Laser Brain
	else sound_play(sndLaser); 

	with instance_create(x,y,Laser){
		alarm0 = 1;
		team = other.team;
		creator = other;
		image_yscale = 1.7 + (skill_get(17)*0.6);
		image_angle = other.gunangle;
	}
	wait 2;
}

#define weapon_sprt
return global.sprHyperLaserRifle; // Wep Sprite