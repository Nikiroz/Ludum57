varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vPosition;

uniform float u_waterline;
uniform vec3 u_color;

void main()
{
	/*
	float waterlineDelta = max(0.0, v_vPosition.y - (u_waterline - 32.0));
	waterlineDelta = min(1.0, waterlineDelta / (64.0));
	colorNight = mix(
		colorNight,
		vec3((colorNight.r + colorNight.g + colorNight.b) / 3.0),
		waterlineDelta
	);
	*/
	vec4 base = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	if (v_vPosition.y > u_waterline) {
		base.rgb = mix(base.rgb, u_color, 0.7);
	}
	gl_FragColor = base;
}