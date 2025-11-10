draw_set_aligns(fa_center,fa_middle);draw_set_font(f_Main);draw_set_color(c_white)
var_xx = 0
repeat(ds_grid_width(select_menu)){
var_yy = 0
repeat(ds_grid_height(select_menu)){
var_sprite = asset_get_index("s_"+string(ds_grid_get(select_menu,var_xx,var_yy))+"D")
draw_sprite(var_sprite,0,(var_xx*96)+640,(var_yy*96)+600)

var_yy += 1}
var_xx += 1}

var_y = 200


var_repeat = 0
repeat(4){
var_x = (screen_width/5)*(var_repeat+1)
if cursor_control[var_repeat] = -1{
draw_text(var_x,var_y,string("Press A to Start"))
}
else{
draw_text(var_x,var_y,ds_grid_get(select_menu,cursor_c[var_repeat],cursor_r[var_repeat]))
if player_selected[var_repeat] != 0{
if player_ready[var_repeat] = false{draw_text(var_x,var_y+20,"Not Ready")}
else{draw_text(var_x,var_y+20,"Ready")}
}
}

var_repeat += 1
}