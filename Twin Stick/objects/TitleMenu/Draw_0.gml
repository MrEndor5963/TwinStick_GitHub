draw_set_halign(fa_left)
draw_set_font(f_Main)
draw_sprite_ext(s_BlackPixel,0,0,0,screen_width,screen_height,0,-1,1)
draw_text(screen_width/2,200,"Title Screen")

if sub_menu = 0 or sub_menu = "Collection"{
var_x = (screen_width/2)-32
var_y = 240+(menu_cursor*(font_get_size(f_Main)*1.5))
draw_sprite(s_MenuCursor,0,var_x,var_y)
var_x = (screen_width/2)+32+(string_width(menu[menu_cursor]))
draw_sprite_ext(s_MenuCursor,0,var_x,var_y,-1,1,0,-1,1)
vrp = 0
repeat(array_length(menu)){
draw_text(screen_width/2,240+(vrp*(font_get_size(f_Main)*1.5)),menu[vrp])
vrp += 1}
}


if sub_menu = "Weaponry"{
vrp = 0
repeat(array_length(menu)){
weapon_sprite = menu[vrp]
var_x = 0+sprite_get_xoffset(weapon_sprite)
var_y = 80+(80*vrp)-(sprite_get_height(weapon_sprite)/2)+sprite_get_yoffset(weapon_sprite)-(menu_cursor*80)
draw_sprite(weapon_sprite,0,var_x,var_y)
vrp += 1}
}