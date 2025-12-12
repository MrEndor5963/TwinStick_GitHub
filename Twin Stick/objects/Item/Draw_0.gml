draw_timer += 0.04
if draw_timer = 3600{draw_timer = 0}
yoff =  1*sin(draw_timer)
draw_sprite_ext(sprite_index,image_index,x,y,0+yoff,1,0,-1,1)