#define init
	global.sprNitroBazooka = sprite_add_weapon("../Sprites/Bazooka/NitroBazooka.png", 8, 5);
	
	global.sprMiniRocket = sprite_add("../Sprites/Projectiles/Bazooka/MiniRocket.png", 1, 7, 3);

#define weapon_name
	return "NITRO BAZOOKA"; // Name

#define weapon_type
	return 4; // Explosive Wep

#define weapon_cost
	return 2; // 2 Ammo

#define weapon_load
	return 3; // 0.10 Seconds

#define weapon_area
	return 23; // L1 3-3+
	
#define weapon_auto
	return 1; // Automatic
	
#define weapon_swap
	return sndSwapExplosive; // Swap Sound

#define weapon_fire
	sound_play(sndRocket);			// Sounds
	sound_play(sndSmartgun);
	weapon_post(14, -15, 20);		// Kick, Shift, Shake
	motion_add(gunangle + 180, 2);	// Knockback

	// Rocket
	repeat(2) with instance_create(x, y, CustomProjectile) {
		motion_set(other.gunangle + (random_range(-16, 16) * other.accuracy), 2)
		creator = other
		team = other.team
		image_angle = direction
		name = "MiniRocket";
		sprite_index = global.sprMiniRocket;
		hitid = [sprite_index, "MINI ROCKET"];
		damage = 12;
		typ = 2;
		alarm1 = 4;
		active = 0;
		on_step = mr_step
		on_draw = mr_draw
		on_destroy = mr_destroy
	}
	
#define mini_rocket_create( _x, _y)
	with instance_create(_x, _y, CustomProjectile) {
		name = "MiniRocket";
		sprite_index = global.sprMiniRocket;
		hitid = [sprite_index, "MINI ROCKET"];
		damage = 12;
		typ = 2;
		alarm1 = 4;
		active = 0;
		on_step = mr_step
		on_draw = mr_draw
		on_destroy = mr_destroy
	}
	
#define mr_step
	 // Active-ness:
	if(alarm1 >= 0){
		alarm1--;
		if(alarm1 = 0){
			active = 1;
			view_shake_at(x, y, 2);
		}
	}

	if(active){
		 // Smoke Trail:
		 if random(2) < 1
		instance_create(x - lengthdir_x(speed * 2, image_angle), y - lengthdir_y(speed * 2, image_angle), Smoke);

		 // Gradually Speed Up:
		if(speed < 12) speed += 0.5;
		else speed = 10;
	}
	
	//Doesn't explode when touching other explosions to prevent it for exploding in your face
	
#define mr_draw
	 // Draw Rocket Flame:
	if(active){
		draw_sprite_ext(sprRocketFlame, -1, x - lengthdir_x(4,image_angle), y - lengthdir_y(4,image_angle), 1, 1.2, image_angle, c_white, image_alpha);
		draw_set_blend_mode(bm_add);
		draw_sprite_ext(sprRocketFlame, 0, x, y, 2 * image_xscale, 2 * image_yscale, image_angle, c_white, 0.1);
	}
	draw_set_blend_mode(bm_normal);
	draw_self();
	
#define mr_destroy
	sound_play(sndExplosionL);	// Sound
	view_shake_at(x, y, 10);	// Screenshake

	 // Explosions:
	with instance_create(x,y,Explosion){
		hitid = [sprite_index, "EXPLOSION"];
		creator = other;
	}

#define weapon_sprt
	return global.sprNitroBazooka; // Wep Sprite