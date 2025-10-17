if (flash_strength > 0) {
    shader_set(shd_flash);
    var u_flash = shader_get_uniform(shd_flash, "flash_strength");
    shader_set_uniform_f(u_flash, flash_strength);
}

draw_self();

if (flash_strength > 0) {
    shader_reset();
}
