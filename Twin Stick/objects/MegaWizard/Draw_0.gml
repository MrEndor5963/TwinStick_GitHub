draw_enemy()
depth_saved = depth
depth =  -9999
draw_color = c_white
draw_hp = clamp(1/(hp_max/hp),0,1)
glitch_intensity = 3-((hp/hp_max)*3)

draw_sprite_ext(s_HPBarBossBackdrop,0,(GM.screen_width/2)+GM.cam_x,672+GM.cam_y,1,1,0,c_black,1)
draw_sprite_ext(s_HPBarBoss,0,(GM.screen_width/2)+GM.cam_x-(sprite_get_width(s_HPBarOutlineBoss)/2),672+GM.cam_y,draw_hp,1,0,draw_color,1)
depth = depth_saved
