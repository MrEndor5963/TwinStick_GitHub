make_block = false
if x < 200 {
spawn_position = "Left"
if on_map(GM.map_x-1,GM.map_y) = false or ds_grid_get(GM.map,GM.map_x-1,GM.map_y) = 0{make_block = true}
}
if x > room_width-200{
spawn_position = "Right"
if on_map(GM.map_x+1,GM.map_y) = false or ds_grid_get(GM.map,GM.map_x+1,GM.map_y) = 0{make_block = true}
}
if y < 200 {
spawn_position = "Top"
if on_map(GM.map_x,GM.map_y-1) = false or ds_grid_get(GM.map,GM.map_x,GM.map_y-1) = 0{make_block = true}
}
if y > room_height-200{
spawn_position = "Bottom"
if on_map(GM.map_x,GM.map_y+1) = false or ds_grid_get(GM.map,GM.map_x,GM.map_y+1) = 0{make_block = true}
}

if make_block = true{
block = instance_create_depth(x,y,depth+1,Collision)
block.image_xscale = image_xscale
block.image_yscale = image_yscale}