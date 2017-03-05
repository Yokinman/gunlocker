#define init 
sprAutoDiscGun = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABAAAAAICAYAAADwdn+XAAAABmJLR0QAAAAAAAD5Q7t/AAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAB3RJTUUH4AsGAwUyP83EcwAAAKNJREFUKM+Vj0EKgzAURF+KBxBaEFzpRhch21yi0Bv0dL1BoYcoeAGziSshoOAN7MIoabBCH3wImcxkPvxm9nPI6Ui8Xe9EIXM84uB38qwCoHcmDMR2LWVR83w9SPaMSmrKot4ubZcyDhO2awEYhwlYzklYUUntRWiaN+dLGhj2EcCspP562DtDnlVb9ZV1pZXemSUgFLxJBM1EvGLcIBYEf/ABhWc9eP9LDbgAAAAASUVORK5CYII=",2,2);

#define weapon_name
return "AUTO DISC GUN"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_area
return 8; // L0 3-3+

#define weapon_load
return 5; // 0.17 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapBow; // Swap Sound

#define weapon_fire
sound_play(sndDiscgun) // Sound
weapon_post(3, -10, 8);

with instance_create(x,y,Disc){ // Disc
	motion_add(other.gunangle + (random_range(-10, 10) * other.accuracy),5)
	image_angle = direction;
	team = other.team;
	creator = other;
}

#define weapon_sprt
return sprAutoDiscGun; // Wep Sprite

#define weapon_text
return "USE AT YOUR OWN RISK"; // Loading Tip