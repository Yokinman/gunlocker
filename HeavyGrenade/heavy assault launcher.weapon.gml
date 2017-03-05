#define init
sprHeavyAssaultLauncher = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABYAAAAMCAYAAABm+U3GAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QIZESYOf59OlgAAAS9JREFUOMu1k79Lw1AQxz+R/AeRQos/MohdCoJ0cWl1NrjZrTgWSv+Colv/BQVnNwcH0TlNli7SPZAhtZJA8f0DLulgXvqSqClCHzzuvbv7fu/u3T3Y0NJK7PE/MKVOsdXp0jo9A8Ad27w8PpRhZSLalqLIbwCavT7NXh+AwXCE1enyG0axoQPx1dFhIXSwEAC83d8lGpu9nRqB7zEYjgh8D/OgXpAqcUoCYFaMTACZrTu+5P0jXLt5OoATCdpVI5OpEwks4OnmOnH1VtX4HuF8BlCQKrEm39SJRMYYzmd8XrwC8GU3CgR5UrW5ujwkpFq+w9vP599gVoTTiUu7amBWDIKFSKU6LbpyiX+aW5kxt42M3olEWqH6lGvN8fFJi9ruflrudOL+hY1V/cZ+3hJLToRMov2tiwAAAABJRU5ErkJggg==", 5, 5)

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
    wkick = 8;
    sound_play(sndHeavyNader); // Sound

    with instance_create(x,y,HeavyNade){ // Heavy Grenades
        motion_add(other.gunangle + (random_range(-3,3) * other.accuracy),10.3 + random(1));
        image_angle = direction;
        team = other.team;
        creator = other;
    }

    wait 3;
}

#define weapon_sprt
return sprHeavyAssaultLauncher; // Wep Sprite
