//GM = Game manager
//Operates various game data,Save data, pause menu, and floor map

if instance_number(GM) > 1{instance_destroy();exit}
dev_mode = true
randomize()
audio_group_load(audiogroup_sfx)
audio_group_set_gain(audiogroup_default,0,0)
audio_group_set_gain(audiogroup_sfx,1,0)
depth = -1000
screen_width = 1280
screen_height = 720

game_mode = ""

game_paused = false
player_amount = 0
player_list = []
//room_goto(r_Floor1_Spawn)
cam_x = 0;cam_y = 0
cam_target_x = 0;cam_target_y = 0
cam_speed = 40
next_room = -1
room_start = true
disable_countdown = true
game_over = false

cam_size_x = 1280;cam_size_y = 720
camera_set_view_size(view_camera[0],cam_size_x,cam_size_y)

clamp_x1 = 0;clamp_x2 = room_width
clamp_y1 = 0;clamp_y2 = room_height

global.collision_grid = ds_grid_create(27,15)
floor_number = 0
next_floor = false
floor_door = true
map_size = 4
map = ds_grid_create(map_size,map_size)
draw_map = false

pause_alpha = 0
menu_cursor = 0
menu[0] = "Resume"
menu[1] = "Settings"
menu[2] = "Main Menu"
menu[3] = "Exit Game"
key_held_u = 0
key_held_d = 0
key_held_l = 0
key_held_r = 0


room_list_1 = []
vrp = 1
repeat(20){
if vrp < 10{var_string = "0"+string(vrp)}else{var_string = vrp}
var_temp = asset_get_index("r_Floor1_Main"+string(var_string))
array_push(room_list_1,var_temp)
vrp += 1
}

room_list_2 = []
vrp = 1
repeat(10){
if vrp < 10{var_string = "0"+string(vrp)}else{var_string = vrp}
var_temp = asset_get_index("r_Floor2_Main"+string(var_string))
array_push(room_list_2,var_temp)
vrp += 1
}

enemy_list = []
//array_push(enemy_list,Zombie)
array_push(enemy_list,StickBlade)
array_push(enemy_list,SpikeFly)
//array_push(enemy_list,ZombieShooter)
//array_push(enemy_list,Hellhound)


weapon_list = []
wallbuy_list = []
box_list = []

melee_list = []
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
items_bought = []

persistent_object_list = []
array_push(persistent_object_list,Player)
array_push(persistent_object_list,MysteryBox)
array_push(persistent_object_list,WallBuy)
array_push(persistent_object_list,ShopKeeper)