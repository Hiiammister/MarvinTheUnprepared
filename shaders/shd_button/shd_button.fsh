varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
uniform float alpha;

void main() {
    vec2 uv = v_vTexcoord;
    // Subtle wave distortion (makes button "breathe")
    float wave = sin((uv.x + time) * 6.0) * 0.01;
    uv.y += wave;

    // Base texture color
    vec4 baseColor = texture2D(gm_BaseTexture, uv) * v_vColour;

    // Glow intensity increases as alpha decreases (on hover)
    float glow = (1.0 - alpha) * 0.5;

    // Apply subtle pulse to brightness
    float pulse = 0.5 + 0.5 * sin(time * 4.0);

    // Combine effects
    baseColor.rgb += glow * pulse;

    gl_FragColor = baseColor;
}
