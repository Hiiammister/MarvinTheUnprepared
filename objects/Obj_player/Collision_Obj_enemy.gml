

/// Collision Event: Player with Enemy

// --- Player attacks enemy ---
if (keyboard_check_pressed(ord("X"))) {

    // Ensure the enemy has health variable
    if (!variable_instance_exists(other, "health")) {
        other.health = 3; 
        other.knockback = 4; 
    }

    // Reduce enemy health
    other.health -= 1;

    // Flash red for a few frames
    other.image_blend = c_red;
    other.alarm[0] = 5;

    // Knockback enemy slightly
    other.x += other.x < x ? -other.knockback : other.knockback;

    // Destroy enemy if health <= 0
    if (other.health <= 0) {
        instance_destroy(other);
    }
}

