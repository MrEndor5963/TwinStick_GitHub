if GM.map_x != home_x or GM.map_y != home_y{x = -3000;exit}else{x = xstart}
vrp = 0
repeat(items_in_shop){
var_item = instance_create_depth((1280/(items_in_shop+1))*(vrp+1),336,depth,Item)
var_item.sprite_index = shop_item[vrp]
vrp += 1
}