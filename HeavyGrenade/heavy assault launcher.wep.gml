#define init
global.sprHeavyAssaultLauncher = sprite_add_weapon("../Sprites/HeavyGrenade/HeavyAssaultLauncher.png", 5, 8)

#define weapon_name
return "HEAVY ASSAULT LAUNCHER"; // Name

#define weapon_type
return 4; // Explosive Wep

#define weapon_load
return 34; // 1.13 Seconds

#define weapon_cost
return 6; // 6 Ammo

#define weapon_area
return 9; // L0 4-1+

#define weapon_swap
return sndSwapExplosive; // Swap sound

#define weapon_fire
repeat(3) if instance_exists(self){
    sound_play(sndHeavyNader); // Sound
	weapon_post(8, -16, 6);

    with instance_create(x,y,HeavyNade){ // Heavy Grenades
        motion_add(other.gunangle + (random_range(-3,3) * other.accuracy),10.3 + random(1));
        image_angle = direction;
        team = other.team;
        creator = other;
    }

    wait 3;
}

#define weapon_sprt
return global.sprHeavyAssaultLauncher; // Wep Sprite
