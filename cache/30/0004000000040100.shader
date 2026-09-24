// shader: 8B31, EB7BD1C7D580F20F

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
vec4 vtx_color = vec4(1,1,1,1);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg1.x,vs_out_reg1.y,1,1);
texcoord12 = vec4(vs_out_reg2.x,vs_out_reg2.y,vs_out_reg3.x,vs_out_reg3.y);
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
vs_out_reg3 = vs_in_reg1;
return true;
}
// shader: 8B30, AF71FBBEF5C90E84
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
vec4 texcolor2 = textureLod(tex2, texcoord12.zw, GetLod(texcoord12.zw * vec2(textureSize(tex2, 0))) + tex_lod_bias[2]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (const_color[0].rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor1.r) * (const_color[0].a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp(fma((texcolor1.rgb), (const_color[1].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp(fma((texcolor0.r), (const_color[1].a), (combiner_buffer.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp(fma((texcolor2.rgb), (const_color[2].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((last_tev_out.a) - (combiner_buffer.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) - (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor2.r) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_4 = (last_tev_out.rgb);
float alpha_output_4 = ByteRound(clamp((combiner_buffer.a) - (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp(fma((last_tev_out.aaa), (const_color[5].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_5 = (last_tev_out.a);
last_tev_out = vec4(color_output_5 * 2.0, alpha_output_5 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B31, 4D59A06C77FA9113

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
vec4 vtx_color = vec4(1,1,1,1);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg1.x,vs_out_reg1.y,1,1);
texcoord12 = vec4(1,1,1,1);
view = vec4(1,1,1,1);
}
void main() {
vs_out_reg0 = vec4(0, 0, 0, 1);
vs_out_reg1 = vec4(0, 0, 0, 1);
ExecVS();
EmitVtx();
}
bvec2 bool_regs = bvec2(false);
ivec3 addr_regs = ivec3(0);
bool Vfn0();
vec4 tmp_reg15;
bool ExecVS() {
tmp_reg15 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn0() {
tmp_reg15.x = dot_s(vs_pica.f[4], vs_in_reg0);
tmp_reg15.y = dot_s(vs_pica.f[5], vs_in_reg0);
tmp_reg15.z = dot_s(vs_pica.f[6], vs_in_reg0);
tmp_reg15.w = dot_s(vs_pica.f[7], vs_in_reg0);
vs_out_reg0.x = dot_s(vs_pica.f[0], tmp_reg15);
vs_out_reg0.y = dot_s(vs_pica.f[1], tmp_reg15);
vs_out_reg0.z = dot_s(vs_pica.f[2], tmp_reg15);
vs_out_reg0.w = dot_s(vs_pica.f[3], tmp_reg15);
vs_out_reg1 = vs_in_reg1;
return true;
}
// shader: 8B30, 4C390CB5B5793EF1
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
vec3 color_output_5 = ByteRound(clamp((const_color[5].rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((const_color[5].a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: E839644B736D1A66, EB7BD1C7D580F20F
// reference: AC941B3A179A059C, AF71FBBEF5C90E84
// reference: 0F1B96060D4FC6E5, 4D59A06C77FA9113
// reference: D4D18F9F9A3DCD98, 4C390CB5B5793EF1
// reference: D2AB3004736D1A66, EB7BD1C7D580F20F
// program: EB7BD1C7D580F20F, 0000000000000000, AF71FBBEF5C90E84
// program: 4D59A06C77FA9113, 0000000000000000, 4C390CB5B5793EF1
// reference: A734F699736D1A66, EB7BD1C7D580F20F
// shader: 8B30, D74A632D8F00C106
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
vec3 color_output_0 = (const_color[0].rgb);
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_5 = (const_color[5].rgb);
float alpha_output_5 = (const_color[5].a);
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 596C8D819A3DCD98, D74A632D8F00C106
// program: 4D59A06C77FA9113, 0000000000000000, D74A632D8F00C106
// program: EB7BD1C7D580F20F, 0000000000000000, AF71FBBEF5C90E84
// program: 4D59A06C77FA9113, 0000000000000000, 4C390CB5B5793EF1
// program: 4D59A06C77FA9113, 0000000000000000, D74A632D8F00C106
// program: EB7BD1C7D580F20F, 0000000000000000, AF71FBBEF5C90E84
// program: 4D59A06C77FA9113, 0000000000000000, 4C390CB5B5793EF1
// program: 4D59A06C77FA9113, 0000000000000000, D74A632D8F00C106
// shader: 8B31, C09BB54F87903F2D

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
layout(location=3) in vec4 vs_in_reg3;
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
vec4 vtx_color = vec4(vs_out_reg1.x,vs_out_reg1.y,vs_out_reg1.z,vs_out_reg1.w);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg2.x,vs_out_reg2.y,vs_out_reg2.z,1);
texcoord12 = vec4(vs_out_reg3.x,vs_out_reg3.y,vs_out_reg3.z,vs_out_reg3.w);
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
bool Vfn1();
vec4 tmp_reg0;
vec4 tmp_reg1;
vec4 tmp_reg2;
vec4 tmp_reg3;
vec4 tmp_reg6;
vec4 tmp_reg7;
vec4 tmp_reg8;
vec4 tmp_reg10;
vec4 tmp_reg11;
vec4 tmp_reg12;
vec4 tmp_reg13;
vec4 tmp_reg14;
vec4 tmp_reg15;
bool ExecVS() {
tmp_reg0 = vec4(0, 0, 0, 1);
tmp_reg1 = vec4(0, 0, 0, 1);
tmp_reg2 = vec4(0, 0, 0, 1);
tmp_reg3 = vec4(0, 0, 0, 1);
tmp_reg6 = vec4(0, 0, 0, 1);
tmp_reg7 = vec4(0, 0, 0, 1);
tmp_reg8 = vec4(0, 0, 0, 1);
tmp_reg10 = vec4(0, 0, 0, 1);
tmp_reg11 = vec4(0, 0, 0, 1);
tmp_reg12 = vec4(0, 0, 0, 1);
tmp_reg13 = vec4(0, 0, 0, 1);
tmp_reg14 = vec4(0, 0, 0, 1);
tmp_reg15 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn0() {
tmp_reg15 = mul_s(vs_pica.f[9].xxxx, vs_in_reg0);
tmp_reg14 = mul_s(vs_pica.f[9].yyyy, vs_in_reg1);
tmp_reg13 = mul_s(vs_pica.f[9].wwww, vs_in_reg3);
tmp_reg12 = vs_pica.f[10] + -tmp_reg15;
tmp_reg0 = vec4(dot_3(tmp_reg12.xyz, tmp_reg12.xyz));
tmp_reg0 = vec4(rsq_s(tmp_reg0.x));
tmp_reg12 = mul_s(tmp_reg12, tmp_reg0);
addr_regs.x = (ivec2(vs_pica.f[94].ww)).x;
if (vs_pica.b[0]) {
Vfn1();
}
addr_regs.x = (ivec2(vs_pica.f[94].xx)).x;
if (vs_pica.b[1]) {
Vfn1();
}
addr_regs.x = (ivec2(vs_pica.f[94].yy)).x;
if (vs_pica.b[2]) {
Vfn1();
}
addr_regs.x = (ivec2(vs_pica.f[94].zz)).x;
if (vs_pica.b[3]) {
Vfn1();
}
tmp_reg0.xy = (vs_in_reg2.xyyy).xy;
tmp_reg0.zw = (vs_pica.f[94].wwww).zw;
tmp_reg12.x = dot_s(vec4(tmp_reg0.xyz, 1.0), vs_pica.f[7]);
tmp_reg12.y = dot_s(vec4(tmp_reg0.xyz, 1.0), vs_pica.f[8]);
tmp_reg11 = vs_pica.f[94].wwww;
tmp_reg10 = vs_pica.f[94].wwww;
tmp_reg0.x = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[4]);
tmp_reg0.y = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[5]);
tmp_reg0.z = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[6]);
vs_out_reg0.x = dot_s(vec4(tmp_reg0.xyz, 1.0), vs_pica.f[0]);
vs_out_reg0.y = dot_s(vec4(tmp_reg0.xyz, 1.0), vs_pica.f[1]);
vs_out_reg0.z = dot_s(vec4(tmp_reg0.xyz, 1.0), vs_pica.f[2]);
vs_out_reg0.w = dot_s(vec4(tmp_reg0.xyz, 1.0), vs_pica.f[3]);
vs_out_reg1 = tmp_reg13;
vs_out_reg3.x = (tmp_reg12.xxxx).x;
vs_out_reg3.y = (tmp_reg12.yyyy).y;
vs_out_reg3.z = (tmp_reg11.xxxx).z;
vs_out_reg3.w = (tmp_reg11.yyyy).w;
vs_out_reg2 = tmp_reg10;
return true;
}
bool Vfn1() {
tmp_reg2 = vs_pica.f[94].xxxx;
tmp_reg1 = vs_pica.f[11 + addr_regs.x] + -tmp_reg15;
tmp_reg2.x = dot_3(tmp_reg1.xyz, tmp_reg1.xyz);
tmp_reg2.y = rsq_s(tmp_reg2.x);
tmp_reg1 = mul_s(tmp_reg1, tmp_reg2.yyyy);
tmp_reg2.y = rcp_s(tmp_reg2.y);
tmp_reg2.w = dot_3(tmp_reg1.xyz, tmp_reg14.xyz);
tmp_reg6 = vec4(dot_3(vs_pica.f[15 + addr_regs.x].xyz, -tmp_reg1.xyz));
tmp_reg6 = mul_s(vs_pica.f[27 + addr_regs.x].xxxx, tmp_reg6);
tmp_reg6 = vs_pica.f[27 + addr_regs.x].yyyy + tmp_reg6;
tmp_reg3.x = (max_s(vs_pica.f[94].wwww, tmp_reg6.xxxx)).x;
tmp_reg3.x = (min_s(vs_pica.f[94].xxxx, tmp_reg3.xxxx)).x;
tmp_reg6 = max_s(vs_pica.f[94].wwww, tmp_reg2.wwww);
tmp_reg6 = min_s(vs_pica.f[94].xxxx, tmp_reg6);
tmp_reg7.x = (mul_s(vs_pica.f[23 + addr_regs.x].yyyy, tmp_reg2.yyyy)).x;
tmp_reg7.x = (vs_pica.f[94].xxxx + -tmp_reg7.xxxx).x;
tmp_reg7.x = (max_s(vs_pica.f[94].wwww, tmp_reg7.xxxx)).x;
tmp_reg7.x = (min_s(vs_pica.f[94].xxxx, tmp_reg7.xxxx)).x;
tmp_reg7.x = (mul_s(tmp_reg7.xxxx, tmp_reg3.xxxx)).x;
tmp_reg8 = mul_s(vs_pica.f[19 + addr_regs.x], tmp_reg6);
tmp_reg13.xyz = (fma_s(tmp_reg7.xxxx, tmp_reg8, tmp_reg13)).xyz;
return false;
}
// shader: 8B30, 6A7E80280F7F6A2B
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
depth /= gl_FragCoord.w;
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (const_color[0].rgb);
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = (rounded_primary_color.rgb);
float alpha_output_1 = (texcolor1.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(min((const_color[2].rgb) + (last_tev_out.rgb), vec3(1)) * (texcolor1.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((const_color[2].a) * (texcolor1.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2 * 2.0, alpha_output_2 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B31, F13586FEF28F29C7

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
layout(location=3) in vec4 vs_in_reg3;
vec4 vs_out_reg3;
layout(location=4) in vec4 vs_in_reg4;
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
vec4 vtx_color = vec4(vs_out_reg1.x,vs_out_reg1.y,vs_out_reg1.z,vs_out_reg1.w);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg2.x,vs_out_reg2.y,vs_out_reg2.z,1);
texcoord12 = vec4(vs_out_reg3.x,vs_out_reg3.y,vs_out_reg3.z,vs_out_reg3.w);
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
bool Vfn1();
vec4 tmp_reg0;
vec4 tmp_reg1;
vec4 tmp_reg2;
vec4 tmp_reg3;
vec4 tmp_reg5;
vec4 tmp_reg6;
vec4 tmp_reg7;
vec4 tmp_reg8;
vec4 tmp_reg10;
vec4 tmp_reg11;
vec4 tmp_reg12;
vec4 tmp_reg13;
vec4 tmp_reg14;
vec4 tmp_reg15;
bool ExecVS() {
tmp_reg0 = vec4(0, 0, 0, 1);
tmp_reg1 = vec4(0, 0, 0, 1);
tmp_reg2 = vec4(0, 0, 0, 1);
tmp_reg3 = vec4(0, 0, 0, 1);
tmp_reg5 = vec4(0, 0, 0, 1);
tmp_reg6 = vec4(0, 0, 0, 1);
tmp_reg7 = vec4(0, 0, 0, 1);
tmp_reg8 = vec4(0, 0, 0, 1);
tmp_reg10 = vec4(0, 0, 0, 1);
tmp_reg11 = vec4(0, 0, 0, 1);
tmp_reg12 = vec4(0, 0, 0, 1);
tmp_reg13 = vec4(0, 0, 0, 1);
tmp_reg14 = vec4(0, 0, 0, 1);
tmp_reg15 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn0() {
tmp_reg15 = mul_s(vs_pica.f[9].xxxx, vs_in_reg0);
tmp_reg14 = mul_s(vs_pica.f[9].yyyy, vs_in_reg1);
tmp_reg0 = mul_s(vs_pica.f[94].zzzz, vs_in_reg4);
addr_regs.xy = ivec2(tmp_reg0.xy);
tmp_reg1.x = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[31 + addr_regs.x]);
tmp_reg1.y = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[32 + addr_regs.x]);
tmp_reg1.z = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[33 + addr_regs.x]);
tmp_reg2.x = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[31 + addr_regs.y]);
tmp_reg2.y = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[32 + addr_regs.y]);
tmp_reg2.z = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[33 + addr_regs.y]);
tmp_reg5.x = dot_3(vs_pica.f[31 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg5.y = dot_3(vs_pica.f[32 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg5.z = dot_3(vs_pica.f[33 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg6.x = dot_3(vs_pica.f[31 + addr_regs.y].xyz, tmp_reg14.xyz);
tmp_reg6.y = dot_3(vs_pica.f[32 + addr_regs.y].xyz, tmp_reg14.xyz);
tmp_reg6.z = dot_3(vs_pica.f[33 + addr_regs.y].xyz, tmp_reg14.xyz);
addr_regs.xy = ivec2(tmp_reg0.zw);
tmp_reg3.x = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[31 + addr_regs.x]);
tmp_reg3.y = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[32 + addr_regs.x]);
tmp_reg3.z = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[33 + addr_regs.x]);
tmp_reg7.x = dot_3(vs_pica.f[31 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg7.y = dot_3(vs_pica.f[32 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg7.z = dot_3(vs_pica.f[33 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg13 = mul_s(vs_pica.f[9].wwww, vs_in_reg3);
tmp_reg15 = mul_s(tmp_reg1, tmp_reg13.xxxx);
tmp_reg15 = fma_s(tmp_reg2, tmp_reg13.yyyy, tmp_reg15);
tmp_reg15 = fma_s(tmp_reg3, tmp_reg13.zzzz, tmp_reg15);
tmp_reg14 = mul_s(tmp_reg5, tmp_reg13.xxxx);
tmp_reg14 = fma_s(tmp_reg6, tmp_reg13.yyyy, tmp_reg14);
tmp_reg14 = fma_s(tmp_reg7, tmp_reg13.zzzz, tmp_reg14);
tmp_reg13.xyz = (vs_pica.f[94].wwww).xyz;
tmp_reg13.w = (vs_pica.f[94].xxxx).w;
tmp_reg12 = vs_pica.f[10] + -tmp_reg15;
tmp_reg0 = vec4(dot_3(tmp_reg12.xyz, tmp_reg12.xyz));
tmp_reg0 = vec4(rsq_s(tmp_reg0.x));
tmp_reg12 = mul_s(tmp_reg12, tmp_reg0);
addr_regs.x = (ivec2(vs_pica.f[94].ww)).x;
if (vs_pica.b[0]) {
Vfn1();
}
addr_regs.x = (ivec2(vs_pica.f[94].xx)).x;
if (vs_pica.b[1]) {
Vfn1();
}
addr_regs.x = (ivec2(vs_pica.f[94].yy)).x;
if (vs_pica.b[2]) {
Vfn1();
}
addr_regs.x = (ivec2(vs_pica.f[94].zz)).x;
if (vs_pica.b[3]) {
Vfn1();
}
tmp_reg1.x = dot_3(vs_pica.f[6].xyz, tmp_reg14.xyz);
tmp_reg2.x = (vs_pica.f[94].xxxx + tmp_reg1.xxxx).x;
tmp_reg3.x = (mul_s(vs_pica.f[95].xxxx, tmp_reg2.xxxx)).x;
tmp_reg6.x = (vs_pica.f[95].yyyy + -tmp_reg3.xxxx).x;
tmp_reg2.x = (max_s(vs_pica.f[94].wwww, tmp_reg6.xxxx)).x;
tmp_reg13.xyz = (tmp_reg13.xyzz + tmp_reg2.xxxx).xyz;
tmp_reg0.xy = (vs_in_reg2.xyyy).xy;
tmp_reg0.zw = (vs_pica.f[94].wwww).zw;
tmp_reg12.x = dot_s(vec4(tmp_reg0.xyz, 1.0), vs_pica.f[7]);
tmp_reg12.y = dot_s(vec4(tmp_reg0.xyz, 1.0), vs_pica.f[8]);
tmp_reg11 = vs_pica.f[94].wwww;
tmp_reg10 = vs_pica.f[94].wwww;
tmp_reg0.x = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[4]);
tmp_reg0.y = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[5]);
tmp_reg0.z = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[6]);
vs_out_reg0.x = dot_s(vec4(tmp_reg0.xyz, 1.0), vs_pica.f[0]);
vs_out_reg0.y = dot_s(vec4(tmp_reg0.xyz, 1.0), vs_pica.f[1]);
vs_out_reg0.z = dot_s(vec4(tmp_reg0.xyz, 1.0), vs_pica.f[2]);
vs_out_reg0.w = dot_s(vec4(tmp_reg0.xyz, 1.0), vs_pica.f[3]);
vs_out_reg1 = tmp_reg13;
vs_out_reg3.x = (tmp_reg12.xxxx).x;
vs_out_reg3.y = (tmp_reg12.yyyy).y;
vs_out_reg3.z = (tmp_reg11.xxxx).z;
vs_out_reg3.w = (tmp_reg11.yyyy).w;
vs_out_reg2 = tmp_reg10;
return true;
}
bool Vfn1() {
tmp_reg2 = vs_pica.f[94].xxxx;
tmp_reg1 = vs_pica.f[11 + addr_regs.x] + -tmp_reg15;
tmp_reg2.x = dot_3(tmp_reg1.xyz, tmp_reg1.xyz);
tmp_reg2.y = rsq_s(tmp_reg2.x);
tmp_reg1 = mul_s(tmp_reg1, tmp_reg2.yyyy);
tmp_reg2.y = rcp_s(tmp_reg2.y);
tmp_reg2.w = dot_3(tmp_reg1.xyz, tmp_reg14.xyz);
tmp_reg6 = vec4(dot_3(vs_pica.f[15 + addr_regs.x].xyz, -tmp_reg1.xyz));
tmp_reg6 = mul_s(vs_pica.f[27 + addr_regs.x].xxxx, tmp_reg6);
tmp_reg6 = vs_pica.f[27 + addr_regs.x].yyyy + tmp_reg6;
tmp_reg3.x = (max_s(vs_pica.f[94].wwww, tmp_reg6.xxxx)).x;
tmp_reg3.x = (min_s(vs_pica.f[94].xxxx, tmp_reg3.xxxx)).x;
tmp_reg6 = max_s(vs_pica.f[94].wwww, tmp_reg2.wwww);
tmp_reg6 = min_s(vs_pica.f[94].xxxx, tmp_reg6);
tmp_reg7.x = (mul_s(vs_pica.f[23 + addr_regs.x].yyyy, tmp_reg2.yyyy)).x;
tmp_reg7.x = (vs_pica.f[94].xxxx + -tmp_reg7.xxxx).x;
tmp_reg7.x = (max_s(vs_pica.f[94].wwww, tmp_reg7.xxxx)).x;
tmp_reg7.x = (min_s(vs_pica.f[94].xxxx, tmp_reg7.xxxx)).x;
tmp_reg7.x = (mul_s(tmp_reg7.xxxx, tmp_reg3.xxxx)).x;
tmp_reg8 = mul_s(vs_pica.f[19 + addr_regs.x], tmp_reg6);
tmp_reg13.xyz = (fma_s(tmp_reg7.xxxx, tmp_reg8, tmp_reg13)).xyz;
return false;
}
// shader: 8B31, 3532B75733202F04

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
vec4 vtx_color = vec4(vs_out_reg1.x,vs_out_reg1.y,vs_out_reg1.z,vs_out_reg1.w);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg2.x,vs_out_reg2.y,vs_out_reg2.z,1);
texcoord12 = vec4(vs_out_reg3.x,vs_out_reg3.y,vs_out_reg3.z,vs_out_reg3.w);
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
vec4 tmp_reg0;
vec4 tmp_reg10;
vec4 tmp_reg11;
vec4 tmp_reg12;
vec4 tmp_reg13;
vec4 tmp_reg15;
bool ExecVS() {
tmp_reg0 = vec4(0, 0, 0, 1);
tmp_reg10 = vec4(0, 0, 0, 1);
tmp_reg11 = vec4(0, 0, 0, 1);
tmp_reg12 = vec4(0, 0, 0, 1);
tmp_reg13 = vec4(0, 0, 0, 1);
tmp_reg15 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn0() {
tmp_reg15 = mul_s(vs_pica.f[9].xxxx, vs_in_reg0);
tmp_reg13 = mul_s(vs_pica.f[9].wwww, vs_in_reg1);
tmp_reg0.xy = (vs_in_reg2.xyyy).xy;
tmp_reg0.zw = (vs_pica.f[94].wwww).zw;
tmp_reg12.x = dot_s(vec4(tmp_reg0.xyz, 1.0), vs_pica.f[7]);
tmp_reg12.y = dot_s(vec4(tmp_reg0.xyz, 1.0), vs_pica.f[8]);
tmp_reg11 = vs_pica.f[94].wwww;
tmp_reg10 = vs_pica.f[94].wwww;
tmp_reg0.x = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[4]);
tmp_reg0.y = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[5]);
tmp_reg0.z = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[6]);
vs_out_reg0.x = dot_s(vec4(tmp_reg0.xyz, 1.0), vs_pica.f[0]);
vs_out_reg0.y = dot_s(vec4(tmp_reg0.xyz, 1.0), vs_pica.f[1]);
vs_out_reg0.z = dot_s(vec4(tmp_reg0.xyz, 1.0), vs_pica.f[2]);
vs_out_reg0.w = dot_s(vec4(tmp_reg0.xyz, 1.0), vs_pica.f[3]);
vs_out_reg1 = tmp_reg13;
vs_out_reg3.x = (tmp_reg12.xxxx).x;
vs_out_reg3.y = (tmp_reg12.yyyy).y;
vs_out_reg3.z = (tmp_reg11.xxxx).z;
vs_out_reg3.w = (tmp_reg11.yyyy).w;
vs_out_reg2 = tmp_reg10;
return true;
}
// shader: 8B30, A6E8F726354EE4BA
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
depth /= gl_FragCoord.w;
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (const_color[0].rgb);
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((texcolor1.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((texcolor1.a) * (rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((const_color[2].rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((const_color[2].a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 1AF5987B40C63EA0
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
depth /= gl_FragCoord.w;
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (const_color[0].rgb);
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = (rounded_primary_color.rgb);
float alpha_output_1 = (texcolor1.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(min((const_color[2].rgb) + (last_tev_out.rgb), vec3(1)) * (texcolor1.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((const_color[2].a) * (texcolor1.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2 * 2.0, alpha_output_2 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, CAC899F9712A53DD
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
depth /= gl_FragCoord.w;
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (const_color[0].rgb);
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = (rounded_primary_color.rgb);
float alpha_output_1 = (texcolor1.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = (texcolor1.rgb);
float alpha_output_2 = (texcolor1.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B31, DA925B80E2B0C719

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
vec4 vtx_color = vec4(1,1,1,1);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg1.x,vs_out_reg1.y,1,1);
texcoord12 = vec4(1,1,1,1);
view = vec4(1,1,1,1);
}
void main() {
vs_out_reg0 = vec4(0, 0, 0, 1);
vs_out_reg1 = vec4(0, 0, 0, 1);
ExecVS();
EmitVtx();
}
bvec2 bool_regs = bvec2(false);
ivec3 addr_regs = ivec3(0);
bool Vfn0();
vec4 tmp_reg0;
bool ExecVS() {
tmp_reg0 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn0() {
tmp_reg0 = mul_s(vs_pica.f[0].xyyy, vs_in_reg1.xyyy);
vs_out_reg0 = vs_in_reg0;
vs_out_reg1 = vs_pica.f[0].zwww + tmp_reg0;
return true;
}
// shader: 8B30, A05EC6E2C80F1DE0
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
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (last_tev_out.aaa), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (const_color[2].rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 41AB3044345D334C
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
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) + (const_color[0].rgb), vec3(0), vec3(1)));
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B31, 13DEBCA70EC901FB

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
layout(location=3) in vec4 vs_in_reg3;
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
vec4 vtx_color = vec4(vs_out_reg1.x,vs_out_reg1.y,vs_out_reg1.z,vs_out_reg1.w);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg2.x,vs_out_reg2.y,vs_out_reg2.z,1);
texcoord12 = vec4(vs_out_reg3.x,vs_out_reg3.y,vs_out_reg3.z,vs_out_reg3.w);
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
vec4 tmp_reg11;
vec4 tmp_reg12;
vec4 tmp_reg13;
vec4 tmp_reg14;
vec4 tmp_reg15;
bool ExecVS() {
tmp_reg11 = vec4(0, 0, 0, 1);
tmp_reg12 = vec4(0, 0, 0, 1);
tmp_reg13 = vec4(0, 0, 0, 1);
tmp_reg14 = vec4(0, 0, 0, 1);
tmp_reg15 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn0() {
tmp_reg15 = mul_s(vs_pica.f[4].xxxx, vs_in_reg0);
tmp_reg14.x = dot_s(vec4(vs_in_reg0.xyz, 1.0), vs_pica.f[0]);
tmp_reg14.y = dot_s(vec4(vs_in_reg0.xyz, 1.0), vs_pica.f[1]);
tmp_reg14.z = dot_s(vec4(vs_in_reg0.xyz, 1.0), vs_pica.f[2]);
tmp_reg14.w = dot_s(vec4(vs_in_reg0.xyz, 1.0), vs_pica.f[3]);
tmp_reg13 = mul_s(vs_pica.f[4].wwww, vs_in_reg2);
tmp_reg12 = mul_s(vs_pica.f[4].zzzz, vs_in_reg3.xyyy);
tmp_reg11 = mul_s(vs_pica.f[4].wwww, vs_in_reg1);
vs_out_reg0 = tmp_reg14;
vs_out_reg1 = tmp_reg11;
vs_out_reg2 = tmp_reg13;
vs_out_reg3 = tmp_reg12;
return true;
}
// shader: 8B30, CBBCDFBAFFC9401C
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
vec3 color_output_0 = (const_color[0].rgb);
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp((texcolor0.rrr) * (texcolor1.rrr), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((texcolor0.r) * (texcolor1.r), 0.0, 1.0));
last_tev_out = vec4(color_output_2 * 1.0, alpha_output_2 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(fma((texcolor0.ggg), (texcolor1.ggg), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp(fma((texcolor0.g), (texcolor1.g), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((texcolor0.bbb), (texcolor1.bbb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((texcolor0.b), (texcolor1.b), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 81208393A42EFF3D, C09BB54F87903F2D
// reference: 0FEDE4847C6AF4BB, 6A7E80280F7F6A2B
// reference: 812083936813F3FF, F13586FEF28F29C7
// reference: 8120839353C8129D, 3532B75733202F04
// reference: 1E0802FE4FDAC829, A6E8F726354EE4BA
// reference: 5A9B42427C6AF4BB, 1AF5987B40C63EA0
// reference: 60D0DDDD9E696A4D, CAC899F9712A53DD
// reference: 9D2985C27CD50C69, DA925B80E2B0C719
// reference: 28CA93997C7FA7C8, A05EC6E2C80F1DE0
// reference: 3F7F3FFED0532A49, 41AB3044345D334C
// reference: 4FB9DDD8021FD2B9, 13DEBCA70EC901FB
// reference: 305AB16E926FA33E, CBBCDFBAFFC9401C
// program: C09BB54F87903F2D, 0000000000000000, 6A7E80280F7F6A2B
// program: F13586FEF28F29C7, 0000000000000000, 6A7E80280F7F6A2B
// program: 3532B75733202F04, 0000000000000000, A6E8F726354EE4BA
// program: C09BB54F87903F2D, 0000000000000000, 1AF5987B40C63EA0
// program: F13586FEF28F29C7, 0000000000000000, CAC899F9712A53DD
// program: DA925B80E2B0C719, 0000000000000000, A05EC6E2C80F1DE0
// program: DA925B80E2B0C719, 0000000000000000, 41AB3044345D334C
// program: 13DEBCA70EC901FB, 0000000000000000, CBBCDFBAFFC9401C
// shader: 8B30, 421889C5BEFF6B04
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
vec3 color_output_0 = (const_color[0].rgb);
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp((texcolor0.rrr) * (texcolor1.rrr), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((texcolor0.r) * (texcolor1.r), 0.0, 1.0));
last_tev_out = vec4(color_output_2 * 1.0, alpha_output_2 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(fma((texcolor0.ggg), (texcolor1.ggg), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp(fma((texcolor0.g), (texcolor1.g), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((texcolor0.bbb), (texcolor1.bbb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((texcolor0.b), (texcolor1.b), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor1.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (texcolor1.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 305AB16E5A9A5670, 421889C5BEFF6B04
// program: 13DEBCA70EC901FB, 0000000000000000, 421889C5BEFF6B04
// shader: 8B31, 2E7F90C31D7F876B

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
layout(location=3) in vec4 vs_in_reg3;
vec4 vs_out_reg3;
layout(location=4) in vec4 vs_in_reg4;
vec4 vs_out_reg4;
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
normquat = vec4(vs_out_reg1.x,vs_out_reg1.y,vs_out_reg1.z,vs_out_reg1.w);
vec4 vtx_color = vec4(1,1,1,1);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg3.x,vs_out_reg3.y,1,1);
texcoord12 = vec4(vs_out_reg4.x,vs_out_reg4.y,vs_out_reg4.z,vs_out_reg4.w);
view = vec4(vs_out_reg2.x,vs_out_reg2.y,vs_out_reg2.z,1);
}
void main() {
vs_out_reg0 = vec4(0, 0, 0, 1);
vs_out_reg1 = vec4(0, 0, 0, 1);
vs_out_reg2 = vec4(0, 0, 0, 1);
vs_out_reg3 = vec4(0, 0, 0, 1);
vs_out_reg4 = vec4(0, 0, 0, 1);
ExecVS();
EmitVtx();
}
bvec2 bool_regs = bvec2(false);
ivec3 addr_regs = ivec3(0);
bool Vfn0();
vec4 tmp_reg0;
vec4 tmp_reg1;
vec4 tmp_reg2;
vec4 tmp_reg5;
vec4 tmp_reg6;
vec4 tmp_reg7;
vec4 tmp_reg10;
vec4 tmp_reg11;
vec4 tmp_reg12;
vec4 tmp_reg13;
vec4 tmp_reg14;
vec4 tmp_reg15;
bool ExecVS() {
tmp_reg0 = vec4(0, 0, 0, 1);
tmp_reg1 = vec4(0, 0, 0, 1);
tmp_reg2 = vec4(0, 0, 0, 1);
tmp_reg5 = vec4(0, 0, 0, 1);
tmp_reg6 = vec4(0, 0, 0, 1);
tmp_reg7 = vec4(0, 0, 0, 1);
tmp_reg10 = vec4(0, 0, 0, 1);
tmp_reg11 = vec4(0, 0, 0, 1);
tmp_reg12 = vec4(0, 0, 0, 1);
tmp_reg13 = vec4(0, 0, 0, 1);
tmp_reg14 = vec4(0, 0, 0, 1);
tmp_reg15 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn0() {
uint jmp_to = 0u;
while (true) {
switch (jmp_to) {
case 0u:
tmp_reg0.xy = (vs_in_reg3.xyyy).xy;
tmp_reg0.zw = (vs_pica.f[95].xxxx).zw;
tmp_reg12.x = dot_s(vec4(tmp_reg0.xyz, 1.0), vs_pica.f[7]);
tmp_reg12.y = dot_s(vec4(tmp_reg0.xyz, 1.0), vs_pica.f[8]);
tmp_reg11 = mul_s(vs_pica.f[9].zzzz, vs_in_reg4);
vs_out_reg3.x = (tmp_reg12.xxxx).x;
vs_out_reg3.y = (tmp_reg12.yyyy).y;
vs_out_reg3.z = (tmp_reg12.zzzz).z;
vs_out_reg3.w = (tmp_reg12.wwww).w;
vs_out_reg4.x = (tmp_reg12.xxxx).x;
vs_out_reg4.y = (tmp_reg12.yyyy).y;
vs_out_reg4.z = (tmp_reg11.xxxx).z;
vs_out_reg4.w = (tmp_reg11.yyyy).w;
tmp_reg15 = mul_s(vs_pica.f[9].xxxx, vs_in_reg0);
tmp_reg14 = mul_s(vs_pica.f[9].yyyy, vs_in_reg1);
tmp_reg13 = mul_s(vs_pica.f[9].yyyy, vs_in_reg2);
tmp_reg12.x = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[4]);
tmp_reg12.y = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[5]);
tmp_reg12.z = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[6]);
tmp_reg11.x = dot_3(vs_pica.f[4].xyz, tmp_reg14.xyz);
tmp_reg11.y = dot_3(vs_pica.f[5].xyz, tmp_reg14.xyz);
tmp_reg11.z = dot_3(vs_pica.f[6].xyz, tmp_reg14.xyz);
tmp_reg10.x = dot_3(vs_pica.f[4].xyz, tmp_reg13.xyz);
tmp_reg10.y = dot_3(vs_pica.f[5].xyz, tmp_reg13.xyz);
tmp_reg10.z = dot_3(vs_pica.f[6].xyz, tmp_reg13.xyz);
vs_out_reg2.x = (-tmp_reg12.xxxx).x;
vs_out_reg2.y = (-tmp_reg12.yyyy).y;
vs_out_reg2.z = (-tmp_reg12.zzzz).z;
vs_out_reg2.w = (vs_pica.f[95].yyyy).w;
vs_out_reg0.x = dot_s(vec4(tmp_reg12.xyz, 1.0), vs_pica.f[0]);
vs_out_reg0.y = dot_s(vec4(tmp_reg12.xyz, 1.0), vs_pica.f[1]);
vs_out_reg0.z = dot_s(vec4(tmp_reg12.xyz, 1.0), vs_pica.f[2]);
vs_out_reg0.w = dot_s(vec4(tmp_reg12.xyz, 1.0), vs_pica.f[3]);
tmp_reg5 = mul_s(tmp_reg11.yzxx, tmp_reg10.zxyy);
tmp_reg5 = fma_s(-tmp_reg10.yzxx, tmp_reg11.zxyy, tmp_reg5);
tmp_reg5.w = dot_3(tmp_reg5.xyz, tmp_reg5.xyz);
tmp_reg5.w = rsq_s(tmp_reg5.w);
tmp_reg5 = mul_s(tmp_reg5, tmp_reg5.wwww);
tmp_reg6.x = (tmp_reg10.xxxx + tmp_reg5.yyyy).x;
tmp_reg6.x = (tmp_reg6.xxxx + tmp_reg11.zzzz).x;
tmp_reg6.y = (tmp_reg10.xxxx + -tmp_reg5.yyyy).y;
tmp_reg6.y = (tmp_reg6.yyyy + -tmp_reg11.zzzz).y;
tmp_reg6.z = (-tmp_reg10.xxxx + tmp_reg5.yyyy).z;
tmp_reg6.z = (tmp_reg6.zzzz + -tmp_reg11.zzzz).z;
tmp_reg6.w = (-tmp_reg10.xxxx + -tmp_reg5.yyyy).w;
tmp_reg6.w = (tmp_reg6.wwww + tmp_reg11.zzzz).w;
tmp_reg6 = vs_pica.f[95].yyyy + tmp_reg6;
bool_regs = greaterThanEqual(vs_pica.f[95].yy, tmp_reg6.xx);
if (bool_regs.x) {
jmp_to = 58u; break;
}
tmp_reg1 = vec4(rsq_s(tmp_reg6.x));
tmp_reg2 = mul_s(vs_pica.f[95].wwww, tmp_reg1);
tmp_reg7.x = (tmp_reg5.zzzz + -tmp_reg11.yyyy).x;
tmp_reg7.y = (tmp_reg11.xxxx + -tmp_reg10.zzzz).y;
tmp_reg7.z = (tmp_reg10.yyyy + -tmp_reg5.xxxx).z;
tmp_reg7 = mul_s(tmp_reg7, tmp_reg2);
tmp_reg7.w = rcp_s(tmp_reg1.x);
tmp_reg7.w = (mul_s(vs_pica.f[95].wwww, tmp_reg7.wwww)).w;
if (vs_pica.b[0]) {
jmp_to = 89u; break;
}
case 58u:
bool_regs = greaterThanEqual(vs_pica.f[95].yy, tmp_reg6.yy);
if (bool_regs.x) {
jmp_to = 69u; break;
}
tmp_reg1 = vec4(rsq_s(tmp_reg6.y));
tmp_reg2 = mul_s(vs_pica.f[95].wwww, tmp_reg1);
tmp_reg7.w = (tmp_reg5.zzzz + -tmp_reg11.yyyy).w;
tmp_reg7.y = (tmp_reg10.yyyy + tmp_reg5.xxxx).y;
tmp_reg7.z = (tmp_reg11.xxxx + tmp_reg10.zzzz).z;
tmp_reg7 = mul_s(tmp_reg7, tmp_reg2);
tmp_reg7.x = rcp_s(tmp_reg1.x);
tmp_reg7.x = (mul_s(vs_pica.f[95].wwww, tmp_reg7.xxxx)).x;
if (vs_pica.b[0]) {
jmp_to = 89u; break;
}
case 69u:
bool_regs = greaterThanEqual(vs_pica.f[95].yy, tmp_reg6.zz);
if (bool_regs.x) {
jmp_to = 80u; break;
}
tmp_reg1 = vec4(rsq_s(tmp_reg6.z));
tmp_reg2 = mul_s(vs_pica.f[95].wwww, tmp_reg1);
tmp_reg7.w = (tmp_reg11.xxxx + -tmp_reg10.zzzz).w;
tmp_reg7.x = (tmp_reg5.xxxx + tmp_reg10.yyyy).x;
tmp_reg7.z = (tmp_reg5.zzzz + tmp_reg11.yyyy).z;
tmp_reg7 = mul_s(tmp_reg7, tmp_reg2);
tmp_reg7.y = rcp_s(tmp_reg1.x);
tmp_reg7.y = (mul_s(vs_pica.f[95].wwww, tmp_reg7.yyyy)).y;
if (vs_pica.b[0]) {
jmp_to = 89u; break;
}
case 80u:
tmp_reg1 = vec4(rsq_s(tmp_reg6.w));
tmp_reg2 = mul_s(vs_pica.f[95].wwww, tmp_reg1);
tmp_reg7.w = (tmp_reg10.yyyy + -tmp_reg5.xxxx).w;
tmp_reg7.x = (tmp_reg11.xxxx + tmp_reg10.zzzz).x;
tmp_reg7.y = (tmp_reg11.yyyy + tmp_reg5.zzzz).y;
tmp_reg7 = mul_s(tmp_reg7, tmp_reg2);
tmp_reg7.z = rcp_s(tmp_reg1.x);
tmp_reg7.z = (mul_s(vs_pica.f[95].wwww, tmp_reg7.zzzz)).z;
if (vs_pica.b[0]) {
jmp_to = 89u; break;
}
case 89u:
vs_out_reg1 = tmp_reg7;
return true;
default: return false;
}
}
return false;
}
// shader: 8B30, 11C65D67F698E699
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

struct LightSrc {
vec3 specular_0;
vec3 specular_1;
vec3 diffuse;
vec3 ambient;
vec3 position;
vec3 spot_direction;
float dist_atten_bias;
float dist_atten_scale;
};
layout(binding=1, std140) uniform light_data0 {
LightSrc light_src[8];
};
layout(binding=2, std140) uniform light_data1 {
ivec4 lighting_lut_offset[6];
vec3 lighting_global_ambient;
float lut_scale_d0;
float lut_scale_d1;
float lut_scale_sp;
float lut_scale_fr;
float lut_scale_rb;
float lut_scale_rg;
float lut_scale_rr;
};

vec3 QuaternionRotate(vec4 q, vec3 v) {
    return v + 2.0 * cross(q.xyz, cross(q.xyz, v) + q.w * v);
}
float LightingLUTUnsigned(int lut_offset, float pos) {
    int index = clamp(int(pos * 256.0), 0, 255);
    float delta = pos * 256.0 - float(index);
    vec2 entry = texelFetch(tex_lut_l, lut_offset + index).rg;
    return entry.r + entry.g * delta;
}
float LightingLUTSigned(int lut_offset, float pos) {
    int index = clamp(int(pos * 128.0), -128, 127);
    float delta = pos * 128.0 - float(index);
    if (index < 0) index += 256;
    vec2 entry = texelFetch(tex_lut_l, lut_offset + index).rg;
    return entry.r + entry.g * delta;
}

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
depth /= gl_FragCoord.w;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 texcolor2 = textureLod(tex2, texcoord12.zw, GetLod(texcoord12.zw * vec2(textureSize(tex2, 0))) + tex_lod_bias[2]);
vec4 diffuse_sum = vec4(0, 0, 0, 1);
vec4 specular_sum = vec4(0, 0, 0, 1);
vec3 light_vector = vec3(0);
vec3 refl_value = vec3(0);
vec3 spot_dir = vec3(0);
vec3 half_vector = vec3(0);
float dot_product = 0.0;
float clamp_highlights = 1.0;
int lut_offset = 0;
float lut_value = 1.0;
float d0_value = 1.0;
float d1_value = 1.0;
float dist_value = 1.0;
float geo_factor = 1.0;
vec3 surface_normal = 2.0 * (texcolor0).rgb - 1.0;
surface_normal.z = sqrt(max((1.0 - (surface_normal.x*surface_normal.x + surface_normal.y*surface_normal.y)), 0.0));
vec3 surface_tangent = vec3(1, 0, 0);
vec4 normalized_normquat = normalize(normquat);
vec3 normal = QuaternionRotate(normalized_normquat, surface_normal);
vec3 tangent = QuaternionRotate(normalized_normquat, surface_tangent);
vec4 shadow = vec4(1);
light_vector = normalize(light_src[0].position + view.xyz);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
clamp_highlights = sign(dot_product);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += ((light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((const_color[0].rgb) + (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0 * 4.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((texcolor2.rgb) + (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (texcolor1.rgb), vec3(0), vec3(1)));
float alpha_output_2 = (texcolor1.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 6D2AC6DACF59D5B8
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
depth /= gl_FragCoord.w;
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (const_color[0].rgb);
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = (rounded_primary_color.rgb);
float alpha_output_1 = (texcolor1.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(min((const_color[2].rgb) + (last_tev_out.rgb), vec3(1)) * (texcolor1.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((const_color[2].a) * (texcolor1.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, ADA519F8E1970D59
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

struct LightSrc {
vec3 specular_0;
vec3 specular_1;
vec3 diffuse;
vec3 ambient;
vec3 position;
vec3 spot_direction;
float dist_atten_bias;
float dist_atten_scale;
};
layout(binding=1, std140) uniform light_data0 {
LightSrc light_src[8];
};
layout(binding=2, std140) uniform light_data1 {
ivec4 lighting_lut_offset[6];
vec3 lighting_global_ambient;
float lut_scale_d0;
float lut_scale_d1;
float lut_scale_sp;
float lut_scale_fr;
float lut_scale_rb;
float lut_scale_rg;
float lut_scale_rr;
};

vec3 QuaternionRotate(vec4 q, vec3 v) {
    return v + 2.0 * cross(q.xyz, cross(q.xyz, v) + q.w * v);
}
float LightingLUTUnsigned(int lut_offset, float pos) {
    int index = clamp(int(pos * 256.0), 0, 255);
    float delta = pos * 256.0 - float(index);
    vec2 entry = texelFetch(tex_lut_l, lut_offset + index).rg;
    return entry.r + entry.g * delta;
}
float LightingLUTSigned(int lut_offset, float pos) {
    int index = clamp(int(pos * 128.0), -128, 127);
    float delta = pos * 128.0 - float(index);
    if (index < 0) index += 256;
    vec2 entry = texelFetch(tex_lut_l, lut_offset + index).rg;
    return entry.r + entry.g * delta;
}

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
depth /= gl_FragCoord.w;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 texcolor2 = textureLod(tex2, texcoord12.zw, GetLod(texcoord12.zw * vec2(textureSize(tex2, 0))) + tex_lod_bias[2]);
vec4 diffuse_sum = vec4(0, 0, 0, 1);
vec4 specular_sum = vec4(0, 0, 0, 1);
vec3 light_vector = vec3(0);
vec3 refl_value = vec3(0);
vec3 spot_dir = vec3(0);
vec3 half_vector = vec3(0);
float dot_product = 0.0;
float clamp_highlights = 1.0;
int lut_offset = 0;
float lut_value = 1.0;
float d0_value = 1.0;
float d1_value = 1.0;
float dist_value = 1.0;
float geo_factor = 1.0;
vec3 surface_normal = 2.0 * (texcolor0).rgb - 1.0;
surface_normal.z = sqrt(max((1.0 - (surface_normal.x*surface_normal.x + surface_normal.y*surface_normal.y)), 0.0));
vec3 surface_tangent = vec3(1, 0, 0);
vec4 normalized_normquat = normalize(normquat);
vec3 normal = QuaternionRotate(normalized_normquat, surface_normal);
vec3 tangent = QuaternionRotate(normalized_normquat, surface_tangent);
vec4 shadow = vec4(1);
light_vector = normalize(light_src[0].position + view.xyz);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
clamp_highlights = sign(dot_product);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[4][0];
dist_value = LightingLUTUnsigned(lut_offset, clamp(light_src[0].dist_atten_scale * length(-light_src[0].position - view.xyz) + light_src[0].dist_atten_bias, 0.0, 1.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * dist_value * 1.0;
specular_sum.rgb += ((light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * dist_value * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((const_color[0].rgb) + (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0 * 4.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((texcolor2.rgb) + (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (texcolor1.rgb), vec3(0), vec3(1)));
float alpha_output_2 = (texcolor1.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: E1473D46C1BAB7B3, 2E7F90C31D7F876B
// reference: 3934387575871D1A, 11C65D67F698E699
// reference: 5A9B424265FF9460, 6D2AC6DACF59D5B8
// reference: 3934387524D90C41, ADA519F8E1970D59
// program: 2E7F90C31D7F876B, 0000000000000000, 11C65D67F698E699
// program: C09BB54F87903F2D, 0000000000000000, 6D2AC6DACF59D5B8
// program: 2E7F90C31D7F876B, 0000000000000000, ADA519F8E1970D59
// program: C09BB54F87903F2D, 0000000000000000, CAC899F9712A53DD
// shader: 8B31, B5C85612ABE65FFF

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
vec4 vs_out_reg1;
layout(location=3) in vec4 vs_in_reg3;
layout(location=4) in vec4 vs_in_reg4;
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
vec4 vtx_color = vec4(1,1,1,1);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg1.x,vs_out_reg1.y,vs_out_reg1.w,1);
texcoord12 = vec4(1,1,1,1);
view = vec4(1,1,1,1);
}
void main() {
vs_out_reg0 = vec4(0, 0, 0, 1);
vs_out_reg1 = vec4(0, 0, 0, 1);
ExecVS();
EmitVtx();
}
bvec2 bool_regs = bvec2(false);
ivec3 addr_regs = ivec3(0);
bool Vfn0();
vec4 tmp_reg0;
vec4 tmp_reg1;
vec4 tmp_reg2;
vec4 tmp_reg3;
vec4 tmp_reg13;
vec4 tmp_reg15;
bool ExecVS() {
tmp_reg0 = vec4(0, 0, 0, 1);
tmp_reg1 = vec4(0, 0, 0, 1);
tmp_reg2 = vec4(0, 0, 0, 1);
tmp_reg3 = vec4(0, 0, 0, 1);
tmp_reg13 = vec4(0, 0, 0, 1);
tmp_reg15 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn0() {
tmp_reg15 = mul_s(vs_pica.f[11].xxxx, vs_in_reg0);
tmp_reg0 = mul_s(vs_pica.f[95].zzzz, vs_in_reg4);
addr_regs.xy = ivec2(tmp_reg0.xy);
tmp_reg1.x = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[12 + addr_regs.x]);
tmp_reg1.y = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[13 + addr_regs.x]);
tmp_reg1.z = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[14 + addr_regs.x]);
tmp_reg2.x = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[12 + addr_regs.y]);
tmp_reg2.y = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[13 + addr_regs.y]);
tmp_reg2.z = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[14 + addr_regs.y]);
addr_regs.xy = ivec2(tmp_reg0.zw);
tmp_reg3.x = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[12 + addr_regs.x]);
tmp_reg3.y = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[13 + addr_regs.x]);
tmp_reg3.z = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[14 + addr_regs.x]);
tmp_reg13 = mul_s(vs_pica.f[11].wwww, vs_in_reg3);
tmp_reg15 = mul_s(tmp_reg1, tmp_reg13.xxxx);
tmp_reg15 = fma_s(tmp_reg2, tmp_reg13.yyyy, tmp_reg15);
tmp_reg15 = fma_s(tmp_reg3, tmp_reg13.zzzz, tmp_reg15);
tmp_reg0.x = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[4]);
tmp_reg0.y = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[5]);
tmp_reg0.z = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[6]);
tmp_reg1.x = dot_s(vec4(tmp_reg0.xyz, 1.0), vs_pica.f[0]);
tmp_reg1.y = dot_s(vec4(tmp_reg0.xyz, 1.0), vs_pica.f[1]);
tmp_reg1.z = dot_s(vec4(tmp_reg0.xyz, 1.0), vs_pica.f[2]);
tmp_reg1.w = dot_s(vec4(tmp_reg0.xyz, 1.0), vs_pica.f[3]);
tmp_reg2.x = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[7]);
tmp_reg2.y = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[8]);
tmp_reg2.z = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[9]);
tmp_reg2.w = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[10]);
vs_out_reg0 = tmp_reg1;
vs_out_reg1 = tmp_reg2;
return true;
}
// shader: 8B30, 5DD95B59C4116232
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
vec4 texcolor0 = textureProj(tex0, texcoord0.xyz);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (const_color[0].rgb);
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp((const_color[2].rgb) + (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_2 = (const_color[2].a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B31, EDA8092D2FEF17B5

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
vec4 vs_out_reg1;
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
vec4 vtx_color = vec4(1,1,1,1);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg1.x,vs_out_reg1.y,vs_out_reg1.w,1);
texcoord12 = vec4(1,1,1,1);
view = vec4(1,1,1,1);
}
void main() {
vs_out_reg0 = vec4(0, 0, 0, 1);
vs_out_reg1 = vec4(0, 0, 0, 1);
ExecVS();
EmitVtx();
}
bvec2 bool_regs = bvec2(false);
ivec3 addr_regs = ivec3(0);
bool Vfn0();
vec4 tmp_reg0;
vec4 tmp_reg1;
vec4 tmp_reg2;
vec4 tmp_reg15;
bool ExecVS() {
tmp_reg0 = vec4(0, 0, 0, 1);
tmp_reg1 = vec4(0, 0, 0, 1);
tmp_reg2 = vec4(0, 0, 0, 1);
tmp_reg15 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn0() {
tmp_reg15 = mul_s(vs_pica.f[11].xxxx, vs_in_reg0);
tmp_reg0.x = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[4]);
tmp_reg0.y = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[5]);
tmp_reg0.z = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[6]);
tmp_reg1.x = dot_s(vec4(tmp_reg0.xyz, 1.0), vs_pica.f[0]);
tmp_reg1.y = dot_s(vec4(tmp_reg0.xyz, 1.0), vs_pica.f[1]);
tmp_reg1.z = dot_s(vec4(tmp_reg0.xyz, 1.0), vs_pica.f[2]);
tmp_reg1.w = dot_s(vec4(tmp_reg0.xyz, 1.0), vs_pica.f[3]);
tmp_reg2.x = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[7]);
tmp_reg2.y = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[8]);
tmp_reg2.z = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[9]);
tmp_reg2.w = dot_s(vec4(tmp_reg15.xyz, 1.0), vs_pica.f[10]);
vs_out_reg0 = tmp_reg1;
vs_out_reg1 = tmp_reg2;
return true;
}
// shader: 8B30, E295EC79B33A396E
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
depth /= gl_FragCoord.w;
vec4 texcolor0 = textureProj(tex0, texcoord0.xyz);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (const_color[0].rgb);
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = (texcolor0.rgb);
float alpha_output_2 = (texcolor0.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 2DF733C252731F1A, B5C85612ABE65FFF
// reference: 6A464C37C7724748, 5DD95B59C4116232
// reference: 2DF733C25957442F, EDA8092D2FEF17B5
// reference: 60D0DDDDC6496E03, E295EC79B33A396E
// reference: 1E0802FEDB1D73D2, A6E8F726354EE4BA
// reference: 60D0DDDD0AAED1B6, CAC899F9712A53DD
// reference: 5A9B4242F1382F9B, 6D2AC6DACF59D5B8
// program: B5C85612ABE65FFF, 0000000000000000, 5DD95B59C4116232
// program: EDA8092D2FEF17B5, 0000000000000000, E295EC79B33A396E
// program: EB7BD1C7D580F20F, 0000000000000000, AF71FBBEF5C90E84
// program: 4D59A06C77FA9113, 0000000000000000, 4C390CB5B5793EF1
// program: 4D59A06C77FA9113, 0000000000000000, D74A632D8F00C106
// program: C09BB54F87903F2D, 0000000000000000, 6A7E80280F7F6A2B
// program: F13586FEF28F29C7, 0000000000000000, 6A7E80280F7F6A2B
// program: 3532B75733202F04, 0000000000000000, A6E8F726354EE4BA
// program: C09BB54F87903F2D, 0000000000000000, 1AF5987B40C63EA0
// program: F13586FEF28F29C7, 0000000000000000, CAC899F9712A53DD
// program: DA925B80E2B0C719, 0000000000000000, A05EC6E2C80F1DE0
// program: DA925B80E2B0C719, 0000000000000000, 41AB3044345D334C
// program: 13DEBCA70EC901FB, 0000000000000000, CBBCDFBAFFC9401C
// program: 13DEBCA70EC901FB, 0000000000000000, 421889C5BEFF6B04
// program: 2E7F90C31D7F876B, 0000000000000000, 11C65D67F698E699
// program: C09BB54F87903F2D, 0000000000000000, 6D2AC6DACF59D5B8
// program: 2E7F90C31D7F876B, 0000000000000000, ADA519F8E1970D59
// program: C09BB54F87903F2D, 0000000000000000, CAC899F9712A53DD
// program: B5C85612ABE65FFF, 0000000000000000, 5DD95B59C4116232
// program: EDA8092D2FEF17B5, 0000000000000000, E295EC79B33A396E
