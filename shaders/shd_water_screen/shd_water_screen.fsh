varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vPosition;

uniform sampler2D u_texture;
uniform float u_base_y;
uniform vec2 u_sprite_size;
uniform vec2 u_view;
uniform vec2 u_parallax;

void main()
{
	vec2 uv = v_vPosition.xy;
	uv.x -= u_view.x * u_parallax.x;
	uv.y = max(uv.y - u_base_y, 0.0);
	// uv.y = min(uv.y, uv.y + u_sprite_size.y);
	uv.x = uv.x / u_sprite_size.x;
	uv.y = uv.y / u_sprite_size.y;
	vec4 base = v_vColour * texture2D(u_texture, uv);
	if (v_vPosition.y < u_base_y) {
		base.a = 0.0;
	}
	gl_FragColor = base;
}