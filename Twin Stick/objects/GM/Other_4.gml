mp_grid_destroy(global.grid)
global.grid = mp_grid_create(0,0,room_width/32,room_height/32,32,32)

if room = r_Floor1_Spawn && grid_made = false{
floor_map_create()
visited_rooms = []
grid_made = true}



array_push(visited_rooms,x_plus_y(map_x,map_y))