home_x = GM.map_x
home_y = GM.map_y
if array_contains(GM.map_visited,x_plus_y(home_x,home_y)){
instance_destroy();exit
}

hp = 400+((GM.floor_number-1)*250)
trail_timer = 1
create_enemy()

hsp = 0;vsp = 0


if irandom_range(1,2) = 1{
while hsp = 0{hsp = irandom_range(-1,1)}}
else{
while vsp = 0{vsp = irandom_range(-1,1)}}

set_nodes()

blood_color = c_lime