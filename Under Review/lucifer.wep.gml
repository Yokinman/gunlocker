#define init
global.sprLucifer = sprite_add_weapon("../Sprites/Flame/Lucifer.png", 5, 5);

#define weapon_name
return "LUCIFER"; // Name 

#define weapon_type
return 4; // Explosive Wep

#define weapon_cost
return 1; // 1 Ammo

#define weapon_area
return 14; // L0 7-2+

#define weapon_load
return 6; // 0.20 Seconds

#define weapon_sprt
return global.sprLucifer; // Wep Sprite

#define weapon_swap
return sndSwapDragon; // Swap Sound

#define weapon_auto
return 1; // Automatic

#define weapon_fire
wkick = 4

//INSERT GOOD CODE THAT FIXES SOUND HERE PLEASE

repeat(6) {
	if instance_exists(self) {
		fireAngle = -7.5-2+random(4)
		repeat(4) {
			repeat(3)
			{
				with instance_create(x,y,Flame) {
					creator = other
					motion_add(other.gunangle+random(10)-other.fireAngle,10+random(3))
					team = other.team
					move_contact_solid(direction,14)
				}
			}
			fireAngle += 5
		}
	}
	wait 1;
	wkick = 4
}