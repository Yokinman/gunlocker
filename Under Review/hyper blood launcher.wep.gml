#define init
	global.sprHyperBloodLauncher = sprite_add_weapon("../Sprites/Blood/HyperBloodLauncher.png", 2, 7);

#define weapon_name
	return "HYPER BLOOD LAUNCHER"; // Name

#define weapon_type
	return 4; // Explosive Wep

#define weapon_area
	return 13; // L0 7-1+

#define weapon_cost
	return 0; // No ammo, for blood purposes

#define weapon_load
	return 8; // 0.27 Seconds

#define weapon_swap
	return sndSwapExplosive; // Swap sound

#define hyperbloodnade_destroy
sound_play(sndBloodLauncherExplo)

var mx = direction
repeat(3) {
	instance_create(x+lengthdir_x(8,mx),y+lengthdir_y(8,mx),MeatExplosion)
	mx += 120
}

#define weapon_fire
	 // HP Ammo:
	if(ammo[weapon_get_type(argument0)] < 2){
		sound_play(sndBloodHurt);
		projectile_hit(self, 1, 0, 0);
		lasthit = [weapon_get_sprite(argument0), weapon_get_name(argument0)];
		ammo[4] += 2;
	}
	if(infammo = 0) ammo[weapon_get_type(argument0)] -= 2;

	sound_play(sndHyperLauncher)
	sound_play(sndBloodLauncher)

	weapon_post(9, -8, 5);

	hyperbloodnade_create(x, y)

#define hyperbloodnade_create(_x, _y)
	with instance_create(_x+lengthdir_x(8,other.gunangle),_y+lengthdir_y(8,other.gunangle),CustomProjectile) {
		sprite_index = sprPopoNade
		creator = other
		name = "hyperbloodnade"
		direction = other.gunangle+random_range(-2, 2)*other.accuracy
		image_angle = direction
		team = other.team
		typ = 1 
		cbe = 8 // Create blood explosion 
		
		on_destroy = hyperbloodnade_destroy
		
		while(instance_exists(self)) {
					
			move_contact_solid(direction,16)

			repeat(4)
			{
				with instance_create(x,y,Smoke)
				motion_add(random(360),random(2))
			}


			dir = 0
			do {
				dir += 1 x += lengthdir_x(4,direction) y += lengthdir_y(4,direction)
				cbe += 1
				if cbe > 7 {
					instance_create(x+lengthdir_x(4,random(360)),y+lengthdir_y(4,random(360)),MeatExplosion)
					cbe = 0
				}
			}
			until dir > 100 or place_meeting(x,y,Wall) or place_meeting(x,y,hitme)
			if place_meeting(x,y,hitme) {
				with instance_nearest(x,y,hitme) {
					with other {
						if other.team != team
						{
							sound_play(other.snd_hurt)
							with other
							{
								my_health -= 20
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
	return global.sprHyperBloodLauncher; // Weapon Sprite