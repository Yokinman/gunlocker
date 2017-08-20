#define init
	global.sprHeavyToxicLauncher = sprite_add_weapon("../Sprites/HeavyGrenade/HeavyToxicLauncher.png", 5, 2)
	
	global.sprHeavyStickyNade = sprite_add("../Sprites/Projectiles/HeavyGrenade/HeavyStickyNade.png", 1, 4, 4)
	global.sprHeavyStickyNadeBlink = sprite_add("../Sprites/Projectiles/HeavyGrenade/HeavyStickyNadeBlink.png", 2, 4, 4)

#define weapon_name
	return "HEAVY TOXIC LAUNCHER"; // Name

#define weapon_type
	return 4; // Explosive Wep

#define weapon_load
	return 25; // 0.83 Seconds

#define weapon_cost
	return 2; // 2 Ammo

#define weapon_area
	return 7; // L0 3-3+

#define weapon_swap
	return sndSwapExplosive; // Swap sound

#define weapon_auto
	return 1; // Automatic

#define weapon_fire
	 // Sound:
	sound_play(sndHeavyNader);
	sound_play(sndToxicLauncher);

	 // Kick, Shift, Shake:
	weapon_post(10, -16, 12);

	 // Heavy Sticky nade:
	with instance_create(x, y, CustomProjectile) {
		motion_set(other.gunangle + ( random_range(-6, 6) * other.accuracy), 10)
		image_angle = direction
		creator = other
		team = other.team
		stick = 0
		image_speed = 0.4;
		friction = 0.2;
		alarm0 = 60
		alarm1 = 6
		typ = 1;
		sprite_index = global.sprHeavyStickyNade
		name = "heavytoxicnade"
		hitid = [sprite_index, "HEAVY TOXIC GRENADE"];
		on_step = hsn_step
		on_destroy = htn_destroy
		on_hit = hsn_hit
		on_wall = hsn_wall
	}
	
#define heavytoxicnade_create(_x, _y)
	instance_create(_x, _y, CustomProjectile) {
		stick = 0
		image_speed = 0.4;
		friction = 0.2;
		alarm0 = 60
		alarm1 = 6
		typ = 1;
		sprite_index = global.sprHeavyStickyNade
		name = "heavytoxicnade"
		hitid = [sprite_index, "HEAVY TOXIC GRENADE"];
		on_step = hsn_step
		on_destroy = htn_destroy
		on_hit = hsn_hit
		on_wall = hsn_wall
	}
	
#define hsn_wall
	sound_play(sndGrenadeStickWall);
	move_bounce_solid(true);
	speed = 0

#define hsn_hit
	if stick = 0 {
		sound_play(sndGrenadeStickWall);
		stick = other
		depth = stick.depth - 1
	}

#define hsn_step
	if !instance_exists(stick) {
		stick = 0
	}
	if stick != 0 {
		x = stick.x
		y = stick.y
	}
	
	 // Slow Down:
	if(alarm1 >= 0) alarm1 -= 1;
	if(alarm1 = 0){
		friction = 0.4;
		repeat(8) with instance_create(x,y,Smoke){
			motion_add(random(360), random(3));
		}
	}

	 // Melee Launching:
	var SlashTypes = [Slash, GuitarSlash, EnergySlash, EnergyHammerSlash, BloodSlash, LightningSlash];
	for(i = 0; i < array_length_1d(SlashTypes); i++){
		with(SlashTypes[i]) if(place_meeting(x,y,other)) with(other){
			motion_set(other.direction, 12);
			friction = 0.2;
			alarm1 = 6;
			view_shake_at(x, y, 5);
			sleep(50);
			with instance_create(x,y,Deflect) image_angle = other.direction;
		}
	}

	 // Blinks & Booms:
	if(alarm0 >= 0) alarm0 -= 1;
	if(alarm0 = 10) sprite_index = global.sprHeavyStickyNadeBlink;
	if(alarm0 = 0 || place_meeting(x,y,Explosion)) instance_destroy();

#define htn_destroy
	sound_play(sndExplosion)
	instance_create(x, y, GreenExplosion)
	repeat(24) with instance_create(x, y, ToxicGas) {
		motion_set(random(360), random(2))
		creator = other.creator
		hitid = [sprite_index, "TOXIC GAS"];
	}
	
#define weapon_sprt
	return global.sprHeavyToxicLauncher; // Wep Sprite