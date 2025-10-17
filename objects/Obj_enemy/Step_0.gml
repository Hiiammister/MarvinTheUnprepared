/// Enemy Step Event

var player = instance_nearest(x, y, obj_player);
var detect_range = 200;


if (player != noone) {
    var dist = point_distance(x, y, player.x, player.y);

    if (dist < detect_range) {
        // Player is in range → shoot
        sprite_index = spr_enemy_shoot;
        image_speed = 0.3;
		if (hspeed != 0) { 
			pre_hpseed=hspeed;
		}
		
		
        hspeed = 0; // stop moving while shooting
    } else {
        // Player out of range → keep walking via marker
        sprite_index = spr_enemy_walk;
		if (hspeed == 0) { 
			hspeed = pre_hpseed;	
		}
        // Do not change hspeed here; the marker handles movement
    }
}
