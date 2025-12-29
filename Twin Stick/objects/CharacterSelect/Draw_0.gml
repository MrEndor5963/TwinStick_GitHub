draw_set_aligns(fa_center,fa_middle);draw_set_font(f_Main);draw_set_color(c_white)
var_xx = 0
repeat(ds_grid_width(select_menu)){
var_yy = 0
repeat(ds_grid_height(select_menu)){
var_sprite = asset_get_index("s_"+string(ds_grid_get(select_menu,var_xx,var_yy))+"D")
//draw_sprite(var_sprite,0,(var_xx*96)+640,(var_yy*96)+600)

var_yy += 1}
var_xx += 1}

var_y = 200


vrp = 0
repeat(4){
if vrp = 0{var_x = 0;var_y = 0}
if vrp = 1{var_x = screen_width/2;var_y = 0}
if vrp = 2{var_x = 0;var_y = screen_height/2}
if vrp = 3{var_x = screen_width/2;var_y = screen_height/2}
var_x = var_x+320
var_y = var_y+50

if cursor_control[vrp] = -1{
draw_text(var_x,var_y,string("Press A"))
}
else{
draw_text(var_x,var_y,ds_grid_get(select_menu,cursor_c[vrp],cursor_r[vrp]))
var_sprite = asset_get_index("s_"+string(ds_grid_get(select_menu,cursor_c[vrp],cursor_r[vrp]))+"D")
draw_sprite(var_sprite,0,var_x,var_y+60)
if player_selected[vrp] != 0{
if player_ready[vrp] = false{draw_text(var_x,var_y+20,"Not Ready")}
else{draw_text(var_x,var_y+20,"Ready")}
}
}

vrp += 1
}

if start_timer < 300{
draw_set_aligns(fa_center,fa_middle)
draw_text(640,360,(start_timer div 60)+1)}