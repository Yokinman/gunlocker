// /loadmod mods/gunlocker/Under Review/seekercannon.wep.gml

#define init
global.sprSeekerCannon = sprite_add_weapon_base64("iVBORw0KGgoAAAANSUhEUgAAABYAAAAOCAYAAAArMezNAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAC7SURBVDhP1ZOxDUIxDESzAxUL0CLR0cAC1HSIBZiAmooBKFnV/DtywTj/h1BQ8KST7cQ5+yOR/gozy1kNbrx6aPbzYrc/2Ol8YdzOZ/7BmAB7IeTPoxd2XC4qwdgP8hHCOyjUhAUMYKQGyBtfb/cqKl+tN6XOfoSPZRz1aeMuYwg1FI2npH4NyjWJpqCcSRqiiJ4sEAcV4kHcYEw+A+93YtgkZ6T6zYZtqB6af5CpT+uhZQxk+rXxD0npAR0P/Ft9xMQ1AAAAAElFTkSuQmCC",
4, 4);
global.sprSeekerCannonProjectile = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAoQAAAAXCAYAAACS2l6LAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAASSSURBVHhe7Zwxjls3FEVnAUGqVKldp0pleAmpU3kJWUHqlKlTea8KLil+k+8+UdTMl2e+dA7wIImP5ziQBokx9uQFAAAAAAAAAAAAYJnT+fEe0HZoO7Qd2g5th7ZD2zlqG34gp3//+6YP8x4fKG2HtkPboe3Qdmg7tJ2jtiHnLu/16ffPX05//Pn19Nff/+z9gdJ2aDu0HdoObYe2Q9s5bDuZvTh0W+95e67D19DL5fnX3z6dvvz6yzZ63Xa6dH5sz2eYQ9sd2u7QdmehvUrvlOe0X9Xun88w5yDtnuLQHijOjm1zaLtD250d29+/rdtCbXTev9a+vy/5Cg/XjkPbZ8+2zvvXtC+3i7UGbefmdrsv+QpHbTdoO/dob3dpb9B27tkulG/r6tu7fSzGX/nt34dp681tQ/t7W2f3aGv4Grze1r3z3MLDt3VHj8VaY6mtve7pftWWOGpbFKdvPXm7eHrsWwf4LGk7tBPKnz1r2n/YW0ij1zpvfydA96u2xMO0ddbmaG29H3q8R7t19m6rccSvkx/d1r1uVnn3dvd+7N7WXnfPs8pyu/tnX+Ww7TZHbMs7WluehvYGbedu7SK2UUjTfjHF2ll/T17VpwzO0ds6b3O0dvui2Lt91M+SNu3A4NAuDA7twuDQLgwO7cLgHKidx6+dyav6lMGhXRgc2oXBoV0YHNqFwaFdGBzahcGhXRgc2oXBoV05ffr5p0HUtGCManRfXtWn0HZoO7Qd2g5th7ZD26Ht0E7YhDYxlu3lVX1K6saJe3lVn5K6ceJeXtWnpG6cuJdX9SmpGyfu5VV9SurGiXt5VZ+SunHiXl7Vp6RunLiXV/UpqRsn7uVVfUrqxol7eVWfkrpx4l5e1aekbpy4l1f1KakbJ+7lVX1K6saJe3lVn5K6ceJeXtWnpG6cuJdX9SmpGyfu5VV9SurGiXt5VZ+SunHiXl7Vp6RunLiXV/UpqRsn7uVVfUrqxol7eVWfkrpx4l5e1aekbpy4l1f1KakbJ+7lVX1K6saJe3lVn5K6ceJeXtWnpG6cuJdX9TnTUB/sR17Vp5hHm3aCebRpJ5hHm3aCebRpJ5hHu5IGstE93a/aErQd2g5th7ZD26Ht0HZoO7QTth9XzoJt9NMruqP7VVuCtkPboe20+2mzzUdty82abd7S1k/TZc02r23L0WTNNrR9dK+bVd69rfdEd8+zyodo647uV20J2g7thCLqX7L63aRGr/U/OVSsnbUfadb9qi1B26Ht0M4pDu2NzblXWy7tjaW27p3nFh6+rXM9FmuNpbb2z9zWWZujtfVaj3u39Vzvtc7f0u6FMlm83+v8/PwatB3aDu05xaG9sbk7touvxza0b27fwrO0Navc3Nb5+fk1Hqo9e/3M7Xb+hvYm9ZSz8Iv2ZGcZF13aA+WM9kA5e+J2RnFpDxT3g3+WF90HbK+SueWM9kA5e6fPMjvLuOjes63fcLbnOuzIzjIuuk/cvkgf3xvaDm2HtkPboe3Qdmg7R22Le3UF7QTeFIe2Q9uh7dB2aDu0HdoAAAAAAAAAAAAAsBsvL/8DyVqfr41q0u8AAAAASUVORK5CYII=",
28, 11, 11);

#define weapon_name
return "SEEKER CANNON";

#define weapon_sprt
return global.sprSeekerCannon;

#define weapon_type
return 3;

#define weapon_fire
sound_play(sndSeekerShotgun);
view_shake_at(x, y, 12);
sc_fire(x+lengthdir_x(24, gunangle), y+lengthdir_y(24, gunangle), gunangle);

#define sc_fire(x, y, dir)
var sc = instance_create(x, y, CustomProjectile);
with(sc)
{
	name = "seekercannon";
	direction = dir;
	team = other.team;
	creator = other;
	sprite_index = global.sprSeekerCannonProjectile;
	
	speed = 2;
	friction = 0.01;
	
	on_step = sc_step;
	on_destroy = sc_destroy;
}
return sc;

#define sc_destroy
sound_play(sndSeekerShotgun);
view_shake_at(x, y, 16);

repeat(3)
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
}

#define sc_step
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
	direction -= angle_difference(direction, point_direction(x, y, e.x, e.y))/32;
}

if((image_index >= 3
&& image_index < 4)
|| (image_index >= 10
&& image_index < 11)
|| (image_index >= 18
&& image_index < 19)
|| (image_index >= 25
&& image_index < 26))
{
	sound_play(sndSeekerPistol);
	view_shake_at(x, y, 5);
	
	var dir = (image_index/image_number)*(360/2);
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
}
if(speed < 0.5)
{
	instance_destroy();
}
