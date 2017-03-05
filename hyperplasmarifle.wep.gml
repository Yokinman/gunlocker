// /loadmod mods/spreadsheet/hyperplasmarifle.wep.gml

#define init
global.sprHyperPlasmaRifle = sprite_add_weapon_base64("iVBORw0KGgoAAAANSUhEUgAAABcAAAANCAYAAABCZ/VdAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAADkSURBVDhPzVNBCsIwEAy0traipQERvAgevBSvnr0X/IGf8AU+yD/GzpJJN0FRFMSBYTeb2dkNtObXcGRuOykQx2vMT+Da/iZETs7qOe4iNAuLQM1r+G3FfHNxEvfdIRoEZs12CCbclWUlZ8/HqKY1gog4AAY66lfpwckSI4rJOBmiU38WcgCJM0kd6uvVLuTeJ0AKEKCBRE2bacLobXNcktocYuSIJO+pxTCdo09cPSJznEmI2cRGmjOnVucDA3TR5VmBGhBtpLYS2nYpGlB/CEieITSD6WvSH+sbBFP/Nf0LjLkDOZ3j7tlcX/MAAAAASUVORK5CYII=",
4, 4);

#define weapon_name
return "HYPER PLASMA RIFLE";

#define weapon_sprt
return global.sprHyperPlasmaRifle;

#define weapon_type
return 5;

#define weapon_fire
sound_play(sndPlasmaRifle);
view_shake_at(x, y, 8);

/*with(instance_create(x+lengthdir_x(24, gunangle), y+lengthdir_y(24, gunangle), PlasmaImpact))
{
	team = other.team;
	creator = other;
}*/
repeat(16)
{
	with(instance_create(x+lengthdir_x(16, gunangle), y+lengthdir_y(16, gunangle), PlasmaTrail))
	{
		image_speed /= random(3)+1;
		speed = 1+random(2);
		friction = -0.1;
		direction = other.gunangle+10*random_range(-1, 1);
		
		if(fork())
		{
			var wv = random(360);
			var odir = direction;
			
			while(instance_exists(self))
			{
				wv += 0.25;
				direction = odir+sin(wv)*45;
				wait(1);
			}
			exit;
		}
	}
}
with(instance_create(x+lengthdir_x(24, gunangle), y+lengthdir_y(24, gunangle), CustomObject))
{
	direction = other.gunangle;
	image_angle = direction;
	tries = 3200;
	team = other.team;
	creator = other;
	sprite_index = mskPlasma;
	var hitList = [];
	
	while(instance_exists(self)
	&& tries > 0)
	{
		tries -= 1;
		x += lengthdir_x(4, direction);
		y += lengthdir_y(4, direction);
		
		var dir = random(360);
		var len = random(8);
		
		with(instance_create(x+lengthdir_x(len, dir), y+lengthdir_y(len, dir), PlasmaTrail))
		{
			image_speed /= random(3)+1;
			speed = random(1);
			friction = -0.1;
			direction = other.direction+choose(-90, 90);
			
			if(fork())
			{
				var wv = random(360);
				var odir = direction;
				
				while(instance_exists(self))
				{
					wv += 0.25;
					direction = odir+sin(wv)*90;
					wait(1);
				}
				exit;
			}
		}
		
		if(instance_exists(hitme))
		{
			if(distance_to_object(hitme) <= 0)
			{
				with(hitme)
				{
					if(my_health > 0
					&& team != other.team
					&& distance_to_object(other) <= 0)
					{
						var canHurt = 1;
						for(var i = 0; i < array_length_1d(hitList); i += 1)
						{
							if(hitList[i] == id)
							{
								canHurt = 0;
							}
						}
						if(canHurt)
						{
							my_health -= 16;
							sound_play(snd_hurt);
							sprite_index = spr_hurt;
							motion_add(other.direction, 4);
							if(my_health > 0)
							{
								other.tries = 0;
							}
							else
							{
								hitList[array_length_1d(hitList)] = id;
								instance_create(x, y, PlasmaImpact);
							}
						}
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
		if(instance_exists(Slash))
		{
			var s = instance_nearest(x, y, Slash);
			if(distance_to_object(hitme) <= 0)
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
	}
	
	sound_play(sndPlasmaBigExplode);
	instance_create(x, y, PlasmaImpact);
	instance_destroy();
}
