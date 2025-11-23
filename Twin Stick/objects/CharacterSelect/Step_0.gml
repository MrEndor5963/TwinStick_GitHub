

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
if gamepad_axis_value(cursor_control[vrp],gp_axislh) < -0.2 or gamepad_button_check(cursor_control[vrp],gp_padl)
{key_left[vrp] = true}else{key_left[vrp] = false}
if gamepad_axis_value(cursor_control[vrp],gp_axislh) > 0.2 or gamepad_button_check(cursor_control[vrp],gp_padr)
{key_right[vrp] = true}else{key_right[vrp] = false}
if gamepad_axis_value(cursor_control[vrp],gp_axislv) < -0.2 or gamepad_button_check(cursor_control[vrp],gp_padu)
{key_up[vrp] = true}else{key_up[vrp] = false}
if gamepad_axis_value(cursor_control[vrp],gp_axislv) > 0.2 or gamepad_button_check(cursor_control[vrp],gp_padd)
{key_down[vrp] = true}else{key_down[vrp] = false}

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
//

if gamepad_button_check_pressed(cursor_control[vrp],gp_face1){
if player_selected[vrp] = 0{
player_selected[vrp] = ds_grid_get(select_menu,cursor_c[vrp],cursor_r[vrp])}
else{player_ready[vrp] = true}
}




if gamepad_button_check_pressed(cursor_control[vrp],gp_face2) {
if player_selected[vrp] = 0{
cursor_control[vrp] = -1
player_amount -= 1}
if player_selected[vrp] != 0{
if player_ready[vrp] = false{player_selected[vrp] = 0}
if player_ready[vrp] = true{player_ready[vrp] = false}
}

}


vrp += 1
}

if cursor_control[0] = -1 or player_ready[0] = true{var0 = true}else{var0 = false}
if cursor_control[1] = -1 or player_ready[1] = true{var1 = true}else{var1 = false}
if cursor_control[2] = -1 or player_ready[2] = true{var2 = true}else{var2 = false}
if cursor_control[3] = -1 or player_ready[3] = true{var3 = true}else{var3 = false}

if var0 = true && var1 = true && var2 = true && var3 = true && player_amount > 0{
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
room_goto(r_Floor1_Spawn)
}