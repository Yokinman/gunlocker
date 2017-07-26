#define init
global.spr_AlphaSplinter = sprite_add_weapon("../Sprites/Splinter/AlphaSplinterGun.png", 2, 4);

#define weapon_name
return "ALPHA SPLINTER GUN"; // Weapon Name 

#define weapon_type
return 3; // Bolt Weapon!

#define weapon_cost
return 1; // Costs 1 Ammo

#define weapon_area
return 0; // Starts appearing at

#define weapon_load
return 10;

#define weapon_swap
return sndSwapBow; // Bolt Weapon Swap Sound

#define weapon_auto
return 1;

#define step
with Player {
	if ("as_loaded" not in self){
		as_loaded = 0;
	}
	if(as_loaded >= 15){
		{reload = 10}
	}
	if (!button_check(index, "fire") && as_loaded > 0) {
		as_loaded -= 1;
		sound_play(sndSplinterGun)
		repeat (5){
			with instance_create(x, y, Splinter) {
				motion_add(other.gunangle + (random_range(-15,15) * other.accuracy), random_range(17,23));
				team = other.team
				image_angle = direction
				creator = other
			}
		}
	}
}


#define weapon_fire
as_loaded += 1

#define weapon_sprt
return global.spr_AlphaSplinter; // Weapon Sprite

#define weapon_text
return "RELEASE"; // Loading Screen Tip