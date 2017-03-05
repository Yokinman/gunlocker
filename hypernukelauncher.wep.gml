// /loadmod mods/spreadsheet/hypernukelauncher.wep.gml

#define init
global.sprHyperNukeLauncher = sprite_add_weapon_base64("iVBORw0KGgoAAAANSUhEUgAAABkAAAAVCAYAAACzK0UYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAERSURBVEhLzZBBjsJADATzBU4rceHGZcWVTyCewCf2XfwxUI561ONYgbBI0FLJmXHbHmf4pMYCyb9XqWy2OV3H3d8YcDZeVjQlTsdQ3B1+jwHf5ul8BTO1ZPHqbiMnezwaTeP5dIlLFXPm9URH28D2Zx8e1XHn9cQ7TXFJESaimTrUSHBmkL6J+MohGH2IXpihkcDjdT7E6puaGeOjITQS8j89hIjRzxnyAk+uK+qbVg3Jm+jeYzmElYky6dflho7/Vs65nninqRxSQT4P9rrFIUImUGPPAx7wfB5idHIDykNQeKpNCmbKyTygg8ZQPOJptSaCuym1uMkqqciR4qzh/9lkSbNNuJtS75OaOt+gYbgBixvzAcvHbXkAAAAASUVORK5CYII=",
4, 8);

#define weapon_name
return "HYPER NUKE LAUNCHER";

#define weapon_sprt
return global.sprHyperNukeLauncher;

#define weapon_type
return 4;

#define weapon_fire
sound_play(sndNukeFire);
view_shake_at(x, y, 16);

repeat(16)
{
	with(instance_create(x+lengthdir_x(24, gunangle), y+lengthdir_y(24, gunangle), Smoke))
	{
		speed = random(6);
		direction = other.gunangle+48*random_range(-1, 1);
	}
}
with(instance_create(x, y, CustomObject))
{
	direction = other.gunangle;
	image_angle = direction;
	tries = 3200;
	team = other.team;
	creator = other;
	sprite_index = mskNuke;
	
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
					other.tries = 0;
				}
			}
		}
	}
	
	sound_play(sndNukeExplosion);
	var l = 4;
	repeat(6)
	{
		var d = random(360);
		for(var i = 0; i < 8; i += 1)
		{
			instance_create(x+lengthdir_x(l, d), y+lengthdir_y(l, d), Explosion);
		}
		l += 4;
		wait(1);
	}
	instance_destroy();
}
