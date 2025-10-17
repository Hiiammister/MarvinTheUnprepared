// PARTICLE SYSTEM CLEANUP
part_system_destroy(global.p_sys);
part_type_destroy(p_type_jump_flash);

// Decrease the global lives count
lives -= 1;

// Check if there are remaining lives
if (lives > 0) {
    // Restart the current room for another try
    room_restart();
} else {
    // No lives left, set game over flag
    global.game_over = true;
}