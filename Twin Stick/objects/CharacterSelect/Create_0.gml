screen_width = GM.screen_width
screen_height = GM.screen_height
select_menu = ds_grid_create(3,1)

ds_grid_set(select_menu,0,0,"Hazel")
ds_grid_set(select_menu,1,0,"Justin")
ds_grid_set(select_menu,2,0,"Craig")
//ds_grid_set(select_menu,3,0,"Stickman")
//ds_grid_set(select_menu,4,0,"Tonis")

cursor_control[0] = -1
cursor_control[1] = -1
cursor_control[2] = -1
cursor_control[3] = -1

cursor_c[0] = 0
cursor_c[1] = 0
cursor_c[2] = 0
cursor_c[3] = 0

cursor_r[0] = 0
cursor_r[1] = 0
cursor_r[2] = 0
cursor_r[3] = 0

player_selected[0] = 0
player_selected[1] = 0
player_selected[2] = 0
player_selected[3] = 0

player_ready[0] = false
player_ready[1] = false
player_ready[2] = false
player_ready[3] = false



player_amount = 0
