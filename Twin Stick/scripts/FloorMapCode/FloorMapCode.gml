function on_map(arg_x,arg_y){
if arg_x >= 0 && arg_x < ds_grid_width(GM.map) && arg_y >= 0 && arg_y < ds_grid_height(GM.map){
return true}
else{return false}
}

function x_plus_y(arg_x,arg_y){
return (arg_x+(arg_y*0.01))}

function set_room_with_path(arg_room){
do{
var_x = irandom_range(0,map_size-1)
var_y = irandom_range(0,map_size-1)
var_temp = ds_grid_get(map,var_x,var_y)}
until(var_temp = 0)
array_push(rooms_in_use,arg_room)
ds_grid_set(map,var_x,var_y,arg_room)

current_x = var_x
current_y = var_y
do {
	move_direction = 0
	move_direction_h = 0
	move_direction_v = 0
	if start_x < current_x{move_direction_h = "Left"}
	if start_x > current_x{move_direction_h = "Right"}
	if start_x = current_x{move_direction_h = 0}
	
	if start_y < current_y{move_direction_v = "Up"}
	if start_y > current_y{move_direction_v = "Down"}
	if start_y = current_y{move_direction_v = 0}
	
	do {
	var_temp = irandom_range(1,2)
	if var_temp = 1{move_direction = move_direction_h}
	if var_temp = 2{move_direction = move_direction_v}
	}
	until(move_direction != 0)
	
	if move_direction = "Left"{current_x -= 1}
	if move_direction = "Right"{current_x += 1}
	if move_direction = "Up"{current_y -= 1};
	if move_direction = "Down"{current_y += 1}
	if ds_grid_get(map,current_x,current_y) = 0{
	if floor_number = 1{
	var_room = room_list_1[irandom_range(0,array_length(room_list_1)-1)]}
	else{var_room = room_list_2[irandom_range(0,array_length(room_list_2)-1)]}
	ds_grid_set(map,current_x,current_y,var_room)
	array_push(rooms_in_use,var_room)
	}
}
until(current_x = start_x && current_y = start_y)}

function floor_map_create(){
vrp = 1
repeat(array_length(GM.persistent_object_list)-1){
var_temp = array_get(GM.persistent_object_list,vrp)
if instance_exists(var_temp){instance_destroy(var_temp)}
vrp += 1
}

i = 0;lowest_value = 1000
repeat(array_length(GM.player_list)){
var_player = GM.player_list[i]
var_player.floor_mystery_box_rolls = 0
repeat(var_player.cryptocoin){
with var_player{player_point_change(irandom_range(-10000,10000))}
}
i += 1
}

floor_door = true
map_x = irandom_range(0,map_size-1)
map_y = irandom_range(0,map_size-1)
rooms_in_use = []
map_visited = []
open_nodes = []
//child_nodes = []
//closed_nodes = []
if floor_number = 1{spawn_room = r_Floor1_Spawn}
else{spawn_room = r_Floor2_Spawn}
ds_grid_clear(map,0)
ds_grid_set(map,map_x,map_y,spawn_room)
array_push(open_nodes,x_plus_y(map_x,map_y))
array_push(rooms_in_use,spawn_room)
start_x = map_x
start_y = map_y

set_room_with_path(r_BoxRoom)
set_room_with_path(r_Shop)
set_room_with_path(r_Treasure)
if irandom_range(1,2) = 1{set_room_with_path(r_FastFood)}
else{set_room_with_path(r_Casino)}
set_room_with_path(r_Floor1_KeyRoom)
set_room_with_path(r_Floor1_Boss)

}