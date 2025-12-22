font = f_Main;draw_set_color(c_white)

if display_text = true && place_meeting(x,y,Player){
draw_set_aligns(fa_center,fa_middle)
if item_is_free = true{
var_text = "Press A to take "+string(item_name)}
else{
var_text = "Press A to Buy "+string(item_name)+" [Cost "+string(cost)+"]"}

draw_text(x+(sprite_width/2),y-(font_get_size(font)*2),var_text)
draw_text(x+(sprite_width/2),y-font_get_size(font),description)
}
display_text = false