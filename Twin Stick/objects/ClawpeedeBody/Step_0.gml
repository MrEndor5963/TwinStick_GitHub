if GM.game_paused = true or GM.game_over = true{exit}

node_x = x div 48
node_y = y div 48
if spawn_timer > 0{
spawn_timer -= 1;exit
}

depth = -y
if hit_stun > 0{hit_stun -= 1}

if instance_exists(Clawpeede){
x = creator.record_x[record]
y = creator.record_y[record]
image_xscale = creator.record_xscale[record]
image_angle = creator.record_angle[record]}
else{hp = 0}

if hp <= 0{
instance_destroy(hitbox);instance_destroy();Player.kills += 1;

blood_splatter()
exit
}



corner_cutting()


if hsp_knockback != 0{hsp_knockback *= 0.2};if hsp_knockback < 0.1 && hsp_knockback > -0.1{hsp_knockback = 0}
if vsp_knockback != 0{vsp_knockback *= 0.2};if vsp_knockback < 0.1 && vsp_knockback > -0.1{vsp_knockback = 0}


move_hitbox()