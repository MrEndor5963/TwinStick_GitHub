depth = layer_get_depth("Background")-1
image_xscale = 6
image_yscale = 4
x = room_width/2;y = room_height/2
if GM.floor_number = 1{sprite_index = s_BackgroundF1}
if GM.floor_number = 2{sprite_index = s_BackgroundF2}
if GM.floor_number = 3{sprite_index = s_BackgroundF3}
if GM.floor_number = 4{sprite_index = s_BackgroundF4}