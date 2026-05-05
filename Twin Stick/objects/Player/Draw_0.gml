if spawned = false or room = r_FloorTransition{exit}
if GM.next_room = -1{
if hit_stun % 5 == 1{}else{
draw_self()

//if recoil != 0{gun_angle = aim_direction+recoil}
//else{gun_angle = aim_direction+recoil_cooldown}

/*
if melee_equipped = false && hp > 0{
direction = gun_angle;speed = 1

draw_sprite_ext(weapon_draw_sprite,0,x,y,1,weapon_yscale,gun_angle,-1,1)

if slide_sprite != s_0{

slide_offset = slide_distance/(shoot_delay/shoot_timer)
draw_sprite_ext(slide_sprite,0,x+(slide_offset*hspeed),y+(slide_offset*vspeed),1,weapon_yscale,gun_angle,-1,1)
}

if pump_sprite != s_0{
pump_offset = 0
draw_sprite_ext(pump_sprite,0,x+(pump_offset*hspeed),y+(pump_offset*vspeed),1,weapon_yscale,gun_angle,-1,1)
}

speed = 0}
*/


}


}

depth_saved = depth
depth = -12000



#region Player UI{
draw_set_color(c_white)

//else{draw_color = c_red;portrait_sprite = s_JunePortrait}

draw_set_font(f_Main)
screen_width = 1280
screen_height = 720
draw_set_alpha(1)


if player_number = 0{
draw_gui_origin_x = 0
draw_gui_origin_y = 0
pon_x = 1
pon_y = 1
portrait_x_scale = 1
}

if player_number = 1{
draw_gui_origin_x = screen_width
draw_gui_origin_y = 0
pon_x = -1
pon_y = 1
portrait_x_scale = -1
}

if player_number = 2{
draw_gui_origin_x = 0
draw_gui_origin_y = screen_height
pon_x = 1
pon_y = -1
portrait_x_scale = 1
}

if player_number = 3{
draw_gui_origin_x = screen_width
draw_gui_origin_y = screen_height
pon_x = -1
pon_y = -1
portrait_x_scale = -1
}

draw_origin_x = draw_gui_origin_x+GM.cam_x
draw_origin_y = draw_gui_origin_y+GM.cam_y

//item draw
item_draw_y += 0.04
if item_draw_y = 3600{item_draw_y = 0}
item_rows = (array_length(item_list)-1) div 4

vrp = 0
repeat(array_length(item_list)){
item_draw_y_offset = 4*sin(item_draw_y+vrp)
row_offset = vrp div 4
if item_rows = 0{
draw_sprite_ext(item_list[vrp],0,
draw_origin_x+((288+36)*pon_x)+(72*vrp)-(row_offset*288),draw_origin_y+(36*pon_y)+item_draw_y_offset+((row_offset*36)),1,1,0,-1,1)}
else{
draw_sprite_ext(item_list[vrp],0,
draw_origin_x+((288+36)*pon_x)+(72*vrp)-(row_offset*288),draw_origin_y+(36*pon_y)+item_draw_y_offset+((row_offset*36)/item_rows),1,1,0,-1,1)
}
vrp += 1}

//draw_set_aligns(fa_center,fa_middle)
//var_x = draw_origin_x+(216*pon_x)-(sprite_get_width(weapon_id)/2)+sprite_get_xoffset(weapon_id)
//var_y = draw_origin_y+(48*pon_y)-(sprite_get_height(weapon_id)/2)+sprite_get_yoffset(weapon_id)
//draw_sprite(weapon_id,0,var_x,var_y)

//draw_text_with_outline(draw_origin_x+(216*pon_x),draw_origin_y+(24*pon_y),weapon_name,draw_color)
//if jam_timer > 0{
//draw_text_with_outline(draw_origin_x+(216*pon_x),draw_origin_y+(48*pon_y),"Jammed",draw_color)
//}
//draw_text_with_outline(draw_origin_x+(216*pon_x),draw_origin_y+(72*pon_y),string(ammo_inmag)+"/"+string(ammo_reserve),draw_color)

if player_number = 0 or player_number = 2{draw_set_halign(fa_left)};else{draw_set_halign(fa_right)}

var_x = draw_origin_x+(96*pon_x)+(sprite_get_xoffset(weapon_id)*pon_x)
var_y = draw_origin_y+(48*pon_y)-(sprite_get_height(weapon_id)/2)+sprite_get_yoffset(weapon_id)
draw_sprite_ext(weapon_id,0,var_x,var_y,pon_x,1,0,-1,1)

