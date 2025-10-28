direction = image_angle
speed = bullet_speed

if hurts_player = true && place_meeting(x,y,Player){
var_temp = instance_nearest(x,y,Player)
var_temp.hp -= 1;instance_destroy();exit
}

if hurts_enemy = true && place_meeting(x,y,Enemy){

if array_contains(contact_list,instance_place(x,y,Enemy)) = false{
array_push(contact_list,instance_place(x,y,Enemy))
var_enemy =  instance_place(x,y,Enemy)
var_enemy.hp -= damage
if var_enemy.hp <= 0{creator.money += 50}
var_enemy.hit_stun = 2
penetration -= 1
creator.money += 10

repeat(4){
particle = instance_create_depth(x,y,depth-100,ParticleEffect)
particle.hsp = random_range(-12,12)
particle.vsp = random_range(-18,4)}
}

if penetration <= 0{
instance_destroy()}
}