#define init
global.sprAssaultLauncher = sprite_add_weapon("../Sprites/Grenade/AssaultNader.png", 4, 6)

#define weapon_name
return "ASSAULT LAUNCHER"; // Name

#define weapon_type
return 4; // Explosive Wep

#define weapon_load
return 28; // 0.93 Seconds

#define weapon_cost
return 3; // 3 Ammo

#define weapon_area
return 6; // L0 3-1+

#define weapon_swap
return sndSwapExplosive; // Swap sound

#define weapon_fire
repeat(3){
    sound_play(sndGrenade); // Sound
    weapon_post(4, -6, 4);

    with instance_create(x,y,Grenade){ // Grenades
        motion_add(other.gunangle + (random_range(-3,3) * other.accuracy),10);
        image_angle = direction;
        team = other.team
        creator = other;
    }

    wait 3;
}

#define weapon_sprt
return global.sprAssaultLauncher; // Wep Sprite