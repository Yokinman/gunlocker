#define init
sprVaporizer = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABkAAAARCAYAAAAougcOAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAB3RJTUUH4QMDFzQRjCrRSQAAAW5JREFUOMu9lE1qAkEQhb9OXCcDMxDIalYRFFcJgwSSC4TcIJ5AT+ABPEE8QY4QcgEFSTxAQFezEgQFx2wNnYV2TTnGnwnEgma6q3rq1at+3XAEMzn327/kOMkDsKhCpwTuu6WIjUIKeaovvEOlHBH6ReKvAdBfiy+qyz3KZzRVuwulU4Lbs+X8tHEu/u/nRNbdVsJdM42Zp0TyC5NKOSIMi8TxgOlkhh94tG0/14F1W4kUo4o3AhKGRV7fXiR6fVOjHkPb9rM/bjXNxDaETcokjgdaLdYB12Noz1Mg3aIDmKzJz15eXAEwGg8BeHyooQtwrdNJevN03ZuvM9HnojUuQAB+4Ekbs0DO6iYSn54D3H+mWFrCZjQeKpUtAaeTDwHMJsraL60yu26rrZSjFchMWgig2Wq/k7piIPn33vhVIuPGaDzEDzz8wMMV4mK6RZqAOfCNyu6zWhgr6Zu8b5fJjI24vlP/bXbfk3Q0+wHVO4Vo3v11PwAAAABJRU5ErkJggg==", 5, 7);

#define weapon_name
return "VAPORIZER"; // Name

#define weapon_type
return 1; // Bullet Wep

#define weapon_cost
return 4; // 4 Ammo

#define weapon_load
return 2; // 0.07 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_area
return 19; // L1 1-2+

#define weapon_swap
return sndSwapFlame; // Swap sound

#define weapon_fire
weapon_post(10, -10, 10);

var ang = -22.5 * accuracy;
repeat(4){
	sound_play(sndIncinerator); // Sound

	with instance_create(x,y,Shell){ // Empty Bullet Casings
		motion_add(other.gunangle + other.right*100 + random_range(-25,25),4+random(3));
	}
	with (instance_create(x, y, FlameShell)){ // Flame Shells
		motion_add(other.gunangle + ang + (random_range(-4, 4) * other.accuracy), 16);
		image_angle = direction;
		team = other.team;
		creator = other;
	}
	ang += 15 * accuracy;
}

motion_add(gunangle - 180, 0.4); // Push Player Backwards A Bit



#define weapon_sprt
return sprVaporizer; // Wep Sprite

#define weapon_text
return "GONE IN AN INSTANT"; // Loading Tip