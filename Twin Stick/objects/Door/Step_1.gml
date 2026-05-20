if spawned = false{
if image_angle = 90{next_room = "Left";x_offset = -48;GM.door_left = id
if GM.map_x = 0 or ds_grid_get(GM.map,GM.map_x-1,GM.map_y) = 0{instance_destroy()}
}
if image_angle = 270{next_room = "Right";x_offset = 48;GM.door_right = id
if GM.map_x = GM.map_size-1 or ds_grid_get(GM.map,GM.map_x+1,GM.map_y) = 0{instance_destroy()}}
if image_angle = 0{next_room = "Up";y_offset = -48;GM.door_up = id
if GM.map_y = 0 or ds_grid_get(GM.map,GM.map_x,GM.map_y-1) = 0{instance_destroy()}}
if image_angle = 180{next_room = "Down";y_offset = 48;GM.door_down = id
if GM.map_y = GM.map_size-1 or ds_grid_get(GM.map,GM.map_x,GM.map_y+1) = 0{instance_destroy()}}
spawned = true}