key_enter = keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter) or keyboard_check_pressed(ord("E"))

if key_enter
{var_player = -1
if cursor_control[3] = -1{var_player = 3}
if cursor_control[2] = -1{var_player = 2}
if cursor_control[1] = -1{var_player = 1}
if cursor_control[0] = -1{var_player = 0}
if var_player != -1 && 
cursor_control[0] != "Keyboard" && cursor_control[1] != "Keyboard" &&
cursor_control[2] != "Keyboard" && cursor_control[3] != "Keyboard"{
cursor_control[var_player] = "Keyboard"
player_amount += 1
exit}
}

if gamepad_button_check_pressed_any(gp_face2) or keyboard_check_pressed(vk_backspace) or keyboard_check_pressed(vk_escape) or keyboard_check_pressed(ord("X")){
if cursor_control[0] = -1 && cursor_control[1] = -1 &&
cursor_control[2] = -1 && cursor_control[3] = -1{
room_goto(r_TitleScreen)}
}

vrp = 0;
repeat(4){
if gamepad_button_check_pressed(vrp,gp_face1) or gamepad_button_check_pressed(vrp,gp_start) or gamepad_button_check_pressed(vrp,gp_select){
var_player = -1
if cursor_control[3] = -1{var_player = 3}
if cursor_control[2] = -1{var_player = 2}
if cursor_control[1] = -1{var_player = 1}
if cursor_control[0] = -1{var_player = 0}
if var_player != -1 && 
cursor_control[0] != vrp && cursor_control[1] != vrp &&
cursor_control[2] != vrp && cursor_control[3] != vrp{
cursor_control[var_player] = vrp
player_amount += 1
exit}
}
//
if cursor_control[vrp] != "Keyboard"{

if gamepad_axis_value(cursor_control[vrp],gp_axislh) < -0.2 or gamepad_button_check(cursor_control[vrp],gp_padl)
{key_left[vrp] = true}else{key_left[vrp] = false}
if gamepad_axis_value(cursor_control[vrp],gp_axislh) > 0.2 or gamepad_button_check(cursor_control[vrp],gp_padr)
{key_right[vrp] = true}else{key_right[vrp] = false}
if gamepad_axis_value(cursor_control[vrp],gp_axislv) < -0.2 or gamepad_button_check(cursor_control[vrp],gp_padu)
{key_up[vrp] = true}else{key_up[vrp] = false}
if gamepad_axis_value(cursor_control[vrp],gp_axislv) > 0.2 or gamepad_button_check(cursor_control[vrp],gp_padd)
{key_down[vrp] = true}else{key_down[vrp] = false}

if gamepad_button_check_pressed(cursor_control[vrp],gp_face1){key_enter[vrp] = true}else{key_enter[vrp] = false}
if gamepad_button_check_pressed(cursor_control[vrp],gp_face2){key_back[vrp] = true}else{key_back[vrp] = false}

}
else{
key_left[vrp] = keyboard_check(vk_left)
key_right[vrp] = keyboard_check(vk_right)
key_up[vrp] = keyboard_check(vk_up)
key_down[vrp] = keyboard_check(vk_down)
key_back[vrp] = keyboard_check_pressed(vk_escape) or keyboard_check_pressed(vk_backspace) or keyboard_check_pressed(ord("X"))
key_enter[vrp] = keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter) or keyboard_check_pressed(ord("Z"))
}

key_left_pressed[vrp] = 0;key_right_pressed[vrp] = 0;key_up_pressed[vrp] = 0;key_down_pressed[vrp] = 0

if player_selected[vrp] = 0{
if key_left[vrp]{key_held_l[vrp] += 1}else{key_held_l[vrp] = -1};
if key_held_l[vrp] = 0{key_held_l[vrp] = -12;key_left_pressed[vrp] = true}
if key_right[vrp]{key_held_r[vrp] += 1}else{key_held_r[vrp] = -1};
if key_held_r[vrp] = 0{key_held_r[vrp] = -12;key_right_pressed[vrp] = true}
if key_up[vrp]{key_held_u[vrp] += 1}else{key_held_u[vrp] = -1};
if key_held_u[vrp] = 0{key_held_u[vrp] = -12;key_up_pressed[vrp] = true}
if key_down[vrp]{key_held_d[vrp] += 1}else{key_held_d[vrp] = -1};
if key_held_d[vrp] = 0{key_held_d[vrp] = -12;key_down_pressed[vrp] = true}

if key_left_pressed[vrp] = true{cursor_c[vrp]-= 1};if cursor_c[vrp] < 0{cursor_c[vrp] = ds_grid_width(select_menu)-1}
if key_right_pressed[vrp] = true{cursor_c[vrp] += 1};if cursor_c[vrp] > ds_grid_width(select_menu)-1{cursor_c[vrp] = 0}
}

if key_enter[vrp] = true{
if player_selected[vrp] = 0{
player_selected[vrp] = ds_grid_get(select_menu,cursor_c[vrp],cursor_r[vrp])}
else{player_ready[vrp] = true}
}

if key_back[vrp] = true{
if player_selected[vrp] = 0{
cursor_control[vrp] = -1
player_amount -= 1}
if player_selected[vrp] != 0{
if player_ready[vrp] = false{player_selected[vrp] = 0}
if player_ready[vrp] = true{player_ready[vrp] = false}
}
}
//


vrp += 1
}

if cursor_control[0] = -1 or player_ready[0] = true{var0 = true}else{var0 = false}
if cursor_control[1] = -1 or player_ready[1] = true{var1 = true}else{var1 = false}
if cursor_control[2] = -1 or player_ready[2] = true{var2 = true}else{var2 = false}
if cursor_control[3] = -1 or player_ready[3] = true{var3 = true}else{var3 = false}

if var0 = true && var1 = true && var2 = true && var3 = true && player_amount > 0{players_ready = true}else{players_ready = false}

if players_ready = true{start_timer -= 1}else{start_timer = 300;if GM.disable_countdown = true{start_timer = 1}}

if start_timer = 0{
if player_ready[0] = true{
var_player = instance_create_depth(300,300,depth,Player)
var_player.player_name = player_selected[0]
var_player.input_number = cursor_control[0]
var_player.player_number = 0
}

if player_ready[1] = true{
var_player = instance_create_depth(300,300,depth,Player)
var_player.player_name = player_selected[1]
var_player.input_number = cursor_control[1]
var_player.player_number = 1
}

if player_ready[2] = true{
var_player = instance_create_depth(300,300,depth,Player)
var_player.player_name = player_selected[2]
var_player.input_number = cursor_control[2]
var_player.player_number = 2
}

if player_ready[3] = true{
var_player = instance_create_depth(300,300,depth,Player)
var_player.player_name = player_selected[3]
var_player.input_number = cursor_control[3]
var_player.player_number = 3
}
GM.player_amount = player_amount
if GM.game_mode = "Versus"{
room_goto(r_Versus1)
}
else{
GM.next_floor = true
GM.glitch_intensity += 1
play_msc(msc_Floor1)}
}