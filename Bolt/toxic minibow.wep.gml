#define init 
sprToxicMinibow = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAAB8AAAARCAYAAAAlpHdJAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QEIACgzC5WsZAAAAX9JREFUSMe1VbtqwzAUPTIesrRLQNBQQqas2duhEDR69mbyA/mCtGPIFxT6Ad06l0yhUILzA50CGUwIKQiyZ6o6OFKvFNlJW3SNwej4nnMfuhIQxtThrbUokDiGo/HJIBjCmToEgMfJg1cvpLjOHE4QLHjZSXJMZ56kGc7ZC77No87YTD7M+CdpZnFFp0STNDNlo310glI1GIajseGg/8RVfbq7aqLDmyjmU3zMpxj0uijkDu3rFqCAt6+G5dSP9mg/tQyDxvvRHrhH6QcYfzAgdkUHva5F2uFNFHKHQu4AAOvNFmLBMXEiFrjEerMtvwkucGn8itXS4DNIxG6m2rRYlc1upC2+4F7cXadYrIWpaeH3z+MALlZLzG7lMSEkGmmZGcXpOoAye/YzCoqKU0GRc0rGaHsqzggfpsiY4fXl2TpjrB0rcq5EzhUOj8i5+u1sugElaaaGo3EtjyUKdTTff7pc6oSZp2T/PX6tMpNSs9AXi/L0tlKHhbhIzuX+Btn8wT4cHvitAAAAAElFTkSuQmCC",7,7);

#define weapon_name
return "TOXIC MINIBOW"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_cost
return 1; // 1 Ammo

#define weapon_area
return 21; // L1 2-1+

#define weapon_load
return 3; // 0.10 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapBow; // Swap Sound

#define weapon_fire
sound_play(sndCrossbow); // Sound
weapon_post(8, -20, 8);

with instance_create(x,y,ToxicBolt){
	motion_add(other.gunangle + (random_range(-14, 14) * other.accuracy),22)
	image_angle = direction;
	team = other.team;
	creator = other;
}

#define weapon_sprt
return sprToxicMinibow; // Wep Sprite

#define weapon_text
return "A SEA OF GREEN"; // Loading Tip