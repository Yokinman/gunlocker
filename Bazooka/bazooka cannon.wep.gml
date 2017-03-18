#define init
global.sprBazookaCannon = sprite_add_weapon("../Sprites/Bazooka/BazookaCannon.png", 12, 6);
global.sprBazookaCannonProjectile = sprite_add("../Sprites/Projectiles/Bazooka/BigRocket.png", 1, 12, 6);

#define weapon_name
return "BAZOOKA CANNON"; // Name

#define weapon_type
return 4; // Explosive Wep

#define weapon_cost
return 6; // 6 Ammo

#define weapon_area
return 14; // L0 7-1+

#define weapon_load
return 43; // 1.43 Seconds

#define weapon_swap
return sndSwapExplosive; // Swap Sound

#define weapon_fire
 // Sound:
sound_play(sndSuperBazooka);
sound_play(sndRocket);

weapon_post(15, -70, 15);

with(instance_create(x + lengthdir_x(10,gunangle), y + lengthdir_y(10,gunangle), CustomProjectile)){
	direction = other.gunangle;
	image_angle = direction;
	image_yscale = other.right;
	team = other.team;
	creator = other;
	damage = 40;
	typ = 2;
	sprite_index = global.sprBazookaCannonProjectile;
	flameframe = 0;
	
	on_draw = bc_draw;
	on_step = bc_step;
	on_destroy = bc_destroy;
}


#define bc_step
flameframe += 1;
instance_create(x - lengthdir_x(speed*2,image_angle),y - lengthdir_y(speed*2,image_angle),Smoke); // Smoke Effect
 // Gradually Speed Up:
if(speed < 12) speed += 0.5;
else speed = 10;
 // Explode When In Contact With Explosions:
if(place_meeting(x,y,Explosion)) instance_destroy();

 // Explode Into Missiles:
#define bc_destroy
sound_play(sndExplosionL); // Sound
view_shake_at(x, y, 20);   // Screenshake

var j = random(360);
for(var i = j; i < j+360; i += 360/3){
	with(instance_create(x+lengthdir_x(4, i), y+lengthdir_y(4, i), Explosion)){
		team = other.team;
		repeat(3) instance_create(x,y,SmallExplosion);
	}
}

var _x = x;
var _y = y;
var _team = team;
var _creator = creator;

var j = random(360);
for(var i = j; i < j+360; i += 360/5){
	with(instance_create(_x+lengthdir_x(24, i), _y+lengthdir_y(24, i), Rocket)){
		team = _team;
		creator = _creator;
		direction = i;
		image_angle = direction;
		
		var msk = mask_index;
		mask_index = mskNone;
		
		if(fork()){
			wait(5);
			
			if(instance_exists(self))
			mask_index = msk;
			
			exit;
		}
	}
}


 // Draw Rocket Flame:
#define bc_draw
draw_self();
draw_sprite_ext(sprRocketFlame,flameframe,x - lengthdir_x(4,image_angle),y - lengthdir_y(4,image_angle),1,1.2,image_angle,c_white,1);
draw_sprite_ext(sprRocketFlame,0,x,y,2,2,image_angle,c_white,0.1);

#define weapon_sprt
return global.sprBazookaCannon; // Wep Sprite

#define weapon_text
return "TOO MUCH?"; // Loading Tip