#define init
global.sprSuperLaserCannon = sprite_add_weapon("../Sprites/Laser/SuperLaserCannon.png",6,6);

#define weapon_name
return "SUPER LASER CANNON"; // Name 

#define weapon_type
return 5; // Energy Wep

#define weapon_cost
return 24; // 24 Ammo

#define weapon_area
return 16; // L0 7-3+

#define weapon_load
return 230; // 7.66 Seconds

#define weapon_swap
return sndSwapEnergy; // Swap Sound

#define weapon_fire
with instance_create(x, y, LaserCannon){
	team = other.team;
	creator = other;
	damage = 15;
	slcannon = 1;
	script_bind_step(slc_step,depth);
	sound_play_pitchvol(sndLaserCannonCharge,0.7,2);
	while instance_exists(self){
		
		 // Slower Charge Up:
		if(image_xscale < 0.6){
			image_xscale -= 0.005;
			image_yscale = image_xscale;
		}
		
		 // Finished Charging:
		else instance_destroy();
		wait 1;
	}
}

if instance_exists(self){
	 // Sound:
	if(skill_get(17)){ // Laser Brain Sound
		sound_play(sndPlasmaBigUpg);
		sound_play(sndUltraLaserUpg);
	}
	else{ // Normal Sound
		sound_play(sndUltraLaser);
		sound_play(sndPlasmaBig);
	}

	var lasercount = 12 + (skill_get(17)*3);
	if("slcshots" not in self) slcshots = 0;
	slcminus = 0;
	slcshots += 1;
	repeat(lasercount) if instance_exists(self){
		 // More Sound:
		if skill_get(17){ // Laser Brain Sound
			sound_play(sndLaserCannonUpg);
			sound_play(sndLaserUpg);
			sound_play(sndPlasmaMinigunUpg);
		}
		else{ // Normal Sound
			sound_play(sndLaserCannon);
			sound_play(sndLaser);
			sound_play(sndPlasmaMinigun);
		}
		
		 // Shoot Lasers:
		sublasercount = floor((6 + (skill_get(17)*1.5)) - (lasercount/2)) + 1;
		slcoffset = slcshots * sublasercount;
		repeat(2){
			repeat(sublasercount){
				with instance_create(x + lengthdir_x(23,gunangle),y + lengthdir_y(23,gunangle),Laser){
					alarm0 = 1;
					image_yscale = 2 + (skill_get(17) * 0.6);
					damage = 1;
					creator = other;
					team = creator.team;
					image_angle = creator.gunangle + (((other.slcoffset - 1) - creator.slcminus) * creator.accuracy);
				}
				slcminus += 2;
			}
			slcminus *= -1;
			slcoffset *= -1;
		}
		weapon_post(8, -10 + slcshots, 14 - (slcshots*2));
		slcminus = 0;
		lasercount -= 1;
		wait 1;
	}
	slcshots = 0;
	
	 // Even More Sound:
	if(skill_get(17)) sound_play(sndUltraLaserUpg); // Laser Brain Sound
	else sound_play(sndUltraLaser); // Normal Sound
}

#define slc_step
with(LaserCannon) if("slcannon" in self && instance_exists(creator)){
	 // Stay With Player:
	x = creator.x + lengthdir_x(23,creator.gunangle);
	y = creator.y + lengthdir_y(23,creator.gunangle);
	motion_set(creator.direction,creator.speed);
	image_angle = creator.gunangle;
}

#define weapon_sprt
return global.sprSuperLaserCannon; // Wep Sprite

#define weapon_text
return "FIRE WHEN READY"; // Loading Tip