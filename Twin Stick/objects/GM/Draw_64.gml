// Activating the shader
display_set_gui_size(1280,720)
bktglitch_activate(1280,720);

// Quickly setting all parameters at once using a preset
bktglitch_config_preset(BktGlitchPreset.B);

// Additional tweaking
bktglitch_set_jumbleness(0.5);
bktglitch_set_jumble_speed(2);
bktglitch_set_jumble_resolution(random_range(0.2, 0.4));
bktglitch_set_jumble_shift(random_range(0.2, 0.4));
bktglitch_set_channel_shift(0.01);
bktglitch_set_channel_dispersion(.1);



// Setting the overall intensity of the effect, adding a bit when the ball bounces.
if glitch_intensity > 0{glitch_intensity -= 0.04}
if glitch_intensity < 0{glitch_intensity = 0}
bktglitch_set_intensity(0.025 + (glitch_intensity));


// Drawing the application surface
draw_surface(application_surface, 0, 0);

description_text = false

// Done with the shader (this is really just shader_reset)!
shader_reset()