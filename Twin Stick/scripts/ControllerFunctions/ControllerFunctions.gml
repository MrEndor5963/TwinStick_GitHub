function gamepad_button_check_pressed_any(arg_button){
if gamepad_button_check_pressed(0,arg_button) or gamepad_button_check_pressed(1,arg_button) or
gamepad_button_check_pressed(2,arg_button)or gamepad_button_check_pressed(3,arg_button) or
gamepad_button_check_pressed(4,arg_button)
{return true}
else{return false}
}

function gamepad_axis_value_any(arg_axis,arg_is_direction_right_or_down){
if arg_is_direction_right_or_down = false{
if gamepad_axis_value(0,arg_axis) < -0.2 or gamepad_axis_value(1,arg_axis) < -0.2 or
gamepad_axis_value(2,arg_axis) < -0.2 or gamepad_axis_value(3,arg_axis) < -0.2 or
gamepad_axis_value(4,arg_axis) < -0.2
{return true}
else{return false}
}

if arg_is_direction_right_or_down = true{
if gamepad_axis_value(0,arg_axis) > 0.2 or gamepad_axis_value(1,arg_axis) > 0.2 or
gamepad_axis_value(2,arg_axis) > 0.2 or gamepad_axis_value(3,arg_axis) > 0.2 or
gamepad_axis_value(4,arg_axis) > 0.2
{return true}
else{return false}
}

}

function menu_controls(){
key_left = gamepad_axis_value_any(gp_axislh,false) or keyboard_check(vk_left)
key_right = gamepad_axis_value_any(gp_axislh,true) or keyboard_check(vk_right)
key_up = gamepad_axis_value_any(gp_axislv,false) or keyboard_check(vk_up)
key_down = gamepad_axis_value_any(gp_axislv,true) or keyboard_check(vk_down)
key_enter = gamepad_button_check_pressed_any(gp_face1) or keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("Z"))

key_left_pressed = false;key_right_pressed = false;key_up_pressed = false;key_down_pressed = false

if key_left{key_held_l += 1}else{key_held_l = -1};
if key_held_l = 0{key_held_l = -12;key_left_pressed = true}
if key_right{key_held_r += 1}else{key_held_r = -1};
if key_held_r = 0{key_held_r = -12;key_right_pressed = true}
if key_up{key_held_u += 1}else{key_held_u = -1};
if key_held_u = 0{key_held_u = -12;key_up_pressed = true}
if key_down{key_held_d += 1}else{key_held_d = -1};
if key_held_d = 0{key_held_d = -12;key_down_pressed = true}

if key_up_pressed = true{menu_cursor -= 1;if menu_cursor < 0{menu_cursor = array_length(menu)-1}}
if key_down_pressed = true{menu_cursor += 1;if menu_cursor > array_length(menu)-1{menu_cursor = 0}}
}