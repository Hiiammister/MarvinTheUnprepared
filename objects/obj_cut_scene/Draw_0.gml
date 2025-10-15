var _videoData = video_draw();
var _videoStatus = _videoData[0];

if (_videoStatus == 0)
{
    var surf = _videoData[1];
    
    // Get surface dimensions
    var surfW = surface_get_width(surf);
    var surfH = surface_get_height(surf);
    
    // Get screen (application) dimensions
    var screenW = display_get_width();
    var screenH = display_get_height();

    // Draw the video stretched to fill the screen
    draw_surface_stretched(surf, 0, 0, room_width, room_height);
}else{
	room_goto_next()	
}
	
