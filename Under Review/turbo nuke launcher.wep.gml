#define init
	global.sprTurboNukeLauncher = sprite_add_weapon("../Sprites/Nuke/TurboNukeLauncher.png", 8, 10);
	
	global.sprMiniNuke = sprite_add("../Sprites/Projectiles/Nuke/MiniNuke.png", 1, 7, 3);

#define weapon_name
	return "TURBO NUKE LAUNCHER"; // Name

#define weapon_type
	return 4; // Explosive Wep

#define weapon_cost
	return 3; // 3 Ammo

#define weapon_load
	return 3; // 0.10 Seconds

#define weapon_area
	return 20; // L1 2-1+
	
#define weapon_auto
	return 1; // Automatic
	
#define weapon_swap
	return sndSwapExplosive; // Swap Sound

#define weapon_fire
	sound_play(sndNukeFire);		// Sounds
	sound_play(sndSmartgun);
	weapon_post(15, -20, 20);		// Kick, Shift, Shake
	motion_add(gunangle + 180, 2);	// Knockback
	
	// Mini nuke
	with instance_create(x, y, CustomProjectile) {
		motion_set(other.gunangle + (random_range(-64, 64) * other.accuracy), 2)
		creator = other
		image_angle = direction
		team = other.team
		name = "MiniNuke";
		sprite_index = global.sprMiniNuke;
		hitid = [sprite_index, "MINI NUKE"];
		damage = 40;
		typ = 2;
		alarm1 = 4;
		active = 0;
		on_step = mn_step
		on_draw = mn_draw
		on_destroy = mn_destroy
	}
	
#define mini_rocket_create( _x, _y)
	with instance_create(_x, _y, CustomProjectile) {
		name = "MiniNuke";
		sprite_index = global.sprMiniNuke;
		hitid = [sprite_index, "MINI NUKE"];
		damage = 40;
		typ = 2;
		alarm1 = 4;
		active = 0;
		on_step = mn_step
		on_draw = mn_draw
		on_destroy = mn_destroy
	}
	
#define mn_draw
	 // Draw Rocket Flame:
	if(active){
		draw_sprite_ext(sprRocketFlame, -1, x - lengthdir_x(4,image_angle), y - lengthdir_y(4,image_angle), 1, 1.2, image_angle, c_white, image_alpha);
		draw_set_blend_mode(bm_add);
		draw_sprite_ext(sprRocketFlame, 0, x, y, 2 * image_xscale, 2 * image_yscale, image_angle, c_white, 0.1);
	}
	draw_set_blend_mode(bm_normal);
	draw_self();

#define mn_step
	 // Active-ness:
	if(alarm1 >= 0){
		alarm1--;
		if(alarm1 = 0){
			active = 1;
			view_shake_at(x, y, 2);
		}
	}
	
	//Create a trail of smoke
	if(active) {
		instance_create(x,y,Smoke)
		if speed > 5
		speed = 5

		motion_add(point_direction(x,y,mouse_x[creator.index],mouse_y[creator.index]),1) //Can be controlled
		motion_add(direction,1)
	}

	image_angle = direction

#define mn_destroy
	view_shake_at(x,y,24); // Screen shake

	sound_stop(sndRocketFly)

	sound_play(sndExplosionXL)
	//First ring of explosions
	ang = random(360)
	repeat(4) {
		instance_create(x+lengthdir_x(12,ang),y+lengthdir_y(12,ang),Explosion)
		ang += 360/4
	}

#define weapon_sprt
	return global.sprTurboNukeLauncher; // Wep Sprite