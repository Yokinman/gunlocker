#define init 
global.sprScorcher = sprite_add_weapon("../Sprites/FlameShell/Scorcher.png",0,1);

#define weapon_name
return "SCORCHER"; // Name

#define weapon_type
return 1; // Bullet Wep

#define weapon_cost
return 1; // 1 Ammo

#define weapon_area
return 5; // L0 2-1+

#define weapon_load
return 6; // 0.20 Seconds

#define weapon_swap
return sndSwapPistol; // Swap Sound

#define weapon_fire
repeat(2) if instance_exists(self){
	 // Sound:
	sound_play(sndIncinerator);
	sound_play(sndPopgun);
	
	weapon_post(3, -5, 5);
	
	 // Bullet Casings:
	with instance_create(x,y,Shell){
		motion_add(other.gunangle + other.right*100 + random_range(-25,25),2+random(2))
	}

	 // Flame Shells:
	with instance_create(x,y,FlameShell){
		motion_add(other.gunangle + (random_range(-4, 4) * other.accuracy),14+random(2))
		team = other.team;
		creator = other;
	}
	wait 2;
}

#define weapon_sprt
return global.sprScorcher; // Wep Sprite

#define weapon_text
return "WARM TO THE TOUCH"; // Loading Tip