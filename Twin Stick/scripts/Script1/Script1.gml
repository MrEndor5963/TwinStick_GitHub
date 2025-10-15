
function set_tileset_collision(){
tiles = layer_tilemap_get_id("TileMap")
}

function collision_present(x_place,y_place){
if place_meeting(x_place,y_place,[Collision,tiles]){return true}
return false
}

function create_enemy(){
hit_stun = 0
image_xscale = 3
image_yscale = 3
hitbox = instance_create_depth(x,y,depth+1,Enemy)
hitbox.sprite_index = sprite_index
hitbox.hp = hp
hitbox.creator = id
set_tileset_collision()
}

function find_player_target(){
if path_exists(path){path_delete(path)}
path = path_add()
var_repeat = 0;distance = infinity;new_distance =  0
repeat(array_length(global.player_list)){
temp_target = global.player_list[var_repeat]
mp_grid_path(global.grid,path,x,y,temp_target.x,temp_target.y,true)
new_distance = path_get_length(path)
if new_distance < distance{target = global.player_list[var_repeat];distance = new_distance}
var_repeat += 1
}
}
/*
function astar(grid, startx, starty, endx, endy){

if ongrid(endx,endy) && ds_grid_get(global.move_radius,endx,endy) <= 0{return false}
//if Cursor.c = endx && Cursor.r = endy{throw("this code was read")}

x = endx;y = endy

move_path_x = []
move_path_y = []
move_path_x[0] = startx
move_path_y[0] = starty
tiles_moved = 0

do {
	tiles_moved += 1
	array_insert(move_path_x,1,x)
	array_insert(move_path_y,1,y)	
	lowest_value = infinity
	
	value = ds_grid_get(global.move_radius,x-1,y)
	if value > 0{move_direction = "Left";lowest_value = value}
	
	value = ds_grid_get(global.move_radius,x+1,y)
	if value > 0 && value < lowest_value{move_direction = "Right";lowest_value = value}
	
	value = ds_grid_get(global.move_radius,x,y-1)
	if value > 0 && value < lowest_value{move_direction = "Up";lowest_value = value}
	
	value = ds_grid_get(global.move_radius,x,y+1)
	if value > 0 && value < lowest_value{move_direction = "Down";}
	
	if startx = x-1 && starty = y{move_direction = "Left"}
	if startx = x+1 && starty = y{move_direction = "Right"}
	if startx = x && starty = y-1{move_direction = "Up"}
	if startx = x && starty = y+1{move_direction = "Down"}
	
	if move_direction = "Left"{x -= 1}
	if move_direction = "Right"{x += 1}
	if move_direction = "Up"{y -= 1};
	if move_direction = "Down"{y += 1}
if tiles_moved > mov*2{throw("Path Not Found")}
}
until(x = startx && y = starty)

x = startx*30;y = starty*30

return true

}

function SetGrid(){
var w = ds_grid_width(global.grid)
var h = ds_grid_height(global.grid)
for (var xx = 0; xx < w; xx++)
for (var yy = 0; yy < h; yy++)
{

if tilemap_get("TileMap",var_x,var_y) = -1{
ds_grid_set(global.grid,xx,yy,1)
}
else{
ds_grid_set(global.grid,xx,yy,1000)
}

}
}