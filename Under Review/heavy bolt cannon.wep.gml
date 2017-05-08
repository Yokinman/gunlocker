#define init
global.sprHeavyBoltCannon = sprite_add_weapon("../Sprites/HeavyBolt/HeavyBoltCannon.png",3,6);
global.sprBigHeavyBolt = sprite_add("../Sprites/Projectiles/HeavyBolt/BigHeavyBolt.png",1, 14, 7);

#define weapon_name
return "HEAVY BOLT CANNON"

#define weapon_type
return 3; //Bolt ammo

#define weapon_cost
return 15;

#define weapon_area
return 12; //5-3

#define weapon_load
return 52;

#define weapon_auto
return 0;

#define weapon_sprt
return global.sprHeavyBoltCannon

#define weapon_swap
return sndSwapBow

#define weapon_text
return "LIKE SHOOTING LOGS"

#define weapon_fire
weapon_post(7, -17, 4)
with instance_create(x,y,CustomProjectile){
	creator = other
	team = other.team
	motion_set(other.gunangle, 18)
	image_angle = direction
	sprite_index = global.sprBigHeavyBolt
	damage = 50
	on_hit = bolt_hit
	on_destroy = bolt_destroy
	on_step = bolt_step
	force = 4
}
sound_play(sndGrenade)
sound_play(sndHeavyCrossbow)
motion_add(gunangle+180,4)

#define bolt_step
with instance_create(x,y,BoltTrail){
	creator = other.creator
	image_angle = other.image_angle
	image_xscale = other.speed
}

#define bolt_hit
var helth = other.my_health
projectile_hit(other, damage, force);
view_shake_at(x, y, 4)
damage -= helth
if damage <= 0 {instance_destroy()}

#define bolt_destroy
sound_play(sndSuperCrossbow)
var ang = image_angle
repeat(7){
	with instance_create(x,y,HeavyBolt){
		creator = other.creator
		team = other.team
		motion_set(ang,16)
		image_angle = direction
	}
	ang += 360/7
}