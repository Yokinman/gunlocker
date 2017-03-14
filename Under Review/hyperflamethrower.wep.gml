// /loadmod mods/gunlocker/under review/hyperflamethrower.wep.gml

#define init
global.sprHyperFlamethrower = sprite_add_weapon_base64("iVBORw0KGgoAAAANSUhEUgAAABYAAAAPCAYAAADgbT9oAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAACvSURBVDhPxVBBDsIwDOsXdkLishsXtCufmHgCn+Bd/LHIaR3MlqFWIGbJirM5btr0b+QGdiOP9+wc5keo4Sv2dnjAVig0fMXeDhvkcKTZw1wr9Qr86YwCqdWHG1Qdwq85nS/5Ot+cWz0rDlqErw4x06dg6OPhZBV+UnqA9Q0+SGoQn0SeA6BWhrCfsoWRVybr927YpqilfYUHG3dBgz30FxsDOuzh3268BIOUeyClJ3hN9aNqmKR2AAAAAElFTkSuQmCC",
5, 8);

#define weapon_name
return "HYPER FLAMETHROWER";

#define weapon_sprt
return global.sprHyperFlamethrower;

#define weapon_type
return 4;

#define weapon_auto
return 1;

#define weapon_load
return 8;

#define weapon_fire
//sound_play(sndRocket);

/*repeat(8)
{
	with(instance_create(x+lengthdir_x(24, gunangle), y+lengthdir_y(24, gunangle), Smoke))
	{
		speed = random(6);
		direction = other.gunangle+24*random_range(-1, 1);
	}
}*/

if(button_pressed(index, "fire"))
{
	sound_play(sndDragonStart);
	sound_loop(sndDragonLoop);
}

repeat(8)
{
	if(instance_exists(self))
	{
		view_shake_at(x, y, 4);
		
		with(instance_create(x, y, CustomObject))
		{
			direction = other.gunangle+16*random_range(-1, 1);
			image_angle = direction;
			tries = 64;
			team = other.team;
			creator = other;
			sprite_index = sprRocket;
			
			while(instance_exists(self)
			&& tries > 0)
			{
				tries -= 1;
				x += lengthdir_x(4, direction);
				y += lengthdir_y(4, direction);
				//if(random(1) < 0.25) instance_create(x, y, Smoke);
				
				var dist = point_distance(x, y, xstart, ystart)/8;
				var dir = random(360);
				with(instance_create(x+lengthdir_x(dist, dir), y+lengthdir_y(dist, dir), TrapFire))
				{
					sprite_index = sprFireLilHunter;
					team = other.team;
					creator = other.creator;
					damage *= 6;
					speed = random(4);
					direction = other.direction;
				}
				
				if(distance_to_object(hitme) <= 0)
				{
					with(hitme)
					{
						if(team != other.team
						&& distance_to_object(other) <= 0)
						{
							if(other.tries > 16)
							other.tries = 16;
						}
					}
				}
				if(distance_to_object(Wall) <= 0)
				{
					tries = 0;
				}
				if(distance_to_object(Slash) <= 0)
				{
					with(Slash)
					{
						if(team != other.team
						&& distance_to_object(other) <= 0)
						{
							other.direction = direction;
							other.image_angle = other.direction;
							other.team = team;
						}
					}
				}
			}
			
			instance_destroy();
		}
	}
	
	wait(1);
}

if(!instance_exists(self)
|| !button_check(index, "fire"))
{
	sound_stop(sndDragonLoop);
	sound_play(sndDragonStop);
}
