// /loadmod mods/spreadsheet/hyperbazooka.wep.gml

#define init
global.sprHyperBazooka = sprite_add_weapon_base64("iVBORw0KGgoAAAANSUhEUgAAAB4AAAANCAYAAAC+ct6XAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAADYSURBVDhPrZDBDQIxDATTAi8kPvz4IL40caIEmqAuegy3ljeynL2QQ6w0cuxs7PMVV/UI4bzFjPZ4O3M9v2rjsLwtop5Qit6vsuaIDmQ1cLve2zkCjxNld2J452+F1MyIG2+R34DcS31MfSxPK/ACOcG2qOHhCPjoRx7fsEeitAsORk7cNEXsg4GIahn3l3o6XizhlyIfMfLgTg0Wy/x/MPsgqp7IV/pfFUlmAuVaQw0WmPJQqvvKEKk8AOI5IqUuR9tm5cHTUg/Utlv6ebASG8002+NdVcoH/jp1FXG0R4YAAAAASUVORK5CYII=",
11, 7);

#define weapon_name
return "HYPER BAZOOKA";

#define weapon_sprt
return global.sprHyperBazooka;

#define weapon_type
return 4;

#define weapon_fire
sound_play(sndRocket);
view_shake_at(x, y, 16);

repeat(8)
{
	with(instance_create(x+lengthdir_x(24, gunangle), y+lengthdir_y(24, gunangle), Smoke))
	{
		speed = random(6);
		direction = other.gunangle+24*random_range(-1, 1);
	}
}
with(instance_create(x, y, CustomObject))
{
	direction = other.gunangle;
	image_angle = direction;
	tries = 3200;
	team = other.team;
	creator = other;
	sprite_index = sprRocket;
	
	while(instance_exists(self)
	&& tries > 0)
	{
		tries -= 1;
		x += lengthdir_x(4, direction);
		y += lengthdir_y(4, direction);
		if(random(1) < 0.25) instance_create(x, y, Smoke);
		
		if(distance_to_object(hitme) <= 0)
		{
			with(hitme)
			{
				if(team != other.team
				&& distance_to_object(other) <= 0)
				{
					other.tries = 0;
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
	
	sound_play(sndExplosionL);
	for(var i = 0; i < 4; i += 1)
	{
		instance_create(x+lengthdir_x(16*i, direction), y+lengthdir_y(16*i, direction+90*choose(-1, 1)), Explosion);
	}
	instance_destroy();
}
