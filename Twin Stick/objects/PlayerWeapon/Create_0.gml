key_shoot = -1;key_shoot_pressed = -1
recoil = 0
png_explosions = 0
aim_direction = 0
shoot_timer = 0
trigger_delay_timer = 0
trigger_needs_reset = false
bullet_chambered = true
mag_loaded = true

reload_progress = -1
reload_time = 60
reload_progress = -1
jam_timer = -1

animation = ""
mag_offset = 0

contact_list = []
attack_timer = -1
xoff = 0
yoff = 0
angleoff = 0
melee_attack = false
hurtbox_active = false
hurts_enemy = true
damage = 25

weapon_weight = 1
angle_offset = 0

slide_offset = 0
pump_offset = 0

function eject_bullet_casing(){
	direction = aim_direction;speed = 1
	particle = instance_create_depth(x,y,depth-1,PersistentVFX)
	particle.hsp = -hspeed*random_range(4,5)
	particle.vsp = -vspeed*random_range(4,5)
	particle.zsp = random_range(-12,-6)
	particle.spin_speed = image_yscale*random_range(35,40)
	particle.z = player_id.y-player_id.floor_y
	particle.floor_y = player_id.floor_y
	particle.grv = 0.5
	particle.sprite_index = caliber
}
