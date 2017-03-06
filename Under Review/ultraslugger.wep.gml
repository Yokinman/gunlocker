#define init 
sprUltraSlugger = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABAAAAAICAYAAADwdn+XAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAB3RJTUUH4QEPERUn+5TBWQAAAMJJREFUKM+VkL8KgmAUxX9fOAsuJtgSROWQgy8Q5BJCYI/h1ts4tLi4B43xQXvQUEu9gLgJrQ1fS5qKRB243APn3D8c+A3qXW1O74u5qt1zWWl1DqC1Bol9H8uyANgejowHfcIkI/Z97kVBmGRsPI+547BOUyXK4dJQYmIY7K83VrNptbCOPM+JpEQD1MbziKRsGALTBiA+nTtDWYyGn9cD024E084iMG3l6kajl5oAlKsbAFweRfuQqOfTpYkOUfAHXn9ISJsqtRUhAAAAAElFTkSuQmCC",1,2);
global.sprUltraSlug = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAEAAAAAgCAYAAACinX6EAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QEIFwIpgPUswwAAAUlJREFUaN7tWVsSgyAMzHqBHNAerxzQE2w/xFokttUiVmMYB2d8xF3yMog4F6x9kHdNX3Trzk/AABptR/N6UByZjPfAOQ5SmIskY2ohhwdug56TExAxgF8G3CbicCSUAX9QEsqC/38S8ixAIeNJaVV4mZYsCFozqyz5QDComa5hKCOLgx8pYFB8SpOWpViplx85QQZymqpRZ/W/s4JywOeNHf3dkKCpNYy+v63MxQLetT8oz1mYD2bHungkUU9TPcgaq/okpO1Egoq0nWAzM+wdnFkM2Nz8J44Q3WAJeP4UBw1XFEGT+h7rWcKuKXHE2YhzuQi4CEiqI1RTvG/PALkFMChQWXlCRMwAErQvVL6q29d/MWN53OzB/VCOriGhVDUKk0KHpfD1M+T9d9h9Q+RqiW1Lwkk6wy7b4nNEnG1jxP3WmPvNUffyANxe4akOG4shAAAAAElFTkSuQmCC",2,17,16);
while(true){ // #define step i guess
    with(Slug){
		if("Ultra" in self){
			damage = (48 + (bonus * 5)) - lostdmg;
			if(damage <= 0) instance_destroy();
			if place_meeting(x,y,enemy){
				with instance_nearest(x,y,enemy){
					other.lostdmg += maxhealth;
				}
				with instance_create(x,y,Slug){
					if("Ultra" not in self) Ultra = 1;
					if("lostdmg" not in self) lostdmg = other.lostdmg;
					motion_set(3,10);
					team = 2;
					damage = other.damage - lostdmg;
					sprite_index = global.sprUltraSlug;
					friction = other.friction;
					force = other.force;
					image_xscale = damage * 0.035;
					image_yscale = image_xscale;
				}
			}
		}
	}
    wait(1/2);
}

#define weapon_name
return "ULTRA SLUGGER"; // Name

#define weapon_type
return 2; // Shell Wep

#define weapon_cost
return 2; // 2 Ammo

#define weapon_area
return 1; // ???

#define weapon_load
return 15; // 0.50 Seconds

#define weapon_swap
return sndSwapShotgun; // Swap Sound

#define weapon_fire

if GameCont.rad > 15{
	GameCont.rad -= 16;
	sound_play(sndUltraShotgun);
	wkick = 10;
	with instance_create(x,y,Slug){
		if("lostdmg" not in self) lostdmg = 0;
		sprite_index = global.sprUltraSlug;
		team = 2;
		damage = 53;
		friction = 0.45;
		force = 15;
		image_xscale = damage * 0.035;
		image_yscale = image_xscale;
		motion_set(point_direction(x, y, mouse_x[other.index], mouse_y[other.index])+((2*random_range(-1, 1))*other.accuracy),13);
		if("Ultra" not in self) Ultra = 1;
	}
}
else{
	ammo[2] += 2;
	wkick = -3;
	sound_play(sndUltraEmpty);
	with instance_create(x,y,PopupText){
		mytext = "NOT ENOUGH RADS"
	}
}

#define weapon_sprt
return sprUltraSlugger; // Wep Sprite

#define weapon_text
return ""; // Loading Tip