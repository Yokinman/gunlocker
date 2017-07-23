#define init
global.sprSplinterMinigun = sprite_add_weapon("../Sprites/Splinter/SplinterMinigun.png", 4, 3);

#define weapon_name
return "SPLINTER MINIGUN"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_cost
return 1; // 1 Ammo

#define weapon_load
return 3; // 0.1 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_area
return 9; // L0 4-1+

#define weapon_swap
return sndSwapBow; // Swap sound

#define weapon_fire
repeat (3)
{
	with (instance_create(x, y, Splinter))
	{
		motion_add(other.gunangle + (10 * random_range(-1, 1) * other.accuracy), 16 + random(8));
		image_angle = direction;
		team = other.team;
		creator = other;
	}
	
	sound_play(sndSplinterPistol);
	wkick = 4;
	weapon_post(4,-8,8)
	
	wait(1);
}

#define weapon_sprt
return global.sprSplinterMinigun; // Wep Sprite