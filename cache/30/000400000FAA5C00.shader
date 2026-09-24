// shader: 8B31, EACE46D120C3BCAE

#define mul_s(x, y) (x * y)
#define fma_s(x, y, z) fma(x, y, z)
#define dot_s(x, y) dot(x, y)
#define dot_3(x, y) dot(x, y)

#define rcp_s(x) (1.0 / x)
#define rsq_s(x) inversesqrt(x)

#define min_s(x, y) min(x, y)
#define max_s(x, y) max(x, y)

layout(binding=4, std140) uniform vs_config {
bool b[16];
uvec4 i[4];
vec4 f[96];
}vs_pica;
bool ExecVS();
layout(location=0) in vec4 vs_in_reg0;
vec4 vs_out_reg0;
layout(location=1) in vec4 vs_in_reg1;
vec4 vs_out_reg1;
layout(location=2) in vec4 vs_in_reg2;
vec4 vs_out_reg2;
vec4 vs_out_reg3;
layout(location=0) out vec4 primary_color;
layout(location=1) out vec4 texcoord0;
layout(location=2) out vec4 texcoord12;
layout(location=3) out vec4 normquat;
layout(location=4) out vec4 view;

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
void EmitVtx() {
vec4 vtx_pos = vec4(vs_out_reg0.x,vs_out_reg0.y,vs_out_reg0.z,vs_out_reg0.w);
gl_Position = vtx_pos;
#if !defined(CITRA_GLES) || defined(GL_EXT_clip_cull_distance)
gl_ClipDistance[0] = -vtx_pos.z;
gl_ClipDistance[1] = dot(clip_coef, vtx_pos);
#endif
normquat = vec4(1,1,1,1);
vec4 vtx_color = vec4(vs_out_reg3.x,vs_out_reg3.y,vs_out_reg3.z,vs_out_reg3.w);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg1.x,vs_out_reg1.y,1,1);
texcoord12 = vec4(vs_out_reg2.x,vs_out_reg2.y,1,1);
view = vec4(1,1,1,1);
}
void main() {
vs_out_reg0 = vec4(0, 0, 0, 1);
vs_out_reg1 = vec4(0, 0, 0, 1);
vs_out_reg2 = vec4(0, 0, 0, 1);
vs_out_reg3 = vec4(0, 0, 0, 1);
ExecVS();
EmitVtx();
}
bvec2 bool_regs = bvec2(false);
ivec3 addr_regs = ivec3(0);
bool Vfn0();
bool ExecVS() {
Vfn0();
return true;
}

bool Vfn0() {
vs_out_reg0 = vs_in_reg0;
vs_out_reg1 = vs_in_reg1;
vs_out_reg2 = vs_in_reg1;
vs_out_reg3 = vs_in_reg2;
return true;
}
// shader: 8B30, 2144B6587E33EB67
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
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (rounded_primary_color.rgb);
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, C81B971DFA2A4196
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
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 7049A7D7E1F4C5EB
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
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (rounded_primary_color.rgb);
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 41A472D981C69615
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
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 20FD66970085C8B6
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
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 394A21325D36E10F, EACE46D120C3BCAE
// reference: 3012706582C53CA4, 2144B6587E33EB67
// reference: EEA32A7A5001975E, C81B971DFA2A4196
// reference: 30127065955D0490, 7049A7D7E1F4C5EB
// reference: 301270654799AF6A, 41A472D981C69615
// reference: 301270655001975E, 20FD66970085C8B6
// program: EACE46D120C3BCAE, 0000000000000000, 2144B6587E33EB67
// program: EACE46D120C3BCAE, 0000000000000000, C81B971DFA2A4196
// program: EACE46D120C3BCAE, 0000000000000000, 7049A7D7E1F4C5EB
// program: EACE46D120C3BCAE, 0000000000000000, 41A472D981C69615
// program: EACE46D120C3BCAE, 0000000000000000, 20FD66970085C8B6
// shader: 8B30, 7CB5F5D358AF2CC9
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
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (texcolor0.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 0F72AE0863D85C39
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
vec3 color_output_0 = (const_color[0].rgb);
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(mix((rounded_primary_color.rgb), (last_tev_out.rgb), (texcolor0.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (const_color[1].a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 701223403884441E
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
vec3 color_output_0 = (const_color[0].rgb);
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(mix((last_tev_out.rgb), (rounded_primary_color.rgb), (texcolor0.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (const_color[1].a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: EEA32A7A8CB51625, 7CB5F5D358AF2CC9
// reference: 44992E574A7005F1, 0F72AE0863D85C39
// reference: 44992E57765C5790, 701223403884441E
// program: EACE46D120C3BCAE, 0000000000000000, 7CB5F5D358AF2CC9
// program: EACE46D120C3BCAE, 0000000000000000, 0F72AE0863D85C39
// program: EACE46D120C3BCAE, 0000000000000000, 701223403884441E
// shader: 8B30, 8DEE1FBDA6FA4BE9
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
float alpha_output_0 = (texcolor0.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 301270658CB51625, 8DEE1FBDA6FA4BE9
// program: EACE46D120C3BCAE, 0000000000000000, 8DEE1FBDA6FA4BE9
// shader: 8B30, 67AC0214D65E2B37
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
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor0.a) * (rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 2AD7E0F48CB51625, 67AC0214D65E2B37
// program: EACE46D120C3BCAE, 0000000000000000, 67AC0214D65E2B37
// shader: 8B30, B494ECF1483A25EE
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
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 278E4AD7A63A7584
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
vec3 color_output_0 = ByteRound(clamp(mix((rounded_primary_color.rgb), (texcolor0.rgb), (texcolor0.aaa)), vec3(0), vec3(1)));
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: EEA32A7A4799AF6A, B494ECF1483A25EE
// reference: F1D5B674B6A9E7E6, 278E4AD7A63A7584
// program: EACE46D120C3BCAE, 0000000000000000, B494ECF1483A25EE
// program: EACE46D120C3BCAE, 0000000000000000, 278E4AD7A63A7584
// program: EACE46D120C3BCAE, 0000000000000000, 2144B6587E33EB67
// program: EACE46D120C3BCAE, 0000000000000000, C81B971DFA2A4196
// program: EACE46D120C3BCAE, 0000000000000000, 7049A7D7E1F4C5EB
// program: EACE46D120C3BCAE, 0000000000000000, 41A472D981C69615
// program: EACE46D120C3BCAE, 0000000000000000, 20FD66970085C8B6
// program: EACE46D120C3BCAE, 0000000000000000, 7CB5F5D358AF2CC9
// program: EACE46D120C3BCAE, 0000000000000000, 0F72AE0863D85C39
// program: EACE46D120C3BCAE, 0000000000000000, 701223403884441E
// program: EACE46D120C3BCAE, 0000000000000000, 8DEE1FBDA6FA4BE9
// program: EACE46D120C3BCAE, 0000000000000000, 67AC0214D65E2B37
// program: EACE46D120C3BCAE, 0000000000000000, B494ECF1483A25EE
// program: EACE46D120C3BCAE, 0000000000000000, 278E4AD7A63A7584
// program: EACE46D120C3BCAE, 0000000000000000, 2144B6587E33EB67
// program: EACE46D120C3BCAE, 0000000000000000, C81B971DFA2A4196
// program: EACE46D120C3BCAE, 0000000000000000, 7049A7D7E1F4C5EB
// program: EACE46D120C3BCAE, 0000000000000000, 41A472D981C69615
// program: EACE46D120C3BCAE, 0000000000000000, 20FD66970085C8B6
// program: EACE46D120C3BCAE, 0000000000000000, 7CB5F5D358AF2CC9
// program: EACE46D120C3BCAE, 0000000000000000, 0F72AE0863D85C39
// program: EACE46D120C3BCAE, 0000000000000000, 701223403884441E
// program: EACE46D120C3BCAE, 0000000000000000, 8DEE1FBDA6FA4BE9
// program: EACE46D120C3BCAE, 0000000000000000, 67AC0214D65E2B37
// program: EACE46D120C3BCAE, 0000000000000000, B494ECF1483A25EE
// program: EACE46D120C3BCAE, 0000000000000000, 278E4AD7A63A7584
// program: EACE46D120C3BCAE, 0000000000000000, 2144B6587E33EB67
// program: EACE46D120C3BCAE, 0000000000000000, C81B971DFA2A4196
// program: EACE46D120C3BCAE, 0000000000000000, 7049A7D7E1F4C5EB
// program: EACE46D120C3BCAE, 0000000000000000, 41A472D981C69615
// program: EACE46D120C3BCAE, 0000000000000000, 20FD66970085C8B6
// program: EACE46D120C3BCAE, 0000000000000000, 7CB5F5D358AF2CC9
// program: EACE46D120C3BCAE, 0000000000000000, 0F72AE0863D85C39
// program: EACE46D120C3BCAE, 0000000000000000, 701223403884441E
// program: EACE46D120C3BCAE, 0000000000000000, 8DEE1FBDA6FA4BE9
// program: EACE46D120C3BCAE, 0000000000000000, 67AC0214D65E2B37
// program: EACE46D120C3BCAE, 0000000000000000, B494ECF1483A25EE
// program: EACE46D120C3BCAE, 0000000000000000, 278E4AD7A63A7584
// program: EACE46D120C3BCAE, 0000000000000000, 2144B6587E33EB67
// program: EACE46D120C3BCAE, 0000000000000000, C81B971DFA2A4196
// program: EACE46D120C3BCAE, 0000000000000000, 7049A7D7E1F4C5EB
// program: EACE46D120C3BCAE, 0000000000000000, 41A472D981C69615
// program: EACE46D120C3BCAE, 0000000000000000, 20FD66970085C8B6
// program: EACE46D120C3BCAE, 0000000000000000, 7CB5F5D358AF2CC9
// program: EACE46D120C3BCAE, 0000000000000000, 0F72AE0863D85C39
// program: EACE46D120C3BCAE, 0000000000000000, 701223403884441E
// program: EACE46D120C3BCAE, 0000000000000000, 8DEE1FBDA6FA4BE9
// program: EACE46D120C3BCAE, 0000000000000000, 67AC0214D65E2B37
// program: EACE46D120C3BCAE, 0000000000000000, B494ECF1483A25EE
// program: EACE46D120C3BCAE, 0000000000000000, 278E4AD7A63A7584
// program: EACE46D120C3BCAE, 0000000000000000, 2144B6587E33EB67
// program: EACE46D120C3BCAE, 0000000000000000, C81B971DFA2A4196
// program: EACE46D120C3BCAE, 0000000000000000, 7049A7D7E1F4C5EB
// program: EACE46D120C3BCAE, 0000000000000000, 41A472D981C69615
// program: EACE46D120C3BCAE, 0000000000000000, 20FD66970085C8B6
// program: EACE46D120C3BCAE, 0000000000000000, 7CB5F5D358AF2CC9
// program: EACE46D120C3BCAE, 0000000000000000, 0F72AE0863D85C39
// program: EACE46D120C3BCAE, 0000000000000000, 701223403884441E
// program: EACE46D120C3BCAE, 0000000000000000, 8DEE1FBDA6FA4BE9
// program: EACE46D120C3BCAE, 0000000000000000, 67AC0214D65E2B37
// program: EACE46D120C3BCAE, 0000000000000000, B494ECF1483A25EE
// program: EACE46D120C3BCAE, 0000000000000000, 278E4AD7A63A7584
// program: EACE46D120C3BCAE, 0000000000000000, 2144B6587E33EB67
// program: EACE46D120C3BCAE, 0000000000000000, C81B971DFA2A4196
// program: EACE46D120C3BCAE, 0000000000000000, 7049A7D7E1F4C5EB
// program: EACE46D120C3BCAE, 0000000000000000, 41A472D981C69615
// program: EACE46D120C3BCAE, 0000000000000000, 20FD66970085C8B6
// program: EACE46D120C3BCAE, 0000000000000000, 7CB5F5D358AF2CC9
// program: EACE46D120C3BCAE, 0000000000000000, 0F72AE0863D85C39
// program: EACE46D120C3BCAE, 0000000000000000, 701223403884441E
// program: EACE46D120C3BCAE, 0000000000000000, 8DEE1FBDA6FA4BE9
// program: EACE46D120C3BCAE, 0000000000000000, 67AC0214D65E2B37
// program: EACE46D120C3BCAE, 0000000000000000, B494ECF1483A25EE
// program: EACE46D120C3BCAE, 0000000000000000, 278E4AD7A63A7584
// program: EACE46D120C3BCAE, 0000000000000000, 2144B6587E33EB67
// program: EACE46D120C3BCAE, 0000000000000000, C81B971DFA2A4196
// program: EACE46D120C3BCAE, 0000000000000000, 7049A7D7E1F4C5EB
// program: EACE46D120C3BCAE, 0000000000000000, 41A472D981C69615
// program: EACE46D120C3BCAE, 0000000000000000, 20FD66970085C8B6
// program: EACE46D120C3BCAE, 0000000000000000, 7CB5F5D358AF2CC9
// program: EACE46D120C3BCAE, 0000000000000000, 0F72AE0863D85C39
// program: EACE46D120C3BCAE, 0000000000000000, 701223403884441E
// program: EACE46D120C3BCAE, 0000000000000000, 8DEE1FBDA6FA4BE9
// program: EACE46D120C3BCAE, 0000000000000000, 67AC0214D65E2B37
// program: EACE46D120C3BCAE, 0000000000000000, B494ECF1483A25EE
// program: EACE46D120C3BCAE, 0000000000000000, 278E4AD7A63A7584
// program: EACE46D120C3BCAE, 0000000000000000, 2144B6587E33EB67
// program: EACE46D120C3BCAE, 0000000000000000, C81B971DFA2A4196
// program: EACE46D120C3BCAE, 0000000000000000, 7049A7D7E1F4C5EB
// program: EACE46D120C3BCAE, 0000000000000000, 41A472D981C69615
// program: EACE46D120C3BCAE, 0000000000000000, 20FD66970085C8B6
// program: EACE46D120C3BCAE, 0000000000000000, 7CB5F5D358AF2CC9
// program: EACE46D120C3BCAE, 0000000000000000, 0F72AE0863D85C39
// program: EACE46D120C3BCAE, 0000000000000000, 701223403884441E
// program: EACE46D120C3BCAE, 0000000000000000, 8DEE1FBDA6FA4BE9
// program: EACE46D120C3BCAE, 0000000000000000, 67AC0214D65E2B37
// program: EACE46D120C3BCAE, 0000000000000000, B494ECF1483A25EE
// program: EACE46D120C3BCAE, 0000000000000000, 278E4AD7A63A7584
// program: EACE46D120C3BCAE, 0000000000000000, 2144B6587E33EB67
// program: EACE46D120C3BCAE, 0000000000000000, C81B971DFA2A4196
// program: EACE46D120C3BCAE, 0000000000000000, 7049A7D7E1F4C5EB
// program: EACE46D120C3BCAE, 0000000000000000, 41A472D981C69615
// program: EACE46D120C3BCAE, 0000000000000000, 20FD66970085C8B6
// program: EACE46D120C3BCAE, 0000000000000000, 7CB5F5D358AF2CC9
// program: EACE46D120C3BCAE, 0000000000000000, 0F72AE0863D85C39
// program: EACE46D120C3BCAE, 0000000000000000, 701223403884441E
// program: EACE46D120C3BCAE, 0000000000000000, 8DEE1FBDA6FA4BE9
// program: EACE46D120C3BCAE, 0000000000000000, 67AC0214D65E2B37
// program: EACE46D120C3BCAE, 0000000000000000, B494ECF1483A25EE
// program: EACE46D120C3BCAE, 0000000000000000, 278E4AD7A63A7584
// program: EACE46D120C3BCAE, 0000000000000000, 2144B6587E33EB67
// program: EACE46D120C3BCAE, 0000000000000000, C81B971DFA2A4196
// program: EACE46D120C3BCAE, 0000000000000000, 7049A7D7E1F4C5EB
// program: EACE46D120C3BCAE, 0000000000000000, 41A472D981C69615
// program: EACE46D120C3BCAE, 0000000000000000, 20FD66970085C8B6
// program: EACE46D120C3BCAE, 0000000000000000, 7CB5F5D358AF2CC9
// program: EACE46D120C3BCAE, 0000000000000000, 0F72AE0863D85C39
// program: EACE46D120C3BCAE, 0000000000000000, 701223403884441E
// program: EACE46D120C3BCAE, 0000000000000000, 8DEE1FBDA6FA4BE9
// program: EACE46D120C3BCAE, 0000000000000000, 67AC0214D65E2B37
// program: EACE46D120C3BCAE, 0000000000000000, B494ECF1483A25EE
// program: EACE46D120C3BCAE, 0000000000000000, 278E4AD7A63A7584
// program: EACE46D120C3BCAE, 0000000000000000, 2144B6587E33EB67
// program: EACE46D120C3BCAE, 0000000000000000, C81B971DFA2A4196
// program: EACE46D120C3BCAE, 0000000000000000, 7049A7D7E1F4C5EB
// program: EACE46D120C3BCAE, 0000000000000000, 41A472D981C69615
// program: EACE46D120C3BCAE, 0000000000000000, 20FD66970085C8B6
// program: EACE46D120C3BCAE, 0000000000000000, 7CB5F5D358AF2CC9
// program: EACE46D120C3BCAE, 0000000000000000, 0F72AE0863D85C39
// program: EACE46D120C3BCAE, 0000000000000000, 701223403884441E
// program: EACE46D120C3BCAE, 0000000000000000, 8DEE1FBDA6FA4BE9
// program: EACE46D120C3BCAE, 0000000000000000, 67AC0214D65E2B37
// program: EACE46D120C3BCAE, 0000000000000000, B494ECF1483A25EE
// program: EACE46D120C3BCAE, 0000000000000000, 278E4AD7A63A7584
// program: EACE46D120C3BCAE, 0000000000000000, 2144B6587E33EB67
// program: EACE46D120C3BCAE, 0000000000000000, C81B971DFA2A4196
// program: EACE46D120C3BCAE, 0000000000000000, 7049A7D7E1F4C5EB
// program: EACE46D120C3BCAE, 0000000000000000, 41A472D981C69615
// program: EACE46D120C3BCAE, 0000000000000000, 20FD66970085C8B6
// program: EACE46D120C3BCAE, 0000000000000000, 7CB5F5D358AF2CC9
// program: EACE46D120C3BCAE, 0000000000000000, 0F72AE0863D85C39
// program: EACE46D120C3BCAE, 0000000000000000, 701223403884441E
// program: EACE46D120C3BCAE, 0000000000000000, 8DEE1FBDA6FA4BE9
// program: EACE46D120C3BCAE, 0000000000000000, 67AC0214D65E2B37
// program: EACE46D120C3BCAE, 0000000000000000, B494ECF1483A25EE
// program: EACE46D120C3BCAE, 0000000000000000, 278E4AD7A63A7584
// program: EACE46D120C3BCAE, 0000000000000000, 2144B6587E33EB67
// program: EACE46D120C3BCAE, 0000000000000000, C81B971DFA2A4196
// program: EACE46D120C3BCAE, 0000000000000000, 7049A7D7E1F4C5EB
// program: EACE46D120C3BCAE, 0000000000000000, 41A472D981C69615
// program: EACE46D120C3BCAE, 0000000000000000, 20FD66970085C8B6
// program: EACE46D120C3BCAE, 0000000000000000, 7CB5F5D358AF2CC9
// program: EACE46D120C3BCAE, 0000000000000000, 0F72AE0863D85C39
// program: EACE46D120C3BCAE, 0000000000000000, 701223403884441E
// program: EACE46D120C3BCAE, 0000000000000000, 8DEE1FBDA6FA4BE9
// program: EACE46D120C3BCAE, 0000000000000000, 67AC0214D65E2B37
// program: EACE46D120C3BCAE, 0000000000000000, B494ECF1483A25EE
// program: EACE46D120C3BCAE, 0000000000000000, 278E4AD7A63A7584
// program: EACE46D120C3BCAE, 0000000000000000, 2144B6587E33EB67
// program: EACE46D120C3BCAE, 0000000000000000, C81B971DFA2A4196
// program: EACE46D120C3BCAE, 0000000000000000, 7049A7D7E1F4C5EB
// program: EACE46D120C3BCAE, 0000000000000000, 41A472D981C69615
// program: EACE46D120C3BCAE, 0000000000000000, 20FD66970085C8B6
// program: EACE46D120C3BCAE, 0000000000000000, 7CB5F5D358AF2CC9
// program: EACE46D120C3BCAE, 0000000000000000, 0F72AE0863D85C39
// program: EACE46D120C3BCAE, 0000000000000000, 701223403884441E
// program: EACE46D120C3BCAE, 0000000000000000, 8DEE1FBDA6FA4BE9
// program: EACE46D120C3BCAE, 0000000000000000, 67AC0214D65E2B37
// program: EACE46D120C3BCAE, 0000000000000000, B494ECF1483A25EE
// program: EACE46D120C3BCAE, 0000000000000000, 278E4AD7A63A7584
// program: EACE46D120C3BCAE, 0000000000000000, 2144B6587E33EB67
// program: EACE46D120C3BCAE, 0000000000000000, C81B971DFA2A4196
// program: EACE46D120C3BCAE, 0000000000000000, 7049A7D7E1F4C5EB
// program: EACE46D120C3BCAE, 0000000000000000, 41A472D981C69615
// program: EACE46D120C3BCAE, 0000000000000000, 20FD66970085C8B6
// program: EACE46D120C3BCAE, 0000000000000000, 7CB5F5D358AF2CC9
// program: EACE46D120C3BCAE, 0000000000000000, 0F72AE0863D85C39
// program: EACE46D120C3BCAE, 0000000000000000, 701223403884441E
// program: EACE46D120C3BCAE, 0000000000000000, 8DEE1FBDA6FA4BE9
// program: EACE46D120C3BCAE, 0000000000000000, 67AC0214D65E2B37
// program: EACE46D120C3BCAE, 0000000000000000, B494ECF1483A25EE
// program: EACE46D120C3BCAE, 0000000000000000, 278E4AD7A63A7584
// program: EACE46D120C3BCAE, 0000000000000000, 2144B6587E33EB67
// program: EACE46D120C3BCAE, 0000000000000000, C81B971DFA2A4196
// program: EACE46D120C3BCAE, 0000000000000000, 7049A7D7E1F4C5EB
// program: EACE46D120C3BCAE, 0000000000000000, 41A472D981C69615
// program: EACE46D120C3BCAE, 0000000000000000, 20FD66970085C8B6
// program: EACE46D120C3BCAE, 0000000000000000, 7CB5F5D358AF2CC9
// program: EACE46D120C3BCAE, 0000000000000000, 0F72AE0863D85C39
// program: EACE46D120C3BCAE, 0000000000000000, 701223403884441E
// program: EACE46D120C3BCAE, 0000000000000000, 8DEE1FBDA6FA4BE9
// program: EACE46D120C3BCAE, 0000000000000000, 67AC0214D65E2B37
// program: EACE46D120C3BCAE, 0000000000000000, B494ECF1483A25EE
// program: EACE46D120C3BCAE, 0000000000000000, 278E4AD7A63A7584
// program: EACE46D120C3BCAE, 0000000000000000, 2144B6587E33EB67
// program: EACE46D120C3BCAE, 0000000000000000, C81B971DFA2A4196
// program: EACE46D120C3BCAE, 0000000000000000, 7049A7D7E1F4C5EB
// program: EACE46D120C3BCAE, 0000000000000000, 41A472D981C69615
// program: EACE46D120C3BCAE, 0000000000000000, 20FD66970085C8B6
// program: EACE46D120C3BCAE, 0000000000000000, 7CB5F5D358AF2CC9
// program: EACE46D120C3BCAE, 0000000000000000, 0F72AE0863D85C39
// program: EACE46D120C3BCAE, 0000000000000000, 701223403884441E
// program: EACE46D120C3BCAE, 0000000000000000, 8DEE1FBDA6FA4BE9
// program: EACE46D120C3BCAE, 0000000000000000, 67AC0214D65E2B37
// program: EACE46D120C3BCAE, 0000000000000000, B494ECF1483A25EE
// program: EACE46D120C3BCAE, 0000000000000000, 278E4AD7A63A7584
// program: EACE46D120C3BCAE, 0000000000000000, 2144B6587E33EB67
// program: EACE46D120C3BCAE, 0000000000000000, C81B971DFA2A4196
// program: EACE46D120C3BCAE, 0000000000000000, 7049A7D7E1F4C5EB
// program: EACE46D120C3BCAE, 0000000000000000, 41A472D981C69615
// program: EACE46D120C3BCAE, 0000000000000000, 20FD66970085C8B6
// program: EACE46D120C3BCAE, 0000000000000000, 7CB5F5D358AF2CC9
// program: EACE46D120C3BCAE, 0000000000000000, 0F72AE0863D85C39
// program: EACE46D120C3BCAE, 0000000000000000, 701223403884441E
// program: EACE46D120C3BCAE, 0000000000000000, 8DEE1FBDA6FA4BE9
// program: EACE46D120C3BCAE, 0000000000000000, 67AC0214D65E2B37
// program: EACE46D120C3BCAE, 0000000000000000, B494ECF1483A25EE
// program: EACE46D120C3BCAE, 0000000000000000, 278E4AD7A63A7584
// program: EACE46D120C3BCAE, 0000000000000000, 2144B6587E33EB67
// program: EACE46D120C3BCAE, 0000000000000000, C81B971DFA2A4196
// program: EACE46D120C3BCAE, 0000000000000000, 7049A7D7E1F4C5EB
// program: EACE46D120C3BCAE, 0000000000000000, 41A472D981C69615
// program: EACE46D120C3BCAE, 0000000000000000, 20FD66970085C8B6
// program: EACE46D120C3BCAE, 0000000000000000, 7CB5F5D358AF2CC9
// program: EACE46D120C3BCAE, 0000000000000000, 0F72AE0863D85C39
// program: EACE46D120C3BCAE, 0000000000000000, 701223403884441E
// program: EACE46D120C3BCAE, 0000000000000000, 8DEE1FBDA6FA4BE9
// program: EACE46D120C3BCAE, 0000000000000000, 67AC0214D65E2B37
// program: EACE46D120C3BCAE, 0000000000000000, B494ECF1483A25EE
// program: EACE46D120C3BCAE, 0000000000000000, 278E4AD7A63A7584
// program: EACE46D120C3BCAE, 0000000000000000, 2144B6587E33EB67
// program: EACE46D120C3BCAE, 0000000000000000, C81B971DFA2A4196
// program: EACE46D120C3BCAE, 0000000000000000, 7049A7D7E1F4C5EB
// program: EACE46D120C3BCAE, 0000000000000000, 41A472D981C69615
// program: EACE46D120C3BCAE, 0000000000000000, 20FD66970085C8B6
// program: EACE46D120C3BCAE, 0000000000000000, 7CB5F5D358AF2CC9
// program: EACE46D120C3BCAE, 0000000000000000, 0F72AE0863D85C39
// program: EACE46D120C3BCAE, 0000000000000000, 701223403884441E
// program: EACE46D120C3BCAE, 0000000000000000, 8DEE1FBDA6FA4BE9
// program: EACE46D120C3BCAE, 0000000000000000, 67AC0214D65E2B37
// program: EACE46D120C3BCAE, 0000000000000000, B494ECF1483A25EE
// program: EACE46D120C3BCAE, 0000000000000000, 278E4AD7A63A7584
// program: EACE46D120C3BCAE, 0000000000000000, 2144B6587E33EB67
// program: EACE46D120C3BCAE, 0000000000000000, C81B971DFA2A4196
// program: EACE46D120C3BCAE, 0000000000000000, 7049A7D7E1F4C5EB
// program: EACE46D120C3BCAE, 0000000000000000, 41A472D981C69615
// program: EACE46D120C3BCAE, 0000000000000000, 20FD66970085C8B6
// program: EACE46D120C3BCAE, 0000000000000000, 7CB5F5D358AF2CC9
// program: EACE46D120C3BCAE, 0000000000000000, 0F72AE0863D85C39
// program: EACE46D120C3BCAE, 0000000000000000, 701223403884441E
// program: EACE46D120C3BCAE, 0000000000000000, 8DEE1FBDA6FA4BE9
// program: EACE46D120C3BCAE, 0000000000000000, 67AC0214D65E2B37
// program: EACE46D120C3BCAE, 0000000000000000, B494ECF1483A25EE
// program: EACE46D120C3BCAE, 0000000000000000, 278E4AD7A63A7584
// program: EACE46D120C3BCAE, 0000000000000000, 2144B6587E33EB67
// program: EACE46D120C3BCAE, 0000000000000000, C81B971DFA2A4196
// program: EACE46D120C3BCAE, 0000000000000000, 7049A7D7E1F4C5EB
// program: EACE46D120C3BCAE, 0000000000000000, 41A472D981C69615
// program: EACE46D120C3BCAE, 0000000000000000, 20FD66970085C8B6
// program: EACE46D120C3BCAE, 0000000000000000, 7CB5F5D358AF2CC9
// program: EACE46D120C3BCAE, 0000000000000000, 0F72AE0863D85C39
// program: EACE46D120C3BCAE, 0000000000000000, 701223403884441E
// program: EACE46D120C3BCAE, 0000000000000000, 8DEE1FBDA6FA4BE9
// program: EACE46D120C3BCAE, 0000000000000000, 67AC0214D65E2B37
// program: EACE46D120C3BCAE, 0000000000000000, B494ECF1483A25EE
// program: EACE46D120C3BCAE, 0000000000000000, 278E4AD7A63A7584
