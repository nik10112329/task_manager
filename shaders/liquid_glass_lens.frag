#version 460 core

#include <flutter/runtime_effect.glsl>

//uniform float uLensSize;
uniform vec2 uSize;
uniform vec2 uLens;
uniform float uMode;
uniform float uLensSize;
uniform float uHasLens;
uniform sampler2D uTexture;

out vec4 fragColor;

vec2 ProjectCoordsLogLens(vec2 normCoords) {
    float z = -log(dot(normCoords, normCoords));
    if (z <= 0.0) return normCoords;
    return normCoords / z;
}

vec2 ProjectCoordsLogLens_mod(vec2 normCoords) {
    float z = -log(dot(normCoords, normCoords));
    if (z <= 0.0) return normCoords;
    return normCoords * (pow(z * 0.1, 0.25));
}

float sdCircle(vec2 p, float r) {
    return length(p) - r;
}

void main() {
    vec2 fragCoord = FlutterFragCoord().xy;
    vec2 ouv = fragCoord / uSize.xy;

    const float sc = uLensSize;
    vec2 res = uSize.xy / uSize.y;

    vec2 im = vec2(0.0);
    if (uHasLens == 1) {
        im = uLens * res - 0.5 * res + sc * 0.5;
    }

    vec2 uv = fragCoord / uSize.y - 0.5 * res + im;

    vec2 gridCoordsRaw = uv / sc;
    vec2 cellMiddlePos = (floor(gridCoordsRaw) * sc + sc / 2.0) - im;
    vec2 cellDelta = (fract(gridCoordsRaw) - 0.5) * 2.0;
    vec2 tuv = (gridCoordsRaw - 0.5) * 2.0;

    bool si = uMode > 0.5;
    if (si) {
        cellDelta = ProjectCoordsLogLens_mod(cellDelta) * sc * 0.5;
    } else {
        cellDelta = ProjectCoordsLogLens(cellDelta) * sc * 0.5;
    }

    vec2 srcTexCoord = cellMiddlePos + cellDelta;
    vec2 originalUV = ouv;
    #ifdef IMPELLER_TARGET_OPENGLES
    originalUV.y = 1.0 - originalUV.y;
    #endif
    vec3 texCol0 = texture(uTexture, originalUV).xyz;

    vec2 distortedUV = (srcTexCoord / res) + 0.5;
    distortedUV = clamp(distortedUV, vec2(0.0), vec2(1.0));
    #ifdef IMPELLER_TARGET_OPENGLES
    distortedUV.y = 1.0 - distortedUV.y;
    #endif
    vec3 texCol = texture(uTexture, distortedUV).xyz;

    float edge_aa = min(0.15, 0.01 / sc);
    texCol = mix(texCol0, texCol, 1.0 - smoothstep(-edge_aa, 0.0, sdCircle(tuv, 1.0)));

    fragColor = vec4(texCol, 1.0);
}