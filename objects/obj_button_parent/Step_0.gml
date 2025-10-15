if (!variable_instance_exists(id, "time")) {
    time = 0;
}

// --- Update shader time ---
time += delta_time / 1000.0;