#define init 
sprHeavyGatlingSlugger = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABcAAAAMCAYAAACJOyb4AAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAB3RJTUUH4QMDFgYMA56D1gAAAN5JREFUOMvVkj0KwjAYhp9Kb1AQWig6iA4iHqEXcHYTL+AJnL2IuDk7uYgddBMcKx0qgorg5AHi0miT/lFw8YWQ5Eu+5/3yA38kETcAahWTyhqD4Ujux9QAuZpMZ8p8t1njuA2arQ5RGCi9VBLOuN9WANHjCcCr2SUKg5RhEpQlCReebX2C8+MJgGRMB10v59K7NPVKt7cngAGIeAw3H8dtKImH/TcmjXRDs8DYSL5HVqWr5QLPtujVLQjuWMB86acAogAMIOJfoIDlCfMKM/Ng+u6COzYqL5SZVcz/vd4rvlAwjxYqnAAAAABJRU5ErkJggg==", 2, 6);

#define weapon_name
return "HEAVY GATLING SLUGGER"; // Name

#define weapon_type
return 2; // Shell Wep

#define weapon_cost
return 2; // 2 Ammo

#define weapon_area
return 10; // L0 5-1+

#define weapon_load
return 7; // 0.2333... Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapShotgun; // Swap Sound

#define weapon_fire
 // Sound:
sound_play(sndHeavySlugger);

// Rapid fire heavy slugs
with (instance_create(x, y, HeavySlug))
{
	motion_add(other.gunangle + (6 * random_range(-1, 1) * other.accuracy), 13);
	image_angle = direction;
	team = other.team;
	creator = other;
}

wkick = 10;

#define weapon_sprt
return sprHeavyGatlingSlugger; // Wep Sprite

#define weapon_text
return "POMF"; // Loading Tip