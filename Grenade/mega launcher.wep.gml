#define init
global.spr_MegaLaunch = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABwAAAAQCAYAAAAFzx/vAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAB3RJTUUH4QMDFxcsauvqOQAAAUtJREFUOMu9VT9rhDAcfRZXJ+HgBDGD4FC6uLl4H+A6d7t+t9Ktc7/AeYOb0OEGD4eI4B0HNxW62kHjJRqNUumD8Ib8ee8lvyTA/6ECAH3OYAW0kbmaalBv0vPLDmWRw7Kdlhk+P94nx3wYcNRtIK4Hy3YEZs0PQvhBCABK7m5ptVmb+CaPQoKyyJXOLduBZe+kxhgncSQIVpu1CbIygZ8LkF5gbF8nC06F3hPjQLN08kLM1BCzc5ZWKb3eAABPW29WQnYMxPVAsxTE9VrjSVwXqd5NR6837M+1oNEkTOKorU6ZgSSO4AfhYLokjnpb2qZqxDQAFb8wc9tlWUK+n0+nvPi8M5qlgwll1SxL1xPk0nUfhaos8mZy2PLYOd5Ni2vpnNCcl6cHgx5BVibooea3r9PgtdCWuF/7873YxgLoC/4G2mKD/vhbCPgFmjGq+Cj/BiAAAAAASUVORK5CYII=",5,4);

#define weapon_name
return "MEGA LAUNCHER"; // Name 

#define weapon_type
return 4; // Explosive Wep

#define weapon_cost
return 10; // 10 Ammo

#define weapon_area
return 18; // L1 1-1+

#define weapon_load
return 54; // 1.80 Seconds

#define weapon_swap
return sndSwapExplosive; // Swap Sound

#define weapon_fire
 // Sound:
sound_play(sndHeavyNader);
sound_play(sndClusterLauncher);

weapon_post(14, -32, 16);

 // 10 Grenades, Wide Spread:
ang = gunangle - (45 * other.accuracy);
repeat(10){
    with instance_create(x,y,Grenade){
        motion_set(other.ang, 10);
        image_angle = direction;
        team = other.team;
		creator = other;
    }
	ang += 10 * accuracy;
}

motion_add(gunangle - 180, 6); // Push Player Backwards

#define weapon_sprt
return global.spr_MegaLaunch; // Wep Sprite

#define weapon_text
return "NOT ENOUGH BARRELS"; // Loading Tip