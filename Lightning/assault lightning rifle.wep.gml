#define init
	global.sprAssaultLightningRifle = sprite_add_weapon("../Sprites/Lightning/AssaultLightningRifle.png", 4, 4);

#define weapon_name
	return "ASSAULT LIGHTNING RIFLE"; // Name

#define weapon_type
	return 5; // Energy Wep

#define weapon_cost
	return 3; // 3 Ammo

#define weapon_load
	return 48; // 1.60 Seconds

#define weapon_area
	return 9; // L0 4-1+
	
#define weapon_swap
	return sndSwapEnergy; // Swap Sound

#define weapon_fire
	repeat(3) if(instance_exists(self)){
		 // Sound:
	if(skill_get(17)) sound_play_pitch(sndLightningRifleUpg, random_range(0.85, 1.15));
	else sound_play_pitch(sndLightningRifle, random_range(0.85, 1.15));

		 // Kick, Shift, Shake
		weapon_post(10, -15, 5);

		 // Lightning:
		with instance_create(x,y,Lightning){
			move_contact_solid(other.gunangle, 10);
			alarm0 = 1;
			ammo = 20;
			image_angle = other.gunangle + (random_range(-5, 5) * other.accuracy);
			team = other.team;
			creator = other
			with instance_create(x,y,LightningSpawn) image_angle = other.image_angle;
		}
		wait 5;
	}

#define weapon_sprt
	return global.sprAssaultLightningRifle; // Wep Sprite

#define weapon_text
	return "OVERKILL@q@b?"; // Loading Tip