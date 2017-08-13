#define init
	global.sprSuperBloodLauncher = sprite_add_weapon("../Sprites/Blood/SuperBloodLauncher.png", 4, 7);

#define weapon_name
	return "SUPER BLOOD LAUNCHER"; // Name

#define weapon_type
	return 4; // Explosive Wep

#define weapon_cost
	return 0; // No ammo, for blood purposes

#define weapon_load
	return 20; // 0.77 Seconds

#define weapon_auto
	if(ammo[weapon_get_type(argument0)] < 5) return 0;	// Not Automatic When Out Of Ammo
	else return 1;										// Automatic Otherwise

#define weapon_area
	return 10; // L0 5-1+

#define weapon_swap
	return sndSwapExplosive; // Swap sound

#define weapon_fire
	 // HP Ammo:
	if(ammo[weapon_get_type(argument0)] < 5){
		sound_play(sndBloodHurt);
		projectile_hit(self, 2, 0, 0);
		lasthit = [weapon_get_sprite(argument0), weapon_get_name(argument0)];
		ammo[4] += 5;
	}
	if(infammo = 0) ammo[weapon_get_type(argument0)] -= 5;

	fireAngle = -20+random_range(-8,8)
	repeat(5) {
		sound_play(sndBloodLauncher);	// Sound
		weapon_post(10, -15, 12);			// Kick, Shift, Shake
		
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
	return global.sprSuperBloodLauncher; // Wep Sprite