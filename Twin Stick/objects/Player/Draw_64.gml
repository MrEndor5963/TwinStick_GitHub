display_set_gui_size(1920,1080)
if player_number = 0{draw_color = c_green;portrait_sprite = s_HazelPortrait}
else{draw_color = c_red;portrait_sprite = s_JunePortrait}

draw_set_font(f_1)
//Player1
draw_hp = clamp(1/(3/hp),0,2.25)
draw_sprite_ext(s_HealthBar,0,64+(224*player_number),64,draw_hp,1,0,draw_color,1)
draw_set_halign(fa_right);draw_set_valign(fa_bottom)
draw_text(64+160+(224*player_number),64+6,kills)
draw_sprite_ext(portrait_sprite,0,64+(224*player_number),64,2,2,0,-1,1)