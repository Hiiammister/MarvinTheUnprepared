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