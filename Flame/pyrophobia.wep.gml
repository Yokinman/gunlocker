#define init
	global.sprPyrophobia = sprite_add_weapon("../Sprites/Flame/Pyrophobia.png", 8, 5);

#define weapon_name
	return "PYROPHOBIA"; // Name

#define weapon_type
	return 4; // Explosive Wep

#define weapon_cost
	return 1; // 1 Ammo

#define weapon_load
	return 6; // 0.20 Seconds

#define weapon_area
	return 10; // L0 5-1+

#define weapon_auto
	return 1; // Automatic
	
#define weapon_swap
	return sndSwapDragon; // Swap Sound

#define weapon_fire
	var _load = weapon_get_load(argument0);

	 // Sound:
	if(button_pressed(index, "fire") || race = "steroids" && button_pressed(index, "spec")){
		sound_play(sndRocket);
		instance_create(x,y,DragonSound);

		 // Knockback:
		motion_add(gunangle + 180, 3);
	}
	with(DragonSound) timeout = -_load;

	 // Kick, Shift, Shake:
	if(fork()){
		repeat(_load) if(instance_exists(self)){
			weapon_post(5, -5, 2.05);
			wait 1;
		}
		exit;
	}

	 // Flames:
	repeat(_load) if(instance_exists(self)){
		for(var i = -6; i <= 6; i += 3) repeat(2){
			with instance_create(x + lengthdir_x(i, gunangle + 90), y + lengthdir_y(i, gunangle + 90), Flame){
				move_contact_solid(other.gunangle, (sqr(abs(i)) / 2) + 6);
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
		}

		wait 1;
	}

#define weapon_sprt
	return global.sprPyrophobia; // Wep Sprite

#define weapon_text
	return "MUFFLED SCREAMING"; // Loading Tip