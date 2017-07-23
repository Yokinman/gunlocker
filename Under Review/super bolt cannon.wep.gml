#define init
global.sprSuperBoltCannon = sprite_add_weapon("../Sprites/Bolt/SuperBoltCannon.png",3,7);
global.sprHugeBolt = sprite_add("../Sprites/Projectiles/Bolt/BoltHuge.png",1, 14, 6);
global.sprBigBolt = sprite_add("../Sprites/Projectiles/Bolt/BoltBig.png",1, 14, 3.5);

#define weapon_name
return "SUPER BOLT CANNON"

#define weapon_type
return 3; //Bolt ammo

#define weapon_cost
return 18; // previusly costed 26 ammo

#define weapon_area
return 14; // 7-1

#define weapon_load
return 56;

#define weapon_auto
return 0;

#define weapon_sprt
return global.sprSuperBoltCannon

#define weapon_swap
return sndSwapBow

#define weapon_text
return "BOLTS ON BOLTS ON BOLTS"

#define weapon_fire
weapon_post(5, -12, 4)
with instance_create(x,y,CustomProjectile){
	creator = other
	team = other.team
	motion_set(other.gunangle, 22)
	image_angle = direction
	sprite_index = global.sprHugeBolt
	damage = 60
	on_hit = bolt_hit
	on_destroy = big_bolt_destroy
	on_step = bolt_step
	force = 5
}
sound_play(sndHeavyNader)
sound_play(sndHeavyCrossbow)
motion_add(gunangle+180,7)
view_shake_at(x, y, 30)

#define bolt_step
with instance_create(x,y,BoltTrail){
	creator = other.creator
	image_angle = other.image_angle
	image_xscale = other.speed
}

#define bolt_hit
var helth = other.my_health
projectile_hit(other, damage, force);
view_shake_at(x, y, 3)
damage -= helth
if damage <= 0 {instance_destroy()}

#define bolt_destroy
sound_play(sndSuperCrossbow)
var ang = image_angle
repeat(7){
	with instance_create(x,y,Bolt){
		creator = other.creator
		team = other.team
		motion_set(ang,24)
		image_angle = direction
	}
	ang += 360/7
}

#define big_bolt_destroy
sound_play(sndSuperCrossbow)
var ang = image_angle
repeat(4){
	with instance_create(x,y,CustomProjectile){
		creator = other.creator
		team = other.team
		motion_set(45 + ang, 22)
		image_angle = direction
		sprite_index = global.sprBigBolt
		damage = 35
		on_hit = bolt_hit
		on_destroy = bolt_destroy
		on_step = bolt_step
		force = 2
	}
	ang += 360/4
}
