#define init
global.sprToxicNukeLauncher = sprite_add_weapon("../Sprites/Nuke/ToxicNukeLauncher.png", 13, 8)
global.sprToxicNuke = sprite_add("../Sprites/Projectiles/Nuke/ToxicNuke.png",1,9,6)

#define weapon_name
return "TOXIC NUKE LAUNCHER"; // Name

#define weapon_type
return 4; // Explosive Wep

#define weapon_load
return 50; // 1.67 Seconds

#define weapon_cost
return 3; // 3 Ammo

#define weapon_sprt
return global.sprToxicNukeLauncher; // Sprite

#define weapon_area
return 12; // L0 6-1+

#define weapon_swap
return sndSwapExplosive; // Swap sound

#define weapon_fire
//Fire sounds
sound_play(sndRocket)

weapon_post(12, -12, 12)

//Create toxic nuke
with (instance_create(x, y, CustomProjectile)) {
	name = "toxicnuke";
	sound_play(sndRocketFly) //Some sound
	//Set some shit:
	active = 0 // Can not be controlled
	activeToxic = 0 // Creates toxic gas
	typ = 2 //Destructable
	team = other.team; // Set team
	motion_add(point_direction(x, y, mouse_x[other.index], mouse_y[other.index])-4+random(8),2); //Set direction
	creator = other; // Set creator
	image_angle = direction; //Set image angle
	sprite_index = global.sprToxicNuke; //Set sprite
	image_speed = 1; // Set animation speed
	on_hit = toxicnuke_hit;
	on_step = toxicnuke_step;
	on_destroy = toxicnuke_destroy;
	on_draw = nuke_draw;
	wait 8; //Wait
	if instance_exists(self) { //If it hasn't blown up
		active = 1; // Can now be controlled
		
		wait 8;
		if(instance_exists(self))
		activeToxic = 1
	}
}

#define create_toxicnuke(_x, _y)
with (instance_create(_x, _y, CustomProjectile)) {
	name = "toxicnuke";
	sound_play(sndRocketFly) //Some sound
	//Set some shit:
	active = 0 // Can not be controlled
	activeToxic = 0 // Creates toxic gas
	typ = 2 //Destructable
	sprite_index = global.sprToxicNuke; //Set sprite
	image_speed = 1; // Set animation speed
	on_hit = toxicnuke_hit;
	on_step = toxicnuke_step;
	on_destroy = toxicnuke_destroy;
	on_draw = nuke_draw;
	wait 8; //Wait
	if instance_exists(self) { //If it hasn't blown up
		active = 1; // Can now be controlled
		
		wait 8;
		if(instance_exists(self))
		activeToxic = 1
	}
}

#define nuke_draw
	 // Draw Rocket Flame:
	if(active){
		draw_sprite_ext(sprRocketFlame, -1, x - lengthdir_x(4,image_angle), y - lengthdir_y(4,image_angle), 1, 1.2, image_angle, c_white, image_alpha);
		draw_set_blend_mode(bm_add);
		draw_sprite_ext(sprRocketFlame, 0, x, y, 2 * image_xscale, 2 * image_yscale, image_angle, c_white, 0.1);
	}
	draw_set_blend_mode(bm_normal);
	draw_self();

#define toxicnuke_hit
//Damage the enemy but blow up
if other.team != team {
	with other {
		my_health -= 60
		sprite_index = spr_hurt
		image_index = 0
		motion_add(other.direction,10)
	}
	
	instance_destroy()
}

#define toxicnuke_step
//Create a trail of smoke
if active = 1
{
instance_create(x,y,Smoke)
if activeToxic = 1
with instance_create(x, y, ToxicGas) {
	motion_set(other.direction + random_range(-20, 20), random(2))
	creator = other.creator
	hitid = [sprite_index, "TOXIC GAS"];
}
if speed > 5
speed = 5

motion_add(point_direction(x,y,mouse_x[creator.index],mouse_y[creator.index]),0.6) //Can be controlled
motion_add(direction,0.6)
}

image_angle = direction

if place_meeting(x,y,Explosion) {
	instance_destroy()
}

#define toxicnuke_destroy
view_shake_at(x,y,24); // Screen shake

sound_stop(sndRocketFly)

sound_play(sndExplosionXL)
//First ring of explosions
ang = random(360)
repeat(8) {
	instance_create(x+lengthdir_x(12,ang),y+lengthdir_y(12,ang),Explosion)
	ang += 360/8
}

repeat(40) with instance_create(x, y, ToxicGas) {
	motion_set(random(360), random(4))
	creator = other.creator
	hitid = [sprite_index, "TOXIC GAS"];
}

