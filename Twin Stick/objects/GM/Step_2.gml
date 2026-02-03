
if keyboard_check(vk_control) && dev_mode = true{
if keyboard_check_pressed(ord("R")){game_restart()}

if keyboard_check_pressed(ord("4")){Player.money += 2000}

if keyboard_check_pressed(ord("F")){
if window_get_fullscreen() = false{
window_set_fullscreen(true)}
else{window_set_fullscreen(false)}
}

if keyboard_check_pressed(ord("M")){
if audio_group_get_gain(audiogroup_default) = 1{
audio_group_set_gain(audiogroup_default,0,0)
audio_group_set_gain(audiogroup_sfx,0,0)}
else{
audio_group_set_gain(audiogroup_default,1,0)
audio_group_set_gain(audiogroup_sfx,1,0)}

}

if keyboard_check_pressed(ord("C")){
if disable_countdown = false{disable_countdown = true}
else{disable_countdown = false}
}
}