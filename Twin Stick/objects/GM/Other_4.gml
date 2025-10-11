global.grid_x = []
global.grid_y = []


mp_grid_destroy(global.grid)
global.grid = mp_grid_create(0,0,room_width/48,room_height/48,48,48)


var_x = 0
repeat(room_width/48){
var_y = 0
repeat(room_height/48){
if tilemap_get("TileMap",var_x,var_y) != -1{
mp_grid_add_cell(global.grid,var_x,var_y)
array_push(global.grid_x,var_x)
array_push(global.grid_y,var_y)
}
var_y += 1
}
var_x += 1
}

