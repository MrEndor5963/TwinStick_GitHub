x_saved = x

home_x = GM.map_x
home_y = GM.map_y
if array_contains(GM.map_visited,x_plus_y(home_x,home_y)){
instance_destroy();exit
}
bought = false
display_text = -678
description_text = -678
spawned = false
if room = r_Treasure or room = r_SpawnRoom{item_is_free = true}else{item_is_free = false}
draw_timer = 0
draw_timer2 = 0
rebuyable = false


var_item = array_get(GM.item_list,irandom_range(0,array_length(GM.item_list)-1))
sprite_index = var_item
item_id = var_item
player_id = -1