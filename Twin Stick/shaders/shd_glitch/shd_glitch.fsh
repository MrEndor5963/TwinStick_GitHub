varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float pixelW;					//texel width
uniform float pixelH;					//texel height
uniform float time;						//time value
uniform sampler2D distortTex;			//noise texture
uniform float distortW;					//texel width of noise
uniform float distortH;					//texel height of noise
uniform float distortSizeH;				//height of noise
uniform float distortstrength;			//strength of distortion on alpha 100%, in pixels
uniform float aberrationstrength;		//strength of aberration, in pixels


void main()
{
	
	vec4 base_col;
	
	//correction to the texel size if it's irrational
	float fdistortW=distortW+0.000001;
	float fdistortH=distortH+0.000001;
	float fpixelW=pixelW;//+0.000001;
	float fpixelH=pixelH;//+0.000001;
	
	//get x and y coordinates from noise to use in distortion
	float yy=v_vTexcoord.y/fpixelH;
	yy=mod(yy,distortSizeH-1.0);
	yy=(fdistortH*yy);
	float xx=time*fdistortW;
	
	//get pixel properties from noise for distortion
	vec4 map=texture2D(distortTex,vec2(xx,yy));
	
	//get distortion direction based on blue color of noise pixel
	float side;
	if (map.b>=0.5)
	{
		side=1.0;
	}
	else
	{
		side=(-1.0);
	}
	//get distortion value based on alpha of noise pixel, texel size, strength and direction
	float distort=map.a*fpixelW*distortstrength*side;
	
	//get pixel properties from noise for aberration
	vec4 abrmap=texture2D(distortTex,vec2(xx,fdistortH*distortSizeH));
	
	//if alpha of pixel on noise is 0 then don't use multiplier
	//if alpha>0, then get multiplier based on blue color of noise pixel 
	float abrmulti;
	if (abrmap.a==0.0)
	{
		abrmulti=1.0;
	}
	else
	{
		abrmulti=(texture2D(distortTex,vec2(xx,distortSizeH-fdistortH))).b;
	}
	
	//get aberration value based on texel size, strength and multiplier
	vec2 abr=vec2(fpixelW*aberrationstrength*abrmulti,0.0);
	
	//get pixel properties for final image with distortion and aberration added
	//																aberration				distortion
	base_col.r=		texture2D(gm_BaseTexture, v_vTexcoord			+abr					+vec2(distort,0.0)).r;
	base_col.g=		texture2D(gm_BaseTexture, v_vTexcoord									+vec2(distort,0.0)).g;
	base_col.b=		texture2D(gm_BaseTexture, v_vTexcoord			-abr					+vec2(distort,0.0)).b;
	base_col.a=		texture2D(gm_BaseTexture, v_vTexcoord									+vec2(distort,0.0)).a;
	
	//additionaly add value of alpha from right and left so that aberration is not getting cutted of if alpha = 0
	base_col.a+=	texture2D(gm_BaseTexture, v_vTexcoord			+abr					+vec2(distort,0.0)).a;
	base_col.a+=	texture2D(gm_BaseTexture, v_vTexcoord			-abr					+vec2(distort,0.0)).a;
	
    gl_FragColor = base_col;
}