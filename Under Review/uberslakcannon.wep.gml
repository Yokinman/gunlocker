#define init
global.sprUberSlakCannon = sprite_add_weapon("../Sprites/HeavySlug/UberSlakCannon.png", 3, 8);

#define weapon_name
return "UBER SLAK CANNON"; // Name

#define weapon_type
return 2; // Shell Wep

#define weapon_cost
return 24; // 12 Ammo

#define weapon_load
return 40; // 1.6 Seconds

#define weapon_area
return 16; // L0 7-3+

#define weapon_swap
return sndSwapExplosive; // Swap sound

#define weapon_fire
 // Sound:
sound_play(sndSuperFlakCannon);
sound_play(sndSlugger);

weapon_post(16, -30, 5);

with (instance_create(x, y, CustomProjectile)){ // Slak
	motion_add(other.gunangle + (random_range(-2, 2) * other.accuracy), 11 + random(2));
	image_angle = direction;
	friction = 0.75;
	sprite_index = sprSuperFlakBullet;
	image_xscale = 2.5
	image_yscale = image_xscale
	mask_index = mskSuperFlakBullet;
	team = other.team;
	creator = other;
	damage = 60;
	typ = 1;
	on_step = script_ref_create(shlak_on_step);
	on_destroy = script_ref_create(super_shlak_on_destroy);
	on_draw = script_ref_create(shlak_on_draw);
	on_wall = super_shlak_on_wall;
}

#define super_shlak_on_wall
repeat(2){
	with instance_nearest(x,y,Wall){
		instance_create(x,y,FloorExplo);
		instance_destroy();
	}
}

#define shlak_on_step
image_speed = speed/12;
if(random(3) < 1){
	with instance_create(x,y,Smoke) motion_add(random(360),random(2));
}
if(speed = 0 || place_meeting(x,y,Explosion)) instance_destroy();

#define super_shlak_on_destroy
 // Sound:
sound_play(sndFlakExplode);
sound_play(sndSlugger);

view_shake_at(x, y, 20) // Screenshake
repeat (random_range(4,6)) with (instance_create(x, y, CustomProjectile)){
	motion_add(random(360), 11 + random(2));
	image_angle = direction;
	friction = .75;
	sprite_index = sprSuperFlakBullet;
	image_xscale = 1.5
	image_yscale = image_xscale
	mask_index = mskSuperFlakBullet;
	team = other.team;
	creator = other;
	damage = 140;
	typ = 1;
	on_step = script_ref_create(shlak_on_step);
	on_destroy = script_ref_create(shlak_on_destroy);
	on_draw = script_ref_create(shlak_on_draw);
}
repeat(5){
	with instance_create(x,y,Smoke) motion_add(random(360),random(3)); 
}


#define shlak_on_destroy
 // Sound:
sound_play(sndFlakExplode);
sound_play(sndHeavySlugger);

view_shake_at(x, y, 20) // Screenshake
repeat (random_range(4,6)) with (instance_create(x, y, HeavySlug)){
	motion_add(random(360), 12 + random(2));
	image_angle = direction;
	team = other.team;
	creator = other.creator;
}
repeat(5){
	with instance_create(x,y,Smoke) motion_add(random(360),random(3)); 
}


 // Draw Flak Projectile Stuffs:
#define shlak_on_draw
draw_sprite_ext(sprite_index, image_index, x, y, .8*image_xscale, .8*image_yscale, image_angle, image_blend, 1.0);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.25);
draw_set_blend_mode(bm_normal);

#define weapon_sprt
return global.sprUberSlakCannon; // Wep Sprite

#define weapon_text
return "BIGGEREST BOYS"; // Loading Tip