#define init
global.sprBouncerCannon = sprite_add_weapon("../Sprites/Bouncer/BouncerCannon.png",2,5);
global.sprBouncerBall = sprite_add("../Sprites/Projectiles/Bouncer/BouncerBall.png",2,12,12);

#define weapon_name
return "BOUNCER CANNON" // Name

#define weapon_type
return 1; // Bullet weapon

#define weapon_load
return 38; // 1.26 Seconds

#define weapon_cost
return 16; // 16 Ammo

#define weapon_sprt
return global.sprBouncerCannon; // Wep sprite

#define weapon_area
return 6; // L0 3-2+

#define weapon_swap
return sndSwapMachinegun; // Swap sound

#define weapon_fire
sound_play(sndBouncerShotgun); //Fire sound

with instance_create(x+lengthdir_x(8, gunangle),y+lengthdir_y(8, gunangle),CustomProjectile) {
	name = "bouncerball";
	//Set some shit:
	image_angle = random(360)
	bounces = 3;
	typ = 1 //Reflectable
	team = other.team; // Set team
	motion_add(point_direction(x, y, mouse_x[other.index], mouse_y[other.index])-4+random(8),5); //Set direction
	creator = other; // Set creator
	mask_index = mskFlakBullet; // Set mask
	image_angle = direction; //Set image angle
	sprite_index = global.sprBouncerBall; //Set sprite
	image_speed = 0.5; // Set animation speed
	on_hit = bouncer_hit;
	on_step = bouncer_step;
	on_destroy = bouncer_destroy;
	on_wall = bouncer_wall;
	on_draw = bouncer_draw;
}

#define bouncer_draw
draw_sprite_ext(sprite_index, image_index, x, y, 2, 2, image_angle, c_white, 0.5 ); // Glow effect
draw_self()

#define bouncer_step
if image_index = 1 {
	image_speed = 0
}

image_angle += 2

#define bouncer_hit
if other.team != team and other.my_health > 0 {
	instance_destroy()
	with other
	{
		my_health -= 22
		sprite_index = spr_hurt
		image_index = 0
	}
	sound_play(other.snd_hurt)
}

#define bouncer_wall
sound_play(sndBouncerBounce);
move_bounce_solid(true)

repeat(2) {
	with instance_create(x,y,BouncerBullet) {
		motion_add(random(360), 6);
		image_angle = direction;
		team = other.team;
		creator = other;
	}
}

bounces -= 1
if bounces < 1 {
	instance_destroy()
}

#define bouncer_destroy
sound_play(sndFlakExplode)

with instance_create(x,y,BulletHit)
sprite_index = sprBullet2Disappear

fire_angle = 0 //Fire angle

repeat(20) {
	with instance_create(x,y,BouncerBullet) {
		motion_add(other.fire_angle, 6);
		image_angle = direction;
		team = other.team;
		creator = other;
	}
	
	fire_angle += 360/20
}

#define weapon_text
return "WATCH OUT FOR SHIELDERS!"; // Loading Tip
