#version 460 core

#include <flutter/runtime_effect.glsl>

precision mediump float;

uniform float iTime;
uniform vec2 iResolution;

out vec4 fragColor;

// Параметры яркого Turbo
#define RED_FADE 0.5
#define BLUE_FADE 0.8
#define PURPLE_FACTOR 0.8

#define MAX_ITER 6
#define SCALE 3.0

// Яркая версия Turbo для цветового перелива
vec3 brightTurbo(float x) {
    float rr = sin((x - 0.33) * 3.141592);
    float gg = sin((x + 0.00) * 3.141592);
    float bb = sin((x + 0.33) * 3.141592);
    float ss = (1.0 - x) * (1.0 - x) * PURPLE_FACTOR;
    float r = clamp(rr * (1.0 - RED_FADE * bb * bb) + ss, 0.0, 1.0);
    float g = clamp(gg * (1.0 - rr * rr * bb * bb), 0.0, 1.0);
    float b = clamp(bb * (1.0 - BLUE_FADE * rr * rr), 0.0, 1.0);
    return vec3(r, g, b);
}

void main() {
    vec2 uv = FlutterFragCoord().xy / iResolution.xy;
    vec2 p = (uv * 2.0 - 1.0);
    float aspect = iResolution.x / iResolution.y;
    p.x *= aspect;
    p *= SCALE;

    float time = iTime * 3.0; // ускоряем анимацию

    // Смещения для движения частиц
    float xBoost = sin(time * 0.3) * 3.0;
    float yBoost = cos(time * 0.2) * 3.0;
    float fScale = 0.5 + 0.5 * cos(time * 3.0);

    vec2 pp = p;
    for (int i = 1; i < MAX_ITER; i++) {
        float fi = float(i);
        vec2 newp = pp;
        newp.x += 0.12/fi * sin(fi*pp.y + time*0.3 + 0.005*fi) * fScale + xBoost*0.5;
        newp.y += 0.12/fi * sin(fi*pp.x + time*0.2 + 0.03*(fi+15.0)) * fScale + yBoost*0.5;
        pp = newp;
    }

    // Цвет Turbo без черного
    float t = fract(time*0.3 + length(pp)*0.05);
    vec3 color = brightTurbo(t);

    // Мягкая виньетка
    float dist = length(uv - 0.5);
    float vignette = smoothstep(1.0, 0.3, dist);
    color *= vignette;

    fragColor = vec4(color, 1.0);
}
