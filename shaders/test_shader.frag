#version 460 core

#include <flutter/runtime_effect.glsl>

precision mediump float;

uniform vec2 uResolution;

out vec4 fragColor;

void main() {
    vec2 uv = FlutterFragCoord().xy / uResolution;
    vec3 color = mix(vec3(1.0, 0.0, 0.0), vec3(0.0, 0.0, 1.0), uv.x);  // Градиент по Y
    fragColor = vec4(color, 1.0);
}

//