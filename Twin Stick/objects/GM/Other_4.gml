set_tileset_collision()
if instance_exists(Player){
array_push(visited_rooms,x_plus_y(map_x,map_y))}

ds_grid_clear(global.collision_grid,0)
var_xx = 0
repeat(ds_grid_width(global.collision_grid)){
x = var_xx*48
var_yy = 0
repeat(ds_grid_height(global.collision_grid)){
y = var_yy*48
if collision_present(x,y){ds_grid_set(global.collision_grid,var_xx,var_yy,1)}
var_yy += 1}
var_xx += 1}