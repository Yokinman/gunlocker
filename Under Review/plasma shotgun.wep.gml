#define init
global.sprPlasmaShotgun = sprite_add_weapon("../Sprites/Plasma/PlasmaShotgun.png", 5, 5);
global.sprMiniPlasma = sprite_add("../Sprites/Projectiles/Plasma/MiniPlasma.png", 2, 6, 6);
global.sprMiniPlasmaExplode = sprite_add("../Sprites/Projectiles/Plasma/MiniPlasmaExplode.png", 7, 12, 12);

#define weapon_name
return "PLASMA SHOTGUN"; // Name 

#define weapon_type
return 5; // Energy Wep

#define weapon_cost
return 4; // 4 Ammo

#define weapon_area
return 9; // L0 4-1+

#define weapon_load
return 38; // 1.26 Seconds

#define weapon_sprt
return global.sprPlasmaShotgun; // Wep Sprite

#define weapon_swap
return sndSwapEnergy; // Swap Sound

#define weapon_fire
 // Sound:
if(skill_get(17)) {
	sound_play(sndPlasmaRifle)
} else {
	sound_play(sndPlasmaRifleUpg)
}

repeat(7) {
	with instance_create(x+lengthdir_x(4, gunangle),y+lengthdir_y(4, gunangle),CustomProjectile) {
		typ = 2 // Destructable
		image_speed = 0 // Set animation speed
		name = "miniplasma" // Set name for compatability
		creator = other // Set creator
		motion_add(point_direction(x,y,mouse_x,mouse_y)-24+random(48),5+random(3)) // Set in motion
		image_angle = direction // set image angle
		team = other.team // Set team
		sprite_index = global.sprMiniPlasma // Set sprite
		
		if(skill_get(17)) { // If you have laser brain make the ball bigger
			image_xscale = 1.5
			image_yscale = 1.5
		}
		
		on_step = miniPlasmaStep // Set on step
		on_draw = miniPlasmaDraw // Set on draw
		on_wall = miniPlasmaWall // Set on wall
		on_hit = miniPlasmaHit // Set on hit
		on_destroy = miniPlasmaDead // Set on dead
	}
}

wkick = 4 // wkick
motion_add(gunangle-180,6) // Add motion to player

wait 1;
with CustomProjectile { //Change image sprite for reasons
	if name = "miniplasma" {
		image_index = 1
	}
}

#define miniPlasmaDraw
//DRAW GLOW:
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1.0);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * 2, image_yscale * 2, image_angle, image_blend, 0.25);
draw_set_blend_mode(bm_normal);

#define miniPlasmaHit
with other //Hurt enemy
{
	my_health -= 1
	sprite_index = spr_hurt
	image_index = 0
	motion_add(other.direction,16)
}
sound_play(other.snd_hurt)

//Make plasma smol
image_xscale -= 0.05
image_yscale -= 0.05

//Stop it
y += lengthdir_y(-speed, image_angle)
x += lengthdir_x(-speed, image_angle)

#define miniPlasmaWall
instance_create(x,y,Dust) //Dust

//smolify:
image_xscale -= 0.05
image_yscale -= 0.05

#define miniPlasmaStep
if random(5) < 1 { //Create plasma trail:
	with instance_create(x-4+random(8), y-4+random(8), PlasmaTrail){
		image_speed = 0.3;
		friction = -0.1;
		//direction = other.direction+10*random_range(-1, 1)+180;
	}
}

if image_xscale < 0.6 { //If the plasma is to small then explode
	instance_destroy()
}

#define miniPlasmaDead
//Destroyed plasma shit:
sound_play(sndPlasmaHit)
with instance_create(x,y,PlasmaImpact) { // Normal plasma explosion in my miniplasma. It's more likely than you think.
	sprite_index = global.sprMiniPlasmaExplode
}