home_x = GM.map_x
home_y = GM.map_y
if array_contains(GM.map_visited,x_plus_y(home_x,home_y)){
instance_destroy();exit
}

box_list = GM.box_list
display_text = false
box_open = false
box_timer = 0
box_toggle_timer = 0
box_toggle_length = 0
box_timer_take_weapon = 0
activate_box = false
block = -23
