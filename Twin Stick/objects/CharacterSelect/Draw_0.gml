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
if cursor_control[0] = -1{
var_x = (screen_width/5)
draw_text(var_x,var_y,string("Press A to Start"))
}

if cursor_control[1] = -1{
var_x = (screen_width/5)*2
draw_text(var_x,var_y,string("Press A to Start"))
}

if cursor_control[2] = -1{
var_x = (screen_width/5)*3
draw_text(var_x,var_y,string("Press A to Start"))
}

if cursor_control[3] = -1{
var_x = (screen_width/5)*4
draw_text(var_x,var_y,string("Press A to Start"))
}