if GM.game_paused = true{exit}
vsp = vsp+0.8
x = x+hsp
y = y+vsp

timer -= 1
if timer = 0{instance_destroy()}