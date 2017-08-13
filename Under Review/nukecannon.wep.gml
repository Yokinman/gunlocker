#define init
global.sprNukeCannon = sprite_add_weapon("../Sprites/Nuke/NukeCannon.png", 13, 8)
global.sprBigNuke = sprite_add("../Sprites/Projectiles/Nuke/NukeBig.png",1,9,6)

#define weapon_name
return "NUKE CANNON"; // Name

#define weapon_type
return 4; // Explosive Wep

#define weapon_load
return 88; // 2.93 Seconds

#define weapon_cost
return 9; // 9 Ammo

#define weapon_sprt
return global.sprNukeCannon; // Sprite

#define weapon_area
return 13; // L0 7-1+

#define weapon_swap
return sndSwapExplosive; // Swap sound

#define nuke_draw
	 // Draw Rocket Flame:
	if(active){
		draw_sprite_ext(sprRocketFlame, -1, x - lengthdir_x(4,image_angle), y - lengthdir_y(4,image_angle), 1, 1.2, image_angle, c_white, image_alpha);
		draw_set_blend_mode(bm_add);
		draw_sprite_ext(sprRocketFlame, 0, x, y, 2 * image_xscale, 2 * image_yscale, image_angle, c_white, 0.1);
	}
	draw_set_blend_mode(bm_normal);
	draw_self();

#define nuke_hit
//Damage the enemy but blow up
if other.team != team {
	with other {
		my_health -= 85
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

motion_add(point_direction(x,y,mouse_x[creator.index],mouse_y[creator.index]),0.3) //Can be controlled
motion_add(direction,0.3)
}

image_angle = direction

#define nuke_destroy
view_shake_at(x,y,24); // Screen shake

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

#define weapon_fire
//Fire sounds
sound_play(sndRocket)

view_shake_at(x,y,8); // Screen shake
wkick = 10;

//Create big nuke
with (instance_create(x+lengthdir_x(8, other.gunangle),y+lengthdir_y(8, other.gunangle),CustomProjectile)) {
	name = "bignuke";
	sound_play(sndRocketFly) //Some sound
	//Set some shit:
	active = 0 // Can not be controlled
	typ = 2 //Destructable
	team = other.team; // Set team
	motion_add(point_direction(x, y, mouse_x[other.index], mouse_y[other.index])-4+random(8),2); //Set direction
	creator = other; // Set creator
	image_angle = direction; //Set image angle
	sprite_index = global.sprBigNuke; //Set sprite
	image_speed = 1; // Set animation speed
	on_hit = nuke_hit;
	on_step = nuke_step;
	on_destroy = nuke_destroy;
	on_draw = nuke_draw;
	wait 8; //Wait
	if instance_exists(self) { //If it hasn't blown up
		active = 1; // Can now be controlled
	}
}

#define weapon_text
return "LITTLE BOY"; // Loading Tip