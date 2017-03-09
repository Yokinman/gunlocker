#define init
global.sprLaserShotgun = sprite_add_weapon("../Sprites/Laser/LaserShotgun.png",4,3);

#define weapon_name
return "LASER SHOTGUN"; // Name 

#define weapon_type
return 5; // Energy Wep

#define weapon_cost
return 6; // 6 Ammo

#define weapon_area
return 9; // L0 4-1+

#define weapon_load
return 23; // 0.77 Seconds

#define weapon_swap
return sndSwapEnergy; // Swap Sound

 // Create Charge Up Object:
#define weapon_fire
with instance_create(x, y, LaserCannon){
	team = other.team;
	creator = other;
	lasershotguncharge = 1;
	sound_play_pitch(sndLaserCannonCharge,0.75);
	script_bind_step(charge_step, depth);
	while instance_exists(self){
		 // Slower Charge Up:
		if(image_xscale < 0.35){
			image_xscale -= 0.005;
			image_yscale = image_xscale;
		}

		 // Fire:
		else{
			if skill_get(17) sound_play_pitch(sndLaserUpg,0.75); // Laser Brain Sound
			else sound_play_pitch(sndLaser,0.75); // Normal Sound
	
			 // Laser Shotgun Spread:
			repeat(7) with instance_create(creator.x,creator.y,Laser){
				alarm0 = 1;
				team = other.team;
				creator = other.creator;
				image_yscale = 1.7 + (skill_get(17)*0.6);
				image_angle = ((14*random_range(-1,1)) * creator.accuracy) + creator.gunangle;
			}
			
			instance_destroy();
		}
		wait 1;
	}
}
weapon_post(4, -14, 8);

#define charge_step
with(LaserCannon) if("lasershotguncharge" in self && instance_exists(creator)){
	 // Stay With Player:
	x = Player.x + lengthdir_x(13.5,creator.gunangle);
	y = Player.y + lengthdir_y(13.5,creator.gunangle) + lengthdir_y(1,(creator.gunangle - 90) * creator.right);
	motion_set(creator.direction,creator.speed);
	image_angle = creator.gunangle;
}

#define weapon_sprt
return global.sprLaserShotgun; // Wep Sprite

#define weapon_text
return "I CAN'T BELIEVE IT'S NOT ULTRA"; // Loading Tip