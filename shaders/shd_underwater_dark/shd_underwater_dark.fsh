varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vPosition;

uniform vec2 u_gradient;
uniform vec2 u_playerpos;
uniform float u_radius;
uniform vec3 u_color;

void main()
{
	vec4 base = vec4(u_color, 1.0);
	base.rgb = vec3(0.0);
	base.a = (v_vPosition.y - u_gradient.x) / (u_gradient.y - u_gradient.x);
	float delta = min(distance(v_vPosition.xy, u_playerpos) / u_radius, 1.0);
	delta = delta;
	base.a *= delta;
	gl_FragColor = base;
}