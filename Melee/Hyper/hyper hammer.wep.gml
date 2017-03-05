#define init
global.sprHyperHammer = sprite_add_weapon_base64("iVBORw0KGgoAAAANSUhEUgAAAB0AAAATCAYAAABsmQZ/AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAACqSURBVEhL7ZIxDsMgDEW5QqdIXbJ1ibr2Eki5QS/Rc+WOrr7ByDgZ+Ux50hfxB/Kx5ERAnKYh609U+K6agjzyEcOn0IKxoi42Fw17bx8V6mLzkefyah2jLjaX1ulVt6xXaNievyp0DU83wpQNFYKg2G033tiwQ3hdXE3+nP+phXjP3+lC3VgPVXxA9ZWuGIgGWqeoq+icOmTTzQvqYnNpoW5m6FiQ1w2TlP4b99RA3c+uKwAAAABJRU5ErkJggg==",
8, 9);
global.sprHyperHammerBGN = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAFEAAAAwCAYAAABpJ5bJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAALYSURBVGhD7ZlZkpwwEETnzL7QHMUfPofPgivVVURKpAAtY2bRi3jRUAiRZLvDH/M2wvufv1ujfuc1WFtR7av0na7B2jtu2yZtwjbKgnZwCMbwHGtDO+95pu/6QuyZyddojX1kyHWX/Hr/vUGxYQ+HAPwihXtxnfob5AXimLTRi2IutWXSKrXycM42sj/Y7j0E81ns7UnG8X39rB/Oyh7g8iCIY+jLEjyHN5AhSm2vKS89G5UVZkSBpX45EbObpZXIEDWjzIrZF0h60nZwrzJQGeEOlwZ9vBPzQWSIUvUiriotyfjMkx+xJX50LA7X+JgE5SyZqBUH4lqpPUS+wAUyxJV4IYZfkCmy+HQMflbNU7g0H0kQvmaBDHFH28uf9hwqF/xQRJkyxF2fLlJlgtPhn7tAhmjxySJVHjgN/umfFClDtPitS6yBIkkZotWnilRZ4H8HBYyW+eNLDEbLfKJIlQM+Tm+Rq8SCniJXiYKvUKTKAD8VrUWuEgWrxEm0FLlKrLBKnMAqcQKrxAmsEiewSpzAKnECq8RBWgqEq0TBKnGQ1gLhKpH4CgUClQM+Tk+BcJVooITeAuGPLnG0PPhEgUBlgR+OvfD6k+ld1h/vJ3JSIJAhWvwRJTIoMnRkiLs+WSBQmeAp/NP0kYTLKi2QIe5oe/nTxsBeNWrXbJ4u4EOZOCuKi2RPijpDhriyLBDncY0psvh0DH5WzZ2yJB/vxHwQGaIUwStmXx7L+MyTn4N1NW2rLBOfsxlcIuuXEzGzTe3+ZmSImvxCwr3AQk/aDu5VBiojPMAlQRDH0JcleA5vIEOU2l5Z+M+Cygqr1P7FRWFhI/uD7d6kmMXenmQc39fP+uGs7CW1Mjs5BIgXFO5fVKf+Bvl/DjgmbfSimEttmbQJ2ygL2sEhGMNzrA3tvOeZvusLsWcmX6M19pEh1w2BhzTqd16DtRXVvkrf6RqsvaMqcNu2t398/1Kk8CIjXQAAAABJRU5ErkJggg==",
3, 26, 24);
global.sprHyperHammerMID = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAMAAAAwCAYAAADUxsC8AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAABOSURBVChTY5h/+O5/EGYAgf9IAJkDkQEpg3NADBAmzAEB8gyAqQdzQAAoAMajAArgAYISVCAWiAHCBDgwfTAZEKCeAWAAdhsIMzAwMAAA41cMlFJSlYMAAAAASUVORK5CYIIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==",
3, 0, 24);
global.sprHyperHammerEND = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAD8AAAAwCAYAAACmCaIKAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAKsSURBVGhD7ZQBbuwgDET3/pfoYf45epYtQ8aRSWKwwfm7q/ZJUQ0x4xnS9vH17/v5SAaaGbrP57M+rCt1ocDWxbYPCIrZRNOVbN106LNh1TBlTmRcQjlfvzQeaGnY0vSo7TM41GPGsJzBc8WM5i3Qz5BZw3LuiqwLKDqstnksG3TPDn24mTWMc3iOzOodKVKstkwsG07baIyyYvjqErIuIAznh+kZxnuWJpELKO/2rybn6kIhPfgpWJp7T1WapCNe33NpIn2CpSeUFlb2BWPb21dfrjAyPEJfwKpWGM5d4mMvgDOXsAxjXx5umaCnp3ULMnSVnmm8k4dbl3j7UpGBK3gMywwuLxEvXA7Rcpb2YOSGDJ7FY1r0ubwkEr707uEsbd0zRESieE1bJgWvjqClLN3OuDMzFxAxjX6W78mdFyDaXL4n0Qt41dcvc1ltnlk26B4XnxJeS1m6U+MiFxAJH+kdUUaz+pDwH8FfeCd/4V9AGc3qF/7Nl9GsfmH4MpfV5pdlg+5xc1f4SO9LiAQHkUDoZ7mElrE0p0a9e/gybw8mXutCoXvcRIMDb3jLaBQtYemFx9wZHKCf5XsxExxkffXIJaaBobPBgcf0KDj4r+FXQ4PM4B6tFFZDCz3DEmgUytuXBr0vYZmNhEFPT6u8YpX4Xx1Cq3jC9ZDg4KhV1nso6asLhe4Bh/rUD+o2Xq5wNBtFAoFVLYCLECy9vYdzp+iI1/dcmkifYOndBueG6RnFe5Ym2cGLBCt7/mkbjVFWjOJsdvByntWmz7JB9+xwvptZoziH58isXgr0METM85gbKzSY1Ku/vniOumxpetT2GRzqgQFRk3IGzxUzmrdAPw3aPNtCUOZEVLMc2b9cFSjUhQJbF9s+IKjDRsxZQBNk66Zzh6m3DdvwePwAhrnDEoT+vcoAAAAASUVORK5CYII=",
3, 0, 24);

