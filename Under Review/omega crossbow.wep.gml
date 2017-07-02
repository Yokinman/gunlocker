#define init
global.sprOmegaCrossbow = sprite_add_weapon("../Sprites/HeavyBolt/OmegaCrossbow.png", 5, 5);
global.sprOmegaBolt = sprite_add("../Sprites/Projectiles/HeavyBolt/OmegaBolt.png", 1, 12, 4);

#define weapon_name
return "OMEGA CROSSBOW"; // Name 

#define weapon_type
return 3; // Bolt Wep

#define weapon_cost
return 10; // 10 Ammo

#define weapon_area
return 18; // L1 1-2+

#define weapon_load
return 12; // 0.40 Seconds

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
    with instance_create(x+lengthdir_x(16,point_direction(x,y,mouse_x,mouse_y)),y+lengthdir_y(16,point_direction(x,y,mouse_x,mouse_y)),HeavyBolt){ // Bolts
		motion_add(other.gunangle+other.fireAngle+random_range(-4, 4)*other.accuracy,24)
		image_angle = direction;
		sprite_index = global.sprOmegaBolt
		team = other.team;
		creator = other;
	}
	fireAngle += (10 * other.accuracy);
}

motion_add(gunangle - 180, 1.5); // Push Player Backwards

#define weapon_sprt
return global.sprOmegaCrossbow; // Wep Sprite