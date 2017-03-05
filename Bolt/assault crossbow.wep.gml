#define init 
sprAssaultCrossbow = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABgAAAAOCAYAAAA1+Nx+AAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QEUFhwxXNUJWgAAAB1pVFh0Q29tbWVudAAAAAAAQ3JlYXRlZCB3aXRoIEdJTVBkLmUHAAABT0lEQVQ4y82TsUoDQRCGv1XLBA4ucHCFJs1dcRypvJeIpLS7XjBFSgmKTbBJ6xuksxRtbezShhQXBKNIIJBA3mBt3LtNdhOuUHCanf2HnX9m/ln4Yzv8rUS+F1CtuFQrLjeDAWHzlNHrC6JsgjhKDGw8GcktyMhnAJ1eP/dnbxlPD0MAaeEUgPS9gO7tFZ9fc+7vrgFEp9dXvkFgq0juqH6DBGC+mAII3wuYL6bEUbJBIHdUT7uVGgSPz0NDAxuJ0Ku2VbparnFrDqvlOsfU3a05NOphjr/PsryzOEoYT0Yc6ewAJ1HIxyTLT51EJy3OzIjbRJY6ibKfdtkX07tv1EM1OtFupcUYz85TJbD0vUD6XiC3BJe+F8g4ShS+EYujRLZbaY7rmh0ASkzbn1CkuDVH3xyhJSe9vOC4WWih+9Y11UeiJS671vuBsg//jX0DC6SNH/HoGggAAAAASUVORK5CYII=",5,6);

#define weapon_name
return "ASSAULT CROSSBOW"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_cost
return 3; // 3 Ammo

#define weapon_area
return 7; // L0 3-2+

#define weapon_load
return 26; // 0.86 Seconds

#define weapon_swap
return sndSwapBow; // Swap Sound

#define weapon_fire
repeat(3) if instance_exists(self){
	sound_play(sndCrossbow) // Sound
	weapon_post(4, -20, 4);
	
	with instance_create(x,y,Bolt){ // Bolts
		motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+((4*random_range(-1, 1))*other.accuracy),24)
		image_angle = direction;
		team = other.team;
		creator = other;
	}
	wait(3);
}

#define weapon_sprt
return sprAssaultCrossbow; // Wep Sprite

#define weapon_text
return "POINTY BARRAGE"; // Loading Tip