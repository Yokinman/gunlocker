#define init
	global.sprDoubleSeekerShotgun = sprite_add_weapon("../Sprites/Seeker/DoubleSeekerShotgun.png", 4, 5);

#define weapon_name
	return "DOUBLE SEEKER SHOTGUN"; // Name

#define weapon_type
	return 3; // Bolt Wep

#define weapon_cost
	return 6; // 6 Ammo

#define weapon_load
	return 56; // 1.87 Seconds

#define weapon_area
	return 16; // L0 7-3+
	
#define weapon_swap
	return sndSwapBow; // Swap Sound

#define weapon_fire
	 // Sound:
	sound_play(sndSeekerShotgun);
	sound_play(sndHeavyCrossbow);

	 // Kick, Shift, Shake:
	weapon_post(12, -10, 40);

	 // Knockback:
	motion_add(gunangle + 180, 2);

	 // Seekers:
	for(var i = -50; i <= 50; i += 20) repeat(2) with instance_create(x,y,Seeker){
		motion_add(other.gunangle + ((i + random_range(-25, 25)) * other.accuracy), 5);
		image_angle = direction;
		hitid = [sprite_index, "SEEKER"];
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.sprDoubleSeekerShotgun; // Wep Sprite

#define weapon_text
	return "THE SWARM"; // Loading Tip