font = f_Main
draw_set_color(c_white)

if display_text = true{
draw_set_aligns(fa_center,fa_middle)
var_text = "Key Required"
draw_text(x+(sprite_width/2),y-font_get_size(font),var_text)
}