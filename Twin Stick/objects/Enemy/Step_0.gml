if GM.game_paused = true{exit}

if enemy_id = -1{
enemy_list = GM.enemy_list
enemy_object = enemy_list[irandom_range(0,array_length(enemy_list)-1)]
instance_create_depth(x,y,depth,enemy_object)
instance_destroy();exit
}