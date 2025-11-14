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