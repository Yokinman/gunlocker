#define init
global.spr_AlphaSplinter = sprite_add_weapon("../Sprites/Splinter/AlphaSplinterGun.png", 2, 4);

#define weapon_name
return "ALPHA SPLINTER GUN"; // Weapon Name 

#define weapon_type
return 3; // Shell Weapon!

#define weapon_cost
return 1; // Costs 1 Ammo

#define weapon_area
return 12; // Starts Appearing at L0 5-3

#define weapon_load
return 30;

#define weapon_swap
return sndSwapBow; // Shell Weapon Swap Sound

#define weapon_auto
return 1;

#define step
with Player if (!button_check(index, "fire")) {
	as_reload = 0;
}
with Player if (wep == "alphasplinter" && button_check(index, "fire")){
	reload = reload - as_reload
	if (as_reload <= 10) {as_reload += .05};
}

#define weapon_fire

repeat (4 + round(as_reload / 5)){
	with instance_create(x, y, Splinter) {
		motion_add(other.gunangle + (random_range(-5,5) * other.accuracy * (.25 * other.as_reload)), random_range(17,23));
		team = other.team
		image_angle = direction
		
	}
};

//sound_play_pitchvol(sndSplinterGun, 1, .5);

#define weapon_sprt
return global.spr_AlphaSplinter; // Weapon Sprite

#define weapon_text
return "RELEASE"; // Loading Screen Tip