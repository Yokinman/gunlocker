#define init
global.sprHeavyHyperLauncher = sprite_add_weapon("../Sprites/HeavyGrenade/HeavyHyperLauncher.png", 2, 7);

#define weapon_name
return "HEAVY HYPER LAUNCHER"; // Name

#define weapon_type
return 4; // Explosive Wep

#define weapon_area
return 15; // L0 7-3+

#define weapon_cost
return 3; // 3 Ammo

#define weapon_load
return 8; // 0.27 Seconds

#define weapon_swap
return sndSwapExplosive; // Swap sound

#define hhn_die
sound_play(sndExplosion)
instance_create(x,y,GreenExplosion)

#define weapon_fire
sound_play(sndHyperLauncher)
sound_play(sndClusterLauncher)

motion_add(gunangle - 180, 0.5); // Push Player Backwards A Bit
weapon_post(9, -8, 5);

with instance_create(x+lengthdir_x(8,other.gunangle),y+lengthdir_y(8,other.gunangle),CustomProjectile) {
	sprite_index = sprPopoNade
	creator = other
	name = "heavyhypernade"
	direction = other.gunangle+random_range(-2, 2)*other.accuracy
	image_angle = direction
	team = other.team
	typ = 1 
	
	on_destroy = hhn_die
	
	while(instance_exists(self)) {
				
		move_contact_solid(direction,16)

		repeat(4)
		{
			with instance_create(x,y,Smoke)
			motion_add(random(360),random(2))
		}


		dir = 0
		do {dir += 1 x += lengthdir_x(4,direction) y += lengthdir_y(4,direction)}
		until dir > 100 or place_meeting(x,y,Wall) or place_meeting(x,y,hitme)
		if place_meeting(x,y,hitme) {
			with instance_nearest(x,y,hitme) {
				with other {
					if other.team != team
					{
						sound_play(other.snd_hurt)
						with other
						{
							my_health -= 60
							sprite_index = spr_hurt
							image_index = 0
							motion_add(other.direction,16)
						}
						instance_destroy()
					}
				}
			}
		}
		if instance_exists(self) {
			speed = 4
			
			instance_destroy()
		}
	}
}


#define weapon_sprt
return global.sprHeavyHyperLauncher; // Weapon Sprite