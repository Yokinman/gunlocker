#define init
sprSuperLaserCannon = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABwAAAANCAYAAAC6hw6qAAAABmJLR0QAAAAAAAD5Q7t/AAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAB3RJTUUH4AsGFzcK4ZAjMAAAAVJJREFUOMudVDFqw0AQnA1u0ilYIBABSY1UGHfCeUKKtKnzCD0ihZ+RtE6RgB+RdCG4kBurCAaDTYyblJtCd2J1d5KSLAg0w97MnHR7BFXMDCKCWV282TNUWsNUMleSgyfTRItpTuKusKyfi5sFRwVzVDALI55OZhwGKTtCDVVrzZkC5NgtooJbuxv7HsIglZwZwMLTycz6ZFbiMEjxnd+3uMtq3rx/rN4AAFqsDydxhpflY/MrRrIRAA77I/L8CptqjiTO8J49AAASPDc9p+vXmivvfoVljbSJrE1VKq7ECU8N1xgaXB9O4sw2/Esd9kcgFu9AJzaDDhpKcSn4tbwFAJzXB6gXj33PNtzu1s1hkcJj38OnYaZ7AdB2t2Y5m26cWobUMfT1aVu102tBNeRkDLqFiYithaqBQyGqdkKOW4hc19nQ9WcmhZmkS/i/pQP9AK7Jvn8eT4gOAAAAAElFTkSuQmCC",6,6);

#define weapon_name
return "SUPER LASER CANNON"; // Name 

#define weapon_type
return 5; // Energy Wep

#define weapon_cost
return 20; // 20 Ammo

#define weapon_area
return 16; // L0 7-3+

#define weapon_load
return 100; // 3.33 Seconds

#define weapon_swap
return sndSwapEnergy; // Swap Sound

#define weapon_fire
with instance_create(x+lengthdir_x(23, gunangle), y+lengthdir_y(23, gunangle),LaserCannon){
	team = other.team;
	creator = other;
	damage = 15;
	slcannon = 1;
	script_bind_step(step,depth);
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
	var lasercount = 10 + (skill_get(17)*2);
	slcminus = 0;
	repeat(lasercount){
		
		 // Shoot Lasers:
		sublasercount = floor((5+skill_get(17)) - (lasercount/2)) + 1;
		repeat(2) if instance_exists(self){
			if skill_get(17){ // Laser Brain Sound
				sound_play(sndLaserUpg);
				sound_play(sndLaserCannonUpg);
			}
			else{ // Normal Sound
				sound_play(sndLaser);
				sound_play(sndLaserCannon);
			}
			repeat(sublasercount){
				with instance_create(x + lengthdir_x(23,gunangle),y + lengthdir_y(23,gunangle),Laser){
					alarm0 = 1;
					image_yscale = 2 + (skill_get(17) * 0.6);
					creator = other;
					team = creator.team;
					image_angle = creator.gunangle + (((creator.sublasercount - 1) - creator.slcminus) * creator.accuracy);
				}
				wkick = 10;
				slcminus += 2;
			}
			slcminus = 0;
		}
		lasercount -= 1;
		wait 1;
	}
}

#define step
with(LaserCannon) if("slcannon" in self && instance_exists(creator)){
	 // Stay With Player:
	x = creator.x + lengthdir_x(23,creator.gunangle);
	y = creator.y + lengthdir_y(23,creator.gunangle);
	motion_set(creator.direction,creator.speed);
	image_angle = creator.gunangle;
}

#define weapon_sprt
return sprSuperLaserCannon; // Wep Sprite

#define weapon_text
return "YOU MAY FIRE WHEN READY"; // Loading Tip