// /loadmod mods/spreadsheet/hyperscrewdriver.wep.gml

#define init
global.sprHyperScrewdriver = sprite_add_weapon_base64("iVBORw0KGgoAAAANSUhEUgAAAAwAAAAFCAYAAABxeg0vAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAABJSURBVBhXY0AD/6EYL4Ap+u/nHftfvug/siZkGi7+X0pc7b+uttl/Qe81YA0gjTAxEA0Th2uAYZBCkCRMAo1GFocDrIIIwMAAAHwdMKjggBTWAAAAAElFTkSuQmCCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==",
-4, 2);
global.sprHyperHammerBGN = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACIAAAAQCAYAAABz9a1kAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAABvSURBVEhL7dHRCYAwDEXR7L+EwziHs1SEK4SaYBoNgvRAPqR97cPK9AvLujVrWE5p4PPKutBDxMW2eOHIpRbiz+kC/URwTI1oiQORGp8U0U/RTwTHvGe0wIl4DV3qrhwRF9vqn5DlFDrW/tUpT2QHdXrNeGL0Gl4AAAAASUVORK5CYIIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==",
2, 15, 8);
global.sprHyperHammerMID = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAIAAAAQCAYAAAA8qK60AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAdSURBVBhXY8AD5h+++x8EGMAECFDIgBuICzAwAABEgS5VCbM0OwAAAABJRU5ErkJgggAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==",
2, 0, 8);
global.sprHyperHammerEND = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAB4AAAAQCAYAAAABOs/SAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAB0SURBVEhL7dDRCYAwDEXR7L+EwziHs1QSr1IlH0lbih89UKghzQvKMs22H4VrWqlQitNHGu4dWlJsC1Dy0eMasYhi3Ps9tZBRSzyXFt3hNqVBT7BhTsi0X10H9YYpPi9a+Abch5YUSwAlX2uAYr6htPyNyAmMLbQADMb0HwAAAABJRU5ErkJgggAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==",
2, 0, 8);

#define weapon_name
return "HYPER SCREWDRIVER";

#define weapon_sprt
return global.sprHyperScrewdriver;

#define weapon_type
return 0;

#define weapon_load
return 7;

#define weapon_fire
sound_play(sndScrewdriver);
view_shake_at(x, y, 4);
wepangle = -wepangle;
motion_add(gunangle, 24);

with(instance_create(x+lengthdir_x(24, gunangle), y+lengthdir_y(24, gunangle), CustomProjectile))
{
	direction = other.gunangle;
	team = other.team;
	creator = other;
	sprite_index = sprShank;
	
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
			if(distance_to_object(hitme) <= 4)
			{
				with(hitme)
				{
					if(my_health > 0
					&& team != other.team
					&& distance_to_object(other) <= 4)
					{
						//trace("boom");
						//if(projectile_canhit_melee(id))
						if(sprite_index != spr_hurt)
						{
							my_health -= 8;
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
			if(distance_to_object(projectile) <= 4)
			{
				with(projectile)
				{
					if(id != other.id
					&& team != other.team
					&& distance_to_object(other) <= 4)
					{
						instance_destroy();
					}
				}
			}
		}
		if(instance_exists(Floor))
		{
			if(distance_to_object(Floor) > 0)
			{
				tries = 0;
			}
		}
	}
	
	var pdist = point_distance(x, y, xstart, ystart);
	trail2.image_xscale = pdist;
	trail3.x = x;
	trail3.y = y;
	
	instance_destroy();
}

#define hh_hit
