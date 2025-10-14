varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;

void main() {
    vec2 uv = v_vTexcoord;
    float amplitude = 0.03;
    uv.y += sin(uv.x * 10.0 + time * 3.0) * amplitude;

    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, uv);
}
