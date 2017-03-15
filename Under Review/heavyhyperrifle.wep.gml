#define init
global.sprHeavyHyperRifle = sprite_add_weapon("../Sprites/HeavyBullet/HeavyHyperRifle.png", 6, 4);

#define weapon_name
return "HEAVY HYPER RIFLE"; // Name

#define weapon_type
return 1; // Bullet Wep

#define weapon_cost
return 10; // 10 Ammo

#define weapon_load
return 3; // 0.10 Seconds

#define weapon_sprt
return global.sprHeavyHyperRifle; // Weapon Sprite

#define weapon_area
return 11; // L0 5-3+

#define weapon_swap
return sndSwapMachinegun; // Swap sound

#define weapon_fire
view_shake_at(x,y,10); // Screen shake
motion_add(point_direction(x,y,mouse_x,mouse_y)+180,1)	
wkick = 6;

repeat(5) { // Burst of 5 bullets
	if instance_exists(self) { // If the player isn't dead
		sound_play_pitchvol(sndHyperRifle,0.8,2);
		with instance_create(x,y,Shell) { // Heavy bullet shell
			motion_add(other.gunangle + other.right*100 + random_range(-40,40),2+random(2))
			sprite_index = sprHeavyShell;
		}

		with (instance_create(x,y,HeavyBullet)) { //Heavy bullet
		motion_add(point_direction(x,y,mouse_x,mouse_y)+(random(4)-2)*other.accuracy,16);
		image_angle = direction;
		team = other.team;
		creator = other;
		}
	}
	wait 1; // Delay
}
