#define init
 // In need of a hyper nuke sprite

#define hypernuke_create(_x, _y)
	with instance_create(_x, _y, CustomProjectile){
		name = "HyperNuke";
		sprite_index = sprNuke
		mask_index = mskNuke;
		hitid = [sprite_index, "HYPER NUKE"];
		damage = 70;
		force = 24;
		tries = 3200;
		typ = 1;
		on_hit = ["mod", "gunlocker_tools", "blank"];
		on_destroy = hn_destroy;
		saveVars = ["tries"];

		if(fork()){
			wait 1;
			while(instance_exists(self) && tries > 0){
				tries -= 1;
				x += lengthdir_x(4, direction);
				y += lengthdir_y(4, direction);

				 // Smoke Trail:
				if(random(2) < 1) instance_create(x, y, Smoke);

				 // Enemy Collisions:
				if(place_meeting(x,y,hitme)) with(hitme){
					if(place_meeting(x,y,other) && team != other.team){
						projectile_hit(self, other.damage, other.force, other.direction);
						if("lasthit" in self) lasthit = other.hitid;
						other.tries = 0;
					}
				}

				 // Wall Collisions:
				if(place_meeting(x,y,Wall)) tries = 0;

				 // Melee Collisions:
				mod_script_call("mod", "gunlocker_tools", "hyper_collide_melee");
			}

			if(instance_exists(self)) instance_destroy();
			exit;
		}

		return id;
	}

#define hn_destroy
	sound_play(sndNukeExplosion); // Sound

	 // Explosions:
	var _ang = random(360);
	for(var i = _ang; i < _ang + 360; i += 360 / 8){
		instance_create(x + lengthdir_x(12, i), y + lengthdir_y(12, i), Explosion);
	}
	var _ang = random(360);
	for(var i = _ang; i < _ang + 360; i += 360 / 7){
		instance_create(x + lengthdir_x(12, i), y + lengthdir_y(12, i), SmallExplosion);
	}

#define weapon_sprt
return global.sprHyperNukeLauncher; // Wep Sprite

#define weapon_text
return "THIS HITS HARDER THAN A VAN"; // Loading Tip