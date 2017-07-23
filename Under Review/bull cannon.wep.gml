#define init
global.sprBullCannon = sprite_add_weapon("../Sprites/Bullet/BullCannon.png",2,3);
global.sprCannonBullet = sprite_add("../Sprites/Projectiles/Bullet/CannonBullet.png",2,12,12)

#define weapon_name
return "BULL CANNON"; // Name 

#define weapon_type
return 1; // Bullet Wep

#define weapon_cost
return 12; // 12 Ammo

#define weapon_area
return 5; // L0 3-1+

#define weapon_load
return 20; // 0.67 Seconds

#define weapon_swap
return sndSwapMachinegun; // Swap Sound

#define bc_draw
draw_sprite_ext(sprite_index, image_index, x, y, 2, 2, image_angle, c_white, 0.5 ); // Glow effect
draw_self()

#define bc_dead
instance_create(x,y,BulletHit) 

fireAngle = random(360) // fire angle

repeat(15) { // Create 15 bullets
	with instance_create(x,y,Bullet1) {
		motion_add(other.fireAngle, 14 + random(2));
		image_angle = direction;
		team = other.team;
		creator = other.creator;
	}
	fireAngle += 24 // add fire angle
}

sound_play(sndFlakExplode) // Sound

 // Create Charge Up Object:
#define weapon_fire
sound_play(sndSmartgun) // Sounds
sound_play(sndFlakCannon)

weapon_post(10, -10, 12); // Weapon 

repeat(12){
	with instance_create(x,y,Shell){ // Empty Bullet Casings
		motion_add(other.gunangle + other.right*100 + random_range(-25,25),2+random(2))
	}
}

with instance_create(x+lengthdir_x(8,other.gunangle),y+lengthdir_y(8,other.gunangle),CustomProjectile) { //Cannon Bullet
	motion_add((random_range(-2,2) * other.accuracy) + other.gunangle, 14);
	image_angle = direction
	mask_index = sprBullet1
	damage = 22
	name = "cannonbullet"
	sprite_index = global.sprCannonBullet
	team = other.team
	creator = other
	
	on_draw = bc_draw
	on_destroy = bc_dead
	
	wait 1;
	if instance_exists(self) {
		image_speed = 0
	}
}

#define weapon_sprt
return global.sprBullCannon; // Wep Sprite