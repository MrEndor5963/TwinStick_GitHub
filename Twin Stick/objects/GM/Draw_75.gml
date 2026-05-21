/// @description Debug menu
if dev_mode = false{exit}

if dev_item_menu = true{
	menu_active = true

	draw_sprite(s_MenuCursor,0,32,80)
	vrp = 0
	repeat(array_length(menu)){
	item_id = menu[vrp]
	var_x = 64+sprite_get_xoffset(item_id)
	var_y = 80+(96*vrp)-(sprite_get_height(item_id)/2)+sprite_get_yoffset(item_id)-(menu_cursor*96)
	draw_sprite(item_id,0,var_x,var_y)
	
	vrp += 1}
	
	item_id = menu[menu_cursor]
	script_execute_item(item_id)

	draw_text(640,20,string(item_name))
	draw_text(640,20+(text_gap*1),"Cost"+string(cost))
	draw_text(640,20+(text_gap*2),string(description))

if key_enter{Player.new_item = item_id}
}