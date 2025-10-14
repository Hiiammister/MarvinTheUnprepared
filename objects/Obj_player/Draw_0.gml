// Set shader
shader_set(shd_player);
// Pass time uniform to shader
var u_time = shader_get_uniform(shd_player, "time");
shader_set_uniform_f(u_time, time);
// Draw player sprite
draw_self();
// Reset shader
shader_reset();
