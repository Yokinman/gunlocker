#define init
global.sprAutoSeekerShotgun = sprite_add_weapon("../Sprites/Seeker/AutoSeekerShotgun.png", 2, 4);

#define weapon_name
return "AUTO SEEKER SHOTGUN"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_cost
return 3; // 3 Ammo

#define weapon_load
return 12; // 0.40 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_area
return 13; // L0 6-1+

#define weapon_swap
return sndSwapBow; // Swap sound

#define weapon_fire
sound_play(sndSeekerShotgun); // Sound
weapon_post(5, 10, 6);

 // Seekers:
var ang = 50 * accuracy;
repeat(5){
	with instance_create(x, y, Seeker){
		motion_add(other.gunangle + ang + (random_range(-30, 30) * other.accuracy), 8);
		image_angle = direction;
		team = other.team;
		creator = other;
	}
	ang -= 25 * accuracy;
}

#define weapon_sprt
return global.sprAutoSeekerShotgun; // Wep Sprite

#define weapon_text
return "THEY HAVE NO CHANCE"; // Loading Tip