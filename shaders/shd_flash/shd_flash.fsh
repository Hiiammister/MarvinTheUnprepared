varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float flash_strength;

void main() {
    vec4 base_col = texture2D(gm_BaseTexture, v_vTexcoord) * v_vColour;

    // Preserve alpha
    float out_a = base_col.a;

    // Mix toward red but keep shading visible
    vec3 flash_col = mix(base_col.rgb, vec3(1.0, 0.0, 0.0), flash_strength);

    gl_FragColor = vec4(flash_col, out_a);
}
