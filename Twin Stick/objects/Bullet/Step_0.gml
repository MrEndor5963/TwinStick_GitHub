direction = image_angle
speed = bullet_speed

if hurts_player = true && place_meeting(x,y,Player){
var_temp = instance_nearest(x,y,Player)
var_temp.hp -= 1;instance_destroy();exit
}

if x < 0 or x > room_width or y < 0 or y > room_height or collision_present(x,y){instance_destroy()}