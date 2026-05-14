instance_destroy()
home_x = GM.map_x
home_y = GM.map_y
if array_contains(GM.map_visited,x_plus_y(home_x,home_y)){exit}

if room != r_GunShop && irandom_range(1,4) != 1{exit}
weapon_list = array_get(GM.weapon_tiers,(irandom_range(0,array_length(GM.weapon_tiers)-1)))
weapon_list = variable_instance_get(GM,"tier_"+string(weapon_list)+"_gun_list")
weapon_id = array_get(weapon_list,(irandom_range(0,array_length(weapon_list)-1)))

var _wb = instance_create_depth(x,y,depth,WallBuy)
_wb.image_angle = image_angle
_wb.weapon_id = weapon_id
