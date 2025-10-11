//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor.rgb = v_vColour.rgb;
	//gl_FragColor = vec4(0.8,0.8,0.8,gl_FragColor.a);
}