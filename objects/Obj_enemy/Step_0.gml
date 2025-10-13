/// Enemy Step Event

// Find the player (assuming object name is Obj_player)
var player = instance_nearest(x, y, obj_player);

if (player != noone) {
    var dist = point_distance(x, y, player.x, player.y);

    // --- State Switching ---
    if (dist < range) {
        state = "attack";
    } else {
        state = "idle";
    }

    // --- Face player ---
    if (player.x < x) image_xscale = 1;
    else image_xscale = -1;
}

// --- Behavior ---
switch (state) {
    case "idle":
        sprite_index = spr_enemy_idle;
        image_speed = 0.2;
        break;

    case "attack":
        sprite_index = spr_enemy_shoot;
        image_speed = 0.3;

        // Shooting cooldown
        if (attack_cooldown > 0) attack_cooldown--;
        else {
            // Shoot bullet toward player
            var enemy_bullet = instance_create_layer(x, y, "instances", Obj_enemy_bullet);
            bullet.direction = point_direction(x, y, player.x, player.y);
            bullet.speed = 6;

            attack_cooldown = attack_rate;
        }
        break;
}
