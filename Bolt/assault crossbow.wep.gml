#define init 
global.sprAssaultCrossbow = sprite_add_weapon("../Sprites/Bolt/AssaultCrossbow.png",5,6);

#define weapon_name
return "ASSAULT CROSSBOW"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_cost
return 3; // 3 Ammo

#define weapon_area
return 7; // L0 3-2+

#define weapon_load
return 26; // 0.86 Seconds

#define weapon_swap
return sndSwapBow; // Swap Sound

#define weapon_fire
repeat(3) if instance_exists(self){
	sound_play(sndCrossbow) // Sound
	weapon_post(4, -20, 4);
	
	with instance_create(x,y,Bolt){ // Bolts
		motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+((4*random_range(-1, 1))*other.accuracy),24)
		image_angle = direction;
		team = other.team;
		creator = other;
	}
	wait(3);
}

#define weapon_sprt
return global.sprAssaultCrossbow; // Wep Sprite

#define weapon_text
return "POINTY BARRAGE"; // Loading Tip