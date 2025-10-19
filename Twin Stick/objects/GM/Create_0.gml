grid_made = false
randomize()
global.grid = mp_grid_create(0,0,room_width/32,room_height/32,32,32)


global.player_amount = 0
global.player_list = []
room_goto(r_Floor1_Spawn)
cam_x = 0;cam_y = 0

cam_size_x = 1920;cam_size_y = 1080
camera_set_view_size(view_camera[0],cam_size_x,cam_size_y)

clamp_x1 = 0;clamp_x2 = room_width
clamp_y1 = 0;clamp_y2 = room_height

map_size = 6
map = ds_grid_create(map_size,map_size)

room_list = []
array_push(room_list,r_Floor1_Main01)