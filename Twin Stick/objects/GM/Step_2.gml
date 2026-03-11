
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

if keyboard_check_pressed(ord("B")){
if room != r_Floor1_Boss{room = r_Floor1_Boss}
}

if keyboard_check_pressed(ord("G")){
if instance_exists(Player){
with Player{
weapon = []
script_execute_wpn(s_m1911)

weapon = []
weapon_slots = array_length(GM.weapon_list)
vrp = 0
repeat(weapon_slots){
get_new_weapon(GM.weapon_list[vrp])
switch_to_weapon(vrp)
vrp += 1
}

}
}
}
}