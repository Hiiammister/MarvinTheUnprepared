var move_speed=4;
var moving=false;
var jump_height=-8;



if (keyboard_check(vk_left) and !instance_place(x-move_speed,y,Obj_block)){
	image_xscale = -1;
	x += -move_speed;
	moving=true;
}
if (keyboard_check(vk_right) and !instance_place(x+move_speed, y, Obj_block)){
	image_xscale = 1;
	x += move_speed;
	moving=true;
}
if moving{
	sprite_index=Sprite6;
	image_speed=0.1;
	image_index=0;
}
else{
	sprite_index=Sprite7;
	image_speed=0.2;
}
if keyboard_check(vk_up){
	if instance_place(x,y+1,Obj_block){
		vspeed=jump_height;
	}
}
if (place_meeting(x, y + 1, Obj_block)) {
    gravity = 0;// stop falling if on ground

} else {
	gravity = 0.25; // apply downward force
}
		
	