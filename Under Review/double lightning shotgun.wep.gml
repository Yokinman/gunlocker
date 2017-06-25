#define init
global.sprDoubleLightningShotgun = sprite_add_weapon("../Sprites/Lightning/DoubleLightningShotgun.png", 5, 5);

#define weapon_name
return "DOUBLE LIGHTNING SHOTGUN"; // Name 

#define weapon_type
return 5; // Energy Wep

#define weapon_cost
return 4; // 4 Ammo

#define weapon_area
return 10; // L0 5-1+

#define weapon_load
return 25; // 0.83 Seconds

#define weapon_swap
return sndSwapEnergy; // Swap Sound

#define weapon_fire
 // Sound:
if(skill_get(17))
sound_play(sndLightningShotgunUpg)
else
sound_play(sndLightningShotgun)

weapon_post(10,-10,5)
repeat(16) {
	with instance_create(x, y, Lightning){
		alarm0 = 1;
		direction = other.gunangle+random_range(-96, 96);
		image_angle = direction;
		team = other.team;
		creator = other;
		ammo = 10+random(8);
	}
}

motion_add(gunangle - 180, 1.5); // Push Player Backwards

#define weapon_sprt
return global.sprDoubleLightningShotgun; // Wep Sprite