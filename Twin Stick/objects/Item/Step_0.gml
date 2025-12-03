if spawned = false{

script_execute_item(sprite_index)
}
if array_contains(GM.items_bought,sprite_index) = true{instance_destroy()}