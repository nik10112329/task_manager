#version 460 core

#include <flutter/runtime_effect.glsl>

precision mediump float;

uniform float iTime;
uniform vec2 iResolution;
uniform vec2 uSize;

out vec4 fragColor;

#define MAX_ITER 4

void main() {
    // Нормализуем координаты от -1 до 1
    vec2 uv = FlutterFragCoord().xy / iResolution;
    uv = uv * 2.0 - 2.0;

    // Масштабируем координаты
    vec2 p = uv * 7.0;
    vec2 i = p;
    float c = 1.0;
    float inten = 0.01;

    for (int n = 0; n < MAX_ITER; n++) {
        float t = iTime * (11.0 - (3.0 / float(n + 1)));
        i = p + vec2(
        cos(t - i.x) + sin(t + i.y),
        sin(t - i.y) + cos(t + i.x)
        );
        c += 1.0 / length(vec2(
        p.x / (sin(i.x + t) / inten),
        p.y / (cos(i.y + t) / inten)
        ));
    }

    c /= float(MAX_ITER);
    c = 1.5 - sqrt(c);

    // Фиксируем альфа-канал для непрозрачности
    vec3 color = vec3(c * c * c * c) + vec3(0.0, 0.3, 0.5);
    fragColor = vec4(color, 1.0);
}