if despawn = false{
if glitch_intensity > 0{glitch_intensity -= 0.05}
if glitch_intensity < 0{glitch_intensity = 0}}
else{
if glitch_intensity < 1{glitch_intensity += 0.1}
if glitch_intensity >= 0.8{instance_destroy();}
}

bktglitch_activate(1280,720);
bktglitch_set_intensity(0.01 + (glitch_intensity));


// Quickly setting all parameters at once using a preset
bktglitch_config_preset(BktGlitchPreset.B);

// Additional tweaking
bktglitch_set_jumbleness(0.5);
bktglitch_set_jumble_speed(2);
bktglitch_set_jumble_resolution(random_range(0.2, 0.4));
bktglitch_set_jumble_shift(random_range(0.2, 0.4));
bktglitch_set_channel_shift(0.0);
bktglitch_set_channel_dispersion(0);

bktglitch_set_intensity(0.1 + (glitch_intensity))
_width = string_width(text_string)
_height = string_height(text_string)
_x = x-(_width/2)
_y = y-(_height/2)
draw_surface_part(application_surface,_x,_y,_width,_height,_x,_y)
shader_reset()
