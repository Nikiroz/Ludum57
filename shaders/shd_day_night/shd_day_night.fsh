//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float hour;
uniform float wave_y;

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
      
	float sunriseStart = 9.00;  
	float sunsetStart = 18.60;  
	float sunriseDuration = 0.3;
	float sunsetDuration = 0.3;  
		
	vec3 colorNight   = vec3(0.01, 0.09, 0.15); // Ночь
    vec3 colorMorning = vec3(1, 0.5, 0.52);	// Утро
    vec3 colorEvening = vec3(0.56, 0.34, 0);	// Вечер
	
	float intensityNight = 0.8;
	float intensityEvening = 0.9;
	float intensityMorning = 0.9;
	
	vec3 finalColor;
	
	if (hour < sunriseStart) {
		finalColor = mix(texColor.rgb, colorNight, intensityNight);	
	}else if(hour >= sunriseStart && hour <= sunriseStart + sunriseDuration){
		
		float timeNorm = clamp((hour - sunriseStart) / sunsetDuration, 0.0, 1.0);
		float progress = sin(timeNorm * 3.14159);
		finalColor = vividLight(texColor.rgb, colorMorning, clamp(progress, 0.0, intensityMorning));
		
		float halfTransition = sunriseDuration / 2.0;
		float halfTime = sunriseStart + halfTransition;
		
		float timeNorm2 = clamp((hour - halfTime) / (sunriseDuration / 2.0), 0.0, 1.0);
		float progress2 = clamp(timeNorm2, 0.0, intensityNight);
		finalColor = mix(finalColor.rgb, colorNight, intensityNight - progress2);
		
	}else if (hour > sunsetStart) {
	 
	    float timeNorm = clamp((hour - sunsetStart) / sunsetDuration, 0.0, 1.0);
		float progress = sin(timeNorm * 3.14159);
	    finalColor = vividLight(texColor.rgb, colorEvening, clamp(progress, 0.0, intensityEvening));
		
	    float halfTransition = sunsetDuration / 2.0;
		float halfTime = sunsetStart + halfTransition;
		
		if (hour > halfTime) {
			float tr = (hour - halfTime) / halfTransition;
		    float progress = clamp(tr, 0.0, intensityNight);
		    finalColor = mix(finalColor, colorNight, progress);
		}
		
	} else {
	    finalColor = texColor.rgb;
	}
	  
    gl_FragColor = vec4(finalColor.rgb, texColor.a * v_vColour.a);
	
}
