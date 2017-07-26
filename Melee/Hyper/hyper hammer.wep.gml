#define init
	global.sprHyperHammer = sprite_add_weapon("../../Sprites/Melee/Hyper/HyperHammer.png", 8, 9);

#define weapon_name
	return "HYPER HAMMER"; // Name

#define weapon_area
	return 19; // L1 1-2+

#define weapon_type
	return 4; // Explosive Wep

#define weapon_cost
	return 3; // 3 Ammo (?Temporary? Nerf)

#define weapon_load
	return 15; // 0.50 Seconds

#define weapon_melee
	return 1; // Melee Wep

#define weapon_swap
	return sndSwapHammer; // Swap Sound

#define weapon_fire
	 // Sound:
	sound_play(sndHammer);
	sound_play(sndHyperRifle);
	sound_play(sndHyperSlugger);

	 // Flip Wep:
	wepangle = -wepangle;

	 // Heavy Hyper Slash:
	with mod_script_call("mod", "melee_tools", "hyperhammerslash_create", x, y){
		motion_add(other.gunangle, 2 + (skill_get(13) * 3));
		image_angle = direction;
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.sprHyperHammer; // Wep Sprite

#define weapon_text
	return "BLUNT FORCE TRAUMA";