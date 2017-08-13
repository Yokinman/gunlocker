#define init
	global.sprGatlingBloodLauncher = sprite_add_weapon("../Sprites/Blood/GatlingBloodLauncher.png", 4, 3);

#define weapon_name
	return "GATLING BLOOD LAUNCHER"; // Name

#define weapon_type
	return 4; // Explosive Wep

#define weapon_cost
	return 0; // No ammo, for blood purposes

#define weapon_load
	return 9; // 0.30 Seconds

#define weapon_auto
	return 1; // Always automatic

#define weapon_area
	return 8; // L0 4-1+

#define weapon_swap
	return sndSwapExplosive; // Swap sound

#define weapon_fire
	 // HP Ammo:
	if(ammo[weapon_get_type(argument0)] < 1){
		sound_play(sndBloodHurt);
		projectile_hit(self, 1, 0, 0);
		lasthit = [weapon_get_sprite(argument0), weapon_get_name(argument0)];
		ammo[4] += 1;
	}
	if(infammo = 0) ammo[weapon_get_type(argument0)] -= 1;

	sound_play(sndBloodLauncher);	// Sound
	weapon_post(8, -10, 12);			// Kick, Shift, Shake
	
	 // Blood Nades:
	with instance_create(x, y, BloodGrenade){
		motion_add(other.gunangle + (random_range(-6, 6) * other.accuracy), 10);
		image_angle = direction;
		hitid = [sprite_index, "BLOOD GRENADE"];
		team = other.team;
		creator = other;
	}

#define weapon_sprt
	return global.sprGatlingBloodLauncher; // Wep Sprite