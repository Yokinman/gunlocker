#define init
global.sprUberBoltCannon = sprite_add_weapon("../Sprites/HeavyBolt/UberBoltCannon.png",3,6);
global.sprHugeHeavyBolt = sprite_add("../Sprites/Projectiles/HeavyBolt/HugeHeavyBolt.png",1, 14, 7.5);
global.sprBigHeavyBolt = sprite_add("../Sprites/Projectiles/HeavyBolt/BigHeavyBolt.png",1, 14, 7);

#define weapon_name
return "UBER BOLT CANNON"

#define weapon_type
return 3; //Bolt ammo

#define weapon_cost
return 36; // previusly costed 48 ammo

#define weapon_area
return 17; // L1 0-1

#define weapon_load
return 72;

#define weapon_auto
return 0;

#define weapon_sprt
return global.sprUberBoltCannon

#define weapon_swap
return sndSwapBow

#define weapon_text
return "BOLTS BOLTED TO BOLTS"

#define weapon_fire
weapon_post(5, -16, 4)
with instance_create(x,y,CustomProjectile){
	creator = other
	team = other.team
	motion_set(other.gunangle, 18)
	image_angle = direction
	sprite_index = global.sprHugeHeavyBolt
	damage = 80
	on_hit = bolt_hit
	on_destroy = big_bolt_destroy
	on_step = bolt_step
	force = 5
}
sound_play(sndHeavyNader)
sound_play(sndHeavyCrossbow)
motion_add(gunangle+180,9)
view_shake_at(x, y, 40)

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
	with instance_create(x,y,HeavyBolt){
		creator = other.creator
		team = other.team
		motion_set(ang,16)
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
		motion_set(45 + ang, 18)
		image_angle = direction
		sprite_index = global.sprBigHeavyBolt
		damage = 50
		on_hit = bolt_hit
		on_destroy = bolt_destroy
		on_step = bolt_step
		force = 4
	}
	ang += 360/4
}
