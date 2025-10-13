/// Bullet Step
if (place_meeting(x, y, obj_block)) instance_destroy();
if (place_meeting(x, y, obj_player)) {
    // damage player (optional)
    instance_destroy();
}
