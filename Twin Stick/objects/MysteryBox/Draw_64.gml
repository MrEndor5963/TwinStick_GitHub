font = f_Main

if display_text = true{
draw_set_aligns(fa_center,fa_middle)
if box_open = false{var_text = "Press A to open Mystery Box [Cost 950]"}
if box_open = true && box_timer > 0{var_text = ""}
if box_open = true && box_timer = 0{script_execute_wpn(weapon_sprite)}
if box_open = true && box_timer = 0{var_text = "Press A to take "+string(weapon_name)}
draw_text(x+(sprite_width/2),y-font_get_size(font),var_text)
}
display_text = false