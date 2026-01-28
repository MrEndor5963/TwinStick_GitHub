if spawned = false{
script_execute_item(sprite_index)
if item_is_free = true{cost = 0}
spawned = true
}

if sprite_index = s_item_Heart{
list_temp = ds_list_create() 
instance_place_list(x,y,[Player],list_temp,false)
higest_value = 0
vrp = 0
repeat(ds_list_size(list_temp)){
var_player = ds_list_find_value(list_temp,vrp)
higest_value = var_player.healthcare
}
cost = higest_value
ds_list_destroy(list_temp)

}
if array_contains(GM.items_bought,sprite_index) = true{instance_destroy()}

font = f_Main;draw_set_color(c_white)

if place_meeting(x,y,Player){
if item_is_free = true{
var_text = "Press A to take "+string(item_name)}
else{
var_text = "Press A to Buy "+string(item_name)+" [Cost "+string(cost)+"]"}
if !instance_exists(display_text){
display_text = instance_create_depth(x+(sprite_width/2),y-(font_get_size(font)),-room_height-100,DisplayText)
display_text.text_string = var_text
display_text.creator = id
display_text.despawn = false
with DisplayText{draw_set_aligns(fa_center,fa_middle)}
}
}
else{if instance_exists(display_text){display_text.despawn = true}}



//GM.description_text = true
//GM.description_text_x = x+(sprite_width/2)
//GM.description_text_y = y
//GM.description_text_string = description


