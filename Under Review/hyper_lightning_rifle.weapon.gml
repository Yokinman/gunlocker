#define init
global.sprHyperLightningRifle = sprite_add_weapon("../Sprites/Lightning/HyperLightningRifle.png", 5, 6);

#define weapon_name
return "HYPER LIGHTNING RIFLE"; // Name

#define weapon_type
return 5; // Energy Wep

#define weapon_cost
return 4; // 4 Ammo

#define weapon_load
return 5; // 0.1666... Seconds

#define weapon_area
return 14; // L0 7-1+

#define weapon_swap
return sndSwapPistol; // Swap sound

#define weapon_fire

repeat(5) {
	sound_play(sndLightningRifle);
	weapon_post(8,-10,10)
	with instance_create(x, y, Lightning){
		alarm0 = 1;
		direction = other.gunangle;
		image_angle = direction;
		team = other.team;
		creator = other;
		ammo = 24;
	}
	wait(2);
}

// /loadwep mods\gunlocker\under review\hyper_lightning_rifle

#define weapon_sprt
return global.sprHyperLightningRifle; // Wep Sprite