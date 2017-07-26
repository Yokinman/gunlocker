#define init
	global.spr_NitroSlug = sprite_add_weapon("../Sprites/Slug/NitroSlugger.png", 3, 9);

#define weapon_name
	return "NITRO SLUGGER"; // Name 

#define weapon_type
	return 2; // Shell Wep

#define weapon_cost
	return 2; // 2 Ammo

#define weapon_area
	return 16; // L0 7-3+

#define weapon_load
	return 4; // 0.13 Seconds

#define weapon_swap
	return sndSwapMotorized; // Swap Sound

#define weapon_auto
	return 1; // Automatic

#define weapon_fire
	var _offset = -3 * right;
	repeat(2) if instance_exists(self){
		 // Sound:
		sound_play(sndSlugger);
		sound_play(sndNadeReload);
		sound_play(sndClusterLauncher);

		 // Kick, Shift, Shake:
		weapon_post(5, -10, 8);

		 // Knockback:
		motion_add(gunangle + 180, 1.2);

		 // Slugs:
		with instance_create(x + lengthdir_x(_offset, gunangle + 90), y + lengthdir_y(_offset, gunangle + 90), Slug){
			motion_add(other.gunangle + _offset + (random_range(-8, 8) * other.accuracy), 18.5);
			image_angle = direction;
			hitid = [sprite_index, "SLUG"];
			team = other.team;
			creator = other;
		}

		_offset *= -1;

		wait(weapon_get_load(argument0)/2);
	}

#define weapon_sprt
	return global.spr_NitroSlug; // Weapon Sprite

#define weapon_text
	return "CAN'T STOP"; // Loading Screen Tip