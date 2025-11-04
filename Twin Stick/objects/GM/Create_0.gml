depth = -1000
grid_made = false
randomize()
screen_width = 1280
screen_height = 720


player_amount = 0
player_list = []
//room_goto(r_Floor1_Spawn)
cam_x = 0;cam_y = 0
cam_target_x = 0;cam_target_y = 0
cam_speed = 40
next_room = -1

cam_size_x = 1280;cam_size_y = 720
camera_set_view_size(view_camera[0],cam_size_x,cam_size_y)

clamp_x1 = 0;clamp_x2 = room_width
clamp_y1 = 0;clamp_y2 = room_height

global.collision_grid = ds_grid_create(27,15)
map_size = 6
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
array_push(room_list,r_Floor1_Main20)

box_list = []
array_push(box_list,s_m1911)
array_push(box_list,s_Taurus92)
array_push(box_list,s_SnW500)
array_push(box_list,s_Olympia)
array_push(box_list,s_mp5)
array_push(box_list,s_spectre)
array_push(box_list,s_AK47)
array_push(box_list,s_Xiuhcoatl)
array_push(box_list,s_AWP)
array_push(box_list,s_DSR50)
array_push(box_list,s_M14)
array_push(box_list,s_SquareGun)

enemy_list = []
array_push(enemy_list,Zombie)
array_push(enemy_list,ZombieShooter)
array_push(enemy_list,Hellhound)