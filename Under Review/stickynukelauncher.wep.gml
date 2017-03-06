#define init
sprStickyNukeLauncher = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAAAwAAAAKCAYAAACALL/6AAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4AsUEjoUUuo94QAAAGdJREFUGNNjYCARMGIR+49PHSO6Ij/vWLiq+w9uMly+egpD539dbTO8znj75gODsIgAw+WrpxhY0CVMTMzh/DNnTqLIoThJSlwNpw3PXt7CKv5fV9vsP9Q/6BgOWEgIPey24AhW8gEAJo0lIr2C2/oAAAAASUVORK5CYII=",-2,3);
global.spr_ConceptStickyNuke = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4AsZDzEWuYRt+AAAAKFJREFUOMtjYBg24D8UkwyYYBr9vGPRDfqPB8MBIwMDw38pcTUGBgYGBmERAQYGBgaGy1dPMehqm6HYJH3pEpy9g/kHTC8DCwMDA4OJiTnD/Qc3GRQV1OGKkNkMDAwMBQwQA7qweIHhzJmTRPu5DI0PdwHEkJsMDAwMDG/ffICzYaALTyCS5AKsBsACDwaevbxFehrw8479T040UpyQhgEAALy7OdTrjS8OAAAAAElFTkSuQmCC",1,6,8)

#define weapon_name
return "STICKY NUKE LAUNCHER"; // Name 

#define weapon_type
return 4; // Explosive Wep

#define weapon_cost
return 3; // 3 Ammo

#define weapon_area
return 13; // L0 6-1+

#define weapon_load
return 55; // 1.83 Seconds

#define weapon_swap
return sndSwapExplosive; // Swap Sound

#define weapon_fire
sound_play(sndNukeFire); // Sound

wkick = 10;

var qx = x, qy = y;
var q = instance_create(x+lengthdir_x(5, gunangle), y+lengthdir_y(5, gunangle),Nuke);

while(instance_exists(q)){
	with q{
		motion_add(point_direction(x, y, mouse_x, mouse_y), 0.80);
		speed = clamp(speed,2,5.32);
		image_angle = direction;
		sprite_index = global.spr_ConceptStickyNuke;
		team = 2;
		wait 1;
	}
}
	
#define weapon_sprt
return sprNukeLauncher; // Wep Sprite