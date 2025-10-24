grid_made = false
randomize()
global.grid = mp_grid_create(0,0,room_width/32,room_height/32,32,32)


global.player_amount = 0
global.player_list = []
room_goto(r_Floor1_Spawn)
cam_x = 0;cam_y = 0

cam_size_x = 1280;cam_size_y = 720
camera_set_view_size(view_camera[0],cam_size_x,cam_size_y)

clamp_x1 = 0;clamp_x2 = room_width
clamp_y1 = 0;clamp_y2 = room_height

map_size = 7
map = ds_grid_create(map_size,map_size)


room_list = []
array_push(room_list,r_Floor1_Main01)
array_push(room_list,r_Floor1_Main02)
array_push(room_list,r_Floor1_Main03)
array_push(room_list,r_Floor1_Main04)
array_push(room_list,r_Floor1_Main05)
array_push(room_list,r_Floor1_Main06)
array_push(room_list,r_Floor1_Main07)
array_push(room_list,r_Floor1_Main08)
array_push(room_list,r_Floor1_Main09)
array_push(room_list,r_Floor1_Main10)
array_push(room_list,r_Floor1_Main11)
array_push(room_list,r_Floor1_Main12)
array_push(room_list,r_Floor1_Main13)
array_push(room_list,r_Floor1_Main14)
array_push(room_list,r_Floor1_Main15)
array_push(room_list,r_Floor1_Main16)
array_push(room_list,r_Floor1_Main17)
array_push(room_list,r_Floor1_Main18)
array_push(room_list,r_Floor1_Main19)