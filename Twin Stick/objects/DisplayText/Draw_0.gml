draw_set_aligns(fa_center,fa_middle)
if textbox = true{
image_alpha = 0.7
draw_self()
}
image_alpha = 1
if textbox = false{
draw_set_color(c_black)
draw_text(x-2,y,text_string)
draw_text(x+2,y,text_string)
draw_text(x,y-2,text_string)
draw_text(x,y+2,text_string)
draw_set_color(c_white)
draw_text(x,y,text_string)}
else{
text_gap = font_get_size(f_Main)*1.5
create_text_scroll_variables()
draw_set_color(c_white)
draw_set_valign(fa_top)
image_xscale = text_width/48
type(x+(padding*2),y,text_string,10000,text_width)
image_yscale = text_rows*1.2
}