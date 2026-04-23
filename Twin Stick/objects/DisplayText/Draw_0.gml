
draw_set_alpha(1-(glitch_intensity/3))

text_width = string_width(text_string)
if x < 0{x = 0};
if x+sprite_width > GM.screen_width{x += (GM.screen_width-(x+sprite_width))}
if y+sprite_height > GM.screen_height{y += (GM.screen_height-(y+sprite_height))}

draw_set_aligns(fa_left,fa_top)

image_alpha = 0.7
draw_self()

image_alpha = 1
//if textbox = false{
//draw_set_color(c_black)
//draw_text(x-2,y,text_string)
//draw_text(x+2,y,text_string)
//draw_text(x,y-2,text_string)
//draw_text(x,y+2,text_string)
draw_set_color(c_white)
draw_text(x+(padding*2),y,text_string)

text_gap = font_get_size(f_Main)*1.5

image_xscale = (text_width+(padding*4))
if description != -1{
type(x+(padding*2),y+text_gap,description,string_length(description),text_width)
image_yscale = ((text_rows+1)*(text_gap))}
else{image_yscale = text_gap}

draw_text(10,10,text_rows)

draw_set_alpha(1)