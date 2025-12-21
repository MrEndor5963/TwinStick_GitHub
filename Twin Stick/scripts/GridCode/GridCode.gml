function ongrid(arg_x,arg_y){
if arg_x < 0 or arg_y < 0 or arg_x > ds_grid_width(pathfinding_grid)-1 or arg_y >ds_grid_height(pathfinding_grid)-1{
return false
}else{return true}
}

function set_player_grid(){
ds_grid_clear(pathfinding_grid,0)

node_x = x div 48;node_y = y div 48

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
		if ds_grid_get(global.collision_grid,child_c,child_r) = 1 or ongrid(child_c,child_r) = false{
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
		if mov_cost != 0 && ds_grid_get(pathfinding_grid,child_c,child_r) <= 0{
		ds_grid_set(pathfinding_grid,child_c,child_r,mov_cost)
		array_push(moveable_tiles,x_plus_y(child_c,child_r))}
		else{array_push(closed_nodes,x_plus_y(child_c,child_r))}
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