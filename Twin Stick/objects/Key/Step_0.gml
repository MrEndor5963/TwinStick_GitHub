if GM.game_paused = true or GM.game_over = true{exit}

if !instance_exists(Enemy) && instance_exists(BossDoor){
move_towards_point(BossDoor.x+32,BossDoor.y+32,10)}else{

if place_meeting(x,y,Player){
follow = instance_nearest(x,y,Player)
persistent = true
}

if follow != -1{
	
//cam_move_x = (cam_target_x - cam_x)*cam_speed
//cam_move_y = (cam_target_y - cam_y)*cam_speed
x += (follow.record_x[8]-x)*0.25
y += (follow.record_y[8]-y)*0.25
}

}