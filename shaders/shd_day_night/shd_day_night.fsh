//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;

vec3 vividLight(vec3 base, vec3 blend, float intensity) {
    vec3 vividResult = vec3(
        blend.r < 0.5 ? base.r - (1.0 - 2.0 * blend.r) * base.r * (1.0 - base.r) : (blend.r > 0.5) ? base.r + (2.0 * (blend.r - 0.5)) * (1.0 - base.r) : base.r,
        blend.g < 0.5 ? base.g - (1.0 - 2.0 * blend.g) * base.g * (1.0 - base.g) : (blend.g > 0.5) ? base.g + (2.0 * (blend.g - 0.5)) * (1.0 - base.g) : base.g,
        blend.b < 0.5 ? base.b - (1.0 - 2.0 * blend.b) * base.b * (1.0 - base.b) : (blend.b > 0.5) ? base.b + (2.0 * (blend.b - 0.5)) * (1.0 - base.b) : base.b
    );
    
    // Смешиваем базовое изображение и результат Vivid Light в зависимости от интенсивности
    return mix(base, vividResult, intensity);
}

void main(){	

    vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
      
    // Определяем два разных цвета для переходов
	vec3 color1 = vec3(0.18, 0.19, 0.26) / 3.0;   // Тёмно-синий для второго перехода
    vec3 color2 = vec3(0.9, 0.3, 0.2);      // Красно-оранжевый для первого перехода

    // Задаем время для каждого перехода (в секундах)
    float transition1_time = 5.5;  // Первый переход длится 2.5 секунды
    float transition2_time = 2.5;  // Второй переход длится 2.5 секунды
    float transition3_time = 3.0;  // Затухание эффекта длится 3.0 секунды
	float intensity = 0.2;
    
    // Общее время всех переходов
    float total_time = transition1_time + transition2_time + transition3_time;
    
    // Ограничиваем время для остановки на оригинальном изображении
    float capped_time = min(time, total_time);
    // Нормализуем время, чтобы оно шло от 0 до 1
    float progress = min(time / transition1_time, 1.0);  // Ограничиваем прогресс от 0 до 1
    // Определяем текущий переход и прогресс
	
	vec3 finalColor;
	
    if (capped_time < transition1_time) {
        // Первый переход: первый цвет (красно-оранжевый) с обычным наложением
		finalColor = vividLight(texColor.rgb, color2, intensity);
        finalColor = mix(color1, finalColor, progress);
    } 
    else if (capped_time < transition1_time + transition2_time) {
	    finalColor = vividLight(texColor.rgb, color2, intensity);
    } 
    else if (capped_time < total_time) {
		
        // Третий переход: затухание эффекта наложения до оригинального изображения
        float progress = (capped_time - transition1_time - transition2_time) / transition3_time;
        
        // Уменьшаем интенсивность с течением времени в фазе затухания
        float fadingIntensity = intensity * (1.0 - progress);
        
        // Применяем Vivid Light с затухающей интенсивностью
        finalColor = vividLight(texColor.rgb, color2, fadingIntensity);
    } 
    else {
        // После завершения всех переходов - оригинальное изображение
        finalColor = texColor.rgb;
    }
  
    gl_FragColor = vec4(finalColor.rgb, texColor.a * v_vColour.a);
	
}
