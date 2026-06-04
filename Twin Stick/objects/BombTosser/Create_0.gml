home_x = GM.map_x
home_y = GM.map_y
if array_contains(GM.map_visited,x_plus_y(home_x,home_y)){
instance_destroy();exit
}

hp = 800
move_timer = 1
create_enemy()
hsp = 0;vsp = 0

set_nodes()

bomb = -37

blood_color = c_blue