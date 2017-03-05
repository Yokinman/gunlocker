#define init
sprLaserShotgun = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABMAAAAKCAYAAABWiWWfAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAB3RJTUUH4QEFFQ8ckgaaHgAAAB1pVFh0Q29tbWVudAAAAAAAQ3JlYXRlZCB3aXRoIEdJTVBkLmUHAAAA4klEQVQoz7WSvWoCURCFvwl26SwXFxufwE6Ei/YLNrLdvoKPklcIaJdOSGplQdKl8QFkEWytUp8Uu3sz/kBSJAcudzgzc+78XPhDmCTMLBKSboNqf+uwKzviwcyQFEW8sIOGo0CWFwDK8iLaTphOI6A7ldwgTKbse0vC4Dly+96S6skEWKclm5cIkynldnNxA5Tbzc8z820AJGmf07GKdovTsSJJ++w+Z4wf15E7dBec3+ZcVOaTvNDryyr6krSoE5suPt5LoPwuym2vHaaGo6AsL1S75Tepq9hfQf7c+y7/ji+Uylz07BeciwAAAABJRU5ErkJggg==",3,3);

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
with instance_create(x+lengthdir_x(15, gunangle), y+lengthdir_y(15, gunangle) + 1,LaserCannon){
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
			creator.wkick = 4;
			
			instance_destroy();
		}
		wait 1;
	}
}

#define charge_step
with(LaserCannon) if("lasershotguncharge" in self && instance_exists(creator)){
	 // Stay With Player:
	x = Player.x+lengthdir_x(15.5,creator.gunangle);
	y = Player.y+lengthdir_y(15.5,creator.gunangle) + 1;
	motion_set(creator.direction,creator.speed);
	image_angle = creator.gunangle;
}

#define weapon_sprt
return sprLaserShotgun; // Wep Sprite

#define weapon_text
return "I CAN'T BELIEVE IT'S NOT ULTRA"; // Loading Tip