home_x = GM.map_x
home_y = GM.map_y
if array_contains(GM.map_visited,x_plus_y(home_x,home_y)){
instance_destroy();exit
}

weapon_list = GM.weapon_list
weapon_sprite = array_get(weapon_list,(irandom_range(0,array_length(weapon_list)-1)))
display_text = -68
spawned = false

