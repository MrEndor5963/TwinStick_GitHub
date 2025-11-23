home_x = GM.map_x
home_y = GM.map_y
if array_contains(GM.map_visited,x_plus_y(home_x,home_y)){
instance_destroy();exit
}

items_in_shop = 3

vrp = 0
repeat(items_in_shop){
shop_item_bought[vrp] = false
shop_item_name[vrp] = array_get(GM.item_list,irandom_range(0,array_length(GM.item_list)-1))

vrp += 1}