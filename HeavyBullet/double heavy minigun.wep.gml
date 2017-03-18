#define init
global.sprDoubleHeavyMinigun = sprite_add_weapon("../Sprites/HeavyBullet/DoubleHeavyMinigun.png", 5, 8);

#define weapon_name
return "DOUBLE HEAVY MINIGUN"; // Name

#define weapon_type
return 1; // Bullet Wep

#define weapon_area
return 20; // L1 1-3+

#define weapon_cost
return 4; // 4 Ammo

#define weapon_load
return 1; // 0.03 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapMachinegun; // Swap sound

#define weapon_fire
 // Sound:
sound_play(sndHyperRifle);
sound_play(sndDoubleMinigun);

weapon_post(8, -15, 8);
	
var bulletoffset = 8;
repeat(2){
	with instance_create(x,y,Shell){ // Empty Heavy Bullet Casings
		motion_add(other.gunangle + other.right*100 + random_range(-40,40), 3+random(2))
		sprite_index = sprHeavyShell;
	}
	with instance_create(x + lengthdir_x(6,gunangle),y + lengthdir_y(6,gunangle),HeavyBullet){ // Heavy Bullets
		motion_add(other.gunangle + ((bulletoffset + random_range(-8,8)) * other.accuracy), 16);
		image_angle = direction;
		team = other.team;
		creator = other;
	}
	motion_add(gunangle - 180, 0.4); // Push Player Backwards
	bulletoffset *= -1;
}

#define weapon_sprt
return global.sprDoubleHeavyMinigun; // Weapon Sprite

#define weapon_text
with(Player){
	if(race = "steroids"){
		if(wep = "double heavy minigun" && bwep = "double heavy minigun") return "THE DREAM"; // Double Roids Tip
		else return "A DREAM"; // Single Roids Tip
	}
	else return "IT EXISTS"; // Standard Tip
}