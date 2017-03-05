#define init
sprAutoFlareGun = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABcAAAALCAYAAACUPhZAAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAB3RJTUUH4AsWASgB86p8ewAAAB1pVFh0Q29tbWVudAAAAAAAQ3JlYXRlZCB3aXRoIEdJTVBkLmUHAAAA3klEQVQoz2NgoCP4D8VUAUzoAmetWBjQLPiPhol2HIbhG17+R7bgf60yMwMyxmIZHOdUtaCYxYJsqzcPE8O5l/8Zzr38z2BkaccgefkIQ4A4I4qGcy+ZGBi9ookKFpjh/40s7RieQzlSsvIMUgwMDP8vH2HY8BIzJJ49fkiS4Shgy6rFcHaTHqqS5rt/GRiOH2JgYGBgqFVmZggQZ2QwPvYH6qhY/BF6DqKRkYCjsMkzIjsKp8uhEcTIwMDwH1uwIPui+S6KZYy4XPAfmxg0hSCChLCv8HoPmy9IUQ8HACxQTkZdVSB9AAAAAElFTkSuQmCC",5,4);

#define weapon_name
return "AUTO FLARE GUN"; // Name 

#define weapon_type
return 4; // Explosive Wep

#define weapon_cost
return 1; // 1 Ammo

#define weapon_area
return 7; // L0 3-2+

#define weapon_load
return 10; // 0.33 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapFlame; // Swap Sound

#define weapon_fire
sound_play(sndFlare); // Sound
weapon_post(5, -8, 4);

with instance_create(x,y,Flare){
    motion_add(point_direction(x, y, mouse_x[other.index], mouse_y[other.index])+((12*random_range(-1, 1))*other.accuracy), 9);
    team = other.team;
	creator = other;
}

#define weapon_sprt
return sprAutoFlareGun; // Wep Sprite

#define weapon_text
return "RAPID-FIRE S.O.S."; // Loading Tip