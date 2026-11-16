#version 460 core

#include <flutter/runtime_effect.glsl>

precision mediump float;

uniform float iTime;
uniform vec2 iResolution;
//uniform vec4 uColor;

out vec4 fragColor;

void main() {
    vec2 sp = gl_FragCoord.xy / iResolution;
    sp = sp * 2.0 - 1.0;

    float aspect = iResolution.x / iResolution.y;
    sp.x *= aspect;

    float time = iTime * 2;

//   вращающееся направление vec2 dir = normalize(vec2(cos(time), sin(time)));
    vec2 dir = normalize(vec2(-1.0, 0.5));
    float v = dot(sp, dir);

    vec3 color = 0.5 + cos(time + v + vec3(0,1,2));
    color = 0.2 + color * 0.65;

    fragColor = vec4(color, 1.0);
}

