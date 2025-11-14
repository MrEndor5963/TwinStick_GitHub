draw_set_color(c_white)

//else{draw_color = c_red;portrait_sprite = s_JunePortrait}

draw_set_font(f_Main)
screen_width = 1280
screen_height = 720
draw_set_alpha(1)
if player_number = 0{
draw_sprite(portrait_sprite,0,0+92,0+48)
draw_set_aligns(fa_center,fa_middle)

draw_text_with_outline(0+48,0+120,string(hp)+"/"+string(hp_max),draw_color)
draw_sprite(s_HPBarOutline,0,0+48,0+288)
draw_hp = clamp(1/(hp_max/hp),0,1)
draw_sprite_ext(s_HPBar,0,0+48,0+288,1,-draw_hp,0,draw_color,1)

var_x = 0+288-(sprite_get_width(weapon_sprite)/2)+sprite_get_xoffset(weapon_sprite)
var_y = 0+48-(sprite_get_height(weapon_sprite)/2)+sprite_get_yoffset(weapon_sprite)
draw_sprite(weapon_sprite,0,var_x,var_y)

draw_sprite(s_WeaponNameBox,0,192,48)
draw_text_with_outline(0+288,0+24,weapon_name,draw_color)
draw_text_with_outline(0+288,0+72,string(ammo_inmag)+"/"+string(ammo_reserve),draw_color)

draw_set_halign(fa_left)

draw_text_with_outline(0+432,0+48,"$"+string(money),draw_color)


vrp = 0
repeat(array_length(point_que)){
if point_draw_timer[vrp] = 0{
money += point_que[vrp]
direction = random_range(280,390)
speed = 2.8
array_insert(point_draw_dir_x,vrp,hspeed)
array_insert(point_draw_dir_y,vrp,vspeed)
speed = 0
}	

var_x = 0+432+72+(point_draw_dir_x[vrp]*point_draw_timer[vrp])
var_y = 0+48+(point_draw_dir_y[vrp]*point_draw_timer[vrp])

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
}

if player_number = 1{
draw_sprite(portrait_sprite,0,screen_width-92,0+48)
draw_set_aligns(fa_center,fa_middle)
draw_text(screen_width-48,0+120,string(hp)+"/"+string(hp_max))
draw_sprite(s_HPBarOutline,0,screen_width-48,0+288)
draw_hp = clamp(1/(hp_max/hp),0,1)
draw_sprite_ext(s_HPBar,0,screen_width-48,0+288,1,-draw_hp,0,draw_color,1)

var_x = screen_width-288-(sprite_get_width(weapon_sprite)/2)+sprite_get_xoffset(weapon_sprite)
var_y = 0+48-(sprite_get_height(weapon_sprite)/2)+sprite_get_yoffset(weapon_sprite)
draw_sprite(weapon_sprite,0,var_x,var_y)
draw_sprite(s_WeaponNameBox,0,192,48)
draw_text(screen_width-288,0+24,weapon_name)
draw_text(screen_width-288,0+72,string(ammo_inmag)+"/"+string(ammo_reserve))

draw_set_halign(fa_right)
draw_text(screen_width-432,0+48,"$"+string(money))
}

if player_number = 2{
draw_sprite(portrait_sprite,0,0+92,screen_height-48)
draw_set_aligns(fa_center,fa_middle)
draw_text(0+48,screen_height-120,string(hp)+"/"+string(hp_max))
draw_sprite(s_HPBarOutline,0,0+48,screen_height-288+144)
draw_hp = clamp(1/(hp_max/hp),0,1)
draw_sprite_ext(s_HPBar,0,0+48,screen_height-288+144,1,-draw_hp,0,draw_color,1)

var_x = 0+288-(sprite_get_width(weapon_sprite)/2)+sprite_get_xoffset(weapon_sprite)
var_y = screen_height-48-(sprite_get_height(weapon_sprite)/2)+sprite_get_yoffset(weapon_sprite)
draw_sprite(weapon_sprite,0,var_x,var_y)
draw_sprite(s_WeaponNameBox,0,192,48)
draw_text(0+288,screen_height-24,weapon_name)
draw_text(0+288,screen_height-72,string(ammo_inmag)+"/"+string(ammo_reserve))

draw_set_halign(fa_left)
draw_text(0+432,screen_height-48,"$"+string(money))
}

if player_number = 3{
draw_sprite(portrait_sprite,0,screen_width-92,screen_height-48)
draw_set_aligns(fa_center,fa_middle)
draw_text(screen_width-48,screen_height-120,string(hp)+"/"+string(hp_max))
draw_sprite(s_HPBarOutline,0,screen_width-48,screen_height-288+144)
draw_hp = clamp(1/(hp_max/hp),0,1)
draw_sprite_ext(s_HPBar,0,screen_width-48,screen_height-288+144,1,-draw_hp,0,draw_color,1)

var_x = screen_width-288-(sprite_get_width(weapon_sprite)/2)+sprite_get_xoffset(weapon_sprite)
var_y = screen_height-48-(sprite_get_height(weapon_sprite)/2)+sprite_get_yoffset(weapon_sprite)
draw_sprite(weapon_sprite,0,var_x,var_y)
draw_sprite(s_WeaponNameBox,0,192,48)
draw_text(screen_width-288,screen_height-24,weapon_name)
draw_text(screen_width-288,screen_height-72,string(ammo_inmag)+"/"+string(ammo_reserve))

draw_set_halign(fa_right)
draw_text(screen_width-432,screen_height-48,"$"+string(money))
}

if hp <= 0{draw_sprite(s_ReviveIcon,0,x,y-64)}

if reload_timer > 0{
draw_reload = clamp(1/(reload_time/reload_timer),0,1)
draw_sprite_ext(s_ReloadBar,0,x-48,y-(sprite_height/2)-20,draw_reload,1,0,draw_color,1)
draw_sprite(s_ReloadBarOutline,0,x,y-(sprite_height/2)-20)
}

if revive_timer > 0{
draw_revive = clamp(1/(revive_time/revive_timer),0,1)
draw_sprite_ext(s_ReloadBar,0,x-48,y-(sprite_height/2)-20,draw_revive,1,0,draw_color,1)
draw_sprite(s_ReloadBarOutline,0,x,y-(sprite_height/2)-20)
if revive_timer = revive_time{hp += 1;hit_stun = 120;revive_timer = 0}
}

/*
draw_set_aligns(fa_center,fa_middle)
var_xx = 0
repeat(ds_grid_width(pathfinding_grid)){
var_yy = 0
repeat(ds_grid_height(pathfinding_grid)){
draw_text((var_xx*48)+24,(var_yy*48)+24,string(ds_grid_get(pathfinding_grid,var_xx,var_yy)))
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