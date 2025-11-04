if hit_stun != 0{creator.hit_stun = hit_stun;hit_stun = 0}

if spawn_enemy = true{
enemy_list = GM.enemy_list
enemy_id = enemy_list[irandom_range(0,array_length(enemy_list)-1)]
instance_create_depth(x,y,depth,enemy_id)
instance_destroy()
}