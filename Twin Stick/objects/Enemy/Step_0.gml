if GM.game_paused = true{exit}

if hit_stun != 0{creator.hit_stun = hit_stun;hit_stun = 0}

if spawn_enemy = true{
enemy_list = GM.enemy_list
enemy_id = enemy_list[irandom_range(0,array_length(enemy_list)-1)]
instance_create_depth(x,y,depth,enemy_id)
instance_destroy();exit
}

enemy_damage_check()

while array_length(contact_list) > 100{array_pop(contact_list)}