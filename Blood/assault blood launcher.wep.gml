#define init
sprAssaultBloodLauncher = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABYAAAASCAYAAABfJS4tAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QMDFzQFlvAFNAAAAB1pVFh0Q29tbWVudAAAAAAAQ3JlYXRlZCB3aXRoIEdJTVBkLmUHAAABIUlEQVQ4y8VUsW3DMBA8Ct5CG7gykMpIkwHUWCNYAyRVCqtmGSALSN6AFQdQQzgNASaFu5Segy5oPZ6yZEu2AT9A3D/AP/4fnwSeZP60JltybUMl17iV/GLFzmjPKvdju0jGsMsUcEYjQ0CZ4moXSY+WZxXtDgFXQRaKBzrxUcXOaKqC+5yQx85ovOdzOKNpVWzfjCc4o2EbRf726xMA8Gd/8PKWE7b2rfaAyiheBBBRxbZRsI1CUdZYvGa9uv2rPR0EAB/5HL9G0xqaoEjnSq59OxXZAHa1bXO6UgjuF2U9eOvLNAopj+dcGjfRJWpxcwDdRU+OGDXHtlF8vIiwKOtul9Nfn0yDfv7k+zv+kIiYE/pHPulb+hUTvs97z3qMHQFePqZZmDVPyAAAAABJRU5ErkJggg==", 4, 7);

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
return sprAssaultBloodLauncher; // Wep Sprite