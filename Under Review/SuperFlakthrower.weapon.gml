#define init
global.sprSuperFlakthrower = sprite_add_weapon("../Sprites/FlameShell/SuperFlakthrower.png", 3, 5)
global.sprFlameFlak = sprite_add("../Sprites/Projectiles/FlameShell/FlameFlak.png", 2, 8, 8);
global.sprSuperFlameFlak =  sprite_add("../Sprites/Projectiles/FlameShell/SuperFlameFlak.png", 2, 12, 12);

#define weapon_name
return "SUPER FLAKTHROWER"; // Name

#define weapon_type
return 2; // Shell Wep

#define weapon_load
return 68; // 2.26 Seconds

#define weapon_cost
return 8; // 8 Ammo

#define weapon_sprt
return global.sprSuperFlakthrower; // Wep Sprite

#define weapon_area
return 9; // L0 5-1+

#define weapon_swap
return sndSwapShotgun; // Swap sound

//BasicCannonProjectile
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

// SuperProjectile
#define ProStep2
//Create smoke:
if random(3) < 1
{
    with instance_create(x,y,Smoke)
    motion_add(random(360),random(2))
}

//Create flames: 
if random(4) < 1 {
    with instance_create(x,y,Flame) {
        creator = other;
        team = other.team
        move_contact_solid(direction,14)
    }
}

image_speed = speed/12

//If it stops it explodes
if speed = 0
instance_destroy()

#define ProDed2
view_shake_at(x,y,30); //Add shake

sound_play(sndFlakExplode); //Add sound
sound_play(sndDoubleFireShotgun);

qDir = 0 //Direction
repeat(5) { //Fire 5 projectiles
    with (instance_create(x,y,CustomProjectile)) { //Flame flaks
		name = "flameflak";
		motion_add(other.qDir,11+random(2));
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
    qDir += 360/5 //Change fire angle
}

//Create flames
repeat(16) {
    with instance_create(x,y,Flame)
    {
        creator = other;
        motion_add(random(360),6+random(2))
        team = other.team
        move_contact_solid(direction,14)
    }
}

//Create smoke
repeat(6)
{
    with instance_create(x,y,Smoke)
    motion_add(random(360),random(3))
}

#define ProDraw2
//Glow effect
draw_sprite_ext(sprite_index,image_index,x,y,2,2,image_angle,c_white,0.5)
draw_self()

#define weapon_fire
//Fire sound
sound_play(sndSuperFlakCannon)
sound_play(sndFireShotgun)
pointing = point_direction(x, y, mouse_x[index], mouse_y[index]) //Short point_direction variable

with (instance_create(x+lengthdir_x(14, other.pointing),y+lengthdir_y(14, other.pointing),CustomProjectile)) { //Create super flak
	name = "superflameflak";
    //Set some shit
    creator = other;
    friction = 0.4
    typ = 1 //Reflectable
    team = other.team;
    motion_add(point_direction(x, y, mouse_x[other.index], mouse_y[other.index])-4+random(8),11+random(2));
    image_angle = direction;
    sprite_index = global.sprSuperFlameFlak;
    mask_index = sprFlakBullet;
    image_speed = 1;
    on_step = ProStep2;
    on_destroy = ProDed2;
    on_draw = ProDraw2;
}