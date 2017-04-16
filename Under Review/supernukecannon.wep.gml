#define init
global.sprSuperNukeCannon = sprite_add_weapon("../Sprites/Nuke/SuperNukeCannon.png", 10, 8)
global.sprHugeNuke = sprite_add("../Sprites/Projectiles/Nuke/NukeHuge.png",1,9,6)

#define weapon_name
return "SUPER NUKE CANNON"; // Name

#define weapon_type
return 4; // Explosive Wep

#define weapon_load
return 121; // 4.03 Seconds

#define weapon_cost
return 15; // 15 Ammo

#define weapon_sprt
return global.sprSuperNukeCannon; // Sprite

#define weapon_area
return 15; // L0 7-3+

#define weapon_swap
return sndSwapExplosive; // Swap sound

#define nuke_hit
//Damage the enemy but blow up
if other.team != team {
	with other {
		my_health -= 155
		sprite_index = spr_hurt
		image_index = 0
		motion_add(other.direction,10)
	}
	
	instance_destroy()
}

#define nuke_step
//Create a trail of smoke
if active = 1
{
instance_create(x,y,Smoke)
if speed > 5
speed = 5

motion_add(point_direction(x,y,mouse_x[creator.index],mouse_y[creator.index]),0.1) //Can be controlled
motion_add(direction,0.1)
}

image_angle = direction

#define nuke_destroy
view_shake_at(x,y,30); // Screen shake

sound_stop(sndRocketFly)

sound_play(sndExplosionXL)
//First ring of explosions
ang = random(360)
repeat(8) {
	instance_create(x+lengthdir_x(12,ang),y+lengthdir_y(12,ang),Explosion)
	ang += 360/8
}
//Second ring of explosions
ang = random(360)
repeat(16) {
	instance_create(x+lengthdir_x(16,ang),y+lengthdir_y(16,ang),Explosion)
	ang += 360/16
}
//Third ring of explosions
ang = random(360)
repeat(32) {
	instance_create(x+lengthdir_x(32,ang),y+lengthdir_y(32,ang),Explosion)
	ang += 360/32
}

#define weapon_fire
//Fire sounds
sound_play(sndRocket)

view_shake_at(x,y,10); // Screen shake
wkick = 10;

//Create big nuke
with (instance_create(x+lengthdir_x(8, other.gunangle),y+lengthdir_y(8, other.gunangle),CustomProjectile)) {
	name = "hugenuke";
	sound_play(sndRocketFly) //Some sound
	//Set some shit:
	active = 0 // Can not be controlled
	typ = 2 //Destructable
	team = other.team; // Set team
	motion_add(point_direction(x, y, mouse_x[other.index], mouse_y[other.index])-4+random(8),2); //Set direction
	creator = other; // Set creator
	image_angle = direction; //Set image angle
	sprite_index = global.sprHugeNuke; //Set sprite
	image_speed = 1; // Set animation speed
	on_hit = nuke_hit;
	on_step = nuke_step;
	on_destroy = nuke_destroy;
	wait 8; //Wait
	if instance_exists(self) { //If it hasn't blown up
		active = 1; // Can now be controlled
	}
}

#define weapon_text
return "FAT MAN"; // Loading Tip