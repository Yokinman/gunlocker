#define init
	global.sprDoubleLightningMinigun = sprite_add_weapon("../Sprites/Lightning/DoubleLightningMinigun.png", 4, 6);

#define weapon_name
	return "DOUBLE LIGHTNING MINIGUN"; // Name

#define weapon_type
	return 5; // Energy Wep

#define weapon_cost
	return 2; // 2 Ammo

#define weapon_load
	return 3; // 0.10 Seconds

#define weapon_area
	return 16; // L0 7-3+

#define weapon_auto
	return 1; // Automatic
	
#define weapon_swap
	return sndSwapEnergy; // Swap Sound

#define weapon_fire
	 // Sound:
	if(skill_get(17)) sound_play_pitch(sndLightningRifleUpg, random_range(0.85, 1.15));
	else sound_play_pitch(sndLightningRifle, random_range(0.85, 1.15));

	 // Kick, Shift, Shake:
	weapon_post(7, -7, 5);

	 // Lightning:
	for(var i = -10; i <= 10; i += 20) with instance_create(x,y,Lightning){
		move_contact_solid(other.gunangle, 11);
		alarm0 = 1;
		ammo = 18;
		image_angle = other.gunangle + i + (random_range(-20, 20) * other.accuracy);
		team = other.team;
		creator = other
		with instance_create(x,y,LightningSpawn) image_angle = other.image_angle;
	}

#define weapon_sprt
	return global.sprDoubleLightningMinigun; // Wep Sprite

#define weapon_text
	return "THUNDERSTORM"; // Loading Tip