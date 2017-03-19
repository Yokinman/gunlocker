#define init
global.sprSuperBloodCannon = sprite_add_weapon("../Sprites/Blood/SuperBloodCannon.png", 5, 5)
global.sprBigBloodBall = sprite_add("../Sprites/Projectiles/Blood/BigBloodBall.png",3,24,24)

#define step 
if(argument0) { //Is the weapon in the primary slot
	if can_shoot = 1 { //If the weapon is reloaded
		if(button_pressed(index, "fire")) { //When trying to fire
			if ammo[4] < 12 { //If you're ouy of ammo
				//Pay health to fire:
				sound_play(snd_hurt) 
				ammo[4] += 12
				my_health -= 2
				sprite_index = spr_hurt
				image_index = 0
				player_fire(gunangle);
			}
		}
	}
}

#define weapon_name
return "SUPER BLOOD CANNON"; // Name

#define weapon_type
return 4; // Explosive Wep

#define weapon_load
return 64; // 2.13 Seconds

#define weapon_cost
return 12; // 12 Ammo

#define weapon_sprt
return global.sprSuperBloodCannon; // Wep Sprite

#define weapon_area
return 15; // L0 7-3+

#define weapon_swap
return sndSwapExplosive; // Swap sound

#define ProHit
//Destroy projectile when colliding with enemy
if team != other.team {
    other.my_health -= 60
}
instance_destroy()

#define ProStep
//Create meat explosions and Blood streaks while rotating
image_angle += 4;
if random(3) < 1 {
    repeat(random(5)) {
        creator = other;
        instance_create(x-64+random(128),y-64+random(128),MeatExplosion)
    }
}
if random(3) < 1 {
    creator = other;
    instance_create(x,y,BloodStreak)
}

#define ProDed
//When destroyed create some meat explosions and small meatballs 
sound_play(sndBloodCannonEnd);
repeat(8+random(3)) {
    with instance_create(x-80+random(160),y-80+random(160),MeatExplosion) {
        creator = other;
    }
}
repeat(6) { //Fire 6 times
    with instance_create(x,y,BloodBall) {
        creator = other;
        team = other.team
        motion_add(random(360),6)
    }
}

#define weapon_fire
//Create big meatball:
with (instance_create(x,y,CustomProjectile)) {
	name = "bigbloodball";
    //Set some shit
    creator = other;
    team = other.team;
    motion_add(point_direction(x, y, mouse_x[other.index], mouse_y[other.index])-4+random(8), 3);
    image_angle = direction;
    sprite_index = global.sprBigBloodBall;
    mask_index = sprBloodBall;
    image_speed = 0.5;
    type = 2; //Destructable
    on_hit = ProHit;
    on_step = ProStep;
    on_destroy = ProDed;
}

#define weapon_text
return "BIG MEATBALLS"; // Loading Tip