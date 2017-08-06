#define init
global.sprDoubleSplinterMinigun = sprite_add_weapon("../Sprites/Splinter/DoubleSplinterMinigun.png", 4, 8);

#define weapon_name
return "DOUBLE SPLINTER MINIGUN"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_cost
return 2; // 2 Ammo

#define weapon_load
return 3; // 0.10 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_area
return 14; // L0 7-2+

#define weapon_swap
return sndSwapBow; // Swap sound

#define weapon_fire
repeat (3)
{
	repeat(2) with (instance_create(x, y, Splinter))
	{
		motion_add(other.gunangle + (random_range(-16, 16) * other.accuracy), 16 + random(8));
		image_angle = direction;
		team = other.team;
		creator = other;
	}
	
	sound_play(sndSplinterPistol);
	weapon_post(8,-8,8)
	wait(1);
}

#define weapon_sprt
return global.sprDoubleSplinterMinigun; // Wep Sprite