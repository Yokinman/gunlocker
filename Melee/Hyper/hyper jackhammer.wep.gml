#define init
	global.sprHyperJackhammer = sprite_add_weapon("../../Sprites/Melee/Hyper/HyperJackhammer.png", 4, 5);

#define weapon_name
	return "HYPER JACKHAMMER"; // Name

#define weapon_type
	return 5; // Explosive Wep

#define weapon_area
	return 12; // L0 5-3+

#define weapon_load
	return 10; // 0.33 Seconds

#define weapon_auto
	return 1; // Automatic

#define weapon_swap
	return sndSwapMotorized; // Swap Sound

#define weapon_fire
	repeat(10) if(instance_exists(self)){
		sound_play(sndHyperRifle); // Sound

		 // Hyper Shank:
		with mod_script_call("mod", "melee_tools", "hypershank_create", x, y){
			motion_add(other.gunangle + (random_range(-15, 15) * other.accuracy), 5 + (skill_get(13) * 3));
			image_angle = direction;
			team = other.team;
			creator = other;
		}

		wait 1;
	}

#define weapon_sprt
	return global.sprHyperJackhammer; // Wep Sprite

#define weapon_text
	return "CONSTRUCTION OF THE FUTURE"; // Loading Tip