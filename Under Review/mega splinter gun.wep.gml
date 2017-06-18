#define init
global.sprMegaSplinterGun = sprite_add_weapon("../Sprites/Splinter/MegaSplinterGun.png", 7, 6);

#define weapon_name
return "MEGA SPLINTER GUN"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_cost
return 5; // 5 Ammo

#define weapon_load
return 36; // 1.20 Seconds

#define weapon_area
return 9; // L0 5-1+

#define weapon_swap
return sndSwapBow; // Swap sound

#define weapon_fire
sound_play(sndSuperSplinterGun); // Sound
repeat(6) if instance_exists(self){
	weapon_post(8, -10, 4);
	repeat(4) with instance_create(x - (lengthdir_x(random_range(1,2), gunangle + 90) * other.right), y - (lengthdir_y(random_range(1,2), gunangle + 90) * other.right), Splinter){ // Splinters
		motion_add(other.gunangle + (random_range(-16, 16) * other.accuracy), 20 + random(4));
		image_angle = direction;
		team = other.team
		creator = other;
	}

    wait 1;
}

#define weapon_sprt
return global.sprMegaSplinterGun; // Wep Sprite