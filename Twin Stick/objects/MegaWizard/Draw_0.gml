if hit_stun > 0{
shader_set(sh_HitFlash)}
draw_self()
shader_reset()
depth_saved = depth
depth =  -9999
draw_color = c_white
draw_sprite(s_HPBarOutlineBoss,0,640,672)
draw_hp = clamp(1/(hp_max/hitbox.hp),0,1)
draw_sprite_ext(s_HPBarBoss,0,640,672,draw_hp,1,0,draw_color,1)
depth = depth_saved
