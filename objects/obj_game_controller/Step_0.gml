if (keyboard_check_pressed(ord("F"))) {
    window_set_fullscreen(!window_get_fullscreen());
}

if (keyboard_check_pressed(vk_escape)) {
    global.paused = !global.paused;
    if (global.paused) {
        audio_pause_all();
    } else {
        audio_resume_all();
    }
}

if (keyboard_check_pressed(ord("R"))) room_restart();

if (keyboard_check_pressed(ord("Q"))) game_end();