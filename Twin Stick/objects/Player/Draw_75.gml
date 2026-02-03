if spawned = false or room = r_FloorTransition{exit}


if glitch_int_gun_name > 0{glitch_int_gun_name -= 0.15};if glitch_int_gun_name < 0{glitch_int_gun_name = 0}
if glitch_int_gun_sprite > 0{glitch_int_gun_sprite -= 0.15};if glitch_int_gun_sprite < 0{glitch_int_gun_sprite = 0}
if glitch_int_mag > 0{glitch_int_mag -= 0.15};if glitch_int_mag < 0{glitch_int_mag = 0}
if glitch_int_reserve > 0{glitch_int_reserve -= 0.15};if glitch_int_reserve < 0{glitch_int_reserve = 0}
if glitch_int_points > 0{glitch_int_points -= 0.15};if glitch_int_points < 0{glitch_int_points = 0}


if GM.glitch_intensity != 0{exit}
bktglitch_activate(1280,720);


// Quickly setting all parameters at once using a preset
bktglitch_config_preset(BktGlitchPreset.B);

// Additional tweaking
bktglitch_set_jumbleness(0.5);
bktglitch_set_jumble_speed(2);
bktglitch_set_jumble_resolution(random_range(0.2, 0.4));
bktglitch_set_jumble_shift(random_range(0.2, 0.4));
bktglitch_set_channel_shift(0.0);
bktglitch_set_channel_dispersion(0);

//draw_origin_x+(216*pon_x),draw_origin_y+(48*pon_y),"Jammed",draw_color)
bktglitch_set_intensity(0.04 + (glitch_int_gun_sprite));
glitch_sprite(weapon_sprite,draw_origin_x+((96+(sprite_get_width(weapon_sprite)/2))*pon_x),
draw_origin_y+(48*pon_y)
)

bktglitch_set_intensity(0.04 + (glitch_int_portrait));
glitch_sprite(portrait_sprite,(draw_origin_x+(48*pon_x)),(draw_origin_y+(48*pon_y)))

bktglitch_set_intensity(0.04 + (0));
glitch_sprite(s_HPBarOutline,draw_origin_x+(48*pon_x),draw_origin_y+(pon_y*192))

bktglitch_set_intensity(0.04 + (glitch_int_gun_name));
glitch_text(draw_origin_x+(96*pon_x),draw_origin_y+(24*pon_y),string(weapon_name))


xoff = 0
if pon_x = -1{xoff = string_width("/"+string(ammo_reserve))}

bktglitch_set_intensity(0.04 + (glitch_int_mag));
glitch_text(draw_origin_x+(96*pon_x)-xoff,draw_origin_y+(72*pon_y),string(ammo_inmag))

if pon_x = -1{xoff = string_width(string(ammo_inmag))}
bktglitch_set_intensity(0.04 + (glitch_int_reserve));
glitch_text(draw_origin_x+((96+string_width(ammo_inmag))*pon_x)+xoff,draw_origin_y+(72*pon_y),"/"+string(ammo_reserve))

if pon_x = -1{xoff = string_width("$"+string(money))}
bktglitch_set_intensity(0.04 + (glitch_int_points));
glitch_text(draw_origin_x+(0*pon_x),draw_origin_y+(122*pon_y),"$"+string(money))



shader_reset()
