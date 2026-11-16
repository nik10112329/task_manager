#version 460 core
#include <flutter/runtime_effect.glsl>

precision highp float;

uniform float iTime;
uniform vec2 iResolution;

out vec4 fragColor;

const float GLASS_ALPHA = 0.3;
const float WAVE_SCALE = 12.0;
const float WAVE_STRENGTH = 0.02;

void main() {
    vec2 uv = FlutterFragCoord().xy / iResolution;
    vec2 p = uv * 2.0 - 1.0;
    p.x *= iResolution.x / iResolution.y;

    // волны
    float wave = sin((p.x + iTime) * WAVE_SCALE) * 0.02
    + cos((p.y - iTime) * WAVE_SCALE) * 0.02;

    // блеск
    float highlight = pow(1.0 - length(p), 3.0);

    vec3 baseColor = vec3(0.85, 0.93, 1.0) + highlight * 0.2;

    // виньетка
    float vignette = smoothstep(1.2, 0.2, length(p));

    fragColor = vec4(baseColor * vignette, GLASS_ALPHA);
}
