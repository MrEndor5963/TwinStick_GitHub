draw_sprite_ext(s_DoorBlackspace,0,x,y,1,1,image_angle,-1,1)

draw_sprite_ext(s_DoorHalf,0,x-(sign(-y_offset)*82),y+(sign(-x_offset)*82),door_closedness,1,image_angle,-1,1)

draw_sprite_ext(s_DoorHalf,0,x+(sign(-y_offset)*82),y-(sign(-x_offset)*82),-door_closedness,1,image_angle,-1,1)

draw_sprite_ext(s_DoorFrame,0,x,y,1,1,image_angle,-1,1)