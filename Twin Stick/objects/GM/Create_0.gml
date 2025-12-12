audio_group_set_gain(audiogroup_default,0,infinity)
depth = -1000
grid_made = false
randomize()
screen_width = 1280
screen_height = 720

game_paused = false
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
floor_number = 1
next_floor = false
floor_door = true
map_size = 5
map = ds_grid_create(map_size,map_size)
draw_map = false

pause_alpha = 0
menu_cursor = 0
menu[0] = "Resume"
menu[1] = "Settings"
menu[2] = "Character Select"
menu[3] = "Exit Game"
key_held_u = 0
key_held_d = 0
key_held_l = 0
key_held_r = 0

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

if grid_made = false{
floor_map_create()
visited_rooms = []
grid_made = true}

enemy_list = []
//array_push(enemy_list,Zombie)
array_push(enemy_list,StickBlade)
array_push(enemy_list,SpikeFly)
//array_push(enemy_list,ZombieShooter)
//array_push(enemy_list,Hellhound)

melee_list = []
box_list = []
handgun_list = []
revolver_list = []
machine_pistol_list = []
smg_list = []
semi_ar_list = []
full_ar_list = []
lmg_list = []
shotgun_list = []
sniper_list = []
nazi_list = []

referece_weapons()


item_list = []
reference_items()
array_push(item_list,s_item_BloodBullets)
array_push(item_list,s_item_DamageUp)
array_push(item_list,s_item_DoubleTap)
array_push(item_list,s_item_HandgunHavoc)
array_push(item_list,s_item_SuperMushroom)
array_push(item_list,s_item_MLGNoScoper)
array_push(item_list,s_item_Move)
array_push(item_list,s_item_PoundOfFeathers)
array_push(item_list,s_item_ShotGunner)
array_push(item_list,s_item_SpeedCola)
array_push(item_list,s_item_WeaponSlots)
array_push(item_list,s_item_WeightedBelt)

items_bought = []