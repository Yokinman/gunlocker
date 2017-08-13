#define init
	global.sprMegaBloodLauncher = sprite_add_weapon("../Sprites/Blood/MegaBloodLauncher.png", 10, 7);

#define weapon_name
	return "MEGA BLOOD LAUNCHER"; // Name

#define weapon_type
	return 4; // Explosive Wep

#define weapon_cost
	return 0; // No ammo, for blood purposes

#define weapon_load
	return 35; // 1.17 Seconds

#define weapon_auto
	if(ammo[weapon_get_type(argument0)] < 10) return 0;	// Not Automatic When Out Of Ammo
	else return 1;										// Automatic Otherwise

#define weapon_area
	return 14; // L0 7-2+

#define weapon_swap
	return sndSwapExplosive; // Swap sound

#define weapon_fire
	 // HP Ammo:
	if(ammo[weapon_get_type(argument0)] < 10){
		sound_play(sndBloodHurt);
		projectile_hit(self, 3, 0, 0);
		lasthit = [weapon_get_sprite(argument0), weapon_get_name(argument0)];
		ammo[4] += 10;
	}
	if(infammo = 0) ammo[weapon_get_type(argument0)] -= 10;

	fireAngle = -45+random_range(-8,8)
	repeat(10) {
		sound_play(sndBloodLauncher);	// Sound
		weapon_post(12, -20, 15);			// Kick, Shift, Shake
		
		 // Blood Nades:
		with instance_create(x, y, BloodGrenade){
			motion_add(other.fireAngle + other.gunangle + (random_range(-3, 3) * other.accuracy), 10);
			image_angle = direction;
			hitid = [sprite_index, "BLOOD GRENADE"];
			team = other.team;
			creator = other;
		}
		fireAngle += 10
	}

#define weapon_sprt
	return global.sprMegaBloodLauncher; // Wep Sprite