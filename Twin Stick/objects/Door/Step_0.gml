if spawned = false{
x_offset = 0;y_offset = 0
if image_angle = 90{next_room = "Left";x_offset = -48
if GM.map_x = 0 or ds_grid_get(GM.map,GM.map_x-1,GM.map_y) = 0{instance_destroy()}
}
if image_angle = 270{next_room = "Right";x_offset = 48
if GM.map_x = GM.map_size-1 or ds_grid_get(GM.map,GM.map_x+1,GM.map_y) = 0{instance_destroy()}}
if image_angle = 0{next_room = "Up";y_offset = -48
if GM.map_y = 0 or ds_grid_get(GM.map,GM.map_x,GM.map_y-1) = 0{instance_destroy()}}
if image_angle = 180{next_room = "Down";y_offset = 48
if GM.map_y = GM.map_size-1 or ds_grid_get(GM.map,GM.map_x,GM.map_y+1) = 0{instance_destroy()}}
spawned = true}

if instance_exists(Enemy){
if door_closedness < 1{door_closedness += 0.05};sprite_index = s_DoorBlackspace}
else{
if door_closedness > 0{door_closedness -= 0.05;sprite_index = s_DoorBlackspace}
if door_closedness = 0{sprite_index = s_DoorOpen}
}

if place_meeting(x+x_offset,y+y_offset,Player) && sprite_index = s_DoorOpen{
GM.next_room = next_room
}