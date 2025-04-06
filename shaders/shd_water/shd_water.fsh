//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;

// Хэш-функция (псевдорандом)
float hash(float n) {
    return fract(sin(n) * 43758.5453123);
}

// Линейная интерполяция
float lerp(float a, float b, float t) {
    return a + t * (b - a);
}

// 1D Perlin Noise
float perlin1D(float x) {
    float i = floor(x);
    float f = fract(x);
    float a = hash(i);
    float b = hash(i + 1.0);
    float u = f * f * (3.0 - 2.0 * f);
    return lerp(a, b, u);
}

void main()
{
	// Частота и амплитуда волн
    float frequency = 25.0;
    float amplitude = 0.005;
    float speed = 2.5;
	
	// Получаем шумовое значение
    float noise = perlin1D(v_vTexcoord.x * frequency + time * speed);
	// Смещаем координату X (волны)
    vec2 uv = vec2(v_vTexcoord.x, v_vTexcoord.y - noise * amplitude);
	vec4 texColor = texture2D(gm_BaseTexture, uv);
    gl_FragColor = texColor * v_vColour;
	
    //gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}
