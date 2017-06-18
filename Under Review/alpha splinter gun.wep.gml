#define init
global.sprAlphaSplinterGun = sprite_add_weapon("../Sprites/Splinter/AlphaSplinterGun.png", 3, 4);

#define weapon_name
return "ALPHA SPLINTER GUN"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_cost
return 2; // 2 Ammo

#define weapon_load
return 8; // 0.26 Seconds

#define weapon_area
return 10; // L0 5-2+

#define weapon_swap
return sndSwapBow; // Swap sound

#define weapon_auto
return 1; // Automatic

#define weapon_fire
sound_play(sndSuperSplinterGun); // Sound
repeat(2) if instance_exists(self){
	weapon_post(6, -4, 2);
	repeat(6) with instance_create(x - (lengthdir_x(random_range(1,2), gunangle + 90) * other.right), y - (lengthdir_y(random_range(1,2), gunangle + 90) * other.right), Splinter){ // Splinters
		motion_add(other.gunangle + (random_range(-8, 8) * other.accuracy), 20 + random(4));
		image_angle = direction;
		team = other.team
		creator = other;
	}

    wait 1;
}

#define weapon_sprt
return global.sprAlphaSplinterGun; // Wep Sprite