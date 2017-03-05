// /loadmod mods/spreadsheet/superseekercannon.wep.gml

#define init
global.sprSuperSeekerCannon = sprite_add_weapon_base64("iVBORw0KGgoAAAANSUhEUgAAABcAAAAQCAYAAAD9L+QYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAADOSURBVDhPzZGxDQIxDEWzAxUL0CLR0cAC1HSIBZiA+ioGoGTVoO/wo2/rEh1wSHzpy05svyR36R+Ug1ua0uOUD8dTvlwHi/vlQgEKsjqMvGz1ZbDzelWNtR6GiD4YuaybsgbAFKTw2/3h4ma7sxx+zVdxwxxvq/4IjiFaYRj8+uYRHg+hCeeBjJPhNGHRABHICOMgGLyCLRqFwKjBHMRehLMHuaydWmCoPnmkXnv4AuRly0sHtCHeKtapXs1JG5s/aw51v+ccIvgn8DeV0hOARUKV/+hENgAAAABJRU5ErkJggg==",
7, 8);
global.sprSuperSeekerCannonProjectile = sprite_add_base64("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",
28, 15, 18);

#define weapon_name
return "SUPER SEEKER CANNON";

#define weapon_sprt
return global.sprSuperSeekerCannon;

#define weapon_type
return 3;

#define weapon_fire
sound_play(sndSeekerShotgun);
view_shake_at(x, y, 18);

ssc_fire(x, y, gunangle);

#define ssc_fire(x, y, dir)
with(instance_create(x+lengthdir_x(24, gunangle), y+lengthdir_y(24, gunangle), CustomProjectile))
{
	direction = other.gunangle;
	team = other.team;
	creator = other;
	sprite_index = global.sprSuperSeekerCannonProjectile;
	
	speed = 2;
	friction = 0.005;
	image_speed /= 2;
	
	on_step = ssc_step;
	on_destroy = ssc_destroy;
}

#define ssc_destroy
sound_play(sndSeekerShotgun);
view_shake_at(x, y, 32);
var j = random(360);
for(var i = j; i < j+360; i += 360/6)
{
	mod_script_call("weapon", "seekercannon", "sc_fire", x, y, i);
}

/*repeat(3)
{
	var dir = random(360);
	with(instance_create(x, y, Seeker))
	{
		team = other.team;
		creator = other;
		speed = 2;
		direction = dir;
	}
	with(instance_create(x, y, Seeker))
	{
		team = other.team;
		creator = other;
		speed = 2;
		direction = dir+180;
	}
}
repeat(3)
{
	var dir = random(360);
	with(instance_create(x, y, Seeker))
	{
		team = other.team;
		creator = other;
		speed = 1;
		direction = dir;
	}
	with(instance_create(x, y, Seeker))
	{
		team = other.team;
		creator = other;
		speed = 1;
		direction = dir+180;
	}
}*/

#define ssc_step
var e = noone;
var dist = 999999;
with(Generator)
{
	if(team != other.team
	&& !collision_line(x, y, other.x, other.y, Wall, 0, 1)
	&& point_distance(x, y, other.x, other.y) < dist)
	{
		dist = point_distance(x, y, other.x, other.y);
		e = id;
	}
}
with(enemy)
{
	if(team != other.team
	&& !collision_line(x, y, other.x, other.y, Wall, 0, 1)
	&& point_distance(x, y, other.x, other.y) < dist)
	{
		dist = point_distance(x, y, other.x, other.y);
		e = id;
	}
}
with(Player)
{
	if(team != other.team
	&& !collision_line(x, y, other.x, other.y, Wall, 0, 1)
	&& point_distance(x, y, other.x, other.y) < dist)
	{
		dist = point_distance(x, y, other.x, other.y);
		e = id;
	}
}
if(e != noone)
{
	direction -= angle_difference(direction, point_direction(x, y, e.x, e.y))/64;
}

if((image_index >= 3
&& image_index < 3.5)
|| (image_index >= 10
&& image_index < 10.5)
|| (image_index >= 18
&& image_index < 18.5)
|| (image_index >= 25
&& image_index < 25.4))
{
	sound_play(sndSeekerPistol);
	view_shake_at(x, y, 5);
	
	var dir = (image_index/image_number)*(360/2);
	with(instance_create(x, y, Seeker))
	{
		team = other.team;
		creator = other;
		speed = 1;
		friction = 0.75;
		direction = dir;
	}
	with(instance_create(x, y, Seeker))
	{
		team = other.team;
		creator = other;
		speed = 1;
		friction = 0.75;
		direction = dir+180;
	}
}
if(speed < 0.5)
{
	instance_destroy();
}
