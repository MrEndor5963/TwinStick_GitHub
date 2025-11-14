door = -22

make_block = false
make_boss_door = false
if x < 200 {
spawn_position = "Left"
var_x = GM.map_x-1;var_y = GM.map_y
}

if x > room_width-200{
spawn_position = "Right"
var_x = GM.map_x+1;var_y = GM.map_y
}

if y < 200 {
spawn_position = "Top"
var_x = GM.map_x;var_y = GM.map_y-1
}

if y > room_height-200{
spawn_position = "Bottom"
var_x = GM.map_x;var_y = GM.map_y+1
}

if on_map(var_x,var_y) = false or ds_grid_get(GM.map,var_x,var_y) = 0{make_block = true}
else{if ds_grid_get(GM.map,var_x,var_y) = r_Floor1_Boss{make_boss_door = true}}

if make_block = true{
block = instance_create_depth(x,y,depth+1,Collision)
block.image_xscale = image_xscale
block.image_yscale = image_yscale}

if make_boss_door = true{
block = instance_create_depth(x,y,depth+1,BossDoor)
block.image_xscale = image_xscale
block.image_yscale = image_yscale
}