#define init 
sprWelder = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABIAAAAKCAYAAAC5Sw6hAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTJDBGvsAAAAlUlEQVQoU32Q0Q2EMAxDuwF7cOIXsQMSG9x2NwlzIQXZ4F5IUyyZpKnzBJQoM6PROmfiXc27RS87lmL7+IA1tt/wPwcQhwAgBAOYVeSU4Z4D2bZ+6ekzc0Fv9VbhCmITQAoKGmsDwgOXgqGXEe5V5W9TdRF9du7Z/RaqCegT0Sscl6BsVnVfdGFR2YxyC4Rcoz7oUikn07ME7Nf1vegAAAAASUVORK5CYII=",3,3);

#define weapon_name
return "WELDER"; // Name

#define weapon_type
return 1; // Bullet Wep

#define weapon_cost
return 2; // 2 Ammo

#define weapon_area
return 5; // L0 2-1+

#define weapon_load
return 10; // 0.33 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapMachinegun; // Swap Sound

#define weapon_fire
repeat(3) if instance_exists(self){
	 // Sound:
	sound_play(sndIncinerator);
	sound_play(sndPopgun);
	
	weapon_post(3, -5, 4);
	
	with instance_create(x,y,Shell){ // Empty Bullet Casings
		motion_add(other.gunangle + other.right*100 + random_range(-25,25),3+random(2))
	}
	
	with instance_create(x,y,FlameShell){ // Flame Shells
		motion_add(other.gunangle + (random_range(-6, 6) * other.accuracy),16);
		team = other.team;
		creator = other;
	}
	wait(2);
}


#define weapon_sprt
return sprWelder; // Wep Sprite

#define weapon_text
return "HOT TO THE TOUCH"; // Loading Tip