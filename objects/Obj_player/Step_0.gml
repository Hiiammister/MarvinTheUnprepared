var on_ground = place_meeting(x, y + 1, obj_block);
var moving = false;

// Horizontal movement
if (keyboard_check(vk_left) && !place_meeting(x - move_speed, y, obj_block)) {
    if (image_xscale > 0) image_xscale *= -1; // flip if currently facing right
    x -= move_speed;
    moving = true;
}
if (keyboard_check(vk_right) && !place_meeting(x + move_speed, y, obj_block)) {
    if (image_xscale < 0) image_xscale *= -1; // flip if currently facing left
    x += move_speed;
    moving = true;
}

// Sprite/animation handling
if (moving && on_ground) {
    sprite_index = spr_marvin_walk;
    image_speed = 0.2;
} else if (on_ground) {
    sprite_index = spr_marvin_idle;
    image_speed = 0.1;
} else {
    sprite_index = spr_marvin_walk; // Add a jump sprite for the air
    image_speed = 0.1;
}

// Jumping
if (keyboard_check_pressed(vk_up) && on_ground) {
    vspeed = jump_height;
}

// Gravity handling
if (on_ground) {
    gravity = 0;
    vspeed = 0; // Stops sliding on platforms
} else {
    gravity = 0.25;
}