penetration = 100

image_angle = creator.aim_direction
if image_angle > 90 && image_angle < 270{image_yscale = -1}else{image_yscale = 1}

if attacking = false{
angleoff *= 0.8
xoff*=0.8
yoff*=0.8
contact_list = []
}

if attacking = true{
if attack_timer = -1{attack_timer = 12}
angleoff = (-25*(3-attack_timer))*image_yscale

direction = image_angle+angleoff
speed = 7
xoff = hspeed*(12-attack_timer)
yoff = vspeed*(12-attack_timer)
speed = 0
if attack_timer = 0{attacking = false}
sprite_index = s_KnifeAttack
}
else{sprite_index = s_Knife}

if attack_timer > -1{attack_timer -= 1}

image_angle = image_angle+angleoff
x = creator.x+xoff
y =  creator.y+yoff