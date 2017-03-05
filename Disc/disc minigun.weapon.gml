#define init
sprDiscMinigun = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABgAAAAOCAYAAAA1+Nx+AAAABmJLR0QAAAAAAAD5Q7t/AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4AsGAjo0j7IhTQAAASxJREFUOMvtk79Lw0AUxz8Hxak2Q1CJop6lJUO3bhVscHEQZzcXR3F2kI7Swbk4iuDiX+DgIiro5h4sEhHURjK06X4uvSNJLWilm1943H3fu/d99+MdTBgiw9UP140F9Uv/eOLWVE5zY/mC9WfxlHmObaxaqytALSytpJKKZZfkBpI8YQhA7R8eEbR94rtL5KwNQBBGTK9tAiBLLq1mY2hnxyenXJyf8fhwa7jGwd4ugBC6kufYRlwXiGWF+cVlUySJoO0jSy7311esrm8YDtBqNiiWXfH85JPTp0glhxGAEdeCWWhfdgQIOx+p9lOeY3/7QLGsmCvIYmt7h7fXFxOv1uomNvCJkQVu3iMzzxcs0e91U3F7Zo7os6N0HKDf66pR/2eokwbt+o/J4wt63Xiu62gthwAAAABJRU5ErkJggg==", 3, 6);
global.sprMiniDisc = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAICAYAAADwdn+XAAAABmJLR0QAAAAAAAD5Q7t/AAAACXBIWXMAAA7CAAAOwgEVKEqAAAAAB3RJTUUH4AsGAjYm0L4fCQAAAB1pVFh0Q29tbWVudAAAAAAAQ3JlYXRlZCB3aXRoIEdJTVBkLmUHAAAAsElEQVQoz6WRoQ6DMBRFTwlf0TQNgoSfmZ6bmVyqJxpkg5gmkzM4NB6yvyBBkGXZbzBVVmBTO6rNefe1rxV8mFgiVvuvXhjrKIt82u0PJGkGwDj0NHUVNvnpxVp6giKMdWgleTxfGx8DJGmGVpLz6QjA5XpDKzk30EoCUBb57D1RWBASnhauPT4TA9y7liTNMNbNgXHoF9f1o6ybRsY60dTVJhA84sbfu9aPI8S/3/gGzolX1e2r5LYAAAAASUVORK5CYII=", 2, 4, 4);
global.mskMiniDisc = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAYAAADED76LAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA7CAAAOwgEVKEqAAAAAB3RJTUUH4QMEDwAGOzFtCAAAAB1pVFh0Q29tbWVudAAAAAAAQ3JlYXRlZCB3aXRoIEdJTVBkLmUHAAAAMUlEQVQY02NkQID/DKiAkYGBgYEpp6oFmyRcjBGHJBwwMRAAVFCQU9XCiEeekZGQNwEhogfhoig+MAAAAABJRU5ErkJggg==", 1, 4, 4);

#define weapon_name
return "DISC MINIGUN"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_load
return 2; // 0.07 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_area
return 11; // L0 5-2+

#define weapon_swap
return sndSwapMotorized; // Swap sound

#define weapon_fire
sound_play(sndDiscgun); // Sound
weapon_post(4, -8, 5);

with instance_create(x + lengthdir_x(10,gunangle), y + lengthdir_y(10,gunangle), Disc){ // Mini Discs
	motion_add(other.gunangle + (random_range(-18, 18) * other.accuracy), 5);
	image_angle = direction;
	sprite_index = global.sprMiniDisc;
	mask_index = global.mskMiniDisc;
	damage = 4;
	dist = -50; // Mini Discs Last Twice As Long As Normal Ones
	team = other.team;
	creator = other;
}

#define weapon_sprt
return sprDiscMinigun; // Wep Sprite

#define weapon_text
return "GET SHREDDED"; // Loading Tip