#define init 
sprPopMinigun = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAAB0AAAANCAYAAABVRWWUAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAB3RJTUUH4QEHFS42byuOoAAAAUlJREFUOMu1lLFqAkEQhr8R22BxEDhB3EK0OERIEZIm9wCRlFYRX8AnsPZFQqxS5wVMk1SBFCkMgZwIGgIW4SBVYCzU4+7cU0j0h2FnZ3bnZ2Z3RkhBVTk08mvl6rINgIgcnDi3Vj6CUUQuIoiIWgSLZPky70aoe6eJKvuuo51GVX3X0WarrYBVtvm6vb52e30FVAcFdFBYVtOSvXYa1WgTfM0JjUexVMZUaomDwfsIU6lFa9o3nYx5fnwA4PcMyT9hJVXfdTDHTkQIEBqPo+A1cTA0HgDFUpnpZJz5fmtSHRQEQK6/EVWN11l919m4GBqP+s9nwnbz8gbAyflFFDiNZmv5Oe/vbndnGsdwNo/0uG9ll9X7WWMlNvFMt5HGAuO7DsPZPN1Lsq82iv/AjQwPim0DQlU3/Fk2G2TX9Ek0855GZe4/Gf8VCwFaoFfXujPBAAAAAElFTkSuQmCC",6,4);

#define weapon_name
return "POP MINIGUN"; // Name

#define weapon_type
return 1; // Bullet Wep

#define weapon_cost
return 1; // 1 Ammo

#define weapon_area
return 7; // L0 3-2+

#define weapon_load
return 1; // 0.03 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapMachinegun; // Swap Sound

#define weapon_fire
sound_play(sndPopgun) // Sound
weapon_post(2,-6,3);

with instance_create(x,y,Shell){ // Empty Bullet Casing
	motion_add(other.gunangle + other.right*100 + random_range(-25,25),2+random(2))
}
with instance_create(x+lengthdir_x(4,gunangle), y+lengthdir_y(4, gunangle),Bullet2){ // Shell
	motion_add(other.gunangle + (random_range(-14, 14) * other.accuracy),15+random(1));
	team = other.team;
	creator = other;
}

motion_add(gunangle - 180,0.4); // Push Player Backwards A Bit

#define weapon_sprt
return sprPopMinigun; // Wep Sprite

#define weapon_text
return "LET'S GET TO WORK"; // Loading Tip