//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float time;

// Simple pseudo-random function
float random(vec2 st) {
    return fract(sin(dot(st.xy, vec2(12.9898, 78.233))) * 43758.5453123);
}

void main()
{
	vec3 finalColor;
	
	vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
	vec2 normalizedCoord = v_vTexcoord.xy;
    float noise = random(normalizedCoord + time * 0.01);
    
    // Apply intensity control
    noise = noise * 1.0;
    finalColor = mix(texColor.rgb, vec3(noise), 0.1);
    finalColor = mix(finalColor.rgb, vec3(0.0, 0.0, 0.0), 0.5);
	
	gl_FragColor = vec4(finalColor.rgb, texColor.a * v_vColour.a);
	
}
