// /loadmod mods/spreadsheet/hypershovel.wep.gml

#define init
global.sprHyperShovel = sprite_add_weapon_base64("iVBORw0KGgoAAAANSUhEUgAAACAAAAANCAYAAADISGwcAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAC1SURBVDhPzVNBDsIwDOsXdkLishsXxJVPTNoP+ATv4o+ZHM3FC1VVUBlYsrKlaexEW+oMC9wdNt7NLuerDdPjZ0ayCcRgpGimevgBXJRboAm8Hw+nopbN082J55U1tNRlQcRIMeLwJGNw+UJMw8lK5yT6kOyrET3W2qcBsnaJK42r1ciNgszHGhng/Q2gTiYokqJRmFHu/8E3IOyBzZZa/oLecFEIUhw54VeRxYPwblDRBuGUFvS0DfTmK4xVAAAAAElFTkSuQmCC",
6, 6);
global.sprHyperHammerBGN = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAFEAAAAwCAYAAABpJ5bJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAALYSURBVGhD7ZlZkpwwEETnzL7QHMUfPofPgivVVURKpAAtY2bRi3jRUAiRZLvDH/M2wvufv1ujfuc1WFtR7av0na7B2jtu2yZtwjbKgnZwCMbwHGtDO+95pu/6QuyZyddojX1kyHWX/Hr/vUGxYQ+HAPwihXtxnfob5AXimLTRi2IutWXSKrXycM42sj/Y7j0E81ns7UnG8X39rB/Oyh7g8iCIY+jLEjyHN5AhSm2vKS89G5UVZkSBpX45EbObpZXIEDWjzIrZF0h60nZwrzJQGeEOlwZ9vBPzQWSIUvUiriotyfjMkx+xJX50LA7X+JgE5SyZqBUH4lqpPUS+wAUyxJV4IYZfkCmy+HQMflbNU7g0H0kQvmaBDHFH28uf9hwqF/xQRJkyxF2fLlJlgtPhn7tAhmjxySJVHjgN/umfFClDtPitS6yBIkkZotWnilRZ4H8HBYyW+eNLDEbLfKJIlQM+Tm+Rq8SCniJXiYKvUKTKAD8VrUWuEgWrxEm0FLlKrLBKnMAqcQKrxAmsEiewSpzAKnECq8RBWgqEq0TBKnGQ1gLhKpH4CgUClQM+Tk+BcJVooITeAuGPLnG0PPhEgUBlgR+OvfD6k+ld1h/vJ3JSIJAhWvwRJTIoMnRkiLs+WSBQmeAp/NP0kYTLKi2QIe5oe/nTxsBeNWrXbJ4u4EOZOCuKi2RPijpDhriyLBDncY0psvh0DH5WzZ2yJB/vxHwQGaIUwStmXx7L+MyTn4N1NW2rLBOfsxlcIuuXEzGzTe3+ZmSImvxCwr3AQk/aDu5VBiojPMAlQRDH0JcleA5vIEOU2l5Z+M+Cygqr1P7FRWFhI/uD7d6kmMXenmQc39fP+uGs7CW1Mjs5BIgXFO5fVKf+Bvl/DjgmbfSimEttmbQJ2ygL2sEhGMNzrA3tvOeZvusLsWcmX6M19pEh1w2BhzTqd16DtRXVvkrf6RqsvaMqcNu2t398/1Kk8CIjXQAAAABJRU5ErkJggg==",
3, 26, 24);
global.sprHyperHammerMID = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAMAAAAwCAYAAADUxsC8AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAABOSURBVChTY5h/+O5/EGYAgf9IAJkDkQEpg3NADBAmzAEB8gyAqQdzQAAoAMajAArgAYISVCAWiAHCBDgwfTAZEKCeAWAAdhsIMzAwMAAA41cMlFJSlYMAAAAASUVORK5CYIIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==",
3, 0, 24);
global.sprHyperHammerEND = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAD8AAAAwCAYAAACmCaIKAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAKsSURBVGhD7ZQBbuwgDET3/pfoYf45epYtQ8aRSWKwwfm7q/ZJUQ0x4xnS9vH17/v5SAaaGbrP57M+rCt1ocDWxbYPCIrZRNOVbN106LNh1TBlTmRcQjlfvzQeaGnY0vSo7TM41GPGsJzBc8WM5i3Qz5BZw3LuiqwLKDqstnksG3TPDn24mTWMc3iOzOodKVKstkwsG07baIyyYvjqErIuIAznh+kZxnuWJpELKO/2rybn6kIhPfgpWJp7T1WapCNe33NpIn2CpSeUFlb2BWPb21dfrjAyPEJfwKpWGM5d4mMvgDOXsAxjXx5umaCnp3ULMnSVnmm8k4dbl3j7UpGBK3gMywwuLxEvXA7Rcpb2YOSGDJ7FY1r0ubwkEr707uEsbd0zRESieE1bJgWvjqClLN3OuDMzFxAxjX6W78mdFyDaXL4n0Qt41dcvc1ltnlk26B4XnxJeS1m6U+MiFxAJH+kdUUaz+pDwH8FfeCd/4V9AGc3qF/7Nl9GsfmH4MpfV5pdlg+5xc1f4SO9LiAQHkUDoZ7mElrE0p0a9e/gybw8mXutCoXvcRIMDb3jLaBQtYemFx9wZHKCf5XsxExxkffXIJaaBobPBgcf0KDj4r+FXQ4PM4B6tFFZDCz3DEmgUytuXBr0vYZmNhEFPT6u8YpX4Xx1Cq3jC9ZDg4KhV1nso6asLhe4Bh/rUD+o2Xq5wNBtFAoFVLYCLECy9vYdzp+iI1/dcmkifYOndBueG6RnFe5Ym2cGLBCt7/mkbjVFWjOJsdvByntWmz7JB9+xwvptZoziH58isXgr0METM85gbKzSY1Ku/vniOumxpetT2GRzqgQFRk3IGzxUzmrdAPw3aPNtCUOZEVLMc2b9cFSjUhQJbF9s+IKjDRsxZQBNk66Zzh6m3DdvwePwAhrnDEoT+vcoAAAAASUVORK5CYII=",
3, 0, 24);

