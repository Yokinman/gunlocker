#define init
sprPorcupine = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABkAAAAOCAYAAADaOrdAAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QEIAwczG88qUAAAAB1pVFh0Q29tbWVudAAAAAAAQ3JlYXRlZCB3aXRoIEdJTVBkLmUHAAABHUlEQVQ4y9WTv0oDQRDGfye+wVUniCnCpZIDO5uc9lsvNsthn8Y2pAwprMUyoOlSx948gqVicf7hhOBVPsBYmIu36yWnEhA/GJbd2f1mZ74Z+K8QkfWRKW0AZG5LsbHicS3aB4dusHokUUgShT+uzun5UEoZucZmcTMOfC5u7ipJ6qI8PmcobWg0W9b52aAHgFf3S4BOt1/pTO9vyZ4e2NreYTIeffHHge9dZ68rySWJQokDX/b22wKI0sZa3bJUBEFEPjJR2jAZj6QsfKPZ4u3qknSWs3t88qtMAE9EPjUpkxcoNJoOelZDpLOc6Uu+2B+ZIUCVJuJKIkqbhc27xiqfW56idTvd/tLucgfTciptvjsvZY3WP/HO5/4W78h/kCtZk+ZUAAAAAElFTkSuQmCC", 5, 8);

#define weapon_name
return "PORCUPINE"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_cost
return 2; // 2 Ammo

#define weapon_load
return 24; // 0.8 Seconds

#define weapon_auto
return 0; // Semi

#define weapon_area
return 4; // L0 4-1+

#define weapon_swap
return sndSwapBow; // Swap sound

#define weapon_fire
repeat (3)
{
    wkick = 3;
    sound_play(sndSplinterPistol); // Sound

	repeat (3)
	{
		with (instance_create(x, y, Splinter)) // Bolt volley
		{
			motion_add(other.gunangle + (6 * random_range(-1, 1) * other.accuracy), 16 + random(8));
			image_angle = direction;
			team = other.team
			creator = other;
		}
	}

    wait 4;
}

#define weapon_sprt
return sprPorcupine; // Wep Sprite