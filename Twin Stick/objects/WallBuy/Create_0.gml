home_x = GM.map_x
home_y = GM.map_y
if array_contains(GM.map_visited,x_plus_y(home_x,home_y)){
instance_destroy();exit
}

weapon_list = GM.weapon_list
weapon_sprite = array_get(weapon_list,(irandom_range(0,array_length(weapon_list)-1)))
display_text = false
spawned = false

jam_chance = 0
jam_timer = 0
jam_time = 60
trigger_delay = 0
trigger_delay_timer = 0
reload_timer = -1
reload_amount = 0
shoot_amount = 0