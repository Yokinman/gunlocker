#define init 
sprHyperDiscGun = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAAABmJLR0QAAAAAAAD5Q7t/AAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAB3RJTUUH4AsGAhENpsdULAAAAMxJREFUKM+VkrEKglAUhr8LzpIUBC1uOkSrPYRQQ669hA/Sk+jo0NzWKg62VIsQFEYvcBrimpoine2c//8uh/NfBQjfUgyUAsQOP8x1pwZBLYjlR5jupg5WWt8jYvmRLOaeLOae1Ixih1L1bUrsUHjlMQBlErDytwAcWFMmQQMQLQKcLzmP+5PxZFTN0uyIoc2zqcP5kgP8GOu9Ud/ncX8CUNxOFDc9dRqa6tvfdDe88pgyCbrPqrMAMPdL0uzYmYmhM2gF1xue+vdrvAHtO1NU5zFjlwAAAABJRU5ErkJggg==",-1,6);
global.spr_HyperDisc = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAMCAYAAAB4MH11AAAABmJLR0QAAAAAAAD5Q7t/AAAACXBIWXMAAA7CAAAOwgEVKEqAAAAAB3RJTUUH4AsGAi8t3GxvmQAAAB1pVFh0Q29tbWVudAAAAAAAQ3JlYXRlZCB3aXRoIEdJTVBkLmUHAAABAklEQVQ4y7WUP2vCQBiHn4izBBIIBIdzSYbiFprJ2bFDdz+GH8KP4d7BgkPnThEXEYdkqYMIQguSL3Ad9NK75k8DJT84OF6e370v73t3UC15X21Vy1sVIL4XAHC+ZHVca143St8LcFzbOOHr86qMpWLa8P3f8EnMDcOQBRBwvmRSSyJ9LyCKYt55auRVAhzXJp8mDN9iw5BPE6J0xus6M+KOa7MLlyX+JOZMxKrge6qakQgBGImQ/WHD/rApYlqfZRMPMAifDb7HP/VxTIu9XpBSH7Bu/YoLw/jh8cd89+iDU3yevjCARt76c8jHRdVNquUnrNhuk1KCzq5p5w+Nrr+Kb2hVlBouLmHQAAAAAElFTkSuQmCC",2,6,6);

#define weapon_name
return "HYPER DISC GUN"; // Name

#define weapon_type
return 3; // Bolt Wep

#define weapon_cost
return 2; // 2 Ammo

#define weapon_area
return 10; // L0 5-1+

#define weapon_load
return 7; // 0.23 Seconds

#define weapon_auto
return 1; // Automatic

#define weapon_swap
return sndSwapBow; // Swap Sound

#define weapon_fire
sound_play(sndDiscgun) // Sound
weapon_post(6, -15, 6);

with instance_create(x,y,Disc){ // Hyper Disc
	motion_add(other.gunangle + (random_range(-4, 4) * other.accuracy),18)
	image_angle = direction;
	sprite_index = global.spr_HyperDisc;
	damage = 10;
	traildist = 4;
	team = other.team;
	creator = other;
	
	 // Smoke Effect
	repeat(5) with instance_create(x + lengthdir_x(5,direction),y + lengthdir_y(5,direction),Smoke){
		motion_add(other.direction,1+random(1));
	}
	
	while instance_exists(self){
		 // Hyper Trail:
		with instance_nearest(x,y,DiscTrail) instance_destroy();
		repeat(2){
			traildist *= -1;
			with instance_create(x + lengthdir_x(traildist,image_angle - 90),y + lengthdir_y(traildist,image_angle - 90),BoltTrail){
				image_angle = other.direction;
				image_xscale = other.speed;
			}
		}
		if(instance_exists(Wall)){
			if(distance_to_object(Floor) > 1) direction -= 180;
			if(distance_to_object(Floor) > 10) instance_destroy();
		}
		wait 1;
	}
}

#define weapon_sprt
return sprHyperDiscGun; // Wep Sprite

#define weapon_text
return "UNDODGEABLE"; // Loading Tip