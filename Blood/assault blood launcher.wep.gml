#define init
	global.sprAssaultBloodLauncher = sprite_add_weapon("../Sprites/Blood/AssaultBloodLauncher.png", 4, 7);

#define weapon_name
	return "ASSAULT BLOOD LAUNCHER"; // Name

#define weapon_type
	return 4; // Explosive Wep

#define weapon_cost
	return 0; // No ammo, for blood purposes

#define weapon_load
	return 23; // 0.77 Seconds

#define weapon_auto
	if(ammo[weapon_get_type(argument0)] < 3) return 0;	// Not Automatic When Out Of Ammo
	else return 1;										// Automatic Otherwise

#define weapon_area
	return 10; // L0 5-1+

#define weapon_swap
	return sndSwapExplosive; // Swap sound

#define weapon_fire
	 // HP Ammo:
	if(ammo[weapon_get_type(argument0)] < 3){
		sound_play(sndBloodHurt);
		projectile_hit(self, 2, 0, 0);
		lasthit = [weapon_get_sprite(argument0), weapon_get_name(argument0)];
		ammo[4] += 3;
	}
	if(infammo = 0) ammo[weapon_get_type(argument0)] -= 3;

	repeat(3) if instance_exists(self){
		sound_play(sndBloodLauncher);	// Sound
		weapon_post(6, -6, 6);			// Kick, Shift, Shake
		
		 // Blood Nades:
		with instance_create(x, y, BloodGrenade){
			motion_add(other.gunangle + (random_range(-6, 6) * other.accuracy), 10);
			image_angle = direction;
			hitid = [sprite_index, "BLOOD GRENADE"];
			team = other.team;
			creator = other;
		}
		
		wait 4;
	}

#define weapon_sprt
	return global.sprAssaultBloodLauncher; // Wep Sprite