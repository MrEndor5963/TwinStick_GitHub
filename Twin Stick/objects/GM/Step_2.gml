if keyboard_check(vk_control){
if keyboard_check_pressed(ord("R")){game_restart()}

if keyboard_check_pressed(ord("F")){
if window_get_fullscreen() = false{
window_set_fullscreen(true)}
else{window_set_fullscreen(false)}
}

if keyboard_check_pressed(ord("M")){
if audio_group_get_gain(audiogroup_default) = 1{
audio_group_set_gain(audiogroup_default,0,infinity)}
else{
audio_group_set_gain(audiogroup_default,1,infinity)}
}

}