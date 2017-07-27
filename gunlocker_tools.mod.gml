#define blank
	// It's dusty in here..

#define scrShells(_angle, _spread, _speed, _sprite)
	with instance_create(x, y, Shell){
		motion_add(other.gunangle + (other.right * _angle) + random_range(-_spread, _spread), _speed);
		sprite_index = _sprite;
	}

#define bloom_draw
	 // Draw Bloom:
	draw_set_blend_mode(bm_add);
	draw_sprite_ext(sprite_index, image_index, x, y, 2 * image_xscale, 2 * image_yscale, image_angle, image_blend, image_alpha * 0.1);

	 // Draw Normal Self:
	draw_set_blend_mode(bm_normal);
	draw_self();

#define melee_hit
	if(projectile_canhit_melee(other)){
		projectile_hit(other, damage, force, direction);
	}

#define melee_deflect
	with(projectile) if(place_meeting(x,y,other) && team != other.team){
		if(typ = 1){
			team = other.team;
			direction = other.direction;
			image_angle = direction;
			with instance_create(x,y,Deflect) image_angle = other.image_angle;
		}
		if(typ = 2) instance_destroy();
	}

#define hyper_collide_melee
	 // Slash/Shield Deflection/Destruction:
	var SlashTypes = [Slash, GuitarSlash, EnergySlash, EnergyHammerSlash, BloodSlash, LightningSlash, CrystalShield, PopoShield];
	for(i = 0; i < array_length_1d(SlashTypes); i++) with(SlashTypes[i]){
		if(place_meeting(x,y,other) && team != other.team) with(other){
			if(typ = 1){
				if(instance_is(other, CrystalShield) || instance_is(other, PopoShield)){
					direction = point_direction(other.x, other.y, x, y);
				}
				else direction = other.direction;
				image_angle = direction;
				team = other.team;
				with instance_create(x,y,Deflect) image_angle = other.direction;
			}
			if(typ = 2) tries = 0;
		}
	}

	 // Shank Destruction:
	var ShankTypes = [Shank, EnergyShank];
	for(i = 0; i < array_length_1d(ShankTypes); i++) with(ShankTypes[i]){
		if(place_meeting(x,y,other) && team != other.team) with(other){
			if(typ = 1 || typ = 2) tries = 0;
		}
	}