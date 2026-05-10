if GM.draw_damage_numbers = false{instance_destroy();exit}
draw_set_alpha(1-(glitch_intensity/3))

if x < 0{x = 0};
if x+sprite_width > room_width{x += (room_width-(x+sprite_width))}
y = ystart-timer*2
//if y+sprite_height > room_height{y += (room_height-(y+sprite_height))}

draw_set_aligns(fa_left,fa_top)

image_alpha = 1
//if textbox = false{
//draw_set_color(c_black)
//draw_text(x-2,y,text_string)
//draw_text(x+2,y,text_string)
//draw_text(x,y-2,text_string)
//draw_text(x,y+2,text_string)
draw_set_color(c_white)
draw_text(x,y,text_string)

if GM.game_paused = false{
timer -= 1 if timer = 0{instance_destroy();exit}}