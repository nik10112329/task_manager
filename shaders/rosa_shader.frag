#version 460 core

#include <flutter/runtime_effect.glsl>

uniform vec2 widgetSize;
uniform vec2 mousePosition;
uniform float timer;
uniform float maxLineOpacity;
uniform float ringWidth;
uniform float animationSpeed;
uniform float intensityMultiplier;
uniform float colorBrightness;

out vec4 fragColor;


void main()
{
    vec2 fragCoord = FlutterFragCoord().xy;
    vec2 uv = fragCoord / widgetSize.xy;
    vec2 origin = mousePosition / widgetSize;

    float distance = length(uv - origin);
    float waveFront = timer * animationSpeed;

    float distToWave = abs(distance - waveFront);
    float intensity = (1.0 - smoothstep(0.0, ringWidth, distToWave)) * maxLineOpacity;

    intensity *= intensityMultiplier;

    vec3 color = vec3(colorBrightness);
    fragColor = vec4(color * intensity, intensity * 0.6);
}