#define weapon_name
return "HYPER SHOVEL";

#define weapon_sprt
return global.sprHyperShovel;

#define weapon_type
return 0;

#define weapon_load
return 25;

#define weapon_fire
sound_play(sndShovel);
view_shake_at(x, y, 8);
wepangle = -wepangle;

for(var s = gunangle-30; s <= gunangle+30; s += 30)
{
	with(instance_create(x+lengthdir_x(24, s), y+lengthdir_y(24, s), CustomProjectile))
	{
		direction = s;
		team = other.team;
		creator = other;
		sprite_index = other.mask_index;
		
		tries = 8;
		for(var i = 0; i < 999; i += 1)
		{
			if(skill_get_name(i) == "LONG ARMS")
			{
				tries = 8*(1+skill_get(i));
				break;
			}
		}
		
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
		
		if(fork())
		{
			while(instance_exists(trail1))
			{
				if(trail1.image_index+trail1.image_speed >= trail1.image_number)
				{
					instance_delete(trail1);
					instance_delete(trail2);
					instance_delete(trail3);
				}
				wait(1);
			}
			exit;
		}
		
		var tp = 1;
		
		while(instance_exists(self)
		&& tries > 0)
		{
			tries -= 1;
			x += lengthdir_x(4, direction);
			y += lengthdir_y(4, direction);
			
			if(instance_exists(hitme))
			{
				if(distance_to_object(hitme) <= 16)
				{
					with(hitme)
					{
						if(my_health > 0
						&& team != other.team
						&& distance_to_object(other) <= 16)
						{
							//trace("boom");
							//if(projectile_canhit_melee(id))
							if(sprite_index != spr_hurt)
							{
								my_health -= 16;
								sound_play(snd_hurt);
								sprite_index = spr_hurt;
								motion_add(other.direction, 4);
							}
						}
					}
				}
			}
			if(instance_exists(projectile))
			{
				if(distance_to_object(projectile) <= 16)
				{
					with(projectile)
					{
						if(id != other.id
						&& team != other.team
						&& distance_to_object(other) <= 16)
						{
							instance_destroy();
						}
					}
				}
			}
			if(instance_exists(Wall))
			{
				if(distance_to_object(Wall) <= 0)
				{
					tries = 0;
				}
			}
			
			var f = instance_nearest(x, y, Floor);
			if(tp
			&& distance_to_object(Floor) <= 0
			&& distance_to_object(Wall) > 0
			&& distance_to_object(InvisiWall) > 0)
			/*if(tp
			&& point_in_rectangle(x, y, f.x, f.y, f.x+f.sprite_width, f.y+f.sprite_height))*/
			{
				if(distance_to_object(hitme) > 0
				&& direction == creator.gunangle)
				{
					if(fork())
					{
						var _creator = creator;
						var _x = x;
						var _y = y;
						wait(1);
						if(instance_exists(_creator))
						{
							_creator.x = _x;
							_creator.y = _y;
						}
						exit;
					}
				}
			}
			else if(tp)
			{
				tp = 0;
				tries = 8;
				sound_play(sndMeleeWall);
			}
		}
		
		var pdist = point_distance(x, y, xstart, ystart);
		trail2.image_xscale = pdist;
		trail3.x = x;
		trail3.y = y;
		
		instance_destroy();
	}
}

#define hh_hit
