draw_self()
if teleport_timer > 0{
draw_revive = clamp(1/(teleport_time/teleport_timer),0,1)
draw_sprite_ext(s_ReloadBar,0,x,y-(sprite_height/2)-20,-draw_revive,-1,0,draw_color,1)
draw_sprite(s_ReloadBarOutline,0,x,y-(sprite_height/2)-20)
}

if teleport_timer >= teleport_time{GM.glitch_intensity = 1;GM.next_floor = true}

font = f_Main;draw_set_color(c_white)

if player_id != -1{
var_text = "Hold "+string(player_id.interact_glyph)+" to teleport"
if !instance_exists(display_text){
display_text = instance_create_depth(x-(string_width(display_text)/2),y-(font_get_size(font)),-room_height-100,DisplayText)
display_text.text_string = var_text
display_text.creator = id
display_text.despawn = false
}
}
else{if instance_exists(display_text){display_text.despawn = true}}

player_id = -1