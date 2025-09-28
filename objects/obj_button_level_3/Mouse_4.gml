// Inherit the parent event
event_inherited();

if global.level >= level_count { 
	room_goto(level_room_name)
}