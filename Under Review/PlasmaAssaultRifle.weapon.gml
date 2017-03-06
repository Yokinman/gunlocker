#define init
sprPlasmaAssaultRifle = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABkAAAAOCAYAAADaOrdAAAAABmJLR0QALQArADY7sGxSAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QIEEBMQhBBUNgAAAB1pVFh0Q29tbWVudAAAAAAAQ3JlYXRlZCB3aXRoIEdJTVBkLmUHAAABQUlEQVQ4y8WUsWrDMBCGP4d0yFJiEhCIQjLJg/GalzCZ0q3kJTJ06CP0NUI3e8xDtHRq6eBMGUIgkNDgtYM6xFFlRzYESntw8Puk/7/T3WH4R9OF/4q1KqJG3I+TarypkDpcSoIfJwxm2rgds8hGpCiCBtzYopOIHsy0Hsy09uNE+3FydiaFcuJqB1pWEs9yPhe3fD0F5FlK5/WBm9Uj43iKFIrrYGJILiyFYhxPTbzteA1ROGI4DAB4CybkwLrwDs8XD75ti0uh6PW77HcHIOP94wUWc0pnQJ6lpuo6vFpl54OXQgGw3x3o9bvHBD9t5OouYz28N8Q8S2vxZrs88b1Sm6RQWgpVt7JaCqWjcGTuVBfBgUvDphL0im+7Ch2FI/PSzXaJ474Ll2bi1ay0seOcsBN4jmKdWt4Fv5lLOX9r3/fzrYkg24zYAAAAAElFTkSuQmCC", 5, 5)

#define weapon_name
return "PLASMA ASSAULT RIFLE"; // Name

#define weapon_type
return 5; // Energy

#define weapon_load
return 25; // 0.83 Seconds

#define weapon_cost
return 6; // 6 Ammo

#define weapon_sprt
return sprPlasmaAssaultRifle; // Wep Sprite

#define weapon_area
return 6; // L0 3-2+

#define weapon_swap
return sndSwapEnergy; // Swap sound

#define weapon_fire
repeat(3) { //Fire 3 times
    //Different fire sound depending on if the player has laser brain or not
    if(skill_get(17))
    sound_play(sndPlasmaUpg)
    else
    sound_play(sndPlasma)

    //Create the plasma
    with instance_create(x,y,PlasmaBall)
    {
        motion_add(point_direction(x,y,mouse_x,mouse_y)+(random(8)-4),2)
        creator = other;
        image_angle = direction
        team = other.team
    }

    motion_add(point_direction(x,y,mouse_x,mouse_y)+180,3)

    wkick += 3;
    wait 5;
}