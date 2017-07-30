#define init
	global.sprLightningMachinegun = sprite_add_weapon("../Sprites/Lightning/LightningMachinegun.png", 0, 4);

#define weapon_name
	return "LIGHTNING MACHINEGUN"; // Name

#define weapon_type
	return 5; // Energy Wep

#define weapon_cost
	return 1; // 1 Ammo

#define weapon_load
	return 11; // 0.33 Seconds

#define weapon_auto
	return 1; // Automatic

#define weapon_area
	return 9; // L0 4-1+
	
#define weapon_swap
	return sndSwapEnergy; // Swap sound

#define weapon_fire
	 // Sound:
	if(skill_get(17)) sound_play_pitch(sndLightningPistolUpg, random_range(0.85, 1.15));
	else sound_play_pitch(sndLightningPistol, random_range(0.85, 1.15));

	 // Kick, Shift, Shake:
	weapon_post(5, -5, 5);

	 // Lightning:
	with instance_create(x,y,Lightning){
		move_contact_solid(other.gunangle, 10);
		alarm0 = 1;
		ammo = 16;
		image_angle = other.gunangle + (random_range(-20, 20) * other.accuracy);
		team = other.team;
		creator = other
		with instance_create(x,y,LightningSpawn) image_angle = other.image_angle;
	}

#define weapon_sprt
	return global.sprLightningMachinegun; // Wep Sprite