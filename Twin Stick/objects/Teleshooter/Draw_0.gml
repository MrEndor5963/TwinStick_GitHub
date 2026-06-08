draw_enemy()
var_aim = point_direction(0,0,move_direction_h,move_direction_v)
hand_x = 20*move_direction_h
hand_y = 20*move_direction_v
draw_sprite_ext(s_TeleshooterHands,0,x+hand_x,y+hand_y,1,1,var_aim,-1,1)