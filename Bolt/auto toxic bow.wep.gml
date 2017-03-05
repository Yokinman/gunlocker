#define init 
sprAutoToxicBow = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABEAAAAJCAYAAADU6McMAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QEIASwKMT6LXwAAALJJREFUKM+VkjEKAjEURN+qhSdIYCtt1iKkW6IH2MIz2noDQbCyS2MrFlbuGaxs5Fvoxt2sER0Ykgz/zw+TwH+QFzsYJIpiBlReJc2CSeWVLO9j2bcYNYSaRs9iR2scelUDMFpcAdgNb71p1jgAjqfD0yTXRaegLOdc6jPTyQwg7OMVYLNdv6+Y60JyXQgg1rjOOcXKq142bUEa40SAvVy+Pqk17mOw7aHZD/+iQRZpofcB4H9jh20GtvUAAAAASUVORK5CYII=",2,3);

#define weapon_name
return "AUTO TOXIC BOW"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_area
return 9; // L0 4-1+

#define weapon_load
return 9; // 0.30 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapBow; // Swap Sound

#define weapon_fire
sound_play(sndCrossbow); // Sound
weapon_post(6, -30, 15);

with instance_create(x,y,ToxicBolt){ // Toxic Bolt
	motion_add(other.gunangle + (random_range(-6, 6) * other.accuracy),22)
	image_angle = direction;
	team = other.team;
	creator = other;
}

#define weapon_sprt
return sprAutoToxicBow; // Wep Sprite

#define weapon_text
return "GREEN THUMB"; // Loading Tip