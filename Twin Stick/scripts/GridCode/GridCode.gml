function set_nodes(){
node_x = x div 64
node_y = (y+sprite_get_yoffset(sprite_index)) div 64
}

function ongrid(arg_x,arg_y){
if arg_x < 0 or arg_y < 0 or arg_x > ds_grid_width(pathfinding_grid)-1 or arg_y >ds_grid_height(pathfinding_grid)-1{
return false
}else{return true}
}

function set_player_grid(){
ds_grid_clear(pathfinding_grid,0)

set_nodes()

c = node_x;r = node_y

mov_cost = 0
open_nodes = []
array_push(open_nodes,x_plus_y(c,r))
child_nodes = []
closed_nodes = []

moveable_tiles = []
array_push(moveable_tiles,x_plus_y(c,r))

code_loops_0 = 0
repeat(1000){if array_length(open_nodes) = 0{exit}
	code_loops_1 = 0
	code_loops_2 = 0
	code_loops_3 = 0
	code_loops_4 = 0
	var var_repeat = 0
	repeat(array_length(open_nodes)){
		current_c = round(floor(open_nodes[var_repeat]))
		current_r = round(frac(open_nodes[var_repeat])*100)
		
		if ongrid(current_c,current_r) = true{
	
		if array_contains(closed_nodes,x_plus_y(current_c-1,current_r)) = false && ongrid(current_c-1,current_r) && array_contains(child_nodes,x_plus_y(current_c-1,current_r)) = false
		{array_push(child_nodes,x_plus_y(current_c-1,current_r))}
	
		if array_contains(closed_nodes,x_plus_y(current_c+1,current_r)) = false && ongrid(current_c+1,current_r) && array_contains(child_nodes,x_plus_y(current_c+1,current_r)) = false
		{array_push(child_nodes,x_plus_y(current_c+1,current_r))}
	
		if array_contains(closed_nodes,x_plus_y(current_c,current_r-1)) = false && ongrid(current_c,current_r-1) && array_contains(child_nodes,x_plus_y(current_c,current_r-1)) = false
		{array_push(child_nodes,x_plus_y(current_c,current_r-1))}
	
		if array_contains(closed_nodes,x_plus_y(current_c,current_r+1)) = false && ongrid(current_c,current_r+1) && array_contains(child_nodes,x_plus_y(current_c,current_r+1)) = false
		{array_push(child_nodes,x_plus_y(current_c,current_r+1))}
		}
		
		var_repeat += 1;code_loops_1 += 1
	}
	
	var var_repeat = 0
	repeat(array_length(child_nodes)){
		child_c = round(floor(child_nodes[var_repeat]))
		child_r = round(frac(child_nodes[var_repeat])*100)
		if ds_grid_get(pathfinding_grid,child_c,child_r) = 1 or ongrid(child_c,child_r) = false{
		array_push(closed_nodes,child_nodes[var_repeat])
		ds_grid_set(pathfinding_grid,child_c,child_r,1000)
		}
		else{
		lowest_value = infinity
		if array_contains(open_nodes,x_plus_y(child_c-1,child_r)) != false
		{mov_cost = ds_grid_get(pathfinding_grid,child_c-1,child_r)
		lowest_value = mov_cost
		}
		
		if array_contains(open_nodes,x_plus_y(child_c+1,child_r)) != false
		{mov_cost = ds_grid_get(pathfinding_grid,child_c+1,child_r)
		if mov_cost < lowest_value{lowest_value = mov_cost}}
		
		if array_contains(open_nodes,x_plus_y(child_c,child_r-1)) != false
		{mov_cost = ds_grid_get(pathfinding_grid,child_c,child_r-1)
		if mov_cost < lowest_value{lowest_value = mov_cost}}
		
		if array_contains(open_nodes,x_plus_y(child_c,child_r+1)) != false
		{mov_cost = ds_grid_get(pathfinding_grid,child_c,child_r+1)
		if mov_cost < lowest_value{lowest_value = mov_cost}}
		mov_cost = lowest_value
		
		
		mov_cost += 1//ds_grid_get(global.grid,child_c,child_r)
		
		saved_sprite = sprite_index;saved_index = image_index
		sprite_index = s_Collision
		if !place_empty(child_c*64,child_r*64,tiles){mov_cost = 999}
		sprite_index = saved_sprite;image_index = saved_index
		
		if mov_cost != 0 && ds_grid_get(pathfinding_grid,child_c,child_r) <= 0 && mov_cost < 999{
		ds_grid_set(pathfinding_grid,child_c,child_r,mov_cost)
		array_push(moveable_tiles,x_plus_y(child_c,child_r))}
		else{
		ds_grid_set(pathfinding_grid,child_c,child_r,mov_cost)
		array_push(closed_nodes,x_plus_y(child_c,child_r))}
		}
		
		var_repeat += 1;code_loops_2 +=1
	}

	var var_repeat = 0
	repeat(array_length(open_nodes))
	{array_push(closed_nodes,open_nodes[var_repeat])
	var_repeat += 1;code_loops_3 += 1}
	
	open_nodes = []
	var var_repeat = 0

	repeat(array_length(child_nodes)){
		if array_contains(closed_nodes,child_nodes[var_repeat]) = false
		{array_push(open_nodes,child_nodes[var_repeat])}
		var_repeat += 1;code_loops_4 += 1}
	child_nodes = []
	code_loops_0 += 1
}

	
ds_grid_set(pathfinding_grid,c,r,1)
}

