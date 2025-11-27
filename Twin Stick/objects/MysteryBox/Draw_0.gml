if GM.map_x != home_x or GM.map_y != home_y{
x = -3000
exit
}
else{x = xstart}

if !instance_exists(block){
block = instance_create_depth(x,y,depth+1,Collision)
block.image_xscale = 5
block.image_yscale = 2
}

draw_self()
if activate_box = true{
activate_box = false
box_toggle_timer = 1
box_toggle_length = 1
box_open = true
box_timer = irandom_range(150,210)
}

if box_open = true{

if box_timer > 0{

box_toggle_timer -= 1
if box_toggle_timer <= 0{
box_toggle_timer = box_toggle_length
box_toggle_length+=0.25

weapon_sprite = irandom_range(0,array_length(box_list)-1)
weapon_sprite = box_list[weapon_sprite]
var_x = x+(sprite_width/2)-(sprite_get_width(weapon_sprite)/2)+sprite_get_xoffset(weapon_sprite)
var_y = y+(sprite_height/2)-(sprite_get_height(weapon_sprite)/2)+sprite_get_yoffset(weapon_sprite)
}
box_timer -= 1
if box_timer = 0{box_timer_take_weapon = 360}
}

draw_sprite(weapon_sprite,0,var_x,var_y)

}

if box_timer_take_weapon > 0{box_timer_take_weapon -= 1}
if box_timer_take_weapon = 0 && box_timer = 0{box_open = false}