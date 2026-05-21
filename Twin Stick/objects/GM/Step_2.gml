/// @description Console Commands
if keyboard_check(vk_control) = false{exit}
	
if keyboard_check_pressed(ord("F")){
if window_get_fullscreen() = false{
window_set_fullscreen(true)}
else{window_set_fullscreen(false)}
}

if dev_mode = false{exit}
	
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
audio_group_set_gain(audiogroup_sfx,sfx_gain_saved,0)
audio_group_set_gain(audiogroup_default,msc_gain_saved,0)
}

if keyboard_check_pressed(ord("S")){
if sfx_gain_saved = 0{sfx_gain_saved = 1}
else{sfx_gain_saved = 0}
audio_group_set_gain(audiogroup_sfx,sfx_gain_saved,0)
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
weapons_held = []
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
	
	
if keyboard_check_pressed(ord("I")){
if dev_item_menu = true{dev_item_menu = false}
else{dev_item_menu = true;menu_cursor = 0

menu = []
vrp = 0

repeat(array_length(item_list)){
menu[vrp] = item_list[vrp]
vrp += 1
}

}
}


