#define init
sprAutoSeekerShotgun = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABQAAAAKCAYAAAC0VX7mAAAABmJLR0QAAAAAAAD5Q7t/AAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAB3RJTUUH4AsGFQwu4qX8twAAANFJREFUKM9jYKAXkBJXY2BgYPgPxbjAf0Jq/qNjXW2z/9jEGRgY/vuExf73CYtFMZAFySAGBgYGBp+wWAYFFXUGBgYGhnVzFzG8ffOBQVfbjOHtmw8MRvbmcLkHd27C2ciAEWYg1ItwICwigMJ/++YDw7OXt1DEcqpaGBgYGBimtNXAzWJBt8HI3pzh4dWbDPLa6ig0uusf3LmJNcywulBYRIDh7ZsPKArRXQezgIGBgWHLqsXIZiEiREpcDSMSpMTV8MUi0bGMIoZkCdUA0QYCAJ0hWlEKAXh2AAAAAElFTkSuQmCC", 3, 4);

#define weapon_name
return "AUTO SEEKER SHOTGUN"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_cost
return 3; // 3 Ammo

#define weapon_load
return 13; // 0.43 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_area
return 13; // L0 6-1+

#define weapon_swap
return sndSwapBow; // Swap sound

#define weapon_fire
wkick = 5;
sound_play(sndSeekerShotgun); // Sound

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
return sprAutoSeekerShotgun; // Wep Sprite

#define weapon_text
return "THEY HAVE NO CHANCE"; // Loading Tip