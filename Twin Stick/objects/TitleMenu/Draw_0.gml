draw_set_halign(fa_left)
draw_set_font(f_Main)
draw_sprite_ext(s_BlackPixel,0,0,0,screen_width,screen_height,0,-1,1)
if sub_menu = 0{
draw_text(screen_width/2,200,"Title Screen")}

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

draw_sprite(s_MenuCursor,0,32,80)
vrp = 0
repeat(array_length(menu)){
weapon_sprite = menu[vrp]
var_x = 64+sprite_get_xoffset(weapon_sprite)
var_y = 80+(80*vrp)-(sprite_get_height(weapon_sprite)/2)+sprite_get_yoffset(weapon_sprite)-(menu_cursor*80)
draw_sprite(weapon_sprite,0,var_x,var_y)
vrp += 1}

text_gap = font_get_size(f_Main)*1.5
draw_text(640,20,string(weapon_name))
draw_text(640,20+(text_gap*1),"Max Ammo"+string(ammo_inmag_max)+"/"+string(ammo_reserve_max))
draw_text(640,20+(text_gap*2),"Action type:"+string(sprite_get_name(action_type)))
draw_text(640,20+(text_gap*3),"Firing Speed:"+string((60/shoot_delay)*60))
draw_text(640,20+(text_gap*4),"Damage:"+string(weapon_damage))
draw_text(640,20+(text_gap*5),"Penetration:"+string(penetration))
draw_text(640,20+(text_gap*6),"Recoil:"+string(abs(gun_recoil)))
draw_text(640,20+(text_gap*7),"Knockback:"+string(knockback))
draw_text(640,20+(text_gap*8),"Weight:"+string(weapon_weight))
//Unshown Stats
//bullet_knockback

}

if sub_menu = "Items"{

draw_sprite(s_MenuCursor,0,32,80)
vrp = 0
repeat(array_length(menu)){
weapon_sprite = menu[vrp]
var_x = 64+sprite_get_xoffset(weapon_sprite)
var_y = 80+(64*vrp)-(sprite_get_height(weapon_sprite)/2)+sprite_get_yoffset(weapon_sprite)-(menu_cursor*64)
draw_sprite(weapon_sprite,0,var_x,var_y)
vrp += 1}

text_gap = font_get_size(f_Main)*1.5
draw_text(640,20,string(item_name))
draw_text(640,20+(text_gap*1),"Cost"+string(cost))
draw_text(640,20+(text_gap*2),string(description))
//Unshown Stats
//bullet_knockback

}