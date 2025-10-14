// --- BASIC SETUP ---
var on_ground = place_meeting(x, y + 1, obj_block);
var gravity_force = 0.25;
var moving = false;

// --- SPEED + STAMINA ---
var base_speed = 4;
var sprint_speed = 6;
var stamina_drain = 0.5;
var stamina_regen = 0.3;

if (!attacking) {
	
	// --- SPRINTING ---
	var current_speed = base_speed;
	if (keyboard_check(vk_shift) && stamina > 0) {
	    current_speed = sprint_speed;
	    stamina -= stamina_drain;
	} else {
	    stamina = clamp(stamina + stamina_regen, 0, max_stamina);
	}


	// --- HORIZONTAL MOVEMENT ---
	if (keyboard_check(vk_left) && !place_meeting(x - current_speed, y, obj_block)) {
	    if (image_xscale > 0) image_xscale *= -1;
	    x -= current_speed;
	    moving = true;
	}
	if (keyboard_check(vk_right) && !place_meeting(x + current_speed, y, obj_block)) {
	    if (image_xscale < 0) image_xscale *= -1;
	    x += current_speed;
	    moving = true;
	}
	
	// --- JUMP & DOUBLE JUMP ---
	if (keyboard_check_pressed(vk_up)) {
	    if (on_ground) {
	        vspeed = -jump_height;
	        can_double_jump = true;
	    } else if (can_double_jump) {
	        vspeed = -jump_height * 0.9;
	        can_double_jump = false;
	    }
	}
	
	// --- CROUCH / FAST FALL ---
	if (keyboard_check(vk_down)) {
		if (on_ground && !moving) {
		    sprite_index = spr_marvin_crouch;
			image_index = 0;
		    image_speed = 1;
			if (image_index >= image_number - 1) image_index = image_number - 1; 
		} else {
		    vspeed += gravity_force * 1.5; // fast fall
		}
	}
	
	
	// --- DASH ---
	if (dash_timer > 0) dash_timer -= 1;

	if (keyboard_check_pressed(vk_space) && dash_timer <= 0) {
	    var dash_dir = sign(image_xscale);
	    x += dash_dir * dash_speed;
	    dash_timer = dash_cooldown;
	    show_debug_message("Dash!");
	}

}

// --- GRAVITY ---
if (!on_ground) vspeed += gravity_force;

// --- APPLY VERTICAL MOVEMENT ---
y += vspeed;

// --- COLLISION FIX ---
if (place_meeting(x, y+base_speed -1 , obj_block) || place_meeting(x, y-base_speed+1, obj_block)) {
    if (vspeed > 0) {
        while (!place_meeting(x, y + 1, obj_block)) y += 1;
    } else if (vspeed < 0) {
        while (!place_meeting(x, y - 1, obj_block)) y -= 1;
    }
    vspeed = 0;
}

// --- ATTACK ---
if (keyboard_check_pressed(ord("X")) && !attacking && on_ground) {
    attacking = true;
    sprite_index = spr_marvin_attack;
    image_speed = 1;
    image_index = 0;
	
}

// End attack when animation finishes
if (attacking) {
    if (image_index >= image_number - 1) {
        attacking = false;
    }
}


// --- ANIMATION CONTROL ---
if (!attacking) {
    if (!on_ground) {
        if (vspeed < 0) {
            // Jumping
            sprite_index = spr_marvin_jump;
            image_speed = 1;
            if (image_index >= image_number - 1) image_index = image_number - 1; // stop on last jump frame
        } else {
            // Falling
            sprite_index = spr_marvin_fall;
            image_speed = 1;
            if (image_index >= image_number - 1) image_index = image_number - 1; // stop on last fall frame
        }
    } else if (moving) {
        sprite_index = spr_marvin_walk;
        image_speed = 1;
    } else {
        sprite_index = spr_marvin_idle;
        image_speed = 1;
    }
}

// Feel off room
if (y > room_height + 100) {
    show_debug_message("remove health");
}
 
// Animating the sprite using shaders
time += delta_time / 1000.0;

// --- OSCILLATING HITBOX BASED ON SHADER WAVE ---
var wave_offset = sin(x * 10 + time * 3) * 4; // frequency = 10, amplitude = 4
mask_y = y; // move the collision mask with the wave

