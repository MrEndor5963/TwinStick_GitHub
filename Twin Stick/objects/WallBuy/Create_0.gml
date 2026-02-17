home_x = GM.map_x
home_y = GM.map_y
if array_contains(GM.map_visited,x_plus_y(home_x,home_y)){
instance_destroy();exit
}

code_loops = 0
do{
weapon_list = array_get(GM.weapon_tiers,(irandom_range(0,array_length(GM.weapon_tiers)-1)))
weapon_list = variable_instance_get(GM,"tier_"+string(weapon_list)+"_gun_list")
weapon_sprite = array_get(weapon_list,(irandom_range(0,array_length(weapon_list)-1)))
code_loops += 1
}
until(!array_contains(GM.wallguns_on_map,weapon_sprite) or code_loops > 100)

array_push(GM.wallguns_on_map,weapon_sprite)

display_text = -68
spawned = false

