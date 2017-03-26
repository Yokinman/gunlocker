#define init
global.sprAlphaCrossbow = sprite_add_weapon("../Sprites/Bolt/AlphaCrossbow.png", 5, 5);
global.sprAlphaBolt = sprite_add("../Sprites/Projectiles/Bolt/AlphaBolt.png", 1, 12, 4);

#define weapon_name
return "ALPHA CROSSBOW"; // Name 

#define weapon_type
return 3; // Bolt Wep

#define weapon_cost
return 5; // 5 Ammo

#define weapon_area
return 13; // L0 6-1+

#define weapon_load
return 11; // 0.36 Seconds

#define weapon_sprt
return global.sprAlphaCrossbow; // Wep Sprite

#define weapon_swap
return sndSwapBow; // Swap Sound

#define weapon_auto
return 1; // Automatic

#define weapon_fire
 // Sound:
sound_play(sndSuperCrossbow);

weapon_post(8, -15, 5);

fireAngle = -15 * other.accuracy;
repeat(4){
    with instance_create(x,y,Bolt){ // Bolts
		motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+other.fireAngle-2+random(4)*other.accuracy,24)
		image_angle = direction;
		sprite_index = global.sprAlphaBolt
		team = other.team;
		creator = other;
	}
	fireAngle += (10 * other.accuracy);
}

motion_add(gunangle - 180, 1.5); // Push Player Backwards