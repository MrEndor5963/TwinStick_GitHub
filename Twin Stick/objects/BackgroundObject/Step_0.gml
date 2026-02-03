
if GM.floor_number = 1{sprite_index = s_BackgroundF1}
if GM.floor_number = 2{sprite_index = s_BackgroundF2}
if GM.floor_number = 3{sprite_index = s_BackgroundF3}
if GM.floor_number = 4{sprite_index = s_BackgroundF4}
if room = r_FloorTransition{sprite_index = s_BlackPixel}

depth = layer_get_depth("Background")-1
image_xscale = (room_width+48)/sprite_get_width(sprite_index)
image_yscale = room_height/sprite_get_height(sprite_index)
x = 0;y = 0