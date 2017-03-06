#define init
sprSuperBloodCannon = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAAB8AAAAVCAYAAAC+NTVfAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QISCQQKGnS5ZgAAAB1pVFh0Q29tbWVudAAAAAAAQ3JlYXRlZCB3aXRoIEdJTVBkLmUHAAAB6klEQVRIx9WWsW7bMBCGPwV+iAB8gw5pAC01smivlmjIXmXz0qFAh2YtMxTokMWb3DfQUmfXYlgLAVdDto4C8hbsIJEmKdVRnABFDyBOPIn8//t1Ogr+oUVHrNGvtdfJM0F1Cuw2a4yXovPmvvtsEBvYbCpwCnzdrFFVCcClzAHYtvAekAJOFznXNysNUPT3ARsL1ZmSud5t1hasUbXnXRJxkiFFRyROMjt2m7Uho6eCe5IZsN/lg+dDEtApEFqcZAMCJyPvCEAXMvekM2ChhSQM0JiFcZt5IXO3cKxkH7M33oK58P1T5FRV2jpxakG74NH1zQr6CnYzDkGNbdvxuCu5Af2bKq7sHkPD+C7IKAQ180P24dM3u+f5RTr81Iy8qippVD0ADc18YqE1qqZRtQVsVE2cZNxfpYOGNAsXOqCRq4oBm4u9QqoqB7Kfxe8A+PH9s83aVXSsyUR35YM+1CoN6LaF+bKrj8flalSBx+WKs0VOnGSoqux812y8vWdTerMLOhf797xt96R+Ar/2ABTA/VXK6SLn7UXK+ZH9X0uBTkHrfkjRDXNt4oXMvV6h+96hn+jxkwjogEB4PQJw8ICZfKp9aeFW+NXuzqNxWaNgHJf5mORpP3+JpM89z0OZjwZ+6Z9MxP9qfwBo8CgmUzYS/wAAAABJRU5ErkJggg==", 5, 5)
global.sprBigBloodBall = sprite_add_base64("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",3,24,24)

#define step 
if can_shoot = 1 { //If the weapon is reloaded
    if(button_pressed(index, "fire")) { //When trying to fire
        if ammo[4] < 12 { //If you're ouy of ammo
            //Pay health to fire:
            sound_play(snd_hurt) 
            ammo[4] += 12
            my_health -= 2
            sprite_index = spr_hurt
            image_index = 0
            player_fire(gunangle);
        }
    }
}

#define weapon_name
return "SUPER BLOOD CANNON"; // Name

#define weapon_type
return 4; // Explosive Wep

#define weapon_load
return 64; // 2.13 Seconds

#define weapon_cost
return 12; // 12 Ammo

#define weapon_sprt
return sprSuperBloodCannon; // Wep Sprite

#define weapon_area
return 12; // L0 7-3+

#define weapon_swap
return sndSwapExplosive; // Swap sound

#define ProWall
//Destroy projectile when colliding with wall
instance_destroy()

#define ProHit
//Destroy projectile when colliding with enemy
if team != other.team {
    other.my_health -= 60
}
instance_destroy()

#define ProStep
//Create meat explosions and Blood streaks while rotating
image_angle += 4;
if random(3) < 1 {
    repeat(random(5)) {
        creator = other;
        instance_create(x-64+random(128),y-64+random(128),MeatExplosion)
    }
}
if random(3) < 1 {
    creator = other;
    instance_create(x,y,BloodStreak)
}

#define ProDed
//When destroyed create some meat explosions and small meatballs 
sound_play(sndBloodCannonEnd);
repeat(8+random(3)) {
    with instance_create(x-80+random(160),y-80+random(160),MeatExplosion) {
        creator = other;
    }
}
repeat(6) { //Fire 6 times
    with instance_create(x,y,BloodBall) {
        creator = other;
        team = other.team
        motion_add(random(360),6)
    }
}

#define weapon_fire
//Create big meatball:
with (instance_create(x,y,CustomProjectile)) {
    //Set some shit
    creator = other;
    team = other.team;
    motion_add(point_direction(x, y, mouse_x[other.index], mouse_y[other.index])-4+random(8), 3);
    image_angle = direction;
    sprite_index = global.sprBigBloodBall;
    mask_index = sprBloodBall;
    image_speed = 0.5;
    type = 2; //Destructable
    on_wall = ProWall;
    on_hit = ProHit;
    on_step = ProStep;
    on_destroy = ProDed;
}

#define weapon_text
return "BIG MEATBALLS"; // Loading Tip