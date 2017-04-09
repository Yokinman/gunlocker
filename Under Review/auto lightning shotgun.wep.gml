#define init
global.sprAutoLightningShotgun = sprite_add_weapon("../Sprites/Lightning/AutoLightningShotgun.png", 5, 5);

#define weapon_name
return "AUTO LIGHTNING SHOTGUN"; // Name 

#define weapon_type
return 5; // Energy Wep

#define weapon_cost
return 2; // 2 Ammo

#define weapon_area
return 10; // L0 5-1+

#define weapon_load
return 11; // 0.36 Seconds

#define weapon_sprt
return global.sprAutoLightningShotgun; // Wep Sprite

#define weapon_swap
return sndSwapEnergy; // Swap Sound

#define weapon_auto
return 1; // Automatic

#define weapon_fire
 // Sound:
if(skill_get(17))
sound_play(sndLightningShotgun)
else
sound_play(sndLightningShotgunUpg)

wkick = 8;
repeat(7) {
	with instance_create(x, y, Lightning){
		alarm0 = 1;
		direction = other.gunangle-4+random(8);
		image_angle = direction;
		team = other.team;
		creator = other;
		ammo = 10+random(6);
	}
}

motion_add(gunangle - 180, 1.5); // Push Player Backwards