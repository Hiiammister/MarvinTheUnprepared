gravity_direction=270;
health = 5;
vspeed = 0;

stamina = 100;
max_stamina = 100;
can_double_jump = true;
dash_timer = 0;
dash_cooldown = 60; // frames (~1 sec)
dash_speed = 100;
attacking = false;
crouching = false;

// --- Flash effect setup ---
flash_strength = 0; // 0 = normal, 1 = fully red

// 1. Create the Particle System (the container)
global.p_sys = part_system_create(); 

// 2. Create and configure the Particle Type (the look) for the JUMP FLASH
p_type_jump_flash = part_type_create();
// Ensure 'pt_shape_circle' is spelled correctly
part_type_shape(p_type_jump_flash, pt_shape_circle); 
part_type_size(p_type_jump_flash, 0.5, 1.5, 0.05, 0); 
part_type_life(p_type_jump_flash, 5, 15); 
part_type_speed(p_type_jump_flash, 0, 0, 0, 0); 

// CRITICAL CHECK: Ensure c_blue is spelled correctly
part_type_color1(p_type_jump_flash, c_blue); 

// This line is where the error appears, but the problem is usually above it:
part_type_alpha3(p_type_jump_flash, 1, 1, 0);