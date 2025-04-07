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
uniform sampler2D u_watermask;
uniform vec4 u_waterdata;
uniform sampler2D u_underwater;
uniform vec2 u_sprite_size;
uniform vec2 u_sprite_pos;
uniform vec2 u_sprite_underwater_size;
uniform float u_anim;

float fbm1(float _value) {
	return sin(_value) * 0.5 + sin(_value * 1.66) * 0.25 + sin(_value * 3.22) * 0.125;
}

void main()
{
	vec2 uv = v_vPosition.xy;
	vec4 base = vec4(0.0);
	
	// float wave_y = u_wave_data.x + sin(u_anim + v_vPosition.x * 0.02) * u_wave_data.y;
	// if (v_vPosition.y > wave_y) {
	vec2 mask_uv = (v_vPosition.xy - u_waterdata.zw);
	mask_uv = mask_uv / u_waterdata.xy;
	/*a 
	vec2 deb = mask_uv;
	// mask_uv.y = max(mask_uv.y, -0.9);
	mask_uv.y = clamp(mask_uv.y, -1.0, 0.0);
	*/
	// mask_uv.x = clamp(mask_uv.x, 0.0, 1.0);
	// mask_uv.y = clamp(mask_uv.y, -0.9, 0.1);
	if (texture2D(u_watermask, mask_uv).r > 0.1 || v_vPosition.y > u_waterdata.w) {
		uv.x = uv.x / u_sprite_underwater_size.x;
		uv.y -= u_sprite_pos.y + u_sprite_underwater_size.y / 2.0 - 12.0;
		uv.y = min(uv.y, u_sprite_underwater_size.y - 0.01) / u_sprite_underwater_size.y;
		base = v_vColour * texture2D(u_underwater, uv);
		// if (v_vPosition.y > u_sprite_pos.y + u_sprite_underwater_size.y) {
		if (uv.y >= 0.99) {
			base.a = 0.0;
		}
	} else {
		uv.x = uv.x / u_sprite_size.x;
		uv.y -= u_sprite_pos.y;
		uv.y = min(uv.y, u_sprite_size.y - 0.01) / u_sprite_size.y;
		base = v_vColour * texture2D(gm_BaseTexture, uv);
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