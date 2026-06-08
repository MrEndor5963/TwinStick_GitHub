home_x = GM.map_x
home_y = GM.map_y
if array_contains(GM.map_visited,x_plus_y(home_x,home_y)){
instance_destroy();exit
}

hp = 3000
move_timer = 1
shoot_timer = 90
create_enemy()
hsp = 0;vsp = 0
move_direction_h = 0
move_direction_v = 0

blood_color = c_blue