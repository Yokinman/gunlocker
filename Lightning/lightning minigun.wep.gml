#define init
	global.sprLightningMinigun = sprite_add_weapon("../Sprites/Lightning/LightningMinigun.png", 2, 6);

#define weapon_name
	return "LIGHTNING MINIGUN"; // Name

#define weapon_type
	return 5; // Energy Wep

#define weapon_cost
	return 1; // 1 Ammo

#define weapon_load
	return 3; // 0.10 Seconds

#define weapon_area
	return 11; // L0 5-2+

#define weapon_auto
	return 1; // Automatic
	
#define weapon_swap
	return sndSwapEnergy; // Swap Sound

#define weapon_fire
	 // Sound:
	if(skill_get(17)) sound_play_pitch(sndLightningPistolUpg, random_range(0.85, 1.15));
	else sound_play_pitch(sndLightningPistol, random_range(0.85, 1.15));

	 // Kick, Shift, Shake:
	weapon_post(7, -7, 5);

	 // Lightning:
	with instance_create(x,y,Lightning){
		move_contact_solid(other.gunangle, 11);
		alarm0 = 1;
		ammo = 18;
		image_angle = other.gunangle + (random_range(-20, 20) * other.accuracy);
		team = other.team;
		creator = other
		with instance_create(x,y,LightningSpawn) image_angle = other.image_angle;
	}

#define weapon_sprt
	return global.sprLightningMinigun; // Wep Sprite

#define weapon_text
	return "TECHNOLOGY"; // Loading Tip