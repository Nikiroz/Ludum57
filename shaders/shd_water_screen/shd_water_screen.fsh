varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vPosition;

/*
uniform sampler2D u_texture;
uniform vec3 u_base_y;
uniform vec2 u_sprite_size;
uniform vec2 u_view;
uniform vec2 u_parallax;
uniform float u_anim;
*/
uniform sampler2D u_underwater;
uniform vec2 u_sprite_size;
uniform vec2 u_sprite_pos;
uniform vec2 u_wave_data;
uniform float u_anim;

float fbm1(float _value) {
	return sin(_value) * 0.5 + sin(_value * 1.66) * 0.25 + sin(_value * 3.22) * 0.125;
}

void main()
{
	vec2 uv = v_vPosition.xy;
	uv.x = uv.x / u_sprite_size.x;
	uv.y -= u_sprite_pos.y;
	uv.y = min(uv.y, u_sprite_size.y - 0.01) / u_sprite_size.y;
	vec4 base = v_vColour * texture2D(gm_BaseTexture, uv);
	
	float wave_y = u_wave_data.x + sin(u_anim + v_vPosition.x * 0.02) * u_wave_data.y;
	if (v_vPosition.y > wave_y) {
		base = v_vColour * texture2D(u_underwater, uv);
	}
	
	gl_FragColor = base;
	/*
	vec2 uv = v_vPosition.xy;
	float cut_y = u_base_y.x;
	float wline = u_base_y.z;
	if (u_base_y.y > 0.5) {
		float ampl = 3.0;
		cut_y += fbm1(u_anim + v_vPosition.x * 0.02) * ampl;
		wline = u_base_y.x - ampl;
	}
	uv.x -= u_view.x * u_parallax.x;
	uv.y = max(uv.y - u_base_y.z, 0.0);
	// uv.y = min(uv.y, uv.y + u_sprite_size.y);
	uv.x = uv.x / u_sprite_size.x;
	uv.y = uv.y / u_sprite_size.y;
	vec4 base = v_vColour * texture2D(u_texture, uv);
	if (v_vPosition.y < cut_y) {
		base.a = 0.0;
	}
	gl_FragColor = base;
	*/
}