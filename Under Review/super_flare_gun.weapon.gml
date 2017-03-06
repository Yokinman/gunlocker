#define init
sprSuperFlareGun = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABUAAAAOCAYAAADABlfOAAAABmJLR0QAAAAAAAD5Q7t/AAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAB3RJTUUH4AsHACIl3CEq7QAAAOFJREFUOMtjYKABYKSCGf/RzWQhQyOyQ/77hMXCOVtWLWZgYGBgYCFgKwMDAwNDrSKC3XwfVY28ijqGehZctjIwMDA8efSAwfflYYYACVRNzfcZGHzCYuEuQwdMMAMNLGwxJKUvHsaqyZsTQqM7AptLGZ48esAgI6cAZ0szMDCce4GqAcZ/8ugBzgjAiCiY4gsnDjNcgIYnNu8bQNVYO7kTNhRmIDSW/zMwMDBseIFTDcPDOzeJMxQdILsUyQJGXKmFEU9a/I8jSaHrxUj8jGTkGGw58T+yGCOFWZKa2R0/AAD47kbWoYhMAgAAAABJRU5ErkJggg==", 4, 6);

#define weapon_name
return "SUPER FLARE GUN"; // Name

#define weapon_type
return 4; // Explosive Wep

#define weapon_cost
return 5; // 5 Ammo

#define weapon_load
return 33; // 1.1 Seconds

#define weapon_auto
return 0; // Semi

#define weapon_area
return 10; // L0 5-1+

#define weapon_swap
return sndSwapFlame; // Swap sound

#define weapon_fire
var spread = -20 * accuracy;
repeat (5)
{
	with (instance_create(x, y, Flare))
	{
		motion_add(other.gunangle + spread, 9);
		image_angle = direction;
		team = other.team;
		creator = other;
	}
	spread += 10 * accuracy;
}
sound_play(sndFlare);
wkick = 7;

#define weapon_sprt
return sprSuperFlareGun; // Wep Sprite