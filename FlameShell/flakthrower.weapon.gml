#define init
sprFlakthrower = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABYAAAAMCAYAAABm+U3GAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA7CAAAOwgEVKEqAAAAAB3RJTUUH4QMFAwQXhEsW/wAAAQRJREFUOMvdkjFqw0AQRZ9jt44EKxCoihsFLFS4WUwguYBARao0ewOfwNdxitQGXyCFCW5chLhQ6SIQkEDYbWBTyKtIlpWkjT8sf5id+TP7Wfhv6BxYn8jrH3p0S53R48IEcaSII0UYSADtuT5hIPkcU57n4fcScaQAdBwpk6/BCHfmixnzxYwszfFcH+HYDK6uuReK7sSiO7G4uYQwkOhHq5hw4Nup1WpFFdpzfQCEY7Pur8qL5Q4eMp/tIGG0l6z7q5J7Ly1WHIsajPayMXm5O81tG+swkGRpjnBssjQH4EkktYa7TWFHte79I2noNYQBXt+K5x9vXxH41dKa8B+/4ZniC9DfUzII84ziAAAAAElFTkSuQmCC", 3, 4);
global.sprFlameFlak = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACAAAAAQCAYAAAB3AH1ZAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QMFAgA70z3VLwAAAMtJREFUSMfNVcERgyAQ3CP/0AcVOHlYUcqhhNgID0uwD3zLXB5hnACnkowZsjM8xOV2D2UhCHAGfLumc+MM9BMIJ4Mk4ctdi+Rg/c+MwBnw0oH5oV+DkY44v3RgZ8C19ar4iXguLBjZK1o0UmNcFs9RmviokS0TzkjbvoX0c+TFUnFhrWS8dHwEeRfWRo4ayIyrs37i/NjWchUa4zQD4/wdV60Pg5aySc6tyH0v1E+gYH18R/LaQSNYXwZZ02P4F0HUMoqbX0bU+jp+AtCjJFcGEajjAAAAAElFTkSuQmCC", 2, 8, 8);

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
	motion_add(other.gunangle + (random_range(-2, 2) * other.accuracy), 11 + random(2));
	image_angle = direction;
	friction = 0.4;
	sprite_index = global.sprFlameFlak;
	mask_index = mskFlakBullet;
	team = other.team;
	creator = other;
	damage = 8;
	typ = 1;
	on_step = script_ref_create(flame_flak_on_step);
	on_destroy = script_ref_create(flame_flak_on_destroy);
	on_draw = script_ref_create(flame_flak_on_draw);
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
return sprFlakthrower; // Wep Sprite

#define weapon_text
return "ADVANCED FLARES"; // Loading Tip