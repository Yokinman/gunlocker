#define init
global.sprSlakCannon = sprite_add_weapon("../Sprites/Slug/SlakCannon.png", 3, 3);

#define weapon_name
return "SLAK CANNON"; // Name

#define weapon_type
return 2; // Shell Wep

#define weapon_cost
return 3; // 3 Ammo

#define weapon_load
return 27; // 0.9 Seconds

#define weapon_area
return 6; // L0 3-1+

#define weapon_swap
return sndSwapExplosive; // Swap sound

#define weapon_fire
 // Sound:
sound_play(sndFlakCannon);
sound_play(sndSlugger);

weapon_post(8, -30, 5);

with (instance_create(x, y, CustomProjectile)){ // Slak
	motion_add(other.gunangle + (random_range(-2, 2) * other.accuracy), 11 + random(2));
	image_angle = direction;
	friction = 0.4;
	sprite_index = sprFlakBullet;
	image_xscale = 1.5
	image_yscale = image_xscale
	mask_index = mskFlakBullet;
	team = other.team;
	creator = other;
	damage = 30;
	typ = 1;
	on_step = script_ref_create(slak_on_step);
	on_destroy = script_ref_create(slak_on_destroy);
	on_draw = script_ref_create(slak_on_draw);
}

#define slak_on_step
image_speed = speed/12;
if(random(3) < 1){
	with instance_create(x,y,Smoke) motion_add(random(360),random(2));
}
if(speed = 0 || place_meeting(x,y,Explosion)) instance_destroy();


#define slak_on_destroy
 // Sound:
sound_play(sndFlakExplode);
sound_play(sndSlugger);

view_shake_at(x, y, 20) // Screenshake
repeat (random_range(4,6)) with (instance_create(x, y, Slug)){
	motion_add(random(360), 14 + random(3));
	image_angle = direction;
	team = other.team;
	creator = other.creator;
}
repeat(5){
	with instance_create(x,y,Smoke) motion_add(random(360),random(3)); 
}


 // Draw Flak Projectile Stuffs:
#define slak_on_draw
draw_sprite_ext(sprite_index, image_index, x, y, .8*image_xscale, .8*image_yscale, image_angle, image_blend, 1.0);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.25);
draw_set_blend_mode(bm_normal);

#define weapon_sprt
return global.sprSlakCannon; // Wep Sprite

#define weapon_text
return "BIG BOYS"; // Loading Tip