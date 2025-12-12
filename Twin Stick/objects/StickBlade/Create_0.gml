home_x = GM.map_x
home_y = GM.map_y
if array_contains(GM.map_visited,x_plus_y(home_x,home_y)){
instance_destroy();exit
}

hp = 240
hp += ((GM.floor_number-1)*120)
move_timer = 1
create_enemy()
hsp = 0;vsp = 0

node_x = x div 48
node_y = y div 48