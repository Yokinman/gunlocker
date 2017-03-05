#define init 
sprCampfireGun = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAAB0AAAANCAYAAABVRWWUAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTJDBGvsAAAAsklEQVQ4T8WPwQ3CMAxFswFHJAbgAOKK2AGJDdiOSZirUtAL/sGlNqe2fOmptZ36pcVSHaul3q73Bu/v1vKpp+P5W+yJks38d9G8p0l32/1Inlyg8TzEfaiPTcPqNE0oqRezfLh8FgF11PczdhppJlJBTwJBzSzq68lO42dCKehCQmd5RuivrU4zEURCzhkkW+rPRfOeLpGIHkhI33qzpUscZHSZJcRZ/iIlkq0qnTGlvAAiuuikdtYPRwAAAABJRU5ErkJggg==",4,4);

#define weapon_name
return "CAMPFIRE"; // Name

#define weapon_type
return 1; // Bullet Wep

#define weapon_cost
return 1; // 1 Ammo

#define weapon_area
return 13; // L0 6-1+

#define weapon_load
return 1; // 0.03 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapMachinegun; // Swap Sound

#define weapon_fire
sound_play(sndMinigun); // Sound
weapon_post(5, -6, 6);

with instance_create(x,y,Shell){ // Empty Bullet Casing
	motion_add(other.gunangle + other.right*100 + random_range(-30,30),2+random(3))
}
with instance_create(x+lengthdir_x(2,gunangle), y+lengthdir_y(2, gunangle),FlameShell){ // Flame Shell
	motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+(random_range(-16, 16)*other.accuracy),14+random(2))
	team = other.team;
	creator = other;
}

motion_add(gunangle - 180, 0.4); // Push Player Backwards A Bit

#define weapon_sprt
return sprCampfireGun; // Wep Sprite

#define weapon_text
return "MELT DOWN"; // Loading Tip