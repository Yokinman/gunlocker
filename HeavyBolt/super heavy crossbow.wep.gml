#define init
	global.sprSuperHeavyCrossbow = sprite_add_weapon("../Sprites/HeavyBolt/HeavySuperCrossbow.png", 6, 6)

#define weapon_name
	return "SUPER HEAVY CROSSBOW"; // Name

#define weapon_type
	return 3; // Bolt Wep

#define weapon_cost
	return 10; // 10 Ammo

#define weapon_area
	return 16; // L0 7-3+

#define weapon_load
	return 74; // 2.46 Seconds

#define weapon_swap
	return sndSwapBow; // Swap Sound

#define weapon_fire
	 // Sound:
	sound_play(sndHeavyCrossbow);
	sound_play(sndSuperCrossbow);

	 // Kick, Shift, Shake:
	weapon_post(10, -70, 20);

	 // Knockback:
	motion_add(gunangle + 180, 4);

	 // Heavy Bolts:
	for(var i = -12; i <= 12; i += 6) with instance_create(x,y,HeavyBolt){
		motion_add(other.gunangle + (i * other.accuracy), 16);
		image_angle = direction;
		hitid = [sprite_index, "HEAVY BOLT"];
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.sprSuperHeavyCrossbow; // Wep Sprite

#define weapon_text
	return "KNEES WEAK"; // Loading Tip