#define weapon_name
return "HYPER HAMMER"; // Name

#define weapon_cost
return 0; // 0 Ammo

#define weapon_area
return 24; // L1 3-3+

#define weapon_load
return 15; // 0.50 Seconds

#define weapon_swap
return sndSwapHammer; // Swap Sound

#define weapon_fire
 // Sound:
sound_play(sndHammer);
sound_play(sndHyperRifle);
sound_play(sndHyperSlugger);

wepangle = -wepangle; // Flip Wep To Other Side

 // Heavy Hyper Swingaroo:
with(instance_create(x+lengthdir_x(24, gunangle), y+lengthdir_y(24, gunangle), CustomProjectile)){
	direction = other.gunangle;
	team = other.team;
	creator = other;
	damage = 20;
	typ = 0;
	sprite_index = sprVoid;
	mask_index = mskSlash;
	tries = 200 + (skill_get(13)*200);
	
	on_hit = hh_hit;
	
	var trail1 = instance_create(x, y, CustomObject);
	trail1.sprite_index = global.sprHyperHammerBGN;
	trail1.image_speed = 0.3;
	trail1.image_angle = direction;
	
	var trail2 = instance_create(x, y, CustomObject);
	trail2.sprite_index = global.sprHyperHammerMID;
	trail2.image_speed = 0.3;
	trail2.image_angle = direction;
	
	var trail3 = instance_create(x, y, CustomObject);
	trail3.sprite_index = global.sprHyperHammerEND;
	trail3.image_speed = 0.3;
	trail3.image_angle = direction;
	
	if(fork()){
		while(instance_exists(trail1)){
			if(trail1.image_index+trail1.image_speed >= trail1.image_number){
				instance_delete(trail1);
				instance_delete(trail2);
				instance_delete(trail3);
			}
			wait(1);
		}
		exit;
	}
	
	while(instance_exists(self) && tries > 0){
		tries -= 1;
		
		x += lengthdir_x(4, direction);
		y += lengthdir_y(4, direction);
		
		 // Hurt Enemies/Props:
		if(instance_exists(hitme) && distance_to_object(hitme) <= 0) with(hitme){
			if(distance_to_object(other) <= 0 && my_health > 0 && team != other.team && sprite_index != spr_hurt){
				my_health -= other.damage;
				sound_play(snd_hurt);
				image_index = 0;
				sprite_index = spr_hurt;
				motion_add(other.direction, 4);
			}
		}
		
		 // Deflect/Break Projectiles:
		if(instance_exists(projectile) && distance_to_object(projectile) <= 0) with(projectile){
			if(team != other.team && distance_to_object(other) <= 0){
				if(typ = 1){
					with instance_create(x,y,Deflect) image_angle = direction;
					direction = other.direction;
					image_angle = direction;
					team = other.team;
				}
				if(typ = 2) instance_destroy();
			}
		}
		
		 // Break Walls:
		if(instance_exists(Wall) && distance_to_object(Wall) <= 0){
			var walls = 0;
			with(Wall) if(distance_to_object(other) <= 0) walls += 1;
			if(walls >= 2) tries = 0;
			else with(Wall){
				if(distance_to_object(other) <= 0){
					instance_create(x, y, FloorExplo);
					instance_destroy();
				}
			}
		}
	}
	
	x += lengthdir_x(32, direction);
	y += lengthdir_y(32, direction);
	
	while(distance_to_object(Wall) <= 0){
		with(instance_nearest(x, y, Wall)){
			instance_create(x, y, FloorExplo);
			instance_destroy();
		}
	}
	with(hitme) if(distance_to_object(other) <= 0 && team != other.team && sprite_index != spr_hurt){
		my_health -= other.damage;
		sound_play(snd_hurt);
		image_index = 0;
		sprite_index = spr_hurt;
		motion_add(other.direction, 4);
	}
	with(projectile){
		if(team != other.team && distance_to_object(other) <= 0){
			if(typ = 1){
				with instance_create(x,y,Deflect) image_angle = direction;
				direction = other.direction;
				image_angle = direction;
				team = other.team;
			}
			if(typ = 2) instance_destroy();
		}
	}
	
	if(!place_meeting(x,y,Floor)) with instance_nearest(x,y,Floor){
		other.creator.x = x;
		other.creator.y = y;
	}
	else{
		creator.x = x;
		creator.y = y;
	}

	var pdist = point_distance(x, y, xstart, ystart);
	with(other) weapon_post(8, pdist * 1.8, 15);
	trail2.image_xscale = pdist;
	trail3.x = x;
	trail3.y = y;
	sound_play(sndMeleeWall);
	
	instance_destroy();
}
repeat(15) with instance_create(x + lengthdir_x(random_range(-15,15),gunangle + 90) - lengthdir_x(10,gunangle),y + lengthdir_y(random_range(-15,15) - lengthdir_y(10,gunangle),gunangle + 90),Dust){
	motion_add(other.gunangle,3+random(5));
}
	

#define hh_hit

#define weapon_sprt
return global.sprHyperHammer; // Wep Sprite

#define weapon_text
return "BLUNT FORCE TRAUMA";