// /loadmod mods/spreadsheet/bazookacannon.wep.gml

#define init
global.sprBazookaCannon = sprite_add_weapon_base64("iVBORw0KGgoAAAANSUhEUgAAACIAAAAQCAYAAABz9a1kAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAADZSURBVEhL1ZDRDcIwEEO7BRID8IP4ZQnECOw/Rqmr+ORcfSVI/amlp7Q+x0k7nUVzY0/MOP6WK5gf92f2LchlXK4BOW/V/H591gKsfFcvQ/96uW1me747CxegurCWYFaRs8qo37pC6w0R0hVgVpGzyi+fa+sKdWF9x3MF5ijULyTwHdyX+kNRyqFurHDFhPMM83hmbiG0CfNZyzM5q8CvMLlQmLqOgKy7ZNXhzloI0dBB9kr0IOJyDch5w6o2Z99xmPKXqro/kXKHXgJyB4xwuPbKdaacUdP0BS4xuTNYnvkvAAAAAElFTkSuQmCC",
12, 6);
global.sprBazookaCannonProjectile = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAMCAYAAAB4MH11AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAACjSURBVDhP1ZBLCgIxEERzC8HtiJthtq7FC3j/08R+g5WpaSYBQQQLihT9eQ0pP9My33iq+bvSgcf9WSOPDnkve6h1CDjmEFbd++rlnGY3RZOnnk/XZhaw8hGwlzE8oKuiUAJE3B35FK55TIYHdHgAa0HLAl6muR3xvjI8oIdfJKveg/Qye0BdDeYLqssOyTnN7hWDPG2J/HaW97L70gHzP6iUF3cU1TIyjaXCAAAAAElFTkSuQmCC",
1, 12, 6);

#define weapon_name
return "BAZOOKA CANNON";

#define weapon_sprt
return global.sprBazookaCannon;

#define weapon_type
return 4;

#define weapon_fire
sound_play(sndSuperBazooka);
view_shake_at(x, y, 24);

with(instance_create(x+lengthdir_x(24, gunangle), y+lengthdir_y(24, gunangle), CustomProjectile))
{
	direction = other.gunangle;
	image_angle = direction;
	team = other.team;
	creator = other;
	sprite_index = global.sprBazookaCannonProjectile;
	
	speed = 1;
	friction = -0.5;
	
	on_step = bc_step;
	on_destroy = bc_destroy;
}

#define bc_destroy
sound_play(sndExplosionL);
view_shake_at(x, y, 16);

var j = random(360);
for(var i = j; i < j+360; i += 360/5)
{
	with(instance_create(x+lengthdir_x(4, i), y+lengthdir_y(4, i), Explosion))
	{
		team = other.team;
	}
}

var _x = x;
var _y = y;
var _team = team;

//wait(5);

var j = random(360);
for(var i = j; i < j+360; i += 360/5)
{
	with(instance_create(_x+lengthdir_x(24, i), _y+lengthdir_y(24, i), Rocket))
	{
		team = _team;
		direction = i;
		image_angle = direction;
		
		var msk = mask_index;
		mask_index = mskNone;
		
		if(fork())
		{
			wait(5);
			
			if(instance_exists(self))
			mask_index = msk;
			
			exit;
		}
	}
}

#define bc_step
if(speed > 16)
{
	speed = 16;
	friction = 0;
}
