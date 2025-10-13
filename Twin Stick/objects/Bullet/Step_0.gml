direction = image_angle
speed = bullet_speed

if place_meeting(x,y,Enemy){

if array_contains(contact_list,instance_place(x,y,Enemy)) = false{
array_push(contact_list,instance_place(x,y,Enemy))
var_enemy =  instance_place(x,y,Enemy)
var_enemy.hp -= damage
var_enemy.hit_stun = 2
penetration -= 1

repeat(4){
particle = instance_create_depth(x,y,depth-100,ParticleEffect)
particle.hsp = random_range(-6,6)
particle.vsp = random_range(-9,2)}
}

if penetration <= 0{
instance_destroy()}
}