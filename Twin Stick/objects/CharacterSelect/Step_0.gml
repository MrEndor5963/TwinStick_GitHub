var_repeat = 0
repeat(4){
if gamepad_button_check_pressed(var_repeat,gp_face1) or gamepad_button_check_pressed(var_repeat,gp_start) or gamepad_button_check_pressed(var_repeat,gp_select){
var_player = -1
if cursor_control[3] = -1{var_player = 3}
if cursor_control[2] = -1{var_player = 2}
if cursor_control[1] = -1{var_player = 1}
if cursor_control[0] = -1{var_player = 0}
if var_player != -1 && 
cursor_control[0] != var_repeat && cursor_control[1] != var_repeat &&
cursor_control[2] != var_repeat && cursor_control[3] != var_repeat{
cursor_control[var_player] = var_repeat
player_amount += 1}
}


var_temp = cursor_control[var_repeat]
if gamepad_button_check(var_temp,gp_face2) or gamepad_is_connected(var_temp) = false{
cursor_control[var_repeat] = -1
player_amount -= 1
}
var_repeat += 1
}