draw_text_with_outline(draw_origin_x+(96*pon_x),draw_origin_y+(24*pon_y),weapon_name,draw_color)
if p_weapon.jam_timer > 0{
draw_text_with_outline(draw_origin_x+(96*pon_x),draw_origin_y+(48*pon_y),"Jammed",draw_color)
}

if ammo_inmag != -1{
draw_text_with_outline(draw_origin_x+(96*pon_x),draw_origin_y+(72*pon_y),string(ammo_inmag)+"/"+string(ammo_reserve),draw_color)}

draw_sprite_ext(portrait_sprite,0,draw_origin_x+(48*pon_x),draw_origin_y+(48*pon_y),portrait_x_scale,1,0,-1,1)

//draw hp
draw_hp = clamp(1/(hp_max/hp),0,1)
draw_circular_Fill_HP(draw_origin_x+(48*pon_x),draw_origin_y+(pon_y*192),hp,hp_max,draw_color,39,1)
draw_sprite(s_HPBarOutline,0,draw_origin_x+(48*pon_x),draw_origin_y+(pon_y*192))

draw_set_aligns(fa_center,fa_middle)
draw_text_with_outline(draw_origin_x+(48*pon_x),draw_origin_y+(192*pon_y),string(hp)+"/"+string(hp_max),draw_color)


#region point draw
//Point draw
if player_number = 0 or player_number = 2{draw_set_halign(fa_left)};else{draw_set_halign(fa_right)}
draw_text_with_outline(draw_origin_x+(0*pon_x),draw_origin_y+(122*pon_y),"$"+string(money),draw_color)

vrp = 0
repeat(array_length(point_que)){
if point_draw_timer[vrp] = 0{
money += point_que[vrp]
direction = random_range(330,390)
speed = 2.8
array_insert(point_draw_dir_x,vrp,hspeed)
array_insert(point_draw_dir_y,vrp,vspeed)
speed = 0
}

var_x = draw_origin_x+(72*pon_x)+((point_draw_dir_x[vrp]*point_draw_timer[vrp])*pon_x)
var_y = draw_origin_y+(122*pon_y)+(point_draw_dir_y[vrp]*point_draw_timer[vrp])

draw_set_alpha((25-point_draw_timer[vrp])/5)

if point_que[vrp] >= 0{
draw_text(var_x,var_y,"+"+string(point_que[vrp]))}
else{
draw_text(var_x,var_y,point_que[vrp])}

point_draw_timer[vrp] += 1
if point_draw_timer[vrp] = 25{
array_delete(point_que,vrp,1)
array_delete(point_draw_timer,vrp,1)
array_delete(point_draw_dir_x,vrp,1)
array_delete(point_draw_dir_y,vrp,1)
vrp -= 1
}
vrp += 1}


#endregion end of point draw

if hp <= 0{draw_sprite(s_ReviveIcon,0,x,y-64)}
draw_bar_x = x-(sprite_get_width(s_ReloadBar)/2)

if revive_timer > 0{
draw_revive = clamp(1/(revive_time/revive_timer),0,1)
draw_sprite_ext(s_ReloadBar,0,draw_bar_x,y-(sprite_height/2)-20,-draw_revive,-1,0,draw_color,1)
draw_sprite(s_ReloadBarOutline,0,draw_bar_x,y-(sprite_height/2)-20)
if revive_timer = revive_time{hp += 2;hit_stun = 120;revive_timer = 0}
}

depth = depth_saved
#endregion Player UI End

//draw_text(200,120,shoot_timer)
/*
draw_set_aligns(fa_center,fa_middle)
var_xx = 0
repeat(ds_grid_width(pathfinding_grid)){
var_yy = 0
repeat(ds_grid_height(pathfinding_grid)){
draw_text((var_xx*64)+32,(var_yy*64)+32,string(ds_grid_get(pathfinding_grid,var_xx,var_yy)))
var_yy += 1}
var_xx += 1}


/*
//Player1
draw_hp = clamp(1/(3/hp),0,2.25)
draw_sprite_ext(s_HealthBar,0,64+(224*player_number),64,draw_hp,1,0,draw_color,1)
draw_set_halign(fa_right);draw_set_valign(fa_bottom)
draw_text(64+160+(224*player_number),64+6,kills)
draw_sprite_ext(portrait_sprite,0,64+(224*player_number),64,2,2,0,-1,1)

draw_set_halign(fa_left)