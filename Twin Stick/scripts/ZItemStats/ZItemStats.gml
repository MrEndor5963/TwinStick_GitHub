function script_execute_item(arg_item_sprite){
var_string = string_delete(sprite_get_name(arg_item_sprite),1,5)
script_execute(asset_get_index("item_"+string(var_string)))
}

function reference_items(){reference_items()
item_Heart()
item_HPMax()
item_Move()
item_WeaponSlots()
}

function item_Heart(){
item_name = "HP Max Up"
cost = 1000
description_text = "Heals 1 HP"
if object_index = Player && new_item != -1{
hp += 1;if hp > hp_max{hp = hp_max}
}
}

function item_HPMax(){
item_name = "HP Max Up"
cost = 1500
description_text = "Max HP +1 and Heals 1 HP"
if object_index = Player && new_item != -1{
hp_max += 1;hp += 1
}
}

function item_Move(){
item_name = "Move Up"
cost = 1200
description_text = "Increases move spd by a bit"
if object_index = Player && new_item != -1{
mov_spd += 1
}
}

function item_WeaponSlots(){
item_name = "Weapon Slots Up"
cost = 6000
description_text = "Carry an extra gun"
if object_index = Player && new_item != -1{
weapon_slots += 1
}
}