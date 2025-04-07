varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vPosition;

uniform vec2 u_gradient;

void main()
{
    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	float delta = 1.0 - (v_vPosition.y - u_gradient.x) / u_gradient.y;
	delta = pow(delta, 5.0);
	gl_FragColor.a *= delta;
	
	/*
	vec2 mask_uv = (v_vPosition.xy - u_waterdata.zw);
	mask_uv = mask_uv / u_waterdata.xy;
	if (texture2D(u_watermask, mask_uv).r > 0.1 || v_vPosition.y > u_waterdata.w) {
		gl_FragColor.a = 1.0;
	}
	gl_FragColor.rgb = vec3(texture2D(u_watermask, mask_uv));
	*/
}

/// 80 87 71