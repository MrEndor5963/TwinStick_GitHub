if GM.map_x != home_x or GM.map_y != home_y{exit}
depth = -y-(sprite_height/2)

draw_timer += 0.03;if draw_timer = 3600{draw_timer = 0}
draw_timer2 += 0.04;if draw_timer2 = 3600{draw_timer2 = 0}
yoff =  16*sin(draw_timer)
yscale_off =  1*sin(draw_timer2)
y = ystart-10-yoff
draw_sprite_ext(sprite_index,image_index,x,y,0+yscale_off,1,0,-1,image_alpha)
if bought = true{instance_destroy()}