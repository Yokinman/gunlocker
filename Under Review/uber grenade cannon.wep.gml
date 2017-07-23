#define init // Define Sprites Using Base64: sprite_add_base64("base64",Frames,XOffset,YOffset)
global.spr_UberGrenadeCannon = sprite_add_weapon("../Sprites/HeavyGrenade/UberGrenadeCannon.png",4,6);
global.spr_BigHeavyNade = sprite_add("../Sprites/Projectiles/HeavyGrenade/BigHeavyNade.png",1,5,5);
global.spr_BigHeavyNadeBlink = sprite_add("../Sprites/Projectiles/HeavyGrenade/BigHeavyNadeBlink.png",2,5,5);
global.spr_HugeHeavyNade = sprite_add("../Sprites/Projectiles/HeavyGrenade/HugeHeavyNade.png",1,6,6);
global.spr_HugeHeavyNadeBlink = sprite_add("../Sprites/Projectiles/HeavyGrenade/HugeHeavyNadeBlink.png",2,6,6);

 // Slashes:
global.Slash[0] = Slash;
global.Slash[1] = GuitarSlash;
global.Slash[2] = EnergySlash;
global.Slash[3] = EnergyHammerSlash;
global.Slash[4] = BloodSlash;
global.Slash[5] = LightningSlash;

 // Shanks:
global.Shank[0] = Shank;
global.Shank[1] = EnergyShank;

// Coolest copy and pasting

#define weapon_name
return "UBER GRENADE CANNON"; // Weapon Name 

#define weapon_type
return 4; // Explosive Weapon

#define weapon_cost
return 32; // 132 ammo

#define weapon_area
return 18; // L1 1-2+

#define weapon_load
return 98; // 3.27 Seconds

#define weapon_swap
return sndSwapExplosive;

#define weapon_fire
sound_play(sndHeavyNader); // Sound
weapon_post(10, -30, 5);

with instance_create(x - lengthdir_x(1,gunangle), y - lengthdir_y(1,gunangle), CustomProjectile){ // Big Nade
	name = "ubernade";
	on_step = script_ref_create(ubernade_step);
	on_wall = script_ref_create(ubernade_wall);
	on_hit = script_ref_create(ubernade_hit);
	on_destroy = script_ref_create(ubernade_destroy);
    motion_set(other.gunangle + (random_range(-3, 3) * other.accuracy), 12);
	image_angle = direction;
	sprite_index = global.spr_HugeHeavyNade;
	friction = 0.4;
	image_speed = 0.4;
	alarm0 = 60;
	damage = 80;
	typ = 1;
	team = other.team;
	creator = other;
}

#define ubernade_step
 // Slashes Make Zoom:
for(i = 0; i < array_length_1d(global.Slash); i++) if(place_meeting(x,y,global.Slash[i])){
	with instance_place(x,y,global.Slash[i]) if(image_index < image_speed){
		other.direction = direction;
		with(other){
			image_angle = direction;
			with instance_create(x,y,Deflect) image_angle = other.direction;
			speed = 14;
		}
	}
}
 // Blinks & Booms:
alarm0 -= 1;
if(alarm0 < 10) sprite_index = global.spr_HugeHeavyNadeBlink;
if(alarm0 <= 0 || place_meeting(x,y,Explosion)) instance_destroy();
if(instance_exists(self)) for(i = 0; i < array_length_1d(global.Shank); i++){
	if(place_meeting(x,y,global.Shank[i])){
		instance_destroy();
		exit;
	}
}

#define ubernade_wall // Bounce Off Wall
if(speed > 0){
	move_bounce_solid(true);				// Bounce
	image_angle = direction;				// Correct Image Angle
	speed *= 0.6;							// Less Speed
	repeat(3) instance_create(x,y,Dust);	// Visual
	sound_play(sndGrenadeHitWall);			// Sound
}

#define ubernade_hit // When In Contact With An Enemy
with(hitme) if(place_meeting(x,y,other) && team != other.team && my_health > 0){
	 // Inv Frames:
	sprite_index = spr_hurt;
	image_index = 0;
	 // Sound:
	sound_play(snd_hurt);
	 // Knockback:
	motion_add(other.direction,4);
	 // Damage / Piercing:
	var newdmg = other.damage;
	newdmg -= my_health;
	my_health -= other.damage;
	with(other){
		if(speed = 0) damage = 0;
		else damage = newdmg;
		if(damage <= 0) instance_destroy();
	}
}

#define ubernade_destroy
 // Sound:
sound_play(sndGrenade);
sound_play(sndClusterOpen);
 // Create Grenades:
repeat(4) with instance_create(x,y, CustomProjectile){ // Big Nade
	name = "bigheavynade";
	on_step = script_ref_create(heavynade_step);
	on_wall = script_ref_create(heavynade_wall);
	on_hit = script_ref_create(heavynade_hit);
	on_destroy = script_ref_create(heavynade_destroy);
    motion_set(random(360), 5+random(4));
	image_angle = direction;
	sprite_index = global.spr_BigHeavyNade;
	friction = 0.4;
	image_speed = 0.4;
	alarm0 = 15;
	damage = 40;
	typ = 1;
	team = other.team;
	creator = other;
}

#define heavynade_step
 // Slashes Make Zoom:
for(i = 0; i < array_length_1d(global.Slash); i++) if(place_meeting(x,y,global.Slash[i])){
	with instance_place(x,y,global.Slash[i]) if(image_index < image_speed){
		other.direction = direction;
		with(other){
			image_angle = direction;
			with instance_create(x,y,Deflect) image_angle = other.direction;
			speed = 14;
		}
	}
}
 // Blinks & Booms:
alarm0 -= 1;
if(alarm0 < 10) sprite_index = global.spr_BigHeavyNadeBlink;
if(alarm0 <= 0 || place_meeting(x,y,Explosion)) instance_destroy();
if(instance_exists(self)) for(i = 0; i < array_length_1d(global.Shank); i++){
	if(place_meeting(x,y,global.Shank[i])){
		instance_destroy();
		exit;
	}
}

#define heavynade_wall // Bounce Off Wall
if(speed > 0){
	move_bounce_solid(true);				// Bounce
	image_angle = direction;				// Correct Image Angle
	speed *= 0.6;							// Less Speed
	repeat(3) instance_create(x,y,Dust);	// Visual
	sound_play(sndGrenadeHitWall);			// Sound
}

#define heavynade_hit // When In Contact With An Enemy
with(hitme) if(place_meeting(x,y,other) && team != other.team && my_health > 0){
	 // Inv Frames:
	sprite_index = spr_hurt;
	image_index = 0;
	 // Sound:
	sound_play(snd_hurt);
	 // Knockback:
	motion_add(other.direction,4);
	 // Damage / Piercing:
	var newdmg = other.damage;
	newdmg -= my_health;
	my_health -= other.damage;
	with(other){
		if(speed = 0) damage = 0;
		else damage = newdmg;
		if(damage <= 0) instance_destroy();
	}
}

#define heavynade_destroy
 // Sound:
sound_play(sndGrenade);
sound_play(sndClusterOpen);
 // Create Grenades:
repeat(8) with instance_create(x,y,HeavyNade){
	motion_set(random(360),4+random(3));
	image_angle = direction;
	sprite_index = sprHeavyGrenadeBlink;
	image_speed = 0.4;
	alarm0 = 20;
	team = other.team;
	creator = other.creator;
}


#define weapon_sprt
return global.spr_UberGrenadeCannon; // Gun sprite