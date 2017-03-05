// /loadmod mods/spreadsheet/hypercrossbow.wep.gml

#define init
global.sprHyperCrossbow = sprite_add_weapon_base64("iVBORw0KGgoAAAANSUhEUgAAABEAAAALCAYAAACZIGYHAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAB6SURBVChTY6An+A/FBAFMITbF/wW91+CTh4P/8kX/kRWjA7A8CIPYUIwCwIIgA7AoxMBoauDgv5S4GhjrapuBsa93LJwGyYPYMBomB+KDNCMDuEEgNgwjKYZjXC6BAbhBaAaCALpmrAbAALIimEKiYwcfoEgzEYCBAQD0fnF3OsaoJAAAAABJRU5ErkJgggAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==",
-2, 5);

#define weapon_name
return "HYPER CROSSBOW";

#define weapon_sprt
return global.sprHyperCrossbow;

#define weapon_type
return 3;

#define weapon_fire
sound_play(sndCrossbow);
view_shake_at(x, y, 16);

repeat(4)
{
	with(instance_create(x+lengthdir_x(24, gunangle), y+lengthdir_y(24, gunangle), Smoke))
	{
		speed = random(9);
		direction = other.gunangle+6*random_range(-1, 1);
	}
}
with(instance_create(x, y, CustomObject))
{
	direction = other.gunangle;
	image_angle = direction;
	tries = 3200;
	team = other.team;
	creator = other;
	sprite_index = mskBolt;
	
	while(instance_exists(self)
	&& tries > 0)
	{
		tries -= 1;
		x += lengthdir_x(1, direction);
		y += lengthdir_y(1, direction);
		//if(random(1) < 0.1) instance_create(x, y, Smoke);
		
		if(distance_to_object(hitme) <= 0)
		{
			with(hitme)
			{
				if(team != other.team
				&& distance_to_object(other) <= 0
				&& my_health > 0
				&& sprite_index != spr_hurt)
				{
					my_health -= 25;
					sound_play(snd_hurt);
					sprite_index = spr_hurt;
					motion_add(other.direction, 4);
					
					if(my_health > 0)
					{
						other.tries = 0;
						with(instance_create(x, y, BoltStick))
						{
							target = other;
							image_angle = other.direction;
						}
					}
				}
			}
		}
		if(distance_to_object(Wall) <= 0)
		{
			tries = 0;
			sound_play(sndBoltHitWall);
			var w = instance_nearest(x, y, Wall);
			
			with(instance_create(w.x+8, w.y+8, Bolt))
			{
				speed = 8;
				direction = other.direction;
				image_angle = direction;
			}
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
	
	with(instance_create(x, y, BoltTrail))
	{
		image_xscale = point_distance(x, y, other.xstart, other.ystart);
		image_angle = other.direction+180;
	}
	
	instance_destroy();
}
