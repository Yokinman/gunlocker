#define init
	global.sprBoiler = sprite_add_weapon("../Sprites/Flame/Boiler.png", 2, 5);

#define weapon_name
	return "BOILER"; // Name

#define weapon_type
	return 4; // Explosive Wep

#define weapon_cost
	return 1; // 1 Ammo

#define weapon_load
	return 12; // 0.40 Seconds

#define weapon_area
	return 6; // L0 3-1+

#define weapon_auto
	return 1; // Automatic
	
#define weapon_swap
	return sndSwapFlame; // Swap Sound

#define weapon_fire
	var _load = weapon_get_load(argument0);

	 // Sound:
	if(button_pressed(index, "fire") || race = "steroids" && button_pressed(index, "spec")) instance_create(x,y,FlameSound);
	with(FlameSound) timeout = -_load;

	 // Kick, Shift, Shake:
	if(fork()){
		repeat(_load) if(instance_exists(self)){
			weapon_post(2, -2, 0);
			wait 1;
		}
		exit;
	}

	 // Flame:
	repeat(_load / 2) repeat(2) if(instance_exists(self)){
		for(var i = -1; i <= 1; i += 2) with instance_create(x,y,Flame){
			move_contact_solid(other.gunangle, 5);
			motion_add(other.gunangle, 11 + random(1));
			hitid = [sprite_index, "Flame"];
			team = other.team;
			creator = other;

			 // Movement Bending:
			if(fork()){
				var _dir = other.gunangle;
				while(instance_exists(self) && instance_exists(other) && abs(angle_difference(direction, _dir)) < 90){
					if(image_index > 0) direction += (5 * i) * other.accuracy;
					wait 1;
				}
				exit;
			}
		}
		wait 1;
	}

#define weapon_sprt
	return global.sprBoiler; // Wep Sprite

#define weapon_text
	return "CONTROLLED BURN"; // Loading Tip