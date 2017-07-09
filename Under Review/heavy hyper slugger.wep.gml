#define init
global.sprHeavyHyperSlugger = sprite_add_weapon("../Sprites/HeavySlug/HeavyHyperSlugger.png", 3, 4);

#define weapon_name
return "HEAVY HYPER SLUGGER"; // Name

#define weapon_type
return 2; // Shell Wep

#define weapon_area
return 15; // L0 7-3+

#define weapon_cost
return 2; // 2 Ammo

#define weapon_load
return 12; // 0.40 Seconds

#define weapon_swap
return sndSwapExplosive; // Swap sound

#define hhn_die
with instance_create(x,y,HeavySlug) {
	creator = other.creator
	direction = other.direction
	image_angle = direction
	motion_add(direction,13)
	team = other.team
}

#define weapon_fire
sound_play(sndHyperSlugger)
sound_play(sndHeavySlugger)

motion_add(gunangle - 180, 0.5); // Push Player Backwards A Bit
weapon_post(9, -8, 5);

with instance_create(x+lengthdir_x(4,other.gunangle),y+lengthdir_y(4,other.gunangle),CustomProjectile) {
	sprite_index = sprHeavySlug
	mask_index = sprBullet1
	creator = other
	name = "heavyhyperslug"
	direction = other.gunangle+random_range(-2, 2)*other.accuracy
	image_angle = direction
	team = other.team
	alarm[0] = 1
	typ = 1 
	
	on_destroy = "hhn_die"
	
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
			instance_destroy()
		}
		if instance_exists(self) {
			speed = 4
			
			instance_destroy()
		}
	}
}


#define weapon_sprt
return global.sprHeavyHyperSlugger; // Weapon Sprite