#define init
	global.sprBouncerCannon = sprite_add_weapon("../Sprites/Bouncer/BouncerCannon.png", 2, 4);

#define weapon_name
	return "BOUNCER CANNON" // Name

#define weapon_type
	return 1; // Bullet Wep

#define weapon_load
	return 28; // 0.93 Seconds

#define weapon_cost
	return 16; // 16 Ammo

#define weapon_area
	return 10; // L0 5-1+

#define weapon_auto
	return 1; // Automatic

#define weapon_swap
	return sndSwapMachinegun; // Swap Sound

#define weapon_fire
	sound_play(sndBouncerShotgun);	// Sound
	weapon_post(8, -20, 5);			// Kick, Shift, Shake
	motion_add(gunangle + 180, 4);	// Knockback

	 // Empty Bullet Casings:
	repeat(8) scrShells(180, 30, 2 + random(3), sprBulletShell);

	 // Bouncer Ball:
	with mod_script_call("mod", "bouncer_tools", "bouncerball_create", x, y){
		move_contact_solid(other.gunangle, 8);
		motion_add(other.gunangle + (random_range(-4, 4) * other.accuracy), 4.5);
		image_angle = direction;
		team = other.team;
		creator = other;
	}

#define scrShells(_angle, _spread, _speed, _sprite)
	mod_script_call("mod", "gunlocker_tools", "scrShells", _angle, _spread, _speed, _sprite);

#define weapon_sprt
	return global.sprBouncerCannon; // Wep Sprite

#define weapon_text
	return "CLUTTERED VISION"; // Loading Tip
