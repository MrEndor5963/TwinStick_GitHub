if GM.glitch_intensity > 0{exit}
//draw_set_alpha(1-(glitch_intensity/4))
if despawn = false{
if glitch_intensity > 0{glitch_intensity -= 0.05}
if glitch_intensity < 0{glitch_intensity = 0}}

if despawn = true or !instance_exists(creator){
if glitch_intensity < 1{glitch_intensity += 0.1}
if glitch_intensity >= 1{
play_sfx(sfx_TextboxSpawn)
;instance_destroy();}
}

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

bktglitch_set_intensity(0.08 + (glitch_intensity))

_width = sprite_width
_height = sprite_height
_x = x
_y = y
draw_surface_part(application_surface,_x,_y,_width,_height,_x,_y)


shader_reset()

draw_set_alpha(1)