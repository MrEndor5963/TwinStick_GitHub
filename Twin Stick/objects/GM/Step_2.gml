/// @description Console commands
if keyboard_check_pressed(ord("F")) && keyboard_check_pressed(vk_control){
if window_get_fullscreen() = false{
window_set_fullscreen(true)}
else{window_set_fullscreen(false)}
}

if keyboard_check(vk_control) && dev_mode = true{
if keyboard_check_pressed(ord("R")){game_restart()}

if keyboard_check_pressed(ord("4")){Player.money += 2000}

if keyboard_check_pressed(ord("M")){
if sfx_gain_saved = 0{
sfx_gain_saved = 1
msc_gain_saved = 1
}
else{
sfx_gain_saved = 0
msc_gain_saved = 0
}

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

weapons_held = []
weapon_slots_max = array_length(GM.weapon_list)
vrp = 0
repeat(weapon_slots_max){
get_new_weapon(GM.weapon_list[vrp])
switch_to_weapon(vrp)
vrp += 1
}

}
}
}
}