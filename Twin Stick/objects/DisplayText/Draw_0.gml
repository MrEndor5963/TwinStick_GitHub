draw_set_alpha(1-(glitch_intensity/3))

text_width = string_width(text_string)
if x < 0{x = 0};
if x+sprite_width > room_width{x += (room_width-(x+sprite_width))}
if y+sprite_height > room_height{y += (room_height-(y+sprite_height))}

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

if rarity = -1{draw_text(x+(padding*2),y,text_string)}

if rarity != -1{
text_x = x+(padding*2) 
draw_text(text_x,y,text_part_1)
text_x += string_width(text_part_1)
draw_set_color(GM.rarity_color[rarity])
draw_text(text_x,y,text_part_2)
text_x += string_width(text_part_2)
draw_set_color(c_white)
draw_text(text_x,y,text_part_3)

}

text_gap = font_get_size(f_Main)*1.5

image_xscale = (text_width+(padding*4))
if description != -1{
type(x+(padding*2),y+text_gap,description,string_length(description),text_width)
image_yscale = ((text_rows+1)*(text_gap))}
else{image_yscale = text_gap}

//draw_text(10,10,text_rows)//debug

draw_set_alpha(1)