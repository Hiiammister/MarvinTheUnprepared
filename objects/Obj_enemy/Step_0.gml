if (flash_strength > 0) {
    flash_strength = max(0, flash_strength - 0.2);
}


if (state == "attack") 
{
    // 1. Decrease the cooldown timer
    if (shoot_cooldown > 0) 
    {
        shoot_cooldown -= 1;
    }
    
    // 2. Fire the gun
    if (shoot_cooldown <= 0) 
    {
        // Calculate the gun barrel position (adjust offset_y as needed for your sprite)
        var barrel_x = x + (10 * image_xscale); 
        var barrel_y = y - 5; 
        
        // CREATE THE BULLET
        instance_create_layer(barrel_x, barrel_y, "Instances", obj_bullet_enemy);
        
        // --- PARTICLE CODE: GUN SMOKE ---
        // Check if the particle system ID is valid (not < 0).
        if (global.p_sys > -1)
        {
            part_particles_create(global.p_sys, barrel_x, barrel_y, p_type_smoke, 3);
        }
        
        // Reset the timer
        shoot_cooldown = attack_rate;
    }
}