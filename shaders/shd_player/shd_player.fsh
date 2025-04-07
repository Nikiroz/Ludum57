varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vPosition;

uniform float u_waterline;
uniform vec3 u_color;
uniform vec3 u_lightcolor;
uniform vec2 u_texel;

void main()
{
	vec4 base = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	
	float _delta = 0.0;
	vec3 delta;
	float _add = 0.0;
	 /*
	for (float i = -2.0; i <= 2.0; i += 1.0) {
		for (float j = -2.0; j <= 2.0; j += 1.0) {
			delta = texture2D(gm_BaseTexture, v_vTexcoord + vec2(i, j) * u_texel).rgb;
			delta = delta.rgb - u_lightcolor;
			_delta += abs(delta.r) + abs(delta.g) + abs(delta.b);
			if (_delta < 2.0 / 255.0) {
				count += 0.33;
			}
		}
	}
	// _delta = _delta / 25.0;
	// */
	// /*
	for (float i = -1.0; i <= 1.0; i += 1.0) {
		for (float j = -1.0; j <= 1.0; j += 1.0) {
			_delta = 0.0;
			delta = texture2D(gm_BaseTexture, v_vTexcoord + vec2(i, j) * u_texel).rgb;
			delta = delta.rgb - u_lightcolor;
			_delta += abs(delta.r) + abs(delta.g) + abs(delta.b);
			if (_delta < 2.0 / 255.0) {
				_add = 0.22;
			}
		}
	}
	delta = texture2D(gm_BaseTexture, v_vTexcoord).rgb;
	delta = delta.rgb - u_lightcolor;
	_delta = 0.0;
	_delta += abs(delta.r) + abs(delta.g) + abs(delta.b);
	if (_delta < 2.0 / 255.0) {
		_add = 1.0;
	}
	// */
	
	// if (_delta < 2.0 / 255.0) {
	// if (count > 0.0) {
		// base.rgb += count;
	if (_add > 0.0) {
		base.rgb += _add;
	} else {
		if (v_vPosition.y > u_waterline) {
			base.rgb = mix(base.rgb, u_color, 0.7);
		}
	}
	gl_FragColor = base;
}