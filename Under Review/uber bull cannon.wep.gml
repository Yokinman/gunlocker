#define init
global.sprUberBullCannon = sprite_add_weapon("../Sprites/HeavyBullet/UberBullCannon.png",2,3);
global.sprHeavyCannonBullet = sprite_add("../Sprites/Projectiles/HeavyBullet/HeavyCannonBullet.png",2,16,16);
global.sprUberCannonBullet = sprite_add("../Sprites/Projectiles/HeavyBullet/UberCannonBullet.png",2,24,24)

#define weapon_name
return "UBER BULL CANNON"; // Name 

#define weapon_type
return 1; // Bullet Wep

#define weapon_cost
return 110; // 110 Ammo

#define weapon_area
return 14; // L0 7-2+

#define weapon_load
return 50; // 1.67 Seconds

#define weapon_swap
return sndSwapMachinegun; // Swap Sound

#define bc_draw
draw_sprite_ext(sprite_index, image_index, x, y, 2, 2, image_angle, c_white, 0.5 ); // Glow effect
draw_self()

#define bc_dead
instance_create(x,y,BulletHit) 

fireAngle = random(360) // fire angle

repeat(15) { // Create 15 bullets
	with instance_create(x,y,HeavyBullet) {
		motion_add(other.fireAngle, 14 + random(2));
		image_angle = direction;
		team = other.team;
		creator = other.creator;
	}
	fireAngle += 24 // add fire angle
}

sound_play(sndFlakExplode) // Sound

#define sbc_draw
draw_sprite_ext(sprite_index, image_index, x, y, 2, 2, image_angle, c_white, 0.5 ); // Glow effect
draw_self()

#define sbc_dead
instance_create(x,y,BulletHit) 

fireAngle = random(360) // fire angle

repeat(5) { // Create 5 cannon bullets
	with instance_create(x,y,CustomProjectile) { //Heavy Cannon Bullet
		motion_add(other.fireAngle, 14);
		image_angle = direction
		mask_index = sprBullet1
		damage = 44
		name = "heavycannonbullet"
		sprite_index = global.sprHeavyCannonBullet
		team = other.team
		creator = other
		
		on_draw = bc_draw
		on_destroy = bc_dead
		
		image_speed = 0
		image_index = 1
	}
	fireAngle += 72	// add to fireangle
}

sound_play(sndSuperFlakExplode) // Sound

 // Create Charge Up Object:
#define weapon_fire
sound_play(sndSmartgun) // Sounds
sound_play(sndSuperFlakCannon)

weapon_post(15, -15, 20); // Weapon 

repeat(110){
	with instance_create(x,y,Shell){ // Empty Bullet Casings
		motion_add(other.gunangle + other.right*100 + random_range(-25,25),2+random(2))
	}
}

with instance_create(x+lengthdir_x(8,other.gunangle),y+lengthdir_y(8,other.gunangle),CustomProjectile) { //Cannon Bullet
	motion_add((random_range(-2,2) * other.accuracy) + other.gunangle, 14);
	image_angle = direction
	mask_index = sprBullet1
	damage = 110
	name = "ubercannonbullet"
	sprite_index = global.sprUberCannonBullet
	team = other.team
	creator = other
	
	on_draw = sbc_draw
	on_destroy = sbc_dead
	
	wait 1;
	if instance_exists(self) {
		image_speed = 0
	}
}

#define weapon_sprt
return global.sprUberBullCannon; // Wep Sprite