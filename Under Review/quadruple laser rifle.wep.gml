#define init
global.sprQuadrupleLaserRifle = sprite_add_weapon("../Sprites/Laser/QuadrupleLaserRifle.png", 3, 6);

#define weapon_name
return "QUADRUPLE LASER RIFLE"; // Name

#define weapon_type
return 5; // Energy Wep

#define weapon_cost
return 4; // 4 Ammo

#define weapon_load
return 6; // 0.20 Seconds

#define weapon_area
return 10; // L0 5-2+

#define weapon_swap
return sndSwapEnergy; // Swap sound

#define weapon_auto
return 1; // Automatic

#define weapon_fire
weapon_post(15, -20, 8);
if skill_get(17) sound_play(sndLaserUpg); // Laser Brain
else sound_play(sndLaser); 

fireAngle = -22.5+random_range(-5,5)

repeat(4) {
	with instance_create(other.x,other.y,Laser){
		alarm0 = 1;
		team = other.team;
		creator = other;
		image_yscale = 1.7 + (skill_get(17)*0.6);
		image_angle = (other.fireAngle * creator.accuracy) + other.gunangle;
	}
	fireAngle += 15
}

#define weapon_sprt
return global.sprQuadrupleLaserRifle; // Wep Sprite