//enemy grid code

function get_move_directions(){
if instance_exists(Player) && GM.game_over = false{
	
i = 0;lowest_value = 1000
repeat(array_length(GM.player_list)){
var_player = GM.player_list[i]
var_grid = var_player.pathfinding_grid
value = ds_grid_get(var_grid,node_x,node_y) 
if value < lowest_value && var_player.hp > 0{lowest_value = value;player_target = GM.player_list[i]}
i += 1
}
if !collision_present(x+move_direction_h,y+move_direction_v) &&
collision_line(node_x*64,node_y*64,player_target.node_x*64,player_target.node_y*64,[Collision,tiles],false,false) = noone{

direction = point_direction(x,y+sprite_get_yoffset(sprite_index),player_target.x,player_target.y+sprite_get_yoffset(player_target.sprite_index))
speed = 1
if abs(hspeed) > 0.01{move_direction_h = hspeed}else{move_direction_h = 0}
if abs(vspeed) > 0.01{move_direction_v = vspeed}else{move_direction_v = 0}

speed = 0
}
else{
astar(player_target.pathfinding_grid,node_x,node_y,player_target.node_x,player_target.node_y)

grid_xoffset = (sprite_get_xoffset(sprite_index)*(move_path_x[1]-node_x))
grid_yoffset = (sprite_get_yoffset(sprite_index)*(move_path_y[1]-node_y))

grid_x = x
grid_y = y+sprite_get_yoffset(sprite_index)
grid_goal_x = (move_path_x[1]*64)+32
grid_goal_y = (move_path_y[1]*64)+32

direction = point_direction(grid_x,grid_y,grid_goal_x,grid_goal_y)
speed = 1
move_direction_h = sign(hspeed)
move_direction_v = sign(vspeed)
speed = 0
if abs(grid_goal_x-grid_x) <= 1{move_direction_h = 0}
if abs(grid_goal_y-grid_y) <= 1{move_direction_v = 0}

}
//if collision_present(x+move_direction_h,y){move_direction_v = sign(move_direction_v)}
//if collision_present(x,y+move_direction_v){move_direction_h = sign(move_direction_h)}
}
else{
move_direction_h = 0;move_direction_v = 0
}
	
//if collision_present(x,y+(sign(move_direction_v)*2)){move_direction_v = 0}
//if collision_present(x+(sign(move_direction_h)*2),y){move_direction_h = 0}
}
	
function astar(arg_grid, arg_startx, arg_starty, arg_endx, arg_endy){
move_path_x = []
move_path_y = []
pathfinding_grid = arg_grid
if ds_grid_get(arg_grid,arg_endx,arg_endy) = 999{return false}
//if Cursor.c = endx && Cursor.r = endy{throw("this code was read")}
x_saved = x;y_saved = y
x = arg_startx;y = arg_starty

move_path_x[0] = arg_startx
move_path_y[0] = arg_starty
tiles_moved = 0

do {
	tiles_moved += 1
	lowest_value = infinity
	
	value = ds_grid_get(arg_grid,x-1,y)
	move_direction = "Left";lowest_value = value
	
	value = ds_grid_get(arg_grid,x+1,y)
	if value < lowest_value{move_direction = "Right";lowest_value = value}
	
	value = ds_grid_get(arg_grid,x,y-1)
	if value < lowest_value{move_direction = "Up";lowest_value = value}
	
	value = ds_grid_get(arg_grid,x,y+1)
	if value < lowest_value{move_direction = "Down";}
	
	if move_direction = "Left"{x -= 1}
	if move_direction = "Right"{x += 1}
	if move_direction = "Up"{y -= 1};
	if move_direction = "Down"{y += 1}
	array_push(move_path_x,x)
	array_push(move_path_y,y)
	if ongrid(x,y) = false{
	x = x_saved;y = y_saved;return false
	//failsafe code
	}
}
until(x = arg_endx && y = arg_endy)

x = x_saved;y = y_saved

return true

}