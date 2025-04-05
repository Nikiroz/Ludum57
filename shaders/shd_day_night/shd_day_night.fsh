//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

const vec3 color1 = vec3(1.0, 0.0, 0.0);
const vec3 color2 = vec3(0.0, 1.0, 0.0); 
const vec3 color3 = vec3(0.0, 0.0, 1.0);
const vec3 color4 = vec3(1.0, 1.0, 1.0);

uniform float time;

void main(){	
	vec4 pixel = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	float t = mod(time, 4.0);
	vec3 finalColor;
	if (t < 1.0) {
	    finalColor = mix(color1, color2, t);
	} else if (t < 2.0) {
	    finalColor = mix(color2, color3, t - 1.0);
	} else if (t < 3.0) {
	    finalColor = mix(color3, color4, t - 2.0);
	} else {
	    finalColor = mix(color4, color4, t - 3.0);;
	}
    gl_FragColor = vec4(pixel.rgb * finalColor.rgb, pixel.a);
}
