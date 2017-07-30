#define init
	global.sprPyromania = sprite_add_weapon("../Sprites/Flame/Pyromania.png", 8, 4);

#define weapon_name
	return "PYROMANIA"; // Name

#define weapon_type
	return 4; // Explosive Wep

#define weapon_cost
	return 1; // 1 Ammo

#define weapon_load
	return 8; // 0.27 Seconds

#define weapon_area
	return 8; // L0 3-3+

#define weapon_auto
	return 1; // Automatic
	
#define weapon_swap
	return sndSwapFlame; // Swap Sound

#define weapon_fire
	var _load = weapon_get_load(argument0);

	 // Sound:
	if(button_pressed(index, "fire") || race = "steroids" && button_pressed(index, "spec")) instance_create(x,y,DragonSound);
	with(DragonSound) timeout = -_load;

	 // Kick, Shift, Shake:
	if(fork()){
		repeat(_load) if(instance_exists(self)){
			weapon_post(3, -3, 0);
			wait 1;
		}
		exit;
	}

	 // Flames:
	repeat(_load) if(instance_exists(self)){
		repeat(3) with instance_create(x,y,Flame){
			move_contact_solid(other.gunangle, 6);
			motion_add(other.gunangle + (random_range(-1, 1) * other.accuracy), 13 + random(3));
			hitid = [sprite_index, "Flame"];
			team = other.team;
			creator = other;

			 // Combat Flame's Built-in Inaccuracy:
			if(fork()){
				var _dir = direction;
				while(instance_exists(self) && abs(angle_difference(direction, _dir)) <= 3){
					direction = _dir;
					wait 1;
				}
				exit
			}
		}
		wait 1;
	}

#define weapon_sprt
	return global.sprPyromania; // Wep Sprite

#define weapon_text
	return "@r@qB@qU@qR@qN"; // Loading Tip