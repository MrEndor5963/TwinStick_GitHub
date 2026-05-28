home_x = GM.map_x
home_y = GM.map_y
if array_contains(GM.map_visited,x_plus_y(home_x,home_y)){
instance_destroy();exit
}

hp = 24000
hp_max = hp
move_timer = 1
create_enemy()
hsp = 0;vsp = 0

node_x = x div 64
node_y = y div 64

blood_color = $FF00FF
weight = 3.50