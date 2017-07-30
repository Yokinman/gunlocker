#define init
	global.sprQuadPlasmaRifle = sprite_add_weapon("../Sprites/Plasma/QuadruplePlasmaRifle.png", 4, 7);

#define weapon_name
	return "QUADRUPLE PLASMA RIFLE"; // Name

#define weapon_type
	return 5; // Energy Wep

#define weapon_cost
	return 8; // 8 Ammo

#define weapon_load
	return 10; // 0.33 Seconds

#define weapon_area
	return 15; // L0 7-2+

#define weapon_auto
	return 1; // Automatic

#define weapon_swap
	return sndSwapEnergy; // Swap Sound

#define weapon_fire
	 // Sound:
	if(skill_get(17)) sound_play_pitch(sndPlasmaRifleUpg, random_range(0.85, 1.15));
	else sound_play_pitch(sndPlasmaRifle, random_range(0.85, 1.15));
	sound_play(sndClusterLauncher);
	sound_play(sndNadeReload);

	 // Kick, Shift, Shake:
	weapon_post(8, -15, 8);

	 // Knockback:
	motion_add(gunangle + 180, 4);

	 // Plasma:
	for(var i = -25.5; i <= 25.5; i += 17) with instance_create(x,y,PlasmaBall){
		motion_add(other.gunangle + ((i + random_range(-5, 5)) * other.accuracy), 7);
		image_angle = direction;
		hitid = [sprite_index, "PLASMA"];
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.sprQuadPlasmaRifle; // Wep Sprite

#define weapon_text
	return "PULSE OF DEATH"; // Loading Tip