// Movement and animation logic
var move_speed = 4;
var jump_height = -8;
var on_ground = place_meeting(x, y + 1, Obj_block);
var moving = false;

// Horizontal movement
if (keyboard_check(vk_left) && !place_meeting(x - move_speed, y, Obj_block)) {
    image_xscale = -1;
    x -= move_speed;
    moving = true;
}
if (keyboard_check(vk_right) && !place_meeting(x + move_speed, y, Obj_block)) {
    image_xscale = 1;
    x += move_speed;
    moving = true;
}

// Sprite/animation handling
if (moving && on_ground) {
    sprite_index = Walk_Marvin_Sheet;
    image_speed = 0.2;
} else if (on_ground) {
    sprite_index = Walk_Marvin_Sheet;
    image_speed = 0.1;
} else {
    sprite_index = Walk_Marvin_Sheet; // Add a jump sprite for the air
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

// Optional: Custom Draw Event (add this to ensure sprite draws correctly)
// draw_self();
