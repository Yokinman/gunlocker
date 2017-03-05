#define init
sprBouncerGun = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAAAwAAAAKCAYAAACALL/6AAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4AsUEjoUUuo94QAAAGdJREFUGNNjYCARMGIR+49PHSO6Ij/vWLiq+w9uMly+egpD539dbTO8znj75gODsIgAw+WrpxhY0CVMTMzh/DNnTqLIoThJSlwNpw3PXt7CKv5fV9vsP9Q/6BgOWEgIPey24AhW8gEAJo0lIr2C2/oAAAAASUVORK5CYII=",-2,3);

#define weapon_name
return "BOUNCER GUN"; // Name 

#define weapon_type
return 1; // Bullet Wep

#define weapon_area
return 5; // L0 2-1+

#define weapon_load
return 5; // 0.17 Seconds

#define weapon_swap
return sndSwapPistol; // Swap Sound

#define weapon_fire
sound_play(sndBouncerSmg); // Sound
weapon_post(4, -6, 3);

with instance_create(x,y,Shell){ // Empty Bullet Casing
	motion_add(other.gunangle + other.right*100 + random_range(-25,25),3+random(2));
}

with instance_create(x,y,BouncerBullet){ // Bouncer Bullet
    motion_add(other.gunangle + (random_range(-4, 4) * other.accuracy), 6);
    team = other.team;
	creator = other;
}

#define weapon_sprt
return sprBouncerGun; // Wep Sprite

#define weapon_text
return "DO A TRICK SHOT"; // Loading Tip