#define init // Define Sprites Using Base64: sprite_add_base64("base64",Frames,XOffset,YOffset)
global.spr_SuperGrenadeCannon = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABYAAAAPCAYAAADgbT9oAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QMEFjsKHcJW5AAAAB1pVFh0Q29tbWVudAAAAAAAQ3JlYXRlZCB3aXRoIEdJTVBkLmUHAAAA40lEQVQ4y6WUPwqDMBTGvyfeQCi0UOpQ6O7mYi/QuVtP5+bsBeri5l7ooAgpCE49QDo0TWO0iY0fhAcJ7/f+EoJd/Mc9mZzIBj2dL2Btg812J22epVaGb4JGcYJwfwCAgY3iRA3A/wUbpQbQlWfpCMxdAtgy5sd1gHAVAADqrscT7vKmoEtU328y4xG07npnoBgo+Trs+vhCo/DtwNoGAKT9gKqyGAxPfffUqAJKtv2uysJaga9lSXNLn6pCB5OyanzJ4EQlpK8bTe00axvhkEg7py2e6R8x9VJ5I+3M7qnT7/YCSxZhEbVMLIkAAAAASUVORK5CYII=",4,6);
global.spr_GrenadeCannonball = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAkAAAAJCAYAAADgkQYQAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QMDFhwl8QHhYQAAAF5JREFUGNONkLENwDAIBI/Iu7CVF3HNIr8V0ziViZVESr4APaATYFyaPGUVgBkRAGQm7g7AGIOIMANm7x13JzMLsbwk2l5YhDvx4Id+DbUd/bbTIpmkauxZUl33+acTgj0p6PFEqFkAAAAASUVORK5CYII=",1,2,2);
global.spr_GrenadeCannonbomb = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPCAYAAAA71pVKAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QMEFhkHxMFseQAAAT9JREFUKM+lky+SwjAUxn9l8XFURkbEc4AIdK/ABXKG3Sv0Ar1CT9DBUh/x5JMoJjMYDKwhGQrMrNiYdF7y/ZkvXxs+r/uHWfPX4A4QYwRAVbHWAtD3/Rtm9Qwcx5EYI6pK27YAtG2LqhJjZBzHhavVM3CaJlQVY8zCjjEGVWWapgXB1+P8e7PZoKrs93tutxsiwvV65XK54Jxjt9txOBw4n88cj0eAnxVwL1aNMaSUquJ2u63fKaXq4JHJff16UUQAcM7hvX+bAZxOJwDWJVVVXSgWYNnneWae50UWawBrbU1XRKqS956UEiKCMeazcmF+vlAIRGQxyznXt18BTd/3WGvJOVebhbAs730FPgrT1JKEELDWMgzDQs05h4gwDAPWWkIIvJak6bquEuScF8EUxRACXdfViv6r281//qpfwxqtFJ8+VGEAAAAASUVORK5CYII=",1,7,7)
#define weapon_name
return "SUPER GRENADE CANNON"; // Weapon Name 

#define weapon_type
return 4; // Explosive Weapon

#define weapon_cost
return 12; //Costs 12 ammo to shoot

#define weapon_area
return 12; //Spawns past 6-1

#define weapon_load
return 65; //65 frame reload time

#define weapon_swap
return sndSwapExplosive;

#define weapon_fire

wkick = 10 // How Much Weapon Moves Back While Firing

    with instance_create(x, y, CustomProjectile){ //Creating the projectile
        motion_set((point_direction(x, y, mouse_x[other.index], mouse_y[other.index])+((2.5*random_range(-1, 1))*other.accuracy)), 10);
        image_angle = direction;
		sound_play(sndHeavyNader);
        team = other.team; // Projectile is Friendly (0 = Hostile/Prop, 1 = Enemy, 2 = Player, 3 = I.D.P.D.)
		creator = other; // Useful for Compatibility With Other Mods Among Other Things
		sprite_index = global.spr_GrenadeCannonbomb //Projectile Sprite
		friction = .3
		damage = 60
		on_destroy = script_ref_create(cannonbomb_pop); //on destruction of the projectile, run the cannonbomb_pop script
    }


#define weapon_sprt
return global.spr_SuperGrenadeCannon; // Gun sprite

#define step
	with(CustomProjectile) {
		if(speed == 0){ //Mimics flak cannon behavior by exploding when it stops
			instance_destroy()
		};
		
	}
#define cannonbomb_pop
repeat(4) with instance_create(x, y, CustomProjectile){ //Creating the projectile
	motion_set(random_range(0,360), 7);
	image_angle = direction;
	sound_play(sndGrenade);
	team = other.team; // Projectile is Friendly (0 = Hostile/Prop, 1 = Enemy, 2 = Player, 3 = I.D.P.D.)
	creator = other; // Useful for Compatibility With Other Mods Among Other Things
	sprite_index = global.spr_GrenadeCannonball //Projectile Sprite
	friction = .4
	damage = 20
	on_destroy = script_ref_create(cannonball_pop); //on destruction of the projectile, run the cannonball_pop script
}


#define cannonball_pop
repeat(4){ //creates four grenades
		with instance_create(x,y,Grenade){
			motion_set(random_range(0,360),5)
				};
		}
sound_play(sndGrenade);