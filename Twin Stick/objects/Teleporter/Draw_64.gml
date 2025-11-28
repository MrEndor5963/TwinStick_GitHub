if teleport_timer > 0{
draw_revive = clamp(1/(teleport_time/teleport_timer),0,1)
draw_sprite_ext(s_ReloadBar,0,x-48,y-(sprite_height/2)-20,-draw_revive,-1,0,draw_color,1)
draw_sprite(s_ReloadBarOutline,0,x,y-(sprite_height/2)-20)
}

if teleport_timer >= teleport_time{GM.next_floor = true}