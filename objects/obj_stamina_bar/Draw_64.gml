// obj_hud - Draw GUI Event

// Reference player (replace obj_player with your player object name)
var p = obj_player;

// Make sure player exists before drawing HUD
if (!instance_exists(p)) exit;

// Set colors
draw_set_color(c_white);
draw_set_font(fnt_menu_40);

// --- HEALTH BAR ---
var health_bar_x = 40;
var health_bar_y = 40;
var health_bar_width = 200;
var health_bar_height = 20;

var health_ratio = global.health / global.max_health;

// Outline
draw_rectangle(health_bar_x - 2, health_bar_y - 2, health_bar_x + health_bar_width + 2, health_bar_y + health_bar_height + 2, false);

// Fill (red)
draw_set_color(c_red);
draw_rectangle(health_bar_x, health_bar_y, health_bar_x + (health_bar_width * health_ratio), health_bar_y + health_bar_height, false);

// Label
draw_set_color(c_white);
draw_text(health_bar_x, health_bar_y - 20, "Health");

// --- STAMINA BAR ---
var stamina_bar_y = health_bar_y + 40;
var stamina_ratio = global.stamina / global.max_stamina;

// Outline
draw_set_color(c_white);
draw_rectangle(health_bar_x - 2, stamina_bar_y - 2, health_bar_x + health_bar_width + 2, stamina_bar_y + health_bar_height + 2, false);

// Fill (yellow)
draw_set_color(make_color_rgb(255, 215, 0));
draw_rectangle(health_bar_x, stamina_bar_y, health_bar_x + (health_bar_width * stamina_ratio), stamina_bar_y + health_bar_height, false);

// Label
draw_set_color(c_white);
draw_text(health_bar_x, stamina_bar_y - 20, "Stamina");
