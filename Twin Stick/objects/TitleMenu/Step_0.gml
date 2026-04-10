if !audio_is_playing(msc_TitleScreen){play_msc(msc_TitleScreen)}

menu_controls()
if key_up_pressed or key_down_pressed{play_sfx(sfx_Cursor)}
key_back = gamepad_button_check_pressed_any(gp_face2) or keyboard_check_pressed(vk_backspace) or keyboard_check_pressed(vk_escape) or keyboard_check_pressed(ord("X"))

if key_back{
if sub_menu != 0{GM.glitch_intensity = 0.5}
sub_menu = 0;menu_cursor = 0}
if key_enter{
if menu[menu_cursor] = "Solo" or menu[menu_cursor] = "Co-op" or menu[menu_cursor] = "Versus"
{
GM.game_mode = menu[menu_cursor]
GM.glitch_intensity = 1
play_sfx(sfx_MenuClick)
room_goto(r_CharacterSelectScreen)}
sub_menu = menu[menu_cursor]
if sub_menu != 0 && GM.glitch_intensity != 1{
play_sfx(sfx_MenuClick)
GM.glitch_intensity = 0.5
}
menu_cursor = 0
}

menu = []
if sub_menu = 0
{
menu[0] = "Solo"
menu[1] = "Co-op"
menu[2] = "Versus"
menu[3] = "Database"
menu[4] = "???????????"//Achievments
menu[5] = "Configuration"
}

if sub_menu = "Configuration"{
menu[0] = "Sound"
menu[1] = "Music"

if menu_cursor = 0{
if key_left_pressed{GM.sfx_gain_saved -= 0.1}
if key_right_pressed{GM.sfx_gain_saved += 0.1}
}

if menu_cursor = 1{
if key_left_pressed{GM.msc_gain_saved -= 0.1}
if key_right_pressed{GM.msc_gain_saved += 0.1}
}


}

if sub_menu = "Database"
{
menu[0] = "Weaponry"
menu[1] = "Items"
menu[2] = "Test Subjects A"
menu[3] = "Test Subjects B"//Characters
}

if sub_menu = "Weaponry"{
vrp = 0
repeat(array_length(GM.weapon_list)){
menu[vrp] = GM.weapon_list[vrp]
vrp += 1}

script_execute_wpn(menu[menu_cursor])

}

if sub_menu = "Items"{
vrp = 0
repeat(array_length(GM.item_list)){
menu[vrp] = GM.item_list[vrp]
vrp += 1}

script_execute_item(menu[menu_cursor])

}