#define init 
sprMinibow = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAAB8AAAARCAYAAAAlpHdJAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAB3RJTUUH4QEIASM6kH+nPAAAAWNJREFUSMe1VLtqwzAUPQpeCwWXQEII7pIOpWTrmh/w7M3kB/wFpqPpF+QPunUu2UumZjUZXAIRwajYxNA/UIdGRlLkxxBdENg+1jnnXl1dwE7w82qNgSVxRHHSaYLAXvCzAaxeX4x6NsVF5tBMEOtll5IjInM/CNGnF0zNw3s0kwmr9/tBqHANukT9IKzLJp+jZoq3YIjipOaQ/3GazmkxcuENXdDNGulmjeV8BlpWmE7GeHp8xr33oGw60AzTyRgAFPxAMwCoMbE/3W3h6KLL+Uwh9YYuaFmBlhUA4JgzVKdfVKevC9fHnAGAET/mDHSf1TgAOHqmIoRYU7h3t8q7INRx/bvAWPEvjsXIVUBZ+PNHNXGzz8CKb7Di0pDITMfFd/Gc7rb1VeC6uCZKTD3RMCNMGJeuGT7e3xRe3rCuNmj8IORRnFybt3s+tAkTWyNVlFkqNbEtzg1n26hDbGTdl/sPRfO3GM72jRwAAAAASUVORK5CYII=",7,7);

#define weapon_name
return "MINIBOW"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_area
return 18; // L1 1-1+

#define weapon_load
return 3; // 0.10 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapBow; // Swap Sound

#define weapon_fire
sound_play(sndCrossbow); // Sound
weapon_post(8, -20, 8);

 // Innacurate Bolt:
with instance_create(x,y,Bolt){
	motion_add(other.gunangle + (random_range(-12, 12) * other.accuracy),24)
	image_angle = direction;
	team = other.team;
	creator = other;
}

motion_add(gunangle - 180,1.2); // Push Player Backwards A Bit

#define weapon_sprt
return sprMinibow; // Wep Sprite

#define weapon_text
return "10 BOLTS PER SECOND"; // Loading Tip