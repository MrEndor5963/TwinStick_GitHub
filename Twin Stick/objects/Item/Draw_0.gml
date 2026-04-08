if GM.map_x != home_x or GM.map_y != home_y or bought = true{exit}
draw_timer += 0.04
if draw_timer = 3600{draw_timer = 0}
yoff =  1*sin(draw_timer)
draw_sprite_ext(sprite_index,image_index,x,y,0+yoff,1,0,-1,1)