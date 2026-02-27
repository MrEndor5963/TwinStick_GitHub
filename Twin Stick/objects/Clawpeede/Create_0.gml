home_x = GM.map_x
home_y = GM.map_y
if array_contains(GM.map_visited,x_plus_y(home_x,home_y)){
instance_destroy();exit
}
hp = 20000
hp += round((GM.player_amount-1)*0.2)
hp_max = hp
move_timer = 1
shoot_timer = 90
create_enemy()
hsp = 0;vsp = 0

node_x = x div 48
node_y = y div 48

image_xscale = irandom_range(-1,1)
while image_xscale = 0{image_xscale = irandom_range(-1,1)}
move_direction_h  = image_xscale
move_direction_v = 0

record_size = 200
for(var i = record_size-1; i >= 0; i--){
record_x[i] = x;record_y[i] = y
record_xscale[i] = image_xscale
record_angle[i] = image_angle
}

var_i = 1
repeat(7){
body = instance_create_depth(x,y,depth+1,ClawpeedeBody)
body.creator = id
body.record = 12*var_i
body.sprite_index = s_ClawpedeBody
if var_i = 7{body.sprite_index = s_ClawpedeEnd}
var_i += 1}