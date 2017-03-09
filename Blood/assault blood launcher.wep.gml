#define init
global.sprAssaultBloodLauncher = sprite_add_weapon("../Sprites/Blood/AssaultBloodLauncher.png", 4, 7);

#define weapon_name
return "ASSAULT BLOOD LAUNCHER"; // Name

#define weapon_type
return 4; // Explosive Wep

#define weapon_cost
return 0; // No Ammo, For Blood Purposes

#define weapon_load
return 23; // 0.77 Seconds

#define weapon_auto
with(Player) if(wep = "assault blood launcher"){
	if(ammo[weapon_get_type(wep)] < 3) return 0; // Not Automatic When Out Of Ammo
	else return 1; // Automatic Otherwise
}

#define weapon_area
return 10; // L0 5-1+

#define weapon_swap
return sndSwapExplosive; // Swap sound

#define weapon_fire
 // Use Health In Place Of Ammo, When Out Of Ammo:
if(ammo[weapon_get_type(wep)] < 3){
	my_health -= 2;
	image_index = 0;
	sprite_index = spr_hurt;
	sound_play(snd_hurt);
	sound_play(sndBloodHurt);
	ammo[weapon_get_type(wep)] += 3;
}
ammo[weapon_get_type(wep)] -= 3;

repeat(3) if instance_exists(self){ // Blood Nades
	sound_play(sndBloodLauncher); // Sound
	weapon_post(6, -6, 6);
	
	with instance_create(x, y, BloodGrenade){ // Blood Nades
		motion_add(other.gunangle + (random_range(-6, 6) * other.accuracy), 10);
		image_angle = direction;
		team = other.team;
		creator = other;
	}
	
	wait 4;
}

#define weapon_sprt
return global.sprAssaultBloodLauncher; // Wep Sprite