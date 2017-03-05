#define init 
sprBonfireGun = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABsAAAAOCAYAAADez2d9AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTJDBGvsAAAA2ElEQVQ4T7WQQQrCMBREg2vBpeABXChuxTsUvIG360k8lxCdJBMnv7+hFDrwaP+fdiZt+CkKmys+h1cC93mVpIewnqrnq5f8eLvebWHaKdxb3peM54E4HhJlDvF0PDeFeq8g9PP4BwDM3l49FtcyWzgHgwlmYve4DvtdUwbVwl4p9vARsBR+JTpyVVZT1oPP6a/ClcGEHrILjRaVeeA9hBMeYK4sLXhqL1Cxz3O28CvLXFWDvEInlPJ2lHqNPwnHjnTKVkmDKijQQ4DibaJJadltKpasLAvhC34Ofp+FZceJAAAAAElFTkSuQmCC",5,4);

#define weapon_name
return "BONFIRE"; // Name

#define weapon_type
return 1; // Bullet Wep

#define weapon_cost
return 2; // 2 Ammo

#define weapon_area
return 21; // L1 2-1+

#define weapon_load
return 1; // 0.03 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapMachinegun; // Swap Sound

#define weapon_fire
weapon_post(6,-10,6)
sound_play(sndIncinerator); // Sound

repeat(2){
	with instance_create(x,y,Shell){ // Empty Bullet Casings
		motion_add(other.gunangle + other.right*100 + random_range(-40,40),3+random(2))
	}	
	with instance_create(x+lengthdir_x(4,gunangle), y+lengthdir_y(4, gunangle),FlameShell){ // Flame Shells
		motion_add(other.gunangle + (random_range(-18, 18)*other.accuracy),14 + random(2));
		team = other.team;
		creator = other;
	}
}

motion_add(gunangle - 180,0.7) // Move Player Backwards

#define weapon_sprt
return sprBonfireGun; // Wep Sprite

#define weapon_text
return "BURN THEM ALL"; // Loading Tip