#define init 
sprHeavySMG = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABEAAAANCAYAAABPeYUaAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QEDFxABGrVz6wAAAL9JREFUKM+tkzEKwkAQRd9KDiAoCFZJYwqxC3pgbyB4iEg6sTCNVoFABG+wNpkw2YyRgB+WZXf+/Bn+7MIf4NrdG3cWTJ6TwG67B+B6u3xVCDh9EQkKkjg1RR7Pu1nIAX692gCwWM4BeDVvU0TiutDpfCTSJEnOsoMpUhS54uZDY6WbKajqcjAJDyBiVV2ihfVZkiU/Cv2xKoWeVHW/gZllnjLQaXISp+bkBiIB0bdr7AH2pzPyortx/iRN/AIdPpyGOkpEz20zAAAAAElFTkSuQmCC",3,4);

#define weapon_name
return "HEAVY SMG"; // Name

#define weapon_type
return 1; // Bullet Wep

#define weapon_cost
return 2; // 2 Ammo

#define weapon_area
return 11; // L0 5-2+

#define weapon_load
return 3; // 0.10 Seconds

#define weapon_swap
return sndSwapMachinegun; // Swap Sound

#define weapon_auto
return 1; // Automatic

#define weapon_fire
sound_play(sndHeavyMachinegun);

with instance_create(x,y,Shell){ // Empty Heavy Bullet Casing
	motion_add(other.gunangle + other.right*100 + random_range(-25,25),2+random(2));
	sprite_index = sprHeavyShell;
}
with instance_create(x+lengthdir_x(6,gunangle), y+lengthdir_y(6, gunangle),HeavyBullet){ // Heavy Bullet
	motion_set(point_direction(x, y, mouse_x[other.index],mouse_y[other.index])+((18*random_range(-1, 1))*other.accuracy), 16);
	image_angle = direction;
	team = other.team;
	creator = other;
}

weapon_post(4, 6, 6)

#define weapon_sprt
return sprHeavySMG; // Wep Sprite

#define weapon_text
return ""; // Loading Tip