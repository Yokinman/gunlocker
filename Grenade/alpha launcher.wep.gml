#define init
global.spr_AlphaLaunch = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABoAAAANCAYAAAC3mX7tAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA7BAAAOwQG4kWvtAAAAB3RJTUUH4QMEEjQj3+F6mwAAAShJREFUOMulk79qwzAQxn8GP4DBhoApJUNwHiMvUJKtWxePxrMHk9FkyBwyZsmWOXv/bF26ZXDJkJRiCLTQN1CXyEi2wEryLUKnu/vuPt056BCNu2OwmeBc6iDmyxUAby/PbDdrANK84LAv6Q+G9SmxmE2xgdskzpJYpHlBfzBkvlyRJTH3dyFA6wQIexF+4AEwmoy1N4ksiVtEAM5iNhUPj09cg6/vyqqjGlIeG8Lfnz8ADvtSs0vpTURCyiGDtpt1/TemZAB+4DGajFuynomcJpFQ9T7uSq3S466s7Sqq0ycQtQpRu1GJRJoXmuPH6/s5STf8wNMm0TTVjolEqcZ2jzrXx23qruracBZhL1Lk6l5Sm803JbmJyL0kQA5KdbpBQ0uIa2P/AZfbdv9AJ8u0AAAAAElFTkSuQmCC",5,4);

#define weapon_name
return "ALPHA LAUNCHER"; // Name 

#define weapon_type
return 4; // Explosive Wep

#define weapon_cost
return 5; // 5 Ammo

#define weapon_area
return 13; // L0 6-1+

#define weapon_load
return 11; // 0.37 Seconds

#define weapon_swap
return sndSwapExplosive; // Swap Sound

#define weapon_auto
return 1; // Automatic

#define weapon_fire
 // Sound:
sound_play(sndClusterLauncher);
sound_play(sndGrenade);

weapon_post(8, -6, 8);

 // Nades:
ang = gunangle - (15 * accuracy);
repeat (4){
    with instance_create(x,y,Grenade){
        motion_set(other.ang, 10);
        image_angle = direction;
        team = other.team;
		creator = other;
    }
	ang += 10 * accuracy;
}

#define weapon_sprt
return global.spr_AlphaLaunch; // Wep Sprite

#define weapon_text
return "GRENADES UP THE WAZOO"; // Loading Tip