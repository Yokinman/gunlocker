#define init
global.sprFlakthrower = sprite_add_weapon("../Sprites/FlameShell/Flakthrower.png", 4, 4);
global.sprFlameFlak = sprite_add("../Sprites/Projectiles/FlameShell/FlameFlak.png", 2, 8, 8);

#define weapon_name
return "FLAKTHROWER"; // Name

#define weapon_type
return 2; // Shell Wep

#define weapon_cost
return 2; // 2 Ammo

#define weapon_load
return 26; // 0.87 Seconds

#define weapon_area
return 7; // L0 3-2+

#define weapon_swap
return sndSwapFlame; // Swap sound

#define weapon_fire
 // Sound:
sound_play(sndFlakCannon);
sound_play(sndFireShotgun);

weapon_post(8, -30, 5);

with (instance_create(x, y, CustomProjectile)){ // Flame Flak
	motion_add(other.gunangle + (random_range(-6, 6) * other.accuracy), 11 + random(2));
	image_angle = direction;
	friction = 0.4;
	sprite_index = global.sprFlameFlak;
	mask_index = mskFlakBullet;
	team = other.team;
	creator = other;
	damage = 10;
	bonus = 1;
	typ = 1;
	on_step = script_ref_create(flame_flak_on_step);
	on_destroy = script_ref_create(flame_flak_on_destroy);
	on_draw = script_ref_create(flame_flak_on_draw);
	
	while(instance_exists(self) && bonus = 1){
		wait 3;
		bonus = 0;
		damage -= 2;
	}
}

#define flame_flak_on_step
image_speed = speed/12;
if(random(2) < 1){
	with instance_create(x,y,Smoke) motion_add(random(360),random(2));
}
if(speed = 0 || place_meeting(x,y,Explosion)) instance_destroy();

#define flame_flak_on_destroy
 // Sound:
sound_play(sndFlakExplode);
sound_play(sndDoubleFireShotgun);

view_shake_at(x, y, 20) // Screenshake
 // Flames & Shells:
repeat(6){
	with instance_create(x,y,Smoke) motion_add(random(360),random(3));
	with (instance_create(x, y, Flame)){
		motion_add(random(360),3+random(2));
		team = other.team;
		creator = other.creator;
	}
}
repeat (14) with (instance_create(x, y, FlameShell)){
	motion_add(random(360), 8 + random(6));
	image_angle = direction;
	team = other.team;
	creator = other.creator;
}

 // Draw Flak Projectile Stuffs:
#define flame_flak_on_draw
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1.0);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * 2, image_yscale * 2, image_angle, image_blend, 0.25);
draw_set_blend_mode(bm_normal);

#define weapon_sprt
return global.sprFlakthrower; // Wep Sprite

#define weapon_text
return "ADVANCED FLARES"; // Loading Tip