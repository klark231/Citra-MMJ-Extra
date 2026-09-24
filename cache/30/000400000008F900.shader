// shader: 8B30, F5366522CE3C7F37
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = (last_tev_out.rgb);
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) * (const_color[1].a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
float fog_index = depth * 128.0;
float fog_i = clamp(floor(fog_index), 0.0, 127.0);
float fog_f = fog_index - fog_i;
vec2 fog_lut_entry = texelFetch(tex_lut_f, int(fog_i) + fog_lut_offset).rg;
float fog_factor = fog_lut_entry.r + fog_lut_entry.g * fog_f;
fog_factor = clamp(fog_factor, 0.0, 1.0);
last_tev_out.rgb = mix(fog_color.rgb, last_tev_out.rgb, fog_factor);
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, C14AC83316707B2D
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (rounded_primary_color.rgb);
float alpha_output_0 = ByteRound(clamp((texcolor0.a) * (1.0 - const_color[0].a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp((rounded_primary_color.rgb) * (const_color[2].rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((last_tev_out.a) * (const_color[2].a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
float fog_index = depth * 128.0;
float fog_i = clamp(floor(fog_index), 0.0, 127.0);
float fog_f = fog_index - fog_i;
vec2 fog_lut_entry = texelFetch(tex_lut_f, int(fog_i) + fog_lut_offset).rg;
float fog_factor = fog_lut_entry.r + fog_lut_entry.g * fog_f;
fog_factor = clamp(fog_factor, 0.0, 1.0);
last_tev_out.rgb = mix(fog_color.rgb, last_tev_out.rgb, fog_factor);
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 3B0B0FD8DE3B25FA, F5366522CE3C7F37
// reference: 2D1CB68D3D18194C, C14AC83316707B2D
// program: 0C3C2FF014074DAF, 0000000000000000, F5366522CE3C7F37
// program: 0C3C2FF014074DAF, 0000000000000000, C14AC83316707B2D
// shader: 8B30, 35416CEAA9E6FC92
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(fma((rounded_primary_color.rgb), (texcolor0.aaa), (const_color[0].rgb)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, E3AAFC8349B332FA
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = (last_tev_out.rgb);
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) * (const_color[1].a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
float fog_index = depth * 128.0;
float fog_i = clamp(floor(fog_index), 0.0, 127.0);
float fog_f = fog_index - fog_i;
vec2 fog_lut_entry = texelFetch(tex_lut_f, int(fog_i) + fog_lut_offset).rg;
float fog_factor = fog_lut_entry.r + fog_lut_entry.g * fog_f;
fog_factor = clamp(fog_factor, 0.0, 1.0);
last_tev_out.rgb = mix(fog_color.rgb, last_tev_out.rgb, fog_factor);
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 63447080C26C2289, 35416CEAA9E6FC92
// reference: 6E7DA91EDE3B25FA, E3AAFC8349B332FA
// program: 0C3C2FF014074DAF, 0000000000000000, 35416CEAA9E6FC92
// program: 0C3C2FF014074DAF, 0000000000000000, E3AAFC8349B332FA
// shader: 8B30, 832BA54A94CE7088
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (const_color[1].rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) * (const_color[1].a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: CB915B7421322B8D, 832BA54A94CE7088
// program: 0C3C2FF014074DAF, 0000000000000000, 832BA54A94CE7088
// shader: 8B30, ECECBBEE041C53F9
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (texcolor1.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1 * 2.0, alpha_output_1 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = (last_tev_out.rgb);
float alpha_output_2 = ByteRound(clamp((last_tev_out.a) * (const_color[2].a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, C4F6E390066657FE
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = (last_tev_out.rgb);
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) * (const_color[1].a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, E7898CBDE0135EA7
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (texcolor1.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = (last_tev_out.rgb);
float alpha_output_2 = ByteRound(clamp((last_tev_out.a) * (const_color[2].a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, F5D2B898F8B0D12F
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) + (texcolor1.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = (last_tev_out.rgb);
float alpha_output_2 = ByteRound(clamp((last_tev_out.a) * (const_color[2].a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 497BCA8370CF1D27
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = (last_tev_out.rgb);
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) * (const_color[1].a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 9AB0723487F5EC55, ECECBBEE041C53F9
// reference: 3B0B0FD8FF837192, C4F6E390066657FE
// reference: 9AB072344D0D91AA, E7898CBDE0135EA7
// reference: 22129A541A748BA6, F5D2B898F8B0D12F
// reference: 22129A54E71DBEC0, F5D2B898F8B0D12F
// reference: 3B0B0FD8C5E158C1, 497BCA8370CF1D27
// reference: 3B0B0FD823D2BC0A, C4F6E390066657FE
// program: 0C3C2FF014074DAF, 0000000000000000, ECECBBEE041C53F9
// program: 0C3C2FF014074DAF, 0000000000000000, C4F6E390066657FE
// program: 0C3C2FF014074DAF, 0000000000000000, E7898CBDE0135EA7
// program: 0C3C2FF014074DAF, 0000000000000000, F5D2B898F8B0D12F
// program: 0C3C2FF014074DAF, 0000000000000000, 497BCA8370CF1D27
// shader: 8B30, 68D6FE3D6CB0B926
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(min((texcolor0.rgb) + (texcolor1.rgb), vec3(1)) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (const_color[1].rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1 * 2.0, alpha_output_1 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = (last_tev_out.rgb);
float alpha_output_2 = ByteRound(clamp((last_tev_out.a) * (const_color[2].a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 1F797F9DD09B57FA, 68D6FE3D6CB0B926
// program: 0C3C2FF014074DAF, 0000000000000000, 68D6FE3D6CB0B926
// shader: 8B30, 5FDAAA8AA9A60626
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (texcolor0.rgb);
float alpha_output_0 = ByteRound(clamp((const_color[0].a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 9D18470F10A88973, 5FDAAA8AA9A60626
// program: 0C3C2FF014074DAF, 0000000000000000, 5FDAAA8AA9A60626
// shader: 8B30, 4A8B65D098CE1F0A
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (texcolor1.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor0.a) * (texcolor1.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) * (rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 24BEA91B13467B1A
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (const_color[1].rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
float fog_index = depth * 128.0;
float fog_i = clamp(floor(fog_index), 0.0, 127.0);
float fog_f = fog_index - fog_i;
vec2 fog_lut_entry = texelFetch(tex_lut_f, int(fog_i) + fog_lut_offset).rg;
float fog_factor = fog_lut_entry.r + fog_lut_entry.g * fog_f;
fog_factor = clamp(fog_factor, 0.0, 1.0);
last_tev_out.rgb = mix(fog_color.rgb, last_tev_out.rgb, fog_factor);
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, B10CFC9EFB579341
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (const_color[1].rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
float fog_index = depth * 128.0;
float fog_i = clamp(floor(fog_index), 0.0, 127.0);
float fog_f = fog_index - fog_i;
vec2 fog_lut_entry = texelFetch(tex_lut_f, int(fog_i) + fog_lut_offset).rg;
float fog_factor = fog_lut_entry.r + fog_lut_entry.g * fog_f;
fog_factor = clamp(fog_factor, 0.0, 1.0);
last_tev_out.rgb = mix(fog_color.rgb, last_tev_out.rgb, fog_factor);
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 2867DF5843C07CCA
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((last_tev_out.rgb), (const_color[1].aaa), (const_color[1].rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
float fog_index = depth * 128.0;
float fog_i = clamp(floor(fog_index), 0.0, 127.0);
float fog_f = fog_index - fog_i;
vec2 fog_lut_entry = texelFetch(tex_lut_f, int(fog_i) + fog_lut_offset).rg;
float fog_factor = fog_lut_entry.r + fog_lut_entry.g * fog_f;
fog_factor = clamp(fog_factor, 0.0, 1.0);
last_tev_out.rgb = mix(fog_color.rgb, last_tev_out.rgb, fog_factor);
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 35416CEA21EAFD45
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(fma((rounded_primary_color.rgb), (texcolor0.rgb), (const_color[0].rgb)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 089813EDD8F9032D
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (texcolor0.rgb);
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0 * 4.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((const_color[1].rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (const_color[1].a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(fma((rounded_primary_color.rgb), (texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 5491B30DE6C0AD29
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: CB915B74E7E339C6, 4A8B65D098CE1F0A
// reference: E645EF7ACA9E14F3, 24BEA91B13467B1A
// reference: B33349BCCA9E14F3, B10CFC9EFB579341
// reference: 32168B1BCA9E14F3, 2867DF5843C07CCA
// reference: DE2788B2C26C2289, 35416CEA21EAFD45
// reference: 655DDFF5A4D3DDEF, 089813EDD8F9032D
// reference: 87DDD79EC26C2289, 5491B30DE6C0AD29
// program: 0C3C2FF014074DAF, 0000000000000000, 4A8B65D098CE1F0A
// program: 0C3C2FF014074DAF, 0000000000000000, 24BEA91B13467B1A
// program: 0C3C2FF014074DAF, 0000000000000000, B10CFC9EFB579341
// program: 0C3C2FF014074DAF, 0000000000000000, 2867DF5843C07CCA
// program: 0C3C2FF014074DAF, 0000000000000000, 35416CEA21EAFD45
// program: 0C3C2FF014074DAF, 0000000000000000, 089813EDD8F9032D
// program: 0C3C2FF014074DAF, 0000000000000000, 5491B30DE6C0AD29
// shader: 8B30, ADB5521579DAF431
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
float fog_index = depth * 128.0;
float fog_i = clamp(floor(fog_index), 0.0, 127.0);
float fog_f = fog_index - fog_i;
vec2 fog_lut_entry = texelFetch(tex_lut_f, int(fog_i) + fog_lut_offset).rg;
float fog_factor = fog_lut_entry.r + fog_lut_entry.g * fog_f;
fog_factor = clamp(fog_factor, 0.0, 1.0);
last_tev_out.rgb = mix(fog_color.rgb, last_tev_out.rgb, fog_factor);
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, BEDAA9CD16F03204
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (texcolor0.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (texcolor1.rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) * (texcolor1.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, F4D2D5B8A05EA68E
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (const_color[1].aaa), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 6003142EC84B432C
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((rounded_primary_color.rgb), (texcolor1.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 8942E2ECC793F1EC
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = (last_tev_out.rgb);
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) * (const_color[1].a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = (last_tev_out.rgb);
float alpha_output_2 = ByteRound(clamp((last_tev_out.a) * (const_color[2].a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
float fog_index = depth * 128.0;
float fog_i = clamp(floor(fog_index), 0.0, 127.0);
float fog_f = fog_index - fog_i;
vec2 fog_lut_entry = texelFetch(tex_lut_f, int(fog_i) + fog_lut_offset).rg;
float fog_factor = fog_lut_entry.r + fog_lut_entry.g * fog_f;
fog_factor = clamp(fog_factor, 0.0, 1.0);
last_tev_out.rgb = mix(fog_color.rgb, last_tev_out.rgb, fog_factor);
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, CF3B95C22AB4B39C
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(min((texcolor0.rgb) + (texcolor1.rgb), vec3(1)) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1 * 2.0, alpha_output_1 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 43A91D10E134E166, ADB5521579DAF431
// reference: 5A93373C9AB914EC, BEDAA9CD16F03204
// reference: 2B9A63D3E9C6D71C, F4D2D5B8A05EA68E
// reference: AABFA1745EFBDD14, 6003142EC84B432C
// reference: 87DDD79E644E0BB3, 5491B30DE6C0AD29
// reference: 81085082FB11613E, 8942E2ECC793F1EC
// reference: 34784C8F6ECB1523, CF3B95C22AB4B39C
// program: 0C3C2FF014074DAF, 0000000000000000, ADB5521579DAF431
// program: 0C3C2FF014074DAF, 0000000000000000, BEDAA9CD16F03204
// program: 0C3C2FF014074DAF, 0000000000000000, F4D2D5B8A05EA68E
// program: 0C3C2FF014074DAF, 0000000000000000, 6003142EC84B432C
// program: 0C3C2FF014074DAF, 0000000000000000, 8942E2ECC793F1EC
// program: 0C3C2FF014074DAF, 0000000000000000, CF3B95C22AB4B39C
// shader: 8B30, 2F8792AA8306010A
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((last_tev_out.aaa), (texcolor1.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
float fog_index = depth * 128.0;
float fog_i = clamp(floor(fog_index), 0.0, 127.0);
float fog_f = fog_index - fog_i;
vec2 fog_lut_entry = texelFetch(tex_lut_f, int(fog_i) + fog_lut_offset).rg;
float fog_factor = fog_lut_entry.r + fog_lut_entry.g * fog_f;
fog_factor = clamp(fog_factor, 0.0, 1.0);
last_tev_out.rgb = mix(fog_color.rgb, last_tev_out.rgb, fog_factor);
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 929376ABA5ADD08B
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((last_tev_out.aaa), (texcolor1.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
float fog_index = depth * 128.0;
float fog_i = clamp(floor(fog_index), 0.0, 127.0);
float fog_f = fog_index - fog_i;
vec2 fog_lut_entry = texelFetch(tex_lut_f, int(fog_i) + fog_lut_offset).rg;
float fog_factor = fog_lut_entry.r + fog_lut_entry.g * fog_f;
fog_factor = clamp(fog_factor, 0.0, 1.0);
last_tev_out.rgb = mix(fog_color.rgb, last_tev_out.rgb, fog_factor);
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, CF41077D04F8B95E
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((last_tev_out.aaa), (texcolor1.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) * (const_color[1].a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
float fog_index = depth * 128.0;
float fog_i = clamp(floor(fog_index), 0.0, 127.0);
float fog_f = fog_index - fog_i;
vec2 fog_lut_entry = texelFetch(tex_lut_f, int(fog_i) + fog_lut_offset).rg;
float fog_factor = fog_lut_entry.r + fog_lut_entry.g * fog_f;
fog_factor = clamp(fog_factor, 0.0, 1.0);
last_tev_out.rgb = mix(fog_color.rgb, last_tev_out.rgb, fog_factor);
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 53C79EFF92BC7855
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (const_color[0].a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
float fog_index = depth * 128.0;
float fog_i = clamp(floor(fog_index), 0.0, 127.0);
float fog_f = fog_index - fog_i;
vec2 fog_lut_entry = texelFetch(tex_lut_f, int(fog_i) + fog_lut_offset).rg;
float fog_factor = fog_lut_entry.r + fog_lut_entry.g * fog_f;
fog_factor = clamp(fog_factor, 0.0, 1.0);
last_tev_out.rgb = mix(fog_color.rgb, last_tev_out.rgb, fog_factor);
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 935713F1E0C3E74E
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((texcolor0.aaa), (texcolor1.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) * (const_color[1].a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
float fog_index = depth * 128.0;
float fog_i = clamp(floor(fog_index), 0.0, 127.0);
float fog_f = fog_index - fog_i;
vec2 fog_lut_entry = texelFetch(tex_lut_f, int(fog_i) + fog_lut_offset).rg;
float fog_factor = fog_lut_entry.r + fog_lut_entry.g * fog_f;
fog_factor = clamp(fog_factor, 0.0, 1.0);
last_tev_out.rgb = mix(fog_color.rgb, last_tev_out.rgb, fog_factor);
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 4BFE6708436FDB1D, 2F8792AA8306010A
// reference: 1E88C1CE436FDB1D, 929376ABA5ADD08B
// reference: 662AD3068B9B278C, CF41077D04F8B95E
// reference: 43A91D1099A79243, 53C79EFF92BC7855
// reference: A25E198823E841A8, 935713F1E0C3E74E
// program: 0C3C2FF014074DAF, 0000000000000000, 2F8792AA8306010A
// program: 0C3C2FF014074DAF, 0000000000000000, 929376ABA5ADD08B
// program: 0C3C2FF014074DAF, 0000000000000000, CF41077D04F8B95E
// program: 0C3C2FF014074DAF, 0000000000000000, 53C79EFF92BC7855
// program: 0C3C2FF014074DAF, 0000000000000000, 935713F1E0C3E74E
// shader: 8B30, AA5E19DF54E48185
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((last_tev_out.aaa), (texcolor1.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(fma((last_tev_out.rgb), (const_color[2].aaa), (const_color[2].rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
float fog_index = depth * 128.0;
float fog_i = clamp(floor(fog_index), 0.0, 127.0);
float fog_f = fog_index - fog_i;
vec2 fog_lut_entry = texelFetch(tex_lut_f, int(fog_i) + fog_lut_offset).rg;
float fog_factor = fog_lut_entry.r + fog_lut_entry.g * fog_f;
fog_factor = clamp(fog_factor, 0.0, 1.0);
last_tev_out.rgb = mix(fog_color.rgb, last_tev_out.rgb, fog_factor);
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 302F7C857138BE58
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((last_tev_out.rgb), (const_color[1].aaa), (const_color[1].rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
float fog_index = depth * 128.0;
float fog_i = clamp(floor(fog_index), 0.0, 127.0);
float fog_f = fog_index - fog_i;
vec2 fog_lut_entry = texelFetch(tex_lut_f, int(fog_i) + fog_lut_offset).rg;
float fog_factor = fog_lut_entry.r + fog_lut_entry.g * fog_f;
fog_factor = clamp(fog_factor, 0.0, 1.0);
last_tev_out.rgb = mix(fog_color.rgb, last_tev_out.rgb, fog_factor);
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 3313DEE2A5FA6709, AA5E19DF54E48185
// reference: 32168B1B142F4EEC, 302F7C857138BE58
// program: 0C3C2FF014074DAF, 0000000000000000, AA5E19DF54E48185
// program: 0C3C2FF014074DAF, 0000000000000000, 302F7C857138BE58
// shader: 8B30, 108926BF2B861367
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (const_color[0].aaa), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((texcolor1.rgb), (vec3(1) - const_color[1].aaa), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2 * 2.0, alpha_output_2 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
float fog_index = depth * 128.0;
float fog_i = clamp(floor(fog_index), 0.0, 127.0);
float fog_f = fog_index - fog_i;
vec2 fog_lut_entry = texelFetch(tex_lut_f, int(fog_i) + fog_lut_offset).rg;
float fog_factor = fog_lut_entry.r + fog_lut_entry.g * fog_f;
fog_factor = clamp(fog_factor, 0.0, 1.0);
last_tev_out.rgb = mix(fog_color.rgb, last_tev_out.rgb, fog_factor);
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 370C05E5CE66B8E7, 108926BF2B861367
// program: 0C3C2FF014074DAF, 0000000000000000, 108926BF2B861367
// shader: 8B30, 7B9BEB5D0B22A50D
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (texcolor0.aaa);
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0 * 4.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((const_color[1].rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (const_color[1].a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(fma((rounded_primary_color.rgb), (texcolor0.aaa), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: B4D5D94AA4D3DDEF, 7B9BEB5D0B22A50D
// program: 0C3C2FF014074DAF, 0000000000000000, 7B9BEB5D0B22A50D
// shader: 8B30, BC81A4E1C632B6BF
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((texcolor0.aaa), (const_color[1].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
float fog_index = depth * 128.0;
float fog_i = clamp(floor(fog_index), 0.0, 127.0);
float fog_f = fog_index - fog_i;
vec2 fog_lut_entry = texelFetch(tex_lut_f, int(fog_i) + fog_lut_offset).rg;
float fog_factor = fog_lut_entry.r + fog_lut_entry.g * fog_f;
fog_factor = clamp(fog_factor, 0.0, 1.0);
last_tev_out.rgb = mix(fog_color.rgb, last_tev_out.rgb, fog_factor);
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 32F25DF01BF8317E
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
float fog_index = depth * 128.0;
float fog_i = clamp(floor(fog_index), 0.0, 127.0);
float fog_f = fog_index - fog_i;
vec2 fog_lut_entry = texelFetch(tex_lut_f, int(fog_i) + fog_lut_offset).rg;
float fog_factor = fog_lut_entry.r + fog_lut_entry.g * fog_f;
fog_factor = clamp(fog_factor, 0.0, 1.0);
last_tev_out.rgb = mix(fog_color.rgb, last_tev_out.rgb, fog_factor);
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: DAFC0B400411470C, BC81A4E1C632B6BF
// reference: 87DDD79EE134E166, 32F25DF01BF8317E
// program: 0C3C2FF014074DAF, 0000000000000000, BC81A4E1C632B6BF
// program: 0C3C2FF014074DAF, 0000000000000000, 32F25DF01BF8317E
// shader: 8B30, 5491B30D9412C9B3
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) + (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 3F7F3FFE644E0BB3, 5491B30D9412C9B3
// program: 0C3C2FF014074DAF, 0000000000000000, 5491B30D9412C9B3
// shader: 8B30, 00FE9C9FCF8CBF17
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(fma((rounded_primary_color.rgb), (texcolor0.rgb), (texcolor1.rgb)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: DE2788B2F80E0BDA, 00FE9C9FCF8CBF17
// program: 0C3C2FF014074DAF, 0000000000000000, 00FE9C9FCF8CBF17
// shader: 8B30, 1314E90F0294647D
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((const_color[0].rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, A3E7B23A42D5C8D5
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((const_color[0].rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = (last_tev_out.rgb);
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) * (const_color[1].a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 43A91D108FF52467, 1314E90F0294647D
// reference: 3B0B0FD86E4BBAE4, A3E7B23A42D5C8D5
// program: 0C3C2FF014074DAF, 0000000000000000, 1314E90F0294647D
// program: 0C3C2FF014074DAF, 0000000000000000, A3E7B23A42D5C8D5
// shader: 8B30, AD744430A2CECB09
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
float scissor_y2;
float alphatest_ref;
float depth_scale;
float depth_offset;
float shadow_bias_constant;
float shadow_bias_linear;
int shadow_texture_bias;
int fog_lut_offset;
};

float ByteRound(float x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec3 ByteRound(vec3 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
vec4 ByteRound(vec4 x) {
    return round(x * 255.0) * (1.0 / 255.0);
}
float GetLod(vec2 coord) {
    vec2 d = max(abs(dFdx(coord)), abs(dFdy(coord)));
    return log2(max(d.x, d.y));
}

void main() {
vec4 rounded_primary_color = ByteRound(primary_color);
vec4 primary_fragment_color = vec4(0);
vec4 secondary_fragment_color = vec4(0);
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((last_tev_out.rgb), (const_color[1].aaa), (const_color[1].rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = (last_tev_out.rgb);
float alpha_output_2 = ByteRound(clamp((last_tev_out.a) * (const_color[2].a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
float fog_index = depth * 128.0;
float fog_i = clamp(floor(fog_index), 0.0, 127.0);
float fog_f = fog_index - fog_i;
vec2 fog_lut_entry = texelFetch(tex_lut_f, int(fog_i) + fog_lut_offset).rg;
float fog_factor = fog_lut_entry.r + fog_lut_entry.g * fog_f;
fog_factor = clamp(fog_factor, 0.0, 1.0);
last_tev_out.rgb = mix(fog_color.rgb, last_tev_out.rgb, fog_factor);
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: DD637287EFB45037, AD744430A2CECB09
// program: 0C3C2FF014074DAF, 0000000000000000, AD744430A2CECB09
