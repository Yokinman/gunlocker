#define init
global.sprDoubleSeekerShotgun = sprite_add_weapon("../Sprites/Seeker/DoubleSeekerShotgun.png", 5, 4)

#define weapon_name
return "DOUBLE SEEKER SHOTGUN"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_load
return 36; // 1.20 Seconds

#define weapon_cost
return 6; // 6 Ammo

#define weapon_sprt
return global.sprDoubleSeekerShotgun; // Wep Sprite

#define weapon_area
return 8; // L0 4-1+

#define weapon_swap
return sndSwapBow; // Swap sound

#define weapon_fire
sound_play(sndSeekerShotgun); // Sound

fireAngle = -66

repeat(12) {
	with instance_create(x+lengthdir_x(10,gunangle), y+lengthdir_y(10,gunangle), Seeker) {
		motion_add(other.gunangle+other.fireAngle-25+random(50)*other.accuracy, 8)
		creator = other;
		image_angle = direction;
		team = other.team;
	}
	fireAngle += 12
}

wkick = 8;