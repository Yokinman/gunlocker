#define init
	global.sprAlphaBloodLauncher = sprite_add_weapon("../Sprites/Blood/AlphaBloodLauncher.png", 8, 7);

#define weapon_name
	return "ALPHA BLOOD LAUNCHER"; // Name

#define weapon_type
	return 4; // Explosive Wep

#define weapon_cost
	return 0; // No ammo, for blood purposes

#define weapon_load
	return 9; // 0.30 Seconds

#define weapon_auto
	return 1; // Always auto even when taking health

#define weapon_area
	return 15; // L0 7-3+

#define weapon_swap
	return sndSwapExplosive; // Swap sound

#define weapon_fire
	 // HP Ammo:
	if(ammo[weapon_get_type(argument0)] < 5){
		sound_play(sndBloodHurt);
		projectile_hit(self, 1, 0, 0);
		lasthit = [weapon_get_sprite(argument0), weapon_get_name(argument0)];
		ammo[4] += 5;
	}
	if(infammo = 0) ammo[weapon_get_type(argument0)] -= 5;

	fireAngle = -15+random_range(-8,8)
	repeat(4) {
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
	return global.sprAlphaBloodLauncher; // Wep Sprite