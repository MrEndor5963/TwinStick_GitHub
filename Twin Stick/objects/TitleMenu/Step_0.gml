menu_controls()
key_back = gamepad_button_check_pressed_any(gp_face2) or keyboard_check_pressed(vk_backspace) or keyboard_check_pressed(vk_escape) or keyboard_check_pressed(ord("X"))

if key_back{sub_menu = 0;menu_cursor = 0}
if key_enter{
if menu[menu_cursor] = "Solo" or menu[menu_cursor] = "Co-op"{room_goto(r_CharacterSelectScreen)}
sub_menu = menu[menu_cursor]
menu_cursor = 0
}

menu = []
if sub_menu = 0
{
menu[0] = "Solo"
menu[1] = "Co-op"
menu[2] = "??????"//Versus
menu[3] = "Collection"
menu[4] = "???????????"//Achievments
menu[5] = "Configuration"
}

if sub_menu = "Collection"
{
menu[0] = "Weaponry"
menu[1] = "Items"
menu[2] = "Enemies"
menu[3] = "??????????"//Characters
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