// shader: 8B31, 6089902024F82DD6

#define mul_s(x, y) mix(x * y, vec4(0), isnan(x * y))
#define fma_s(x, y, z) (mul_s(x, y) + z)
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
vec4 vs_out_reg2;
vec4 vs_out_reg3;
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
normquat = vec4(1,1,1,1);
vec4 vtx_color = vec4(vs_out_reg1.x,vs_out_reg1.y,vs_out_reg1.z,vs_out_reg1.w);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg2.x,vs_out_reg2.y,1,1);
texcoord12 = vec4(vs_out_reg3.x,vs_out_reg3.y,vs_out_reg4.x,vs_out_reg4.y);
view = vec4(1,1,1,1);
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
bool Vfn3();
bool Vfn12();
bool Vfn13();
bool Vfn18();
vec4 tmp_reg0;
vec4 tmp_reg1;
vec4 tmp_reg2;
vec4 tmp_reg3;
vec4 tmp_reg4;
vec4 tmp_reg5;
vec4 tmp_reg6;
vec4 tmp_reg7;
vec4 tmp_reg8;
bool ExecVS() {
tmp_reg0 = vec4(0, 0, 0, 1);
tmp_reg1 = vec4(0, 0, 0, 1);
tmp_reg2 = vec4(0, 0, 0, 1);
tmp_reg3 = vec4(0, 0, 0, 1);
tmp_reg4 = vec4(0, 0, 0, 1);
tmp_reg5 = vec4(0, 0, 0, 1);
tmp_reg6 = vec4(0, 0, 0, 1);
tmp_reg7 = vec4(0, 0, 0, 1);
tmp_reg8 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn0() {
addr_regs.x = (ivec2(vs_in_reg0.xy)).x;
tmp_reg0 = vs_pica.f[6 + addr_regs.x].wzyx;
tmp_reg1.xy = (vs_in_reg0.zwzw).xy;
tmp_reg1.zw = (vs_pica.f[5].xyxy).zw;
addr_regs.xy = ivec2(tmp_reg0.xy);
tmp_reg2.xw = (vs_pica.f[64 + addr_regs.y].wwyy).xw;
tmp_reg2.yz = (vs_pica.f[5].xxxx).yz;
tmp_reg4.x = dot_s(tmp_reg1, tmp_reg2);
tmp_reg2.yw = (vs_pica.f[64 + addr_regs.y].zzxx).yw;
tmp_reg2.xz = (vs_pica.f[5].xxxx).xz;
tmp_reg4.y = dot_s(tmp_reg1, tmp_reg2);
tmp_reg4.zw = (tmp_reg1.zwzw).zw;
tmp_reg3.x = dot_s(vs_pica.f[32 + addr_regs.x].wzyx, tmp_reg4);
tmp_reg3.y = dot_s(vs_pica.f[33 + addr_regs.x].wzyx, tmp_reg4);
tmp_reg3.z = dot_s(vs_pica.f[34 + addr_regs.x].wzyx, tmp_reg4);
tmp_reg3.w = (tmp_reg1.wwww).w;
tmp_reg4.z = (vs_pica.f[34 + addr_regs.x].xxxx).z;
tmp_reg4.z = (abs(tmp_reg4.zzzz)).z;
tmp_reg4.z = (vs_pica.f[4].yyyy + tmp_reg4.zzzz).z;
tmp_reg4.x = (vs_pica.f[4].wwww).x;
bool_regs = notEqual(vs_pica.f[5].xx, tmp_reg4.xz);
if (all(bool_regs)) {
tmp_reg4.x = (vs_pica.f[4].wwww).x;
tmp_reg4.y = (-vs_pica.f[4].zzzz + tmp_reg4.zzzz).y;
tmp_reg4.z = rcp_s(tmp_reg4.z);
tmp_reg4.z = (mul_s(tmp_reg4.yyyy, tmp_reg4.zzzz)).z;
tmp_reg3.x = (fma_s(tmp_reg4.xxxx, tmp_reg4.zzzz, tmp_reg3.xxxx)).x;
}
vs_out_reg0.x = dot_s(vs_pica.f[0].wzyx, tmp_reg3);
vs_out_reg0.y = dot_s(vs_pica.f[1].wzyx, tmp_reg3);
vs_out_reg0.z = dot_s(vs_pica.f[2].wzyx, tmp_reg3);
vs_out_reg0.w = dot_s(vs_pica.f[3].wzyx, tmp_reg3);
bool_regs = greaterThanEqual(vs_pica.f[5].yy, tmp_reg0.ww);
if (all(bool_regs)) {
vs_out_reg1.xyz = (vs_pica.f[5].yyyy).xyz;
vs_out_reg1.w = (tmp_reg0.wwww).w;
} else {
Vfn3();
}
bool_regs = notEqual(vs_pica.f[5].xx, tmp_reg1.xy);
if (all(not(bool_regs))) {
tmp_reg5 = vs_pica.f[5].xyyy;
tmp_reg6 = vs_pica.f[5].xyyy;
tmp_reg7 = vs_pica.f[5].xyyy;
}
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
tmp_reg5 = vs_pica.f[5].yyyy;
tmp_reg6 = vs_pica.f[5].yyyy;
tmp_reg7 = vs_pica.f[5].yyyy;
}
if (all(bvec2(!bool_regs.x, bool_regs.y))) {
tmp_reg5 = vs_pica.f[5].xxyy;
tmp_reg6 = vs_pica.f[5].xxyy;
tmp_reg7 = vs_pica.f[5].xxyy;
}
if (all(bool_regs)) {
tmp_reg5 = vs_pica.f[5].yxyy;
tmp_reg6 = vs_pica.f[5].yxyy;
tmp_reg7 = vs_pica.f[5].yxyy;
}
tmp_reg8 = vs_pica.f[5].xxxx;
addr_regs.z = int(vs_pica.i[0].y);
for (uint i = 0u; i <= vs_pica.i[0].x; addr_regs.z += int(vs_pica.i[0].z), ++i) {
Vfn12();
}
vs_out_reg2 = tmp_reg5;
vs_out_reg3 = tmp_reg6;
vs_out_reg4 = tmp_reg7;
return true;
}
bool Vfn3() {
addr_regs.y = (ivec2(tmp_reg0.ww)).y;
bool_regs = notEqual(vs_pica.f[5].xx, tmp_reg1.xy);
if (all(not(bool_regs))) {
vs_out_reg1 = vs_pica.f[32 + addr_regs.y].wzyx;
}
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
vs_out_reg1 = vs_pica.f[33 + addr_regs.y].wzyx;
}
if (all(bvec2(!bool_regs.x, bool_regs.y))) {
vs_out_reg1 = vs_pica.f[34 + addr_regs.y].wzyx;
}
if (all(bool_regs)) {
vs_out_reg1 = vs_pica.f[35 + addr_regs.y].wzyx;
}
return false;
}
bool Vfn12() {
bool_regs = equal(vs_pica.f[5].yy, tmp_reg8.xy);
if (all(bool_regs)) {
Vfn13();
}
bool_regs = lessThan(vs_pica.f[5].ww, tmp_reg8.xy);
if (all(bool_regs)) {
Vfn18();
}
tmp_reg8 = vs_pica.f[5].yyyy + tmp_reg8;
return false;
}
bool Vfn13() {
addr_regs.y = (ivec2(tmp_reg0.zz)).y;
bool_regs = notEqual(vs_pica.f[5].xx, tmp_reg1.xy);
if (all(not(bool_regs))) {
tmp_reg5.xy = (vs_pica.f[64 + addr_regs.y].wzzz).xy;
tmp_reg6.xy = (vs_pica.f[65 + addr_regs.y].wzzz).xy;
tmp_reg7.xy = (vs_pica.f[66 + addr_regs.y].wzzz).xy;
}
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
tmp_reg5.xy = (vs_pica.f[64 + addr_regs.y].yzzz).xy;
tmp_reg6.xy = (vs_pica.f[65 + addr_regs.y].yzzz).xy;
tmp_reg7.xy = (vs_pica.f[66 + addr_regs.y].yzzz).xy;
}
if (all(bvec2(!bool_regs.x, bool_regs.y))) {
tmp_reg5.xy = (vs_pica.f[64 + addr_regs.y].wxxx).xy;
tmp_reg6.xy = (vs_pica.f[65 + addr_regs.y].wxxx).xy;
tmp_reg7.xy = (vs_pica.f[66 + addr_regs.y].wxxx).xy;
}
if (all(bool_regs)) {
tmp_reg5.xy = (vs_pica.f[64 + addr_regs.y].yxxx).xy;
tmp_reg6.xy = (vs_pica.f[65 + addr_regs.y].yxxx).xy;
tmp_reg7.xy = (vs_pica.f[66 + addr_regs.y].yxxx).xy;
}
return false;
}
bool Vfn18() {
bool_regs = notEqual(vs_pica.f[5].xx, tmp_reg1.xy);
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
tmp_reg5.xy = (vs_pica.f[67 + addr_regs.y].yxxx).xy;
tmp_reg6.xy = (vs_pica.f[68 + addr_regs.y].yxxx).xy;
tmp_reg7.xy = (vs_pica.f[69 + addr_regs.y].yxxx).xy;
}
if (all(bvec2(!bool_regs.x, bool_regs.y))) {
tmp_reg5.xy = (vs_pica.f[67 + addr_regs.y].wzzz).xy;
tmp_reg6.xy = (vs_pica.f[68 + addr_regs.y].wzzz).xy;
tmp_reg7.xy = (vs_pica.f[69 + addr_regs.y].wzzz).xy;
}
return false;
}
// shader: 8B30, 412AC109E836D862
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
vec3 color_output_3 = ByteRound(clamp((const_color[3].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((const_color[3].a) * (1.0 - texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((const_color[4].rgb), (texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((const_color[4].a), (texcolor0.a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, A20B986661D9E689
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
vec3 color_output_3 = ByteRound(clamp((const_color[3].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((const_color[3].a) * (1.0 - texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((const_color[4].rgb), (texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((const_color[4].a), (texcolor0.a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (const_color[5].rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (const_color[5].a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, B078C5F7BB55E3E0
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
vec3 color_output_3 = ByteRound(clamp((vec3(1) - texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, D4DF22D667848958
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
vec3 color_output_3 = ByteRound(clamp(mix((texcolor1.rgb), (texcolor0.rgb), (const_color[3].aaa)), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp(mix((texcolor1.a), (texcolor0.a), (const_color[3].a)), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((combiner_buffer.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(mix((combiner_buffer.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 384C079991CF7FB0
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
vec3 color_output_3 = ByteRound(clamp((texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((vec3(1) - texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 527D6DE4CAF36738
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
vec3 color_output_3 = ByteRound(clamp((texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((vec3(1) - texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (const_color[5].rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (const_color[5].a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 009A891FC4825999, 6089902024F82DD6
// reference: 1DFD0FBA90BFC325, 412AC109E836D862
// reference: 1DFD0FBA7E2843C5, A20B986661D9E689
// reference: D265EB45D4A2AD85, B078C5F7BB55E3E0
// reference: F11C49A9A5BD9EA2, D4DF22D667848958
// reference: A1170514D4A2AD85, 384C079991CF7FB0
// reference: A11705143A352D65, 527D6DE4CAF36738
// program: 6089902024F82DD6, 0000000000000000, 412AC109E836D862
// program: 6089902024F82DD6, 0000000000000000, A20B986661D9E689
// program: 6089902024F82DD6, 0000000000000000, B078C5F7BB55E3E0
// program: 6089902024F82DD6, 0000000000000000, D4DF22D667848958
// program: 6089902024F82DD6, 0000000000000000, 384C079991CF7FB0
// program: 6089902024F82DD6, 0000000000000000, 527D6DE4CAF36738
// shader: 8B31, 286543F1975717DA

#define mul_s(x, y) mix(x * y, vec4(0), isnan(x * y))
#define fma_s(x, y, z) (mul_s(x, y) + z)
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
texcoord0 = vec4(vs_out_reg2.x,vs_out_reg2.y,1,1);
texcoord12 = vec4(1,1,1,1);
view = vec4(1,1,1,1);
}
void main() {
vs_out_reg0 = vec4(0, 0, 0, 1);
vs_out_reg1 = vec4(0, 0, 0, 1);
vs_out_reg2 = vec4(0, 0, 0, 1);
ExecVS();
EmitVtx();
}
bvec2 bool_regs = bvec2(false);
ivec3 addr_regs = ivec3(0);
bool Vfn0();
vec4 tmp_reg12;
vec4 tmp_reg13;
vec4 tmp_reg14;
vec4 tmp_reg15;
bool ExecVS() {
tmp_reg12 = vec4(0, 0, 0, 1);
tmp_reg13 = vec4(0, 0, 0, 1);
tmp_reg14 = vec4(0, 0, 0, 1);
tmp_reg15 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn0() {
tmp_reg13 = vs_pica.f[10].xxxz;
tmp_reg12.x = (vs_in_reg0.wwww).x;
tmp_reg13.xyz = (vs_in_reg0.xyzz).xyz;
tmp_reg14.y = rcp_s(tmp_reg12.x);
tmp_reg14.x = (-vs_pica.f[80].xxxx + tmp_reg12.xxxx).x;
tmp_reg14.z = (mul_s(tmp_reg14.xxxx, tmp_reg14.yyyy)).z;
tmp_reg13.x = (fma_s(tmp_reg14.zzzz, vs_pica.f[80].yyyy, vs_in_reg0.xxxx)).x;
tmp_reg15 = tmp_reg13;
tmp_reg13.x = dot_s(vs_pica.f[90], tmp_reg15);
tmp_reg13.y = dot_s(vs_pica.f[91], tmp_reg15);
tmp_reg13.z = dot_s(vs_pica.f[92], tmp_reg15);
vs_out_reg1 = vs_in_reg2;
vs_out_reg2 = vs_in_reg1.xyyy;
vs_out_reg0.x = dot_s(vs_pica.f[86], tmp_reg13);
vs_out_reg0.y = dot_s(vs_pica.f[87], tmp_reg13);
vs_out_reg0.z = dot_s(vs_pica.f[88], tmp_reg13);
vs_out_reg0.w = dot_s(vs_pica.f[89], tmp_reg13);
return true;
}
// shader: 8B30, 74222AB89B3F1BC8
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
if (gl_FragCoord.x < scissor_x1 || gl_FragCoord.y < scissor_y1 || gl_FragCoord.x >= scissor_x2 || gl_FragCoord.y >= scissor_y2) discard;
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
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B31, 68FD505661AD5B02

#define mul_s(x, y) mix(x * y, vec4(0), isnan(x * y))
#define fma_s(x, y, z) (mul_s(x, y) + z)
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
layout(location=5) in vec4 vs_in_reg5;
layout(location=6) in vec4 vs_in_reg6;
layout(location=7) in vec4 vs_in_reg7;
layout(location=8) in vec4 vs_in_reg8;
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
vec4 vtx_color = vec4(vs_out_reg3.x,vs_out_reg3.y,vs_out_reg3.z,vs_out_reg3.w);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg4.x,vs_out_reg4.y,vs_out_reg4.z,1);
texcoord12 = vec4(1,1,1,1);
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
bool Vfn22();
bool Vfn4();
bool Vfn10();
bool Vfn1();
bool Vfn2();
bool Vfn3();
bool Vfn5();
bool Vfn8();
bool Vfn9();
bool Vfn11();
bool Vfn21();
bool Vfn23();
bool Vfn25();
bool Vfn28();
bool Vfn29();
bool Vfn30();
bool Vfn6();
bool Vfn7();
bool Vfn12();
bool Vfn13();
bool Vfn15();
bool Vfn18();
bool Vfn33();
bool Vfn34();
bool Vfn36();
bool Vfn39();
bool Vfn40();
bool Vfn46();
bool Vfn48();
bool Vfn49();
bool Vfn51();
bool Vfn41();
bool Vfn43();
bool Vfn0();
vec4 tmp_reg0;
vec4 tmp_reg1;
vec4 tmp_reg2;
vec4 tmp_reg3;
vec4 tmp_reg4;
vec4 tmp_reg5;
vec4 tmp_reg6;
vec4 tmp_reg7;
vec4 tmp_reg8;
vec4 tmp_reg9;
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
tmp_reg4 = vec4(0, 0, 0, 1);
tmp_reg5 = vec4(0, 0, 0, 1);
tmp_reg6 = vec4(0, 0, 0, 1);
tmp_reg7 = vec4(0, 0, 0, 1);
tmp_reg8 = vec4(0, 0, 0, 1);
tmp_reg9 = vec4(0, 0, 0, 1);
tmp_reg10 = vec4(0, 0, 0, 1);
tmp_reg11 = vec4(0, 0, 0, 1);
tmp_reg12 = vec4(0, 0, 0, 1);
tmp_reg13 = vec4(0, 0, 0, 1);
tmp_reg14 = vec4(0, 0, 0, 1);
tmp_reg15 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn22() {
addr_regs.x = (ivec2(tmp_reg1.xx)).x;
tmp_reg3.x = dot_s(vs_pica.f[25 + addr_regs.x], tmp_reg15);
tmp_reg3.y = dot_s(vs_pica.f[26 + addr_regs.x], tmp_reg15);
tmp_reg3.z = dot_s(vs_pica.f[27 + addr_regs.x], tmp_reg15);
tmp_reg7 = fma_s(tmp_reg1.wwww, tmp_reg3, tmp_reg7);
return false;
}
bool Vfn4() {
addr_regs.x = (ivec2(tmp_reg1.xx)).x;
tmp_reg3.x = dot_s(vs_pica.f[25 + addr_regs.x], tmp_reg15);
tmp_reg3.y = dot_s(vs_pica.f[26 + addr_regs.x], tmp_reg15);
tmp_reg3.z = dot_s(vs_pica.f[27 + addr_regs.x], tmp_reg15);
tmp_reg4.x = dot_3(vs_pica.f[25 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg4.y = dot_3(vs_pica.f[26 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg4.z = dot_3(vs_pica.f[27 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg7 = fma_s(tmp_reg1.wwww, tmp_reg3, tmp_reg7);
tmp_reg12 = fma_s(tmp_reg1.wwww, tmp_reg4, tmp_reg12);
return false;
}
bool Vfn10() {
addr_regs.x = (ivec2(tmp_reg1.xx)).x;
tmp_reg3.x = dot_s(vs_pica.f[25 + addr_regs.x], tmp_reg15);
tmp_reg3.y = dot_s(vs_pica.f[26 + addr_regs.x], tmp_reg15);
tmp_reg3.z = dot_s(vs_pica.f[27 + addr_regs.x], tmp_reg15);
tmp_reg4.x = dot_3(vs_pica.f[25 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg4.y = dot_3(vs_pica.f[26 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg4.z = dot_3(vs_pica.f[27 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg5.x = dot_3(vs_pica.f[25 + addr_regs.x].xyz, tmp_reg13.xyz);
tmp_reg5.y = dot_3(vs_pica.f[26 + addr_regs.x].xyz, tmp_reg13.xyz);
tmp_reg5.z = dot_3(vs_pica.f[27 + addr_regs.x].xyz, tmp_reg13.xyz);
tmp_reg7 = fma_s(tmp_reg1.wwww, tmp_reg3, tmp_reg7);
tmp_reg12 = fma_s(tmp_reg1.wwww, tmp_reg4, tmp_reg12);
tmp_reg11 = fma_s(tmp_reg1.wwww, tmp_reg5, tmp_reg11);
return false;
}
bool Vfn1() {
tmp_reg15.xyz = (mul_s(vs_pica.f[7].xxxx, vs_in_reg0)).xyz;
tmp_reg14.xyz = (mul_s(vs_pica.f[7].yyyy, vs_in_reg1)).xyz;
tmp_reg13.xyz = (mul_s(vs_pica.f[7].zzzz, vs_in_reg2)).xyz;
tmp_reg15.xyz = (vs_pica.f[6] + tmp_reg15).xyz;
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
if (vs_pica.b[1]) {
Vfn2();
} else {
Vfn25();
}
return false;
}
bool Vfn2() {
tmp_reg0 = vs_pica.f[7];
bool_regs = notEqual(vs_pica.f[93].xx, tmp_reg0.yz);
tmp_reg7 = vs_pica.f[93].xxxx;
tmp_reg12 = vs_pica.f[93].xxxx;
tmp_reg11 = vs_pica.f[93].xxxx;
tmp_reg2 = mul_s(vs_pica.f[93].wwww, vs_in_reg7);
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
Vfn3();
} else {
Vfn8();
}
vs_out_reg2 = -tmp_reg15;
tmp_reg0.x = dot_s(vs_pica.f[86], tmp_reg15);
tmp_reg0.y = dot_s(vs_pica.f[87], tmp_reg15);
tmp_reg0.z = dot_s(vs_pica.f[88], tmp_reg15);
tmp_reg0.w = dot_s(vs_pica.f[89], tmp_reg15);
tmp_reg1.x = (-tmp_reg0.wwww).x;
tmp_reg1.y = (mul_s(vs_pica.f[95].zzzz, -tmp_reg0.wwww)).y;
bool_regs.x = tmp_reg0.xxxx.x > tmp_reg1.xyyy.x;
bool_regs.y = tmp_reg0.xxxx.y < tmp_reg1.xyyy.y;
if (all(bool_regs)) {
tmp_reg0.x = (-tmp_reg0.wwww).x;
}
vs_out_reg0 = tmp_reg0;
return false;
}
bool Vfn3() {
bool_regs = notEqual(vs_pica.f[93].xx, vs_in_reg8.zw);
tmp_reg1.xy = (tmp_reg2.xxxx).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.xxxx)).w;
Vfn4();
tmp_reg1.xy = (tmp_reg2.yyyy).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.yyyy)).w;
Vfn4();
tmp_reg1.xy = (tmp_reg2.zzzz).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.zzzz)).w;
if (bool_regs.x) {
Vfn4();
}
if (vs_pica.b[8]) {
Vfn5();
}
tmp_reg7.w = (vs_pica.f[93].yyyy).w;
tmp_reg10.x = dot_s(vs_pica.f[0], tmp_reg7);
tmp_reg10.y = dot_s(vs_pica.f[1], tmp_reg7);
tmp_reg10.z = dot_s(vs_pica.f[2], tmp_reg7);
tmp_reg10.w = (vs_pica.f[93].yyyy).w;
Vfn6();
tmp_reg15.x = dot_s(vs_pica.f[90], tmp_reg10);
tmp_reg15.y = dot_s(vs_pica.f[91], tmp_reg10);
tmp_reg15.z = dot_s(vs_pica.f[92], tmp_reg10);
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
tmp_reg14.x = dot_3(vs_pica.f[3].xyz, tmp_reg12.xyz);
tmp_reg14.y = dot_3(vs_pica.f[4].xyz, tmp_reg12.xyz);
tmp_reg14.z = dot_3(vs_pica.f[5].xyz, tmp_reg12.xyz);
Vfn7();
return false;
}
bool Vfn5() {
tmp_reg1.xy = (tmp_reg2.wwww).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.wwww)).w;
if (bool_regs.y) {
Vfn4();
}
return false;
}
bool Vfn8() {
if (all(bool_regs)) {
Vfn9();
} else {
Vfn21();
}
return false;
}
bool Vfn9() {
bool_regs = notEqual(vs_pica.f[93].xx, vs_in_reg8.zw);
tmp_reg1.xy = (tmp_reg2.xxxx).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.xxxx)).w;
Vfn10();
tmp_reg1.xy = (tmp_reg2.yyyy).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.yyyy)).w;
Vfn10();
tmp_reg1.xy = (tmp_reg2.zzzz).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.zzzz)).w;
if (bool_regs.x) {
Vfn10();
}
if (vs_pica.b[8]) {
Vfn11();
}
tmp_reg7.w = (vs_pica.f[93].yyyy).w;
tmp_reg10.x = dot_s(vs_pica.f[0], tmp_reg7);
tmp_reg10.y = dot_s(vs_pica.f[1], tmp_reg7);
tmp_reg10.z = dot_s(vs_pica.f[2], tmp_reg7);
tmp_reg10.w = (vs_pica.f[93].yyyy).w;
Vfn6();
tmp_reg13.x = dot_3(vs_pica.f[3].xyz, tmp_reg11.xyz);
tmp_reg13.y = dot_3(vs_pica.f[4].xyz, tmp_reg11.xyz);
tmp_reg13.z = dot_3(vs_pica.f[5].xyz, tmp_reg11.xyz);
tmp_reg14.x = dot_3(vs_pica.f[3].xyz, tmp_reg12.xyz);
tmp_reg14.y = dot_3(vs_pica.f[4].xyz, tmp_reg12.xyz);
tmp_reg14.z = dot_3(vs_pica.f[5].xyz, tmp_reg12.xyz);
tmp_reg15.x = dot_s(vs_pica.f[90], tmp_reg10);
tmp_reg15.y = dot_s(vs_pica.f[91], tmp_reg10);
tmp_reg15.z = dot_s(vs_pica.f[92], tmp_reg10);
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
Vfn12();
return false;
}
bool Vfn11() {
tmp_reg1.xy = (tmp_reg2.wwww).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.wwww)).w;
if (bool_regs.y) {
Vfn10();
}
return false;
}
bool Vfn21() {
bool_regs = notEqual(vs_pica.f[93].xx, vs_in_reg8.zw);
tmp_reg1.xy = (tmp_reg2.xxxx).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.xxxx)).w;
Vfn22();
tmp_reg1.xy = (tmp_reg2.yyyy).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.yyyy)).w;
Vfn22();
tmp_reg1.xy = (tmp_reg2.zzzz).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.zzzz)).w;
if (bool_regs.x) {
Vfn22();
}
if (vs_pica.b[8]) {
Vfn23();
}
tmp_reg7.w = (vs_pica.f[93].yyyy).w;
tmp_reg10.x = dot_s(vs_pica.f[0], tmp_reg7);
tmp_reg10.y = dot_s(vs_pica.f[1], tmp_reg7);
tmp_reg10.z = dot_s(vs_pica.f[2], tmp_reg7);
tmp_reg10.w = (vs_pica.f[93].yyyy).w;
tmp_reg15.x = dot_s(vs_pica.f[90], tmp_reg10);
tmp_reg15.y = dot_s(vs_pica.f[91], tmp_reg10);
tmp_reg15.z = dot_s(vs_pica.f[92], tmp_reg10);
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
vs_out_reg1 = vs_pica.f[93].xxxx;
return false;
}
bool Vfn23() {
tmp_reg1.xy = (tmp_reg2.wwww).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.wwww)).w;
if (bool_regs.y) {
Vfn22();
}
return false;
}
bool Vfn25() {
tmp_reg0 = vs_pica.f[7];
bool_regs = notEqual(vs_pica.f[93].xx, tmp_reg0.yz);
if (vs_pica.b[2]) {
tmp_reg1.x = (mul_s(vs_pica.f[93].wwww, vs_in_reg7.xxxx)).x;
addr_regs.x = (ivec2(tmp_reg1.xx)).x;
tmp_reg7.x = dot_s(vs_pica.f[25 + addr_regs.x], tmp_reg15);
tmp_reg7.y = dot_s(vs_pica.f[26 + addr_regs.x], tmp_reg15);
tmp_reg7.z = dot_s(vs_pica.f[27 + addr_regs.x], tmp_reg15);
tmp_reg7.w = (vs_pica.f[93].yyyy).w;
tmp_reg10.x = dot_s(vs_pica.f[0], tmp_reg7);
tmp_reg10.y = dot_s(vs_pica.f[1], tmp_reg7);
tmp_reg10.z = dot_s(vs_pica.f[2], tmp_reg7);
tmp_reg10.w = (vs_pica.f[93].yyyy).w;
} else {
addr_regs.x = (ivec2(vs_pica.f[93].xx)).x;
tmp_reg10.x = dot_s(vs_pica.f[25], tmp_reg15);
tmp_reg10.y = dot_s(vs_pica.f[26], tmp_reg15);
tmp_reg10.z = dot_s(vs_pica.f[27], tmp_reg15);
tmp_reg10.w = (vs_pica.f[93].yyyy).w;
}
Vfn6();
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
Vfn28();
} else {
Vfn29();
}
vs_out_reg2 = -tmp_reg15;
tmp_reg0.x = dot_s(vs_pica.f[86], tmp_reg15);
tmp_reg0.y = dot_s(vs_pica.f[87], tmp_reg15);
tmp_reg0.z = dot_s(vs_pica.f[88], tmp_reg15);
tmp_reg0.w = dot_s(vs_pica.f[89], tmp_reg15);
tmp_reg1.x = (-tmp_reg0.wwww).x;
tmp_reg1.y = (mul_s(vs_pica.f[95].zzzz, -tmp_reg0.wwww)).y;
bool_regs.x = tmp_reg0.xxxx.x > tmp_reg1.xyyy.x;
bool_regs.y = tmp_reg0.xxxx.y < tmp_reg1.xyyy.y;
if (all(bool_regs)) {
tmp_reg0.x = (-tmp_reg0.wwww).x;
}
vs_out_reg0 = tmp_reg0;
return false;
}
bool Vfn28() {
tmp_reg12.x = dot_3(vs_pica.f[25 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg12.y = dot_3(vs_pica.f[26 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg12.z = dot_3(vs_pica.f[27 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg15.x = dot_s(vs_pica.f[90], tmp_reg10);
tmp_reg15.y = dot_s(vs_pica.f[91], tmp_reg10);
tmp_reg15.z = dot_s(vs_pica.f[92], tmp_reg10);
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
tmp_reg14.x = dot_3(vs_pica.f[3].xyz, tmp_reg12.xyz);
tmp_reg14.y = dot_3(vs_pica.f[4].xyz, tmp_reg12.xyz);
tmp_reg14.z = dot_3(vs_pica.f[5].xyz, tmp_reg12.xyz);
Vfn7();
return false;
}
bool Vfn29() {
if (all(bool_regs)) {
Vfn30();
} else {
tmp_reg15.x = dot_s(vs_pica.f[90], tmp_reg10);
tmp_reg15.y = dot_s(vs_pica.f[91], tmp_reg10);
tmp_reg15.z = dot_s(vs_pica.f[92], tmp_reg10);
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
vs_out_reg1 = vs_pica.f[93].xxxx;
}
return false;
}
bool Vfn30() {
tmp_reg12.x = dot_3(vs_pica.f[25 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg12.y = dot_3(vs_pica.f[26 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg12.z = dot_3(vs_pica.f[27 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg11.x = dot_3(vs_pica.f[25 + addr_regs.x].xyz, tmp_reg13.xyz);
tmp_reg11.y = dot_3(vs_pica.f[26 + addr_regs.x].xyz, tmp_reg13.xyz);
tmp_reg11.z = dot_3(vs_pica.f[27 + addr_regs.x].xyz, tmp_reg13.xyz);
tmp_reg15.x = dot_s(vs_pica.f[90], tmp_reg10);
tmp_reg15.y = dot_s(vs_pica.f[91], tmp_reg10);
tmp_reg15.z = dot_s(vs_pica.f[92], tmp_reg10);
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
tmp_reg14.x = dot_3(vs_pica.f[3].xyz, tmp_reg12.xyz);
tmp_reg14.y = dot_3(vs_pica.f[4].xyz, tmp_reg12.xyz);
tmp_reg14.z = dot_3(vs_pica.f[5].xyz, tmp_reg12.xyz);
tmp_reg13.x = dot_3(vs_pica.f[3].xyz, tmp_reg11.xyz);
tmp_reg13.y = dot_3(vs_pica.f[4].xyz, tmp_reg11.xyz);
tmp_reg13.z = dot_3(vs_pica.f[5].xyz, tmp_reg11.xyz);
Vfn12();
return false;
}
bool Vfn6() {
tmp_reg0.x = (vs_pica.f[81].xxxx + tmp_reg10.zzzz).x;
tmp_reg1.x = rcp_s(tmp_reg0.x);
tmp_reg1.y = (-vs_pica.f[80].xxxx + tmp_reg0.xxxx).y;
tmp_reg1.z = (mul_s(tmp_reg1.xxxx, tmp_reg1.yyyy)).z;
tmp_reg10.x = (fma_s(tmp_reg1.zzzz, vs_pica.f[80].yyyy, tmp_reg10.xxxx)).x;
return false;
}
bool Vfn7() {
uint jmp_to = 222u;
while (true) {
switch (jmp_to) {
case 222u:
tmp_reg6.x = dot_3(tmp_reg14.xyz, tmp_reg14.xyz);
tmp_reg7.x = dot_3(tmp_reg12.xyz, tmp_reg12.xyz);
tmp_reg6.x = rsq_s(tmp_reg6.x);
tmp_reg7.x = rsq_s(tmp_reg7.x);
tmp_reg14.xyz = (mul_s(tmp_reg14.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg12.xyz = (mul_s(tmp_reg12.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg0 = vs_pica.f[93].yxxx;
if (!vs_pica.b[15]) {
jmp_to = 238u; break;
}
tmp_reg4 = vs_pica.f[93].yyyy + tmp_reg14.zzzz;
tmp_reg4 = mul_s(vs_pica.f[94].zzzz, tmp_reg4);
bool_regs = greaterThanEqual(vs_pica.f[93].xx, tmp_reg4.xx);
tmp_reg4 = vec4(rsq_s(tmp_reg4.x));
tmp_reg5 = mul_s(vs_pica.f[94].zzzz, tmp_reg14);
if (bool_regs.x) {
jmp_to = 238u; break;
}
tmp_reg0.z = rcp_s(tmp_reg4.x);
tmp_reg0.xy = (mul_s(tmp_reg5, tmp_reg4)).xy;
case 238u:
vs_out_reg1 = tmp_reg0;
default: return false;
}
}
return false;
}
bool Vfn12() {
uint jmp_to = 239u;
while (true) {
switch (jmp_to) {
case 239u:
tmp_reg6.x = dot_3(tmp_reg14.xyz, tmp_reg14.xyz);
tmp_reg7.x = dot_3(tmp_reg12.xyz, tmp_reg12.xyz);
tmp_reg6.x = rsq_s(tmp_reg6.x);
tmp_reg7.x = rsq_s(tmp_reg7.x);
tmp_reg14.xyz = (mul_s(tmp_reg14.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg12.xyz = (mul_s(tmp_reg12.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg13.xyz = (mul_s(tmp_reg13.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg11.xyz = (mul_s(tmp_reg11.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg0 = vs_pica.f[93].yxxx;
if (!vs_pica.b[15]) {
jmp_to = 314u; break;
}
tmp_reg13.xyz = (mul_s(tmp_reg13.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg11.xyz = (mul_s(tmp_reg11.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg5 = mul_s(tmp_reg14.yzxx, tmp_reg13.zxyy);
tmp_reg5 = fma_s(-tmp_reg13.yzxx, tmp_reg14.zxyy, tmp_reg5);
tmp_reg5.w = dot_3(tmp_reg5.xyz, tmp_reg5.xyz);
tmp_reg5.w = rsq_s(tmp_reg5.w);
tmp_reg5 = mul_s(tmp_reg5, tmp_reg5.wwww);
tmp_reg6.w = (tmp_reg14.zzzz + tmp_reg5.yyyy).w;
tmp_reg13 = mul_s(tmp_reg5.yzxx, tmp_reg14.zxyy);
tmp_reg13 = fma_s(-tmp_reg14.yzxx, tmp_reg5.zxyy, tmp_reg13);
tmp_reg6.w = (tmp_reg13.xxxx + tmp_reg6).w;
tmp_reg13.w = (tmp_reg5.zzzz).w;
tmp_reg5.z = (tmp_reg13.xxxx).z;
tmp_reg6.w = (vs_pica.f[93].yyyy + tmp_reg6).w;
tmp_reg14.w = (tmp_reg5.xxxx).w;
tmp_reg5.x = (tmp_reg14.zzzz).x;
bool_regs = lessThan(vs_pica.f[94].yy, tmp_reg6.ww);
tmp_reg6.x = (vs_pica.f[93].yyyy).x;
tmp_reg6.y = (-vs_pica.f[93].yyyy).y;
if (!bool_regs.x) {
jmp_to = 276u; break;
}
tmp_reg7.xz = (tmp_reg13.wwyy + -tmp_reg14.yyww).xz;
tmp_reg7.y = (tmp_reg14.xxxx + -tmp_reg13.zzzz).y;
tmp_reg7.w = (tmp_reg6).w;
tmp_reg6 = vec4(dot_s(tmp_reg7, tmp_reg7));
tmp_reg6 = vec4(rsq_s(tmp_reg6.x));
tmp_reg0 = mul_s(tmp_reg7, tmp_reg6);
if (vs_pica.b[0]) {
jmp_to = 314u; break;
}
case 276u:
bool_regs = greaterThan(tmp_reg5.zy, tmp_reg5.yx);
if (bool_regs.x) {
Vfn13();
} else {
Vfn18();
}
tmp_reg6 = vec4(dot_s(tmp_reg8, tmp_reg8));
tmp_reg6 = vec4(rsq_s(tmp_reg6.x));
tmp_reg0 = mul_s(tmp_reg8, tmp_reg6);
case 314u:
vs_out_reg1 = tmp_reg0;
default: return false;
}
}
return false;
}
bool Vfn13() {
if (bool_regs.y) {
tmp_reg8 = mul_s(tmp_reg13.yyzw, tmp_reg6.xxxy);
tmp_reg8.x = (vs_pica.f[93].yyyy + -tmp_reg5.yyyy).x;
tmp_reg9 = tmp_reg5.zzzz + -tmp_reg5.xxxx;
tmp_reg8.yzw = (tmp_reg8 + tmp_reg14.wwxy).yzw;
tmp_reg8.x = (tmp_reg9 + tmp_reg8).x;
} else {
Vfn15();
}
tmp_reg8.w = (-tmp_reg8).w;
return false;
}
bool Vfn15() {
bool_regs = greaterThan(tmp_reg5.zz, tmp_reg5.xx);
tmp_reg8 = mul_s(tmp_reg13.yyzw, tmp_reg6.xxxy);
tmp_reg8.x = (vs_pica.f[93].yyyy + -tmp_reg5.yyyy).x;
if (bool_regs.x) {
tmp_reg9 = tmp_reg5.zzzz + -tmp_reg5.xxxx;
tmp_reg8.yzw = (tmp_reg8 + tmp_reg14.wwxy).yzw;
tmp_reg8.x = (tmp_reg9 + tmp_reg8).x;
} else {
tmp_reg8 = mul_s(tmp_reg13.zwwy, tmp_reg6.xxxy);
tmp_reg8.z = (vs_pica.f[93].yyyy + -tmp_reg5.zzzz).z;
tmp_reg9 = tmp_reg5.xxxx + -tmp_reg5.yyyy;
tmp_reg8.xyw = (tmp_reg8 + tmp_reg14.xyyw).xyw;
tmp_reg8.z = (tmp_reg9 + tmp_reg8).z;
}
return false;
}
bool Vfn18() {
if (bool_regs.y) {
tmp_reg8 = mul_s(tmp_reg13.yywz, tmp_reg6.xxxy);
tmp_reg8.y = (vs_pica.f[93].yyyy + -tmp_reg5.zzzz).y;
tmp_reg9 = tmp_reg5.yyyy + -tmp_reg5.xxxx;
tmp_reg8.xzw = (tmp_reg8 + tmp_reg14.wwyx).xzw;
tmp_reg8.y = (tmp_reg9 + tmp_reg8).y;
} else {
tmp_reg8 = mul_s(tmp_reg13.zwwy, tmp_reg6.xxxy);
tmp_reg8.z = (vs_pica.f[93].yyyy + -tmp_reg5.zzzz).z;
tmp_reg9 = tmp_reg5.xxxx + -tmp_reg5.yyyy;
tmp_reg8.xyw = (tmp_reg8 + tmp_reg14.xyyw).xyw;
tmp_reg8.z = (tmp_reg9 + tmp_reg8).z;
tmp_reg8.w = (-tmp_reg8).w;
}
return false;
}
bool Vfn33() {
tmp_reg8.xy = (vs_pica.f[93].xxxx).xy;
tmp_reg0.y = (vs_pica.f[7].wwww).y;
bool_regs = notEqual(vs_pica.f[93].xx, tmp_reg0.xy);
tmp_reg9.xyz = (vs_pica.f[93].xxxx).xyz;
tmp_reg9.w = (vs_pica.f[21].wwww).w;
if (bool_regs.y) {
Vfn34();
}
if (vs_pica.b[5]) {
Vfn36();
}
bool_regs = equal(vs_pica.f[93].xx, tmp_reg8.xy);
if (all(bool_regs)) {
tmp_reg9 = vs_pica.f[21];
}
vs_out_reg3 = max_s(vs_pica.f[93].xxxx, tmp_reg9);
return false;
}
bool Vfn34() {
tmp_reg0 = mul_s(vs_pica.f[7].wwww, vs_in_reg3);
if (vs_pica.b[7]) {
tmp_reg9.w = (mul_s(tmp_reg9.wwww, tmp_reg0.wwww)).w;
}
tmp_reg9.xyz = (mul_s(vs_pica.f[20].wwww, tmp_reg0.xyzz)).xyz;
tmp_reg8.x = (vs_pica.f[93].yyyy).x;
return false;
}
bool Vfn36() {
tmp_reg1 = vec4(dot_3(vs_pica.f[24].xyz, tmp_reg14.xyz));
tmp_reg2 = vs_pica.f[24].wwww;
tmp_reg1 = fma_s(tmp_reg1, tmp_reg2, tmp_reg2);
tmp_reg3 = vs_pica.f[22];
tmp_reg2 = vs_pica.f[23] + -tmp_reg3;
tmp_reg4 = fma_s(tmp_reg2, tmp_reg1, tmp_reg3);
if (vs_pica.b[6]) {
tmp_reg4 = mul_s(tmp_reg4, tmp_reg9.wwww);
}
tmp_reg9.xyz = (fma_s(tmp_reg4, vs_pica.f[21], tmp_reg9)).xyz;
tmp_reg8.x = (vs_pica.f[93].yyyy).x;
return false;
}
bool Vfn39() {
tmp_reg0.xy = (vs_pica.f[10].xxxx).xy;
if (vs_pica.b[9]) {
Vfn40();
} else {
Vfn46();
}
return false;
}
bool Vfn40() {
Vfn41();
tmp_reg3.x = dot_s(vs_pica.f[11].xywz, tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12].xywz, tmp_reg6);
tmp_reg3.zw = (vs_pica.f[93].xxxx).zw;
vs_out_reg4 = tmp_reg3;
return false;
}
bool Vfn46() {
bool_regs = equal(vs_pica.f[95].xy, tmp_reg0.xy);
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
if (all(not(bool_regs))) {
tmp_reg6 = tmp_reg10;
tmp_reg3.x = dot_s(vs_pica.f[11], tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12], tmp_reg6);
tmp_reg3.z = dot_s(vs_pica.f[13], tmp_reg6);
tmp_reg0.xy = (mul_s(vs_pica.f[19].xyyy, tmp_reg3.zzzz)).xy;
tmp_reg3.xy = (tmp_reg3.xyyy + tmp_reg0.xyyy).xy;
} else {
Vfn48();
}
vs_out_reg4 = tmp_reg3;
return false;
}
bool Vfn48() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
Vfn49();
} else {
Vfn51();
}
return false;
}
bool Vfn49() {
tmp_reg2 = -tmp_reg15;
tmp_reg2.w = dot_3(tmp_reg2.xyz, tmp_reg2.xyz);
tmp_reg2.w = rsq_s(tmp_reg2.w);
tmp_reg2 = mul_s(tmp_reg2, tmp_reg2.wwww);
tmp_reg1 = vec4(dot_3(tmp_reg2.xyz, tmp_reg14.xyz));
tmp_reg1 = tmp_reg1 + tmp_reg1;
tmp_reg6 = fma_s(tmp_reg1, tmp_reg14, -tmp_reg2);
tmp_reg3.x = dot_3(vs_pica.f[11].xyz, tmp_reg6.xyz);
tmp_reg3.y = dot_3(vs_pica.f[12].xyz, tmp_reg6.xyz);
tmp_reg3.z = dot_3(vs_pica.f[13].xyz, tmp_reg6.xyz);
return false;
}
bool Vfn51() {
tmp_reg1.xy = (vs_pica.f[94].zzzz).xy;
tmp_reg1.zw = (vs_pica.f[93].xxxx).zw;
tmp_reg6 = fma_s(tmp_reg14, tmp_reg1, tmp_reg1);
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
tmp_reg3.x = dot_s(vs_pica.f[11], tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12], tmp_reg6);
return false;
}
bool Vfn41() {
bool_regs = equal(vs_pica.f[93].yz, tmp_reg0.xy);
if (all(not(bool_regs))) {
tmp_reg6.xy = (mul_s(vs_pica.f[8].xxxx, vs_in_reg4.xyyy)).xy;
} else {
Vfn43();
}
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
return false;
}
bool Vfn43() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
tmp_reg6.xy = (mul_s(vs_pica.f[8].yyyy, vs_in_reg5.xyyy)).xy;
} else {
tmp_reg6.xy = (mul_s(vs_pica.f[8].zzzz, vs_in_reg6.xyyy)).xy;
}
return false;
}
bool Vfn0() {
Vfn1();
Vfn33();
Vfn39();
return true;
}
// shader: 8B30, 15C7483CDCAC839B
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
if (gl_FragCoord.x < scissor_x1 || gl_FragCoord.y < scissor_y1 || gl_FragCoord.x >= scissor_x2 || gl_FragCoord.y >= scissor_y2) discard;
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
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, F9280F16AFA7D82A
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
if (gl_FragCoord.x < scissor_x1 || gl_FragCoord.y < scissor_y1 || gl_FragCoord.x >= scissor_x2 || gl_FragCoord.y >= scissor_y2) discard;
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (texcolor0.rgb);
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B31, 8BDB60558C9403BE

#define mul_s(x, y) mix(x * y, vec4(0), isnan(x * y))
#define fma_s(x, y, z) (mul_s(x, y) + z)
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
layout(location=5) in vec4 vs_in_reg5;
vec4 vs_out_reg5;
layout(location=6) in vec4 vs_in_reg6;
layout(location=7) in vec4 vs_in_reg7;
layout(location=8) in vec4 vs_in_reg8;
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
vec4 vtx_color = vec4(vs_out_reg3.x,vs_out_reg3.y,vs_out_reg3.z,vs_out_reg3.w);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg4.x,vs_out_reg4.y,vs_out_reg4.z,1);
texcoord12 = vec4(vs_out_reg5.x,vs_out_reg5.y,1,1);
view = vec4(vs_out_reg2.x,vs_out_reg2.y,vs_out_reg2.z,1);
}
void main() {
vs_out_reg0 = vec4(0, 0, 0, 1);
vs_out_reg1 = vec4(0, 0, 0, 1);
vs_out_reg2 = vec4(0, 0, 0, 1);
vs_out_reg3 = vec4(0, 0, 0, 1);
vs_out_reg4 = vec4(0, 0, 0, 1);
vs_out_reg5 = vec4(0, 0, 0, 1);
ExecVS();
EmitVtx();
}
bvec2 bool_regs = bvec2(false);
ivec3 addr_regs = ivec3(0);
bool Vfn22();
bool Vfn4();
bool Vfn10();
bool Vfn1();
bool Vfn2();
bool Vfn3();
bool Vfn5();
bool Vfn8();
bool Vfn9();
bool Vfn11();
bool Vfn21();
bool Vfn23();
bool Vfn25();
bool Vfn28();
bool Vfn29();
bool Vfn30();
bool Vfn6();
bool Vfn7();
bool Vfn12();
bool Vfn13();
bool Vfn15();
bool Vfn18();
bool Vfn33();
bool Vfn34();
bool Vfn36();
bool Vfn39();
bool Vfn40();
bool Vfn46();
bool Vfn48();
bool Vfn49();
bool Vfn51();
bool Vfn41();
bool Vfn43();
bool Vfn52();
bool Vfn53();
bool Vfn54();
bool Vfn55();
bool Vfn56();
bool Vfn58();
bool Vfn0();
vec4 tmp_reg0;
vec4 tmp_reg1;
vec4 tmp_reg2;
vec4 tmp_reg3;
vec4 tmp_reg4;
vec4 tmp_reg5;
vec4 tmp_reg6;
vec4 tmp_reg7;
vec4 tmp_reg8;
vec4 tmp_reg9;
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
tmp_reg4 = vec4(0, 0, 0, 1);
tmp_reg5 = vec4(0, 0, 0, 1);
tmp_reg6 = vec4(0, 0, 0, 1);
tmp_reg7 = vec4(0, 0, 0, 1);
tmp_reg8 = vec4(0, 0, 0, 1);
tmp_reg9 = vec4(0, 0, 0, 1);
tmp_reg10 = vec4(0, 0, 0, 1);
tmp_reg11 = vec4(0, 0, 0, 1);
tmp_reg12 = vec4(0, 0, 0, 1);
tmp_reg13 = vec4(0, 0, 0, 1);
tmp_reg14 = vec4(0, 0, 0, 1);
tmp_reg15 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn22() {
addr_regs.x = (ivec2(tmp_reg1.xx)).x;
tmp_reg3.x = dot_s(vs_pica.f[25 + addr_regs.x], tmp_reg15);
tmp_reg3.y = dot_s(vs_pica.f[26 + addr_regs.x], tmp_reg15);
tmp_reg3.z = dot_s(vs_pica.f[27 + addr_regs.x], tmp_reg15);
tmp_reg7 = fma_s(tmp_reg1.wwww, tmp_reg3, tmp_reg7);
return false;
}
bool Vfn4() {
addr_regs.x = (ivec2(tmp_reg1.xx)).x;
tmp_reg3.x = dot_s(vs_pica.f[25 + addr_regs.x], tmp_reg15);
tmp_reg3.y = dot_s(vs_pica.f[26 + addr_regs.x], tmp_reg15);
tmp_reg3.z = dot_s(vs_pica.f[27 + addr_regs.x], tmp_reg15);
tmp_reg4.x = dot_3(vs_pica.f[25 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg4.y = dot_3(vs_pica.f[26 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg4.z = dot_3(vs_pica.f[27 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg7 = fma_s(tmp_reg1.wwww, tmp_reg3, tmp_reg7);
tmp_reg12 = fma_s(tmp_reg1.wwww, tmp_reg4, tmp_reg12);
return false;
}
bool Vfn10() {
addr_regs.x = (ivec2(tmp_reg1.xx)).x;
tmp_reg3.x = dot_s(vs_pica.f[25 + addr_regs.x], tmp_reg15);
tmp_reg3.y = dot_s(vs_pica.f[26 + addr_regs.x], tmp_reg15);
tmp_reg3.z = dot_s(vs_pica.f[27 + addr_regs.x], tmp_reg15);
tmp_reg4.x = dot_3(vs_pica.f[25 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg4.y = dot_3(vs_pica.f[26 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg4.z = dot_3(vs_pica.f[27 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg5.x = dot_3(vs_pica.f[25 + addr_regs.x].xyz, tmp_reg13.xyz);
tmp_reg5.y = dot_3(vs_pica.f[26 + addr_regs.x].xyz, tmp_reg13.xyz);
tmp_reg5.z = dot_3(vs_pica.f[27 + addr_regs.x].xyz, tmp_reg13.xyz);
tmp_reg7 = fma_s(tmp_reg1.wwww, tmp_reg3, tmp_reg7);
tmp_reg12 = fma_s(tmp_reg1.wwww, tmp_reg4, tmp_reg12);
tmp_reg11 = fma_s(tmp_reg1.wwww, tmp_reg5, tmp_reg11);
return false;
}
bool Vfn1() {
tmp_reg15.xyz = (mul_s(vs_pica.f[7].xxxx, vs_in_reg0)).xyz;
tmp_reg14.xyz = (mul_s(vs_pica.f[7].yyyy, vs_in_reg1)).xyz;
tmp_reg13.xyz = (mul_s(vs_pica.f[7].zzzz, vs_in_reg2)).xyz;
tmp_reg15.xyz = (vs_pica.f[6] + tmp_reg15).xyz;
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
if (vs_pica.b[1]) {
Vfn2();
} else {
Vfn25();
}
return false;
}
bool Vfn2() {
tmp_reg0 = vs_pica.f[7];
bool_regs = notEqual(vs_pica.f[93].xx, tmp_reg0.yz);
tmp_reg7 = vs_pica.f[93].xxxx;
tmp_reg12 = vs_pica.f[93].xxxx;
tmp_reg11 = vs_pica.f[93].xxxx;
tmp_reg2 = mul_s(vs_pica.f[93].wwww, vs_in_reg7);
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
Vfn3();
} else {
Vfn8();
}
vs_out_reg2 = -tmp_reg15;
tmp_reg0.x = dot_s(vs_pica.f[86], tmp_reg15);
tmp_reg0.y = dot_s(vs_pica.f[87], tmp_reg15);
tmp_reg0.z = dot_s(vs_pica.f[88], tmp_reg15);
tmp_reg0.w = dot_s(vs_pica.f[89], tmp_reg15);
tmp_reg1.x = (-tmp_reg0.wwww).x;
tmp_reg1.y = (mul_s(vs_pica.f[95].zzzz, -tmp_reg0.wwww)).y;
bool_regs.x = tmp_reg0.xxxx.x > tmp_reg1.xyyy.x;
bool_regs.y = tmp_reg0.xxxx.y < tmp_reg1.xyyy.y;
if (all(bool_regs)) {
tmp_reg0.x = (-tmp_reg0.wwww).x;
}
vs_out_reg0 = tmp_reg0;
return false;
}
bool Vfn3() {
bool_regs = notEqual(vs_pica.f[93].xx, vs_in_reg8.zw);
tmp_reg1.xy = (tmp_reg2.xxxx).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.xxxx)).w;
Vfn4();
tmp_reg1.xy = (tmp_reg2.yyyy).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.yyyy)).w;
Vfn4();
tmp_reg1.xy = (tmp_reg2.zzzz).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.zzzz)).w;
if (bool_regs.x) {
Vfn4();
}
if (vs_pica.b[8]) {
Vfn5();
}
tmp_reg7.w = (vs_pica.f[93].yyyy).w;
tmp_reg10.x = dot_s(vs_pica.f[0], tmp_reg7);
tmp_reg10.y = dot_s(vs_pica.f[1], tmp_reg7);
tmp_reg10.z = dot_s(vs_pica.f[2], tmp_reg7);
tmp_reg10.w = (vs_pica.f[93].yyyy).w;
Vfn6();
tmp_reg15.x = dot_s(vs_pica.f[90], tmp_reg10);
tmp_reg15.y = dot_s(vs_pica.f[91], tmp_reg10);
tmp_reg15.z = dot_s(vs_pica.f[92], tmp_reg10);
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
tmp_reg14.x = dot_3(vs_pica.f[3].xyz, tmp_reg12.xyz);
tmp_reg14.y = dot_3(vs_pica.f[4].xyz, tmp_reg12.xyz);
tmp_reg14.z = dot_3(vs_pica.f[5].xyz, tmp_reg12.xyz);
Vfn7();
return false;
}
bool Vfn5() {
tmp_reg1.xy = (tmp_reg2.wwww).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.wwww)).w;
if (bool_regs.y) {
Vfn4();
}
return false;
}
bool Vfn8() {
if (all(bool_regs)) {
Vfn9();
} else {
Vfn21();
}
return false;
}
bool Vfn9() {
bool_regs = notEqual(vs_pica.f[93].xx, vs_in_reg8.zw);
tmp_reg1.xy = (tmp_reg2.xxxx).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.xxxx)).w;
Vfn10();
tmp_reg1.xy = (tmp_reg2.yyyy).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.yyyy)).w;
Vfn10();
tmp_reg1.xy = (tmp_reg2.zzzz).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.zzzz)).w;
if (bool_regs.x) {
Vfn10();
}
if (vs_pica.b[8]) {
Vfn11();
}
tmp_reg7.w = (vs_pica.f[93].yyyy).w;
tmp_reg10.x = dot_s(vs_pica.f[0], tmp_reg7);
tmp_reg10.y = dot_s(vs_pica.f[1], tmp_reg7);
tmp_reg10.z = dot_s(vs_pica.f[2], tmp_reg7);
tmp_reg10.w = (vs_pica.f[93].yyyy).w;
Vfn6();
tmp_reg13.x = dot_3(vs_pica.f[3].xyz, tmp_reg11.xyz);
tmp_reg13.y = dot_3(vs_pica.f[4].xyz, tmp_reg11.xyz);
tmp_reg13.z = dot_3(vs_pica.f[5].xyz, tmp_reg11.xyz);
tmp_reg14.x = dot_3(vs_pica.f[3].xyz, tmp_reg12.xyz);
tmp_reg14.y = dot_3(vs_pica.f[4].xyz, tmp_reg12.xyz);
tmp_reg14.z = dot_3(vs_pica.f[5].xyz, tmp_reg12.xyz);
tmp_reg15.x = dot_s(vs_pica.f[90], tmp_reg10);
tmp_reg15.y = dot_s(vs_pica.f[91], tmp_reg10);
tmp_reg15.z = dot_s(vs_pica.f[92], tmp_reg10);
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
Vfn12();
return false;
}
bool Vfn11() {
tmp_reg1.xy = (tmp_reg2.wwww).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.wwww)).w;
if (bool_regs.y) {
Vfn10();
}
return false;
}
bool Vfn21() {
bool_regs = notEqual(vs_pica.f[93].xx, vs_in_reg8.zw);
tmp_reg1.xy = (tmp_reg2.xxxx).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.xxxx)).w;
Vfn22();
tmp_reg1.xy = (tmp_reg2.yyyy).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.yyyy)).w;
Vfn22();
tmp_reg1.xy = (tmp_reg2.zzzz).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.zzzz)).w;
if (bool_regs.x) {
Vfn22();
}
if (vs_pica.b[8]) {
Vfn23();
}
tmp_reg7.w = (vs_pica.f[93].yyyy).w;
tmp_reg10.x = dot_s(vs_pica.f[0], tmp_reg7);
tmp_reg10.y = dot_s(vs_pica.f[1], tmp_reg7);
tmp_reg10.z = dot_s(vs_pica.f[2], tmp_reg7);
tmp_reg10.w = (vs_pica.f[93].yyyy).w;
tmp_reg15.x = dot_s(vs_pica.f[90], tmp_reg10);
tmp_reg15.y = dot_s(vs_pica.f[91], tmp_reg10);
tmp_reg15.z = dot_s(vs_pica.f[92], tmp_reg10);
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
vs_out_reg1 = vs_pica.f[93].xxxx;
return false;
}
bool Vfn23() {
tmp_reg1.xy = (tmp_reg2.wwww).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.wwww)).w;
if (bool_regs.y) {
Vfn22();
}
return false;
}
bool Vfn25() {
tmp_reg0 = vs_pica.f[7];
bool_regs = notEqual(vs_pica.f[93].xx, tmp_reg0.yz);
if (vs_pica.b[2]) {
tmp_reg1.x = (mul_s(vs_pica.f[93].wwww, vs_in_reg7.xxxx)).x;
addr_regs.x = (ivec2(tmp_reg1.xx)).x;
tmp_reg7.x = dot_s(vs_pica.f[25 + addr_regs.x], tmp_reg15);
tmp_reg7.y = dot_s(vs_pica.f[26 + addr_regs.x], tmp_reg15);
tmp_reg7.z = dot_s(vs_pica.f[27 + addr_regs.x], tmp_reg15);
tmp_reg7.w = (vs_pica.f[93].yyyy).w;
tmp_reg10.x = dot_s(vs_pica.f[0], tmp_reg7);
tmp_reg10.y = dot_s(vs_pica.f[1], tmp_reg7);
tmp_reg10.z = dot_s(vs_pica.f[2], tmp_reg7);
tmp_reg10.w = (vs_pica.f[93].yyyy).w;
} else {
addr_regs.x = (ivec2(vs_pica.f[93].xx)).x;
tmp_reg10.x = dot_s(vs_pica.f[25], tmp_reg15);
tmp_reg10.y = dot_s(vs_pica.f[26], tmp_reg15);
tmp_reg10.z = dot_s(vs_pica.f[27], tmp_reg15);
tmp_reg10.w = (vs_pica.f[93].yyyy).w;
}
Vfn6();
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
Vfn28();
} else {
Vfn29();
}
vs_out_reg2 = -tmp_reg15;
tmp_reg0.x = dot_s(vs_pica.f[86], tmp_reg15);
tmp_reg0.y = dot_s(vs_pica.f[87], tmp_reg15);
tmp_reg0.z = dot_s(vs_pica.f[88], tmp_reg15);
tmp_reg0.w = dot_s(vs_pica.f[89], tmp_reg15);
tmp_reg1.x = (-tmp_reg0.wwww).x;
tmp_reg1.y = (mul_s(vs_pica.f[95].zzzz, -tmp_reg0.wwww)).y;
bool_regs.x = tmp_reg0.xxxx.x > tmp_reg1.xyyy.x;
bool_regs.y = tmp_reg0.xxxx.y < tmp_reg1.xyyy.y;
if (all(bool_regs)) {
tmp_reg0.x = (-tmp_reg0.wwww).x;
}
vs_out_reg0 = tmp_reg0;
return false;
}
bool Vfn28() {
tmp_reg12.x = dot_3(vs_pica.f[25 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg12.y = dot_3(vs_pica.f[26 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg12.z = dot_3(vs_pica.f[27 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg15.x = dot_s(vs_pica.f[90], tmp_reg10);
tmp_reg15.y = dot_s(vs_pica.f[91], tmp_reg10);
tmp_reg15.z = dot_s(vs_pica.f[92], tmp_reg10);
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
tmp_reg14.x = dot_3(vs_pica.f[3].xyz, tmp_reg12.xyz);
tmp_reg14.y = dot_3(vs_pica.f[4].xyz, tmp_reg12.xyz);
tmp_reg14.z = dot_3(vs_pica.f[5].xyz, tmp_reg12.xyz);
Vfn7();
return false;
}
bool Vfn29() {
if (all(bool_regs)) {
Vfn30();
} else {
tmp_reg15.x = dot_s(vs_pica.f[90], tmp_reg10);
tmp_reg15.y = dot_s(vs_pica.f[91], tmp_reg10);
tmp_reg15.z = dot_s(vs_pica.f[92], tmp_reg10);
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
vs_out_reg1 = vs_pica.f[93].xxxx;
}
return false;
}
bool Vfn30() {
tmp_reg12.x = dot_3(vs_pica.f[25 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg12.y = dot_3(vs_pica.f[26 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg12.z = dot_3(vs_pica.f[27 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg11.x = dot_3(vs_pica.f[25 + addr_regs.x].xyz, tmp_reg13.xyz);
tmp_reg11.y = dot_3(vs_pica.f[26 + addr_regs.x].xyz, tmp_reg13.xyz);
tmp_reg11.z = dot_3(vs_pica.f[27 + addr_regs.x].xyz, tmp_reg13.xyz);
tmp_reg15.x = dot_s(vs_pica.f[90], tmp_reg10);
tmp_reg15.y = dot_s(vs_pica.f[91], tmp_reg10);
tmp_reg15.z = dot_s(vs_pica.f[92], tmp_reg10);
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
tmp_reg14.x = dot_3(vs_pica.f[3].xyz, tmp_reg12.xyz);
tmp_reg14.y = dot_3(vs_pica.f[4].xyz, tmp_reg12.xyz);
tmp_reg14.z = dot_3(vs_pica.f[5].xyz, tmp_reg12.xyz);
tmp_reg13.x = dot_3(vs_pica.f[3].xyz, tmp_reg11.xyz);
tmp_reg13.y = dot_3(vs_pica.f[4].xyz, tmp_reg11.xyz);
tmp_reg13.z = dot_3(vs_pica.f[5].xyz, tmp_reg11.xyz);
Vfn12();
return false;
}
bool Vfn6() {
tmp_reg0.x = (vs_pica.f[81].xxxx + tmp_reg10.zzzz).x;
tmp_reg1.x = rcp_s(tmp_reg0.x);
tmp_reg1.y = (-vs_pica.f[80].xxxx + tmp_reg0.xxxx).y;
tmp_reg1.z = (mul_s(tmp_reg1.xxxx, tmp_reg1.yyyy)).z;
tmp_reg10.x = (fma_s(tmp_reg1.zzzz, vs_pica.f[80].yyyy, tmp_reg10.xxxx)).x;
return false;
}
bool Vfn7() {
uint jmp_to = 222u;
while (true) {
switch (jmp_to) {
case 222u:
tmp_reg6.x = dot_3(tmp_reg14.xyz, tmp_reg14.xyz);
tmp_reg7.x = dot_3(tmp_reg12.xyz, tmp_reg12.xyz);
tmp_reg6.x = rsq_s(tmp_reg6.x);
tmp_reg7.x = rsq_s(tmp_reg7.x);
tmp_reg14.xyz = (mul_s(tmp_reg14.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg12.xyz = (mul_s(tmp_reg12.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg0 = vs_pica.f[93].yxxx;
if (!vs_pica.b[15]) {
jmp_to = 238u; break;
}
tmp_reg4 = vs_pica.f[93].yyyy + tmp_reg14.zzzz;
tmp_reg4 = mul_s(vs_pica.f[94].zzzz, tmp_reg4);
bool_regs = greaterThanEqual(vs_pica.f[93].xx, tmp_reg4.xx);
tmp_reg4 = vec4(rsq_s(tmp_reg4.x));
tmp_reg5 = mul_s(vs_pica.f[94].zzzz, tmp_reg14);
if (bool_regs.x) {
jmp_to = 238u; break;
}
tmp_reg0.z = rcp_s(tmp_reg4.x);
tmp_reg0.xy = (mul_s(tmp_reg5, tmp_reg4)).xy;
case 238u:
vs_out_reg1 = tmp_reg0;
default: return false;
}
}
return false;
}
bool Vfn12() {
uint jmp_to = 239u;
while (true) {
switch (jmp_to) {
case 239u:
tmp_reg6.x = dot_3(tmp_reg14.xyz, tmp_reg14.xyz);
tmp_reg7.x = dot_3(tmp_reg12.xyz, tmp_reg12.xyz);
tmp_reg6.x = rsq_s(tmp_reg6.x);
tmp_reg7.x = rsq_s(tmp_reg7.x);
tmp_reg14.xyz = (mul_s(tmp_reg14.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg12.xyz = (mul_s(tmp_reg12.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg13.xyz = (mul_s(tmp_reg13.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg11.xyz = (mul_s(tmp_reg11.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg0 = vs_pica.f[93].yxxx;
if (!vs_pica.b[15]) {
jmp_to = 314u; break;
}
tmp_reg13.xyz = (mul_s(tmp_reg13.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg11.xyz = (mul_s(tmp_reg11.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg5 = mul_s(tmp_reg14.yzxx, tmp_reg13.zxyy);
tmp_reg5 = fma_s(-tmp_reg13.yzxx, tmp_reg14.zxyy, tmp_reg5);
tmp_reg5.w = dot_3(tmp_reg5.xyz, tmp_reg5.xyz);
tmp_reg5.w = rsq_s(tmp_reg5.w);
tmp_reg5 = mul_s(tmp_reg5, tmp_reg5.wwww);
tmp_reg6.w = (tmp_reg14.zzzz + tmp_reg5.yyyy).w;
tmp_reg13 = mul_s(tmp_reg5.yzxx, tmp_reg14.zxyy);
tmp_reg13 = fma_s(-tmp_reg14.yzxx, tmp_reg5.zxyy, tmp_reg13);
tmp_reg6.w = (tmp_reg13.xxxx + tmp_reg6).w;
tmp_reg13.w = (tmp_reg5.zzzz).w;
tmp_reg5.z = (tmp_reg13.xxxx).z;
tmp_reg6.w = (vs_pica.f[93].yyyy + tmp_reg6).w;
tmp_reg14.w = (tmp_reg5.xxxx).w;
tmp_reg5.x = (tmp_reg14.zzzz).x;
bool_regs = lessThan(vs_pica.f[94].yy, tmp_reg6.ww);
tmp_reg6.x = (vs_pica.f[93].yyyy).x;
tmp_reg6.y = (-vs_pica.f[93].yyyy).y;
if (!bool_regs.x) {
jmp_to = 276u; break;
}
tmp_reg7.xz = (tmp_reg13.wwyy + -tmp_reg14.yyww).xz;
tmp_reg7.y = (tmp_reg14.xxxx + -tmp_reg13.zzzz).y;
tmp_reg7.w = (tmp_reg6).w;
tmp_reg6 = vec4(dot_s(tmp_reg7, tmp_reg7));
tmp_reg6 = vec4(rsq_s(tmp_reg6.x));
tmp_reg0 = mul_s(tmp_reg7, tmp_reg6);
if (vs_pica.b[0]) {
jmp_to = 314u; break;
}
case 276u:
bool_regs = greaterThan(tmp_reg5.zy, tmp_reg5.yx);
if (bool_regs.x) {
Vfn13();
} else {
Vfn18();
}
tmp_reg6 = vec4(dot_s(tmp_reg8, tmp_reg8));
tmp_reg6 = vec4(rsq_s(tmp_reg6.x));
tmp_reg0 = mul_s(tmp_reg8, tmp_reg6);
case 314u:
vs_out_reg1 = tmp_reg0;
default: return false;
}
}
return false;
}
bool Vfn13() {
if (bool_regs.y) {
tmp_reg8 = mul_s(tmp_reg13.yyzw, tmp_reg6.xxxy);
tmp_reg8.x = (vs_pica.f[93].yyyy + -tmp_reg5.yyyy).x;
tmp_reg9 = tmp_reg5.zzzz + -tmp_reg5.xxxx;
tmp_reg8.yzw = (tmp_reg8 + tmp_reg14.wwxy).yzw;
tmp_reg8.x = (tmp_reg9 + tmp_reg8).x;
} else {
Vfn15();
}
tmp_reg8.w = (-tmp_reg8).w;
return false;
}
bool Vfn15() {
bool_regs = greaterThan(tmp_reg5.zz, tmp_reg5.xx);
tmp_reg8 = mul_s(tmp_reg13.yyzw, tmp_reg6.xxxy);
tmp_reg8.x = (vs_pica.f[93].yyyy + -tmp_reg5.yyyy).x;
if (bool_regs.x) {
tmp_reg9 = tmp_reg5.zzzz + -tmp_reg5.xxxx;
tmp_reg8.yzw = (tmp_reg8 + tmp_reg14.wwxy).yzw;
tmp_reg8.x = (tmp_reg9 + tmp_reg8).x;
} else {
tmp_reg8 = mul_s(tmp_reg13.zwwy, tmp_reg6.xxxy);
tmp_reg8.z = (vs_pica.f[93].yyyy + -tmp_reg5.zzzz).z;
tmp_reg9 = tmp_reg5.xxxx + -tmp_reg5.yyyy;
tmp_reg8.xyw = (tmp_reg8 + tmp_reg14.xyyw).xyw;
tmp_reg8.z = (tmp_reg9 + tmp_reg8).z;
}
return false;
}
bool Vfn18() {
if (bool_regs.y) {
tmp_reg8 = mul_s(tmp_reg13.yywz, tmp_reg6.xxxy);
tmp_reg8.y = (vs_pica.f[93].yyyy + -tmp_reg5.zzzz).y;
tmp_reg9 = tmp_reg5.yyyy + -tmp_reg5.xxxx;
tmp_reg8.xzw = (tmp_reg8 + tmp_reg14.wwyx).xzw;
tmp_reg8.y = (tmp_reg9 + tmp_reg8).y;
} else {
tmp_reg8 = mul_s(tmp_reg13.zwwy, tmp_reg6.xxxy);
tmp_reg8.z = (vs_pica.f[93].yyyy + -tmp_reg5.zzzz).z;
tmp_reg9 = tmp_reg5.xxxx + -tmp_reg5.yyyy;
tmp_reg8.xyw = (tmp_reg8 + tmp_reg14.xyyw).xyw;
tmp_reg8.z = (tmp_reg9 + tmp_reg8).z;
tmp_reg8.w = (-tmp_reg8).w;
}
return false;
}
bool Vfn33() {
tmp_reg8.xy = (vs_pica.f[93].xxxx).xy;
tmp_reg0.y = (vs_pica.f[7].wwww).y;
bool_regs = notEqual(vs_pica.f[93].xx, tmp_reg0.xy);
tmp_reg9.xyz = (vs_pica.f[93].xxxx).xyz;
tmp_reg9.w = (vs_pica.f[21].wwww).w;
if (bool_regs.y) {
Vfn34();
}
if (vs_pica.b[5]) {
Vfn36();
}
bool_regs = equal(vs_pica.f[93].xx, tmp_reg8.xy);
if (all(bool_regs)) {
tmp_reg9 = vs_pica.f[21];
}
vs_out_reg3 = max_s(vs_pica.f[93].xxxx, tmp_reg9);
return false;
}
bool Vfn34() {
tmp_reg0 = mul_s(vs_pica.f[7].wwww, vs_in_reg3);
if (vs_pica.b[7]) {
tmp_reg9.w = (mul_s(tmp_reg9.wwww, tmp_reg0.wwww)).w;
}
tmp_reg9.xyz = (mul_s(vs_pica.f[20].wwww, tmp_reg0.xyzz)).xyz;
tmp_reg8.x = (vs_pica.f[93].yyyy).x;
return false;
}
bool Vfn36() {
tmp_reg1 = vec4(dot_3(vs_pica.f[24].xyz, tmp_reg14.xyz));
tmp_reg2 = vs_pica.f[24].wwww;
tmp_reg1 = fma_s(tmp_reg1, tmp_reg2, tmp_reg2);
tmp_reg3 = vs_pica.f[22];
tmp_reg2 = vs_pica.f[23] + -tmp_reg3;
tmp_reg4 = fma_s(tmp_reg2, tmp_reg1, tmp_reg3);
if (vs_pica.b[6]) {
tmp_reg4 = mul_s(tmp_reg4, tmp_reg9.wwww);
}
tmp_reg9.xyz = (fma_s(tmp_reg4, vs_pica.f[21], tmp_reg9)).xyz;
tmp_reg8.x = (vs_pica.f[93].yyyy).x;
return false;
}
bool Vfn39() {
tmp_reg0.xy = (vs_pica.f[10].xxxx).xy;
if (vs_pica.b[9]) {
Vfn40();
} else {
Vfn46();
}
return false;
}
bool Vfn40() {
Vfn41();
tmp_reg3.x = dot_s(vs_pica.f[11].xywz, tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12].xywz, tmp_reg6);
tmp_reg3.zw = (vs_pica.f[93].xxxx).zw;
vs_out_reg4 = tmp_reg3;
return false;
}
bool Vfn46() {
bool_regs = equal(vs_pica.f[95].xy, tmp_reg0.xy);
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
if (all(not(bool_regs))) {
tmp_reg6 = tmp_reg10;
tmp_reg3.x = dot_s(vs_pica.f[11], tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12], tmp_reg6);
tmp_reg3.z = dot_s(vs_pica.f[13], tmp_reg6);
tmp_reg0.xy = (mul_s(vs_pica.f[19].xyyy, tmp_reg3.zzzz)).xy;
tmp_reg3.xy = (tmp_reg3.xyyy + tmp_reg0.xyyy).xy;
} else {
Vfn48();
}
vs_out_reg4 = tmp_reg3;
return false;
}
bool Vfn48() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
Vfn49();
} else {
Vfn51();
}
return false;
}
bool Vfn49() {
tmp_reg2 = -tmp_reg15;
tmp_reg2.w = dot_3(tmp_reg2.xyz, tmp_reg2.xyz);
tmp_reg2.w = rsq_s(tmp_reg2.w);
tmp_reg2 = mul_s(tmp_reg2, tmp_reg2.wwww);
tmp_reg1 = vec4(dot_3(tmp_reg2.xyz, tmp_reg14.xyz));
tmp_reg1 = tmp_reg1 + tmp_reg1;
tmp_reg6 = fma_s(tmp_reg1, tmp_reg14, -tmp_reg2);
tmp_reg3.x = dot_3(vs_pica.f[11].xyz, tmp_reg6.xyz);
tmp_reg3.y = dot_3(vs_pica.f[12].xyz, tmp_reg6.xyz);
tmp_reg3.z = dot_3(vs_pica.f[13].xyz, tmp_reg6.xyz);
return false;
}
bool Vfn51() {
Vfn52();
tmp_reg3.x = dot_s(vs_pica.f[11], tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12], tmp_reg6);
return false;
}
bool Vfn41() {
bool_regs = equal(vs_pica.f[93].yz, tmp_reg0.xy);
if (all(not(bool_regs))) {
tmp_reg6.xy = (mul_s(vs_pica.f[8].xxxx, vs_in_reg4.xyyy)).xy;
} else {
Vfn43();
}
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
return false;
}
bool Vfn43() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
tmp_reg6.xy = (mul_s(vs_pica.f[8].yyyy, vs_in_reg5.xyyy)).xy;
} else {
tmp_reg6.xy = (mul_s(vs_pica.f[8].zzzz, vs_in_reg6.xyyy)).xy;
}
return false;
}
bool Vfn52() {
tmp_reg1.xy = (vs_pica.f[94].zzzz).xy;
tmp_reg1.zw = (vs_pica.f[93].xxxx).zw;
tmp_reg6 = fma_s(tmp_reg14, tmp_reg1, tmp_reg1);
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
return false;
}
bool Vfn53() {
tmp_reg0.xy = (vs_pica.f[10].yyyy).xy;
if (vs_pica.b[10]) {
Vfn54();
} else {
Vfn55();
}
return false;
}
bool Vfn54() {
Vfn41();
tmp_reg4.x = dot_s(vs_pica.f[14].xywz, tmp_reg6);
tmp_reg4.y = dot_s(vs_pica.f[15].xywz, tmp_reg6);
vs_out_reg5 = tmp_reg4;
return false;
}
bool Vfn55() {
if (vs_pica.b[13]) {
Vfn56();
} else {
vs_out_reg5 = vs_pica.f[93].xxxx;
}
return false;
}
bool Vfn56() {
bool_regs = equal(vs_pica.f[95].xy, tmp_reg0.xy);
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
if (all(not(bool_regs))) {
tmp_reg6 = tmp_reg10;
tmp_reg4.x = dot_s(vs_pica.f[14], tmp_reg6);
tmp_reg4.y = dot_s(vs_pica.f[15], tmp_reg6);
tmp_reg4.z = dot_s(vs_pica.f[16], tmp_reg6);
tmp_reg6.w = rcp_s(tmp_reg4.z);
tmp_reg4.xy = (mul_s(tmp_reg4.xyyy, tmp_reg6.wwww)).xy;
tmp_reg4.xy = (vs_pica.f[19].zwww + tmp_reg4.xyyy).xy;
} else {
Vfn58();
}
vs_out_reg5 = tmp_reg4;
return false;
}
bool Vfn58() {
Vfn52();
tmp_reg4.x = dot_s(vs_pica.f[14], tmp_reg6);
tmp_reg4.y = dot_s(vs_pica.f[15], tmp_reg6);
return false;
}
bool Vfn0() {
Vfn1();
Vfn33();
Vfn39();
Vfn53();
return true;
}
// shader: 8B30, D6290F51F8522343
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
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
vec3 surface_normal = vec3(0, 0, 1);
vec3 surface_tangent = vec3(1, 0, 0);
vec4 normalized_normquat = normalize(normquat);
vec3 normal = QuaternionRotate(normalized_normquat, surface_normal);
vec3 tangent = QuaternionRotate(normalized_normquat, surface_tangent);
vec4 shadow = vec4(1);
light_vector = normalize(light_src[0].position);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(view.xyz)));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTSigned(lut_offset, dot(normal, normalize(view.xyz)));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(fma((vec3(1) - secondary_fragment_color.aaa), (const_color[0].rgb), (primary_fragment_color.rgb)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp(fma((texcolor0.rgb), (last_tev_out.rgb), (texcolor1.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) + (const_color[2].rgb) - vec3(0.5), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(fma((vec3(1) - combiner_buffer.rgb), (secondary_fragment_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(min((rounded_primary_color.rgb) + (const_color[4].rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp(fma((last_tev_out.rgb), (last_tev_out.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_5 = (last_tev_out.a);
last_tev_out = vec4(color_output_5 * 2.0, alpha_output_5 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 09FDAEEE89A67B7E
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
if (gl_FragCoord.x < scissor_x1 || gl_FragCoord.y < scissor_y1 || gl_FragCoord.x >= scissor_x2 || gl_FragCoord.y >= scissor_y2) discard;
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(mix((texcolor1.rgb), (texcolor0.rgb), (const_color[0].aaa)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp(mix((texcolor1.a), (texcolor0.a), (const_color[0].a)), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 973F1B3800270DB0
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
if (gl_FragCoord.x < scissor_x1 || gl_FragCoord.y < scissor_y1 || gl_FragCoord.x >= scissor_x2 || gl_FragCoord.y >= scissor_y2) discard;
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(mix((texcolor1.rgb), (texcolor0.rgb), (const_color[0].aaa)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp(mix((texcolor1.a), (texcolor0.a), (const_color[0].a)), 0.0, 1.0));
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
// shader: 8B30, 4A18503B07DC0362
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
if (gl_FragCoord.x < scissor_x1 || gl_FragCoord.y < scissor_y1 || gl_FragCoord.x >= scissor_x2 || gl_FragCoord.y >= scissor_y2) discard;
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 87D3A3EE9BA2CB66
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
if (gl_FragCoord.x < scissor_x1 || gl_FragCoord.y < scissor_y1 || gl_FragCoord.x >= scissor_x2 || gl_FragCoord.y >= scissor_y2) discard;
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (texcolor0.rgb);
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, CC86011280063988
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
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((const_color[3].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((const_color[3].a) * (1.0 - texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((const_color[4].rgb), (texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((const_color[4].a), (texcolor0.a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 1728F6066B1F4F9E
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
vec3 color_output_0 = (texcolor0.rgb);
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp(fma((const_color[3].aaa), (texcolor1.aaa), (texcolor0.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (texcolor0.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((combiner_buffer.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(mix((combiner_buffer.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 867FF3BD5FC09DC8
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
vec3 color_output_0 = (texcolor0.rgb);
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp(fma((texcolor1.aaa), (const_color[3].aaa), (texcolor0.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (texcolor0.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((combiner_buffer.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(mix((combiner_buffer.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, C73C5E3C61ECA850
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
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((vec3(1) - texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 0906273E64D37750
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
vec3 color_output_3 = ByteRound(clamp((const_color[3].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((const_color[3].a) * (1.0 - texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((const_color[4].rgb), (texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((const_color[4].a), (texcolor0.a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 0947643786C5D0B8
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
vec3 color_output_3 = ByteRound(clamp(fma((const_color[3].aaa), (texcolor1.aaa), (texcolor0.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (texcolor0.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((combiner_buffer.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(mix((combiner_buffer.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 7AD4D0A6690D9FF8
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
vec3 color_output_3 = ByteRound(clamp(fma((texcolor1.aaa), (const_color[3].aaa), (texcolor0.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (texcolor0.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((combiner_buffer.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(mix((combiner_buffer.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, F85423C037B04CD2
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
vec3 color_output_3 = ByteRound(clamp((vec3(1) - texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 7060E1AE1D2AD082
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
vec3 color_output_3 = ByteRound(clamp((texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((vec3(1) - texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, B696B737D7B76AD3
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
vec3 color_output_3 = (texcolor1.rgb);
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (texcolor1.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((combiner_buffer.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(mix((combiner_buffer.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 6B355AF5EA8A6074
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
vec3 color_output_3 = (texcolor1.rgb);
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (texcolor1.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((combiner_buffer.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(mix((combiner_buffer.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (const_color[5].rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (const_color[5].a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 400A9C90B571714D
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
vec3 color_output_3 = ByteRound(clamp((vec3(1) - texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (const_color[5].rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (const_color[5].a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 7E3F2BF795B21DFF, 286543F1975717DA
// reference: D76EA6EBA5302646, 74222AB89B3F1BC8
// reference: 9A25920CB0E1BE51, 68FD505661AD5B02
// reference: CDAB367A4E710442, 15C7483CDCAC839B
// reference: 5CA95A32855DBD0D, F9280F16AFA7D82A
// reference: 50C438E4F5897ABF, 8BDB60558C9403BE
// reference: 9AB1A226827F0EEA, D6290F51F8522343
// reference: 5BC7827D113821FB, 09FDAEEE89A67B7E
// reference: 236590B54CC4579E, 973F1B3800270DB0
// reference: D76EA6EB668FB926, 4A18503B07DC0362
// reference: 09DFFCF4855DBD0D, 87D3A3EE9BA2CB66
// reference: D989C534652E68D0, CC86011280063988
// reference: A74542010DFB176B, 1728F6066B1F4F9E
// reference: A74542017A39C7FB, 867FF3BD5FC09DC8
// reference: 161121CB21330670, C73C5E3C61ECA850
// reference: 07389F2BB3A80015, 0906273E64D37750
// reference: 79F4181EDB7D7FAE, 0947643786C5D0B8
// reference: 79F4181EACBFAF3E, 7AD4D0A6690D9FF8
// reference: C8A07BD4F7B56EB5, F85423C037B04CD2
// reference: BBD29585F7B56EB5, 7060E1AE1D2AD082
// reference: 83422C6A5EEB93E4, B696B737D7B76AD3
// reference: D6348AACB07C1304, 6B355AF5EA8A6074
// reference: C8A07BD41922EE55, 400A9C90B571714D
// program: 286543F1975717DA, 0000000000000000, 74222AB89B3F1BC8
// program: 68FD505661AD5B02, 0000000000000000, 15C7483CDCAC839B
// program: 68FD505661AD5B02, 0000000000000000, F9280F16AFA7D82A
// program: 8BDB60558C9403BE, 0000000000000000, D6290F51F8522343
// program: 8BDB60558C9403BE, 0000000000000000, 09FDAEEE89A67B7E
// program: 8BDB60558C9403BE, 0000000000000000, 973F1B3800270DB0
// program: 68FD505661AD5B02, 0000000000000000, 4A18503B07DC0362
// program: 68FD505661AD5B02, 0000000000000000, 87D3A3EE9BA2CB66
// program: 6089902024F82DD6, 0000000000000000, CC86011280063988
// program: 6089902024F82DD6, 0000000000000000, 1728F6066B1F4F9E
// program: 6089902024F82DD6, 0000000000000000, 867FF3BD5FC09DC8
// program: 6089902024F82DD6, 0000000000000000, C73C5E3C61ECA850
// program: 6089902024F82DD6, 0000000000000000, 0906273E64D37750
// program: 6089902024F82DD6, 0000000000000000, 0947643786C5D0B8
// program: 6089902024F82DD6, 0000000000000000, 7AD4D0A6690D9FF8
// program: 6089902024F82DD6, 0000000000000000, F85423C037B04CD2
// program: 6089902024F82DD6, 0000000000000000, 7060E1AE1D2AD082
// program: 6089902024F82DD6, 0000000000000000, B696B737D7B76AD3
// program: 6089902024F82DD6, 0000000000000000, 6B355AF5EA8A6074
// program: 6089902024F82DD6, 0000000000000000, 400A9C90B571714D
// shader: 8B30, EA88E40D14E3E09B
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
vec3 color_output_3 = ByteRound(clamp((texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((vec3(1) - texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (const_color[5].rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (const_color[5].a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 1AFE118FBFC9612A
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
vec3 color_output_3 = ByteRound(clamp((const_color[3].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((const_color[3].a) * (1.0 - texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((const_color[4].rgb), (texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((const_color[4].a), (texcolor0.a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (const_color[5].rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (const_color[5].a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: BBD295851922EE55, EA88E40D14E3E09B
// reference: 07389F2B5D3F80F5, 1AFE118FBFC9612A
// program: 6089902024F82DD6, 0000000000000000, EA88E40D14E3E09B
// program: 6089902024F82DD6, 0000000000000000, 1AFE118FBFC9612A
// shader: 8B30, 2410CAD632A6BB9E
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
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
vec3 surface_normal = vec3(0, 0, 1);
vec3 surface_tangent = vec3(1, 0, 0);
vec4 normalized_normquat = normalize(normquat);
vec3 normal = QuaternionRotate(normalized_normquat, surface_normal);
vec3 tangent = QuaternionRotate(normalized_normquat, surface_tangent);
vec4 shadow = vec4(1);
light_vector = normalize(light_src[0].position);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(view.xyz)));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTSigned(lut_offset, dot(normal, normalize(view.xyz)));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(fma((vec3(1) - secondary_fragment_color.aaa), (const_color[0].rgb), (primary_fragment_color.rgb)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((texcolor0.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) + (const_color[2].rgb) - vec3(0.5), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_3 = ByteRound(clamp(mix((last_tev_out.rgb), (vec3(1) - last_tev_out.rgb), (secondary_fragment_color.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_4 = ByteRound(clamp(min((rounded_primary_color.rgb) + (const_color[4].rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp(fma((last_tev_out.rgb), (combiner_buffer.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_5 = (last_tev_out.a);
last_tev_out = vec4(color_output_5 * 2.0, alpha_output_5 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 05304BE6C7BE43EF
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
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
vec3 surface_normal = vec3(0, 0, 1);
vec3 surface_tangent = vec3(1, 0, 0);
vec4 normalized_normquat = normalize(normquat);
vec3 normal = QuaternionRotate(normalized_normquat, surface_normal);
vec3 tangent = QuaternionRotate(normalized_normquat, surface_tangent);
vec4 shadow = vec4(1);
light_vector = normalize(light_src[0].position);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(view.xyz)));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTSigned(lut_offset, dot(normal, normalize(view.xyz)));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(fma((vec3(1) - secondary_fragment_color.aaa), (const_color[0].rgb), (primary_fragment_color.rgb)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((texcolor0.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) + (const_color[2].rgb) - vec3(0.5), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(fma((vec3(1) - combiner_buffer.rgb), (secondary_fragment_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(min((rounded_primary_color.rgb) + (const_color[4].rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp(fma((last_tev_out.rgb), (last_tev_out.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_5 = (last_tev_out.a);
last_tev_out = vec4(color_output_5 * 2.0, alpha_output_5 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 8568ED5EF57EA77D
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
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
vec3 surface_normal = vec3(0, 0, 1);
vec3 surface_tangent = vec3(1, 0, 0);
vec4 normalized_normquat = normalize(normquat);
vec3 normal = QuaternionRotate(normalized_normquat, surface_normal);
vec3 tangent = QuaternionRotate(normalized_normquat, surface_tangent);
vec4 shadow = vec4(1);
light_vector = normalize(light_src[0].position);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(view.xyz)));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTSigned(lut_offset, dot(normal, normalize(view.xyz)));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(fma((vec3(1) - secondary_fragment_color.aaa), (const_color[0].rgb), (primary_fragment_color.rgb)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((texcolor0.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) + (const_color[2].rgb) - vec3(0.5), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_3 = ByteRound(clamp(fma((texcolor1.rgb), (secondary_fragment_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_4 = ByteRound(clamp(min((rounded_primary_color.rgb) + (const_color[4].rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp(fma((last_tev_out.rgb), (last_tev_out.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_5 = (last_tev_out.a);
last_tev_out = vec4(color_output_5 * 2.0, alpha_output_5 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, F35A873DB2144D0D
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
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((const_color[3].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((const_color[3].a) * (1.0 - texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((const_color[4].rgb), (texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((const_color[4].a), (texcolor0.a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: D76EA6EB40012EC3, 74222AB89B3F1BC8
// reference: 4F2595CF323072F8, 2410CAD632A6BB9E
// reference: 833D4AEE53B4F218, 05304BE6C7BE43EF
// reference: 33E8E51FC7850FFC, 8568ED5EF57EA77D
// reference: 07389F2B86FC6CFB, F35A873DB2144D0D
// program: 68FD505661AD5B02, 0000000000000000, 74222AB89B3F1BC8
// program: 68FD505661AD5B02, 0000000000000000, 2410CAD632A6BB9E
// program: 68FD505661AD5B02, 0000000000000000, 05304BE6C7BE43EF
// program: 8BDB60558C9403BE, 0000000000000000, 8568ED5EF57EA77D
// program: 6089902024F82DD6, 0000000000000000, F35A873DB2144D0D
// shader: 8B31, 80D08F984545513A

#define mul_s(x, y) mix(x * y, vec4(0), isnan(x * y))
#define fma_s(x, y, z) (mul_s(x, y) + z)
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
normquat = vec4(vs_out_reg3.x,vs_out_reg3.y,vs_out_reg3.z,vs_out_reg3.w);
vec4 vtx_color = vec4(vs_out_reg1.x,vs_out_reg1.y,vs_out_reg1.z,vs_out_reg1.w);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg2.x,vs_out_reg2.y,1,1);
texcoord12 = vec4(1,1,1,1);
view = vec4(vs_out_reg4.x,vs_out_reg4.y,vs_out_reg4.z,1);
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
bool Vfn3();
vec4 tmp_reg2;
vec4 tmp_reg3;
vec4 tmp_reg4;
vec4 tmp_reg5;
vec4 tmp_reg6;
vec4 tmp_reg7;
vec4 tmp_reg8;
vec4 tmp_reg9;
vec4 tmp_reg10;
vec4 tmp_reg11;
vec4 tmp_reg12;
vec4 tmp_reg13;
vec4 tmp_reg14;
vec4 tmp_reg15;
bool ExecVS() {
tmp_reg2 = vec4(0, 0, 0, 1);
tmp_reg3 = vec4(0, 0, 0, 1);
tmp_reg4 = vec4(0, 0, 0, 1);
tmp_reg5 = vec4(0, 0, 0, 1);
tmp_reg6 = vec4(0, 0, 0, 1);
tmp_reg7 = vec4(0, 0, 0, 1);
tmp_reg8 = vec4(0, 0, 0, 1);
tmp_reg9 = vec4(0, 0, 0, 1);
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
addr_regs.y = (ivec2(vs_pica.f[5].ww)).y;
tmp_reg6 = vs_pica.f[0 + addr_regs.y];
addr_regs.x = (ivec2(vs_in_reg1.zz)).x;
tmp_reg14 = vs_pica.f[84].xxxz;
tmp_reg15 = vs_pica.f[84].xxxz;
tmp_reg10 = vs_pica.f[84].xxxz;
tmp_reg11 = vs_pica.f[84].xxxz;
addr_regs.y = (ivec2(vs_pica.f[8 + addr_regs.x].ww)).y;
tmp_reg12.xy = (vs_pica.f[4].xyyy + vs_in_reg0.xyyy).xy;
tmp_reg12.z = (vs_pica.f[84].xxxx).z;
tmp_reg13.xyz = (mul_s(vs_pica.f[9 + addr_regs.x].zwww, tmp_reg12.xyzz)).xyz;
tmp_reg10.x = (tmp_reg13.xxxx).x;
tmp_reg12 = vs_pica.f[85].xxxx;
bool_regs = equal(vs_pica.f[4].zz, tmp_reg12.xy);
if (any(bool_regs)) {
tmp_reg10.y = (vs_pica.f[84].xxxx).y;
tmp_reg10.z = (mul_s(vs_pica.f[85].zzzz, tmp_reg13.yyyy)).z;
} else {
tmp_reg10.y = (tmp_reg13.yyyy).y;
tmp_reg10.z = (vs_pica.f[84].xxxx).z;
}
tmp_reg11.x = dot_3(vs_pica.f[11 + addr_regs.x].xyz, tmp_reg10.xyz);
tmp_reg11.y = dot_3(vs_pica.f[12 + addr_regs.x].xyz, tmp_reg10.xyz);
tmp_reg11.z = dot_3(vs_pica.f[13 + addr_regs.x].xyz, tmp_reg10.xyz);
tmp_reg12 = vs_pica.f[84].wwww;
bool_regs = greaterThanEqual(vs_pica.f[4].zz, tmp_reg12.xy);
if (any(bool_regs)) {
Vfn3();
} else {
tmp_reg10.x = dot_3(vs_pica.f[0 + addr_regs.y].xyz, tmp_reg11.xyz);
tmp_reg10.y = dot_3(vs_pica.f[1 + addr_regs.y].xyz, tmp_reg11.xyz);
tmp_reg10.z = dot_3(vs_pica.f[2 + addr_regs.y].xyz, tmp_reg11.xyz);
}
tmp_reg15.xyz = (vs_pica.f[8 + addr_regs.x].xyzz + tmp_reg10.xyzz).xyz;
tmp_reg2.x = (vs_pica.f[81].xxxx + tmp_reg10.zzzz).x;
tmp_reg3.x = (-vs_pica.f[80].xxxx + tmp_reg2.xxxx).x;
tmp_reg4.x = rcp_s(tmp_reg2.x);
tmp_reg5.x = (mul_s(tmp_reg3.xxxx, tmp_reg4.xxxx)).x;
tmp_reg15.x = (fma_s(tmp_reg5.xxxx, vs_pica.f[80].yyyy, tmp_reg15.xxxx)).x;
tmp_reg14.x = dot_s(vs_pica.f[90], tmp_reg15);
tmp_reg14.y = dot_s(vs_pica.f[91], tmp_reg15);
tmp_reg14.z = dot_s(vs_pica.f[92], tmp_reg15);
tmp_reg14.w = (vs_pica.f[84].zzzz).w;
vs_out_reg0.x = dot_s(vs_pica.f[86], tmp_reg14);
vs_out_reg0.y = dot_s(vs_pica.f[87], tmp_reg14);
vs_out_reg0.z = dot_s(vs_pica.f[88], tmp_reg14);
vs_out_reg0.w = dot_s(vs_pica.f[89], tmp_reg14);
vs_out_reg4 = -tmp_reg14;
vs_out_reg1.x = (vs_pica.f[11 + addr_regs.x].wwww).x;
vs_out_reg1.y = (vs_pica.f[12 + addr_regs.x].wwww).y;
vs_out_reg1.z = (vs_pica.f[13 + addr_regs.x].wwww).z;
vs_out_reg1.w = (vs_pica.f[9 + addr_regs.x].yyyy).w;
tmp_reg10.xy = (mul_s(vs_pica.f[10 + addr_regs.x].zwww, vs_in_reg1.xyyy)).xy;
tmp_reg11.xy = (vs_pica.f[10 + addr_regs.x].xyyy + tmp_reg10.xyyy).xy;
vs_out_reg2.x = (tmp_reg11.xxxx).x;
vs_out_reg2.y = (vs_pica.f[84].zzzz + -tmp_reg11.yyyy).y;
vs_out_reg2.zw = (vs_pica.f[84].zzzz).zw;
vs_out_reg3 = vs_pica.f[84].xxxz;
return true;
}
bool Vfn3() {
tmp_reg13 = vs_pica.f[0 + addr_regs.y];
tmp_reg10.x = dot_3(tmp_reg13.xyz, tmp_reg13.xyz);
bool_regs = greaterThanEqual(vs_pica.f[85].yy, tmp_reg10.xx);
if (bool_regs.x) {
tmp_reg8.xyz = (vs_pica.f[84].xxxx).xyz;
} else {
tmp_reg10.x = rsq_s(tmp_reg10.x);
tmp_reg8.xyz = (mul_s(vs_pica.f[0 + addr_regs.y].xyzz, tmp_reg10.xxxx)).xyz;
}
tmp_reg12.xyz = (tmp_reg6).xyz;
tmp_reg13.xyz = (mul_s(tmp_reg12.yzxx, tmp_reg8.zxyy)).xyz;
tmp_reg13.xyz = (fma_s(-tmp_reg8.yzxx, tmp_reg12.zxyy, tmp_reg13)).xyz;
tmp_reg10.x = dot_3(tmp_reg13.xyz, tmp_reg13.xyz);
bool_regs = greaterThanEqual(vs_pica.f[85].yy, tmp_reg10.xx);
if (bool_regs.x) {
tmp_reg7.xyz = (vs_pica.f[84].xxxx).xyz;
} else {
tmp_reg10.x = rsq_s(tmp_reg10.x);
tmp_reg7.xyz = (mul_s(tmp_reg13.xyzz, tmp_reg10.xxxx)).xyz;
}
tmp_reg12.xyz = (mul_s(tmp_reg7.yzxx, tmp_reg8.zxyy)).xyz;
tmp_reg12.xyz = (fma_s(-tmp_reg8.yzxx, tmp_reg7.zxyy, tmp_reg12)).xyz;
tmp_reg10.x = dot_3(tmp_reg12.xyz, tmp_reg12.xyz);
bool_regs = greaterThanEqual(vs_pica.f[85].yy, tmp_reg10.xx);
if (bool_regs.x) {
tmp_reg9.xyz = (vs_pica.f[84].xxxx).xyz;
} else {
tmp_reg10.x = rsq_s(tmp_reg10.x);
tmp_reg9.xyz = (mul_s(tmp_reg12.xyzz, tmp_reg10.xxxx)).xyz;
}
tmp_reg10.xyz = (mul_s(tmp_reg11.xxxx, tmp_reg7.xyzz)).xyz;
tmp_reg10.xyz = (fma_s(tmp_reg11.yyyy, tmp_reg8.xyzz, tmp_reg10.xyzz)).xyz;
tmp_reg10.xyz = (fma_s(tmp_reg11.zzzz, tmp_reg9.xyzz, tmp_reg10.xyzz)).xyz;
return false;
}
// shader: 8B30, 7C5A33F69907445E
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
if (gl_FragCoord.x < scissor_x1 || gl_FragCoord.y < scissor_y1 || gl_FragCoord.x >= scissor_x2 || gl_FragCoord.y >= scissor_y2) discard;
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((const_color[0].rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((rounded_primary_color.rgb), (vec3(1) - texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 2D31F573A19BFC2B, 80D08F984545513A
// reference: CAE2AA5E337114AE, 7C5A33F69907445E
// program: 80D08F984545513A, 0000000000000000, 7C5A33F69907445E
// shader: 8B31, 20E9550E8AC8843A

#define mul_s(x, y) mix(x * y, vec4(0), isnan(x * y))
#define fma_s(x, y, z) (mul_s(x, y) + z)
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
texcoord0 = vec4(vs_out_reg2.x,vs_out_reg2.y,1,1);
texcoord12 = vec4(1,1,1,1);
view = vec4(1,1,1,1);
}
void main() {
vs_out_reg0 = vec4(0, 0, 0, 1);
vs_out_reg1 = vec4(0, 0, 0, 1);
vs_out_reg2 = vec4(0, 0, 0, 1);
ExecVS();
EmitVtx();
}
bvec2 bool_regs = bvec2(false);
ivec3 addr_regs = ivec3(0);
bool Vfn0();
vec4 tmp_reg12;
vec4 tmp_reg13;
vec4 tmp_reg14;
vec4 tmp_reg15;
bool ExecVS() {
tmp_reg12 = vec4(0, 0, 0, 1);
tmp_reg13 = vec4(0, 0, 0, 1);
tmp_reg14 = vec4(0, 0, 0, 1);
tmp_reg15 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn0() {
tmp_reg13.xyz = (vs_in_reg0.xyzz).xyz;
tmp_reg12.x = (vs_in_reg0.wwww).x;
tmp_reg13.w = (vs_pica.f[10].zzzz).w;
tmp_reg14.y = rcp_s(tmp_reg12.x);
tmp_reg14.x = (-vs_pica.f[80].xxxx + tmp_reg12.xxxx).x;
tmp_reg14.z = (mul_s(tmp_reg14.xxxx, tmp_reg14.yyyy)).z;
tmp_reg13.x = (fma_s(tmp_reg14.zzzz, vs_pica.f[80].yyyy, vs_in_reg0.xxxx)).x;
tmp_reg15 = tmp_reg13;
tmp_reg13.x = dot_s(vs_pica.f[90], tmp_reg15);
tmp_reg13.y = dot_s(vs_pica.f[91], tmp_reg15);
tmp_reg13.z = dot_s(vs_pica.f[92], tmp_reg15);
vs_out_reg1 = vs_pica.f[10].zzzz;
vs_out_reg2 = vs_in_reg1.xyyy;
vs_out_reg0.x = dot_s(vs_pica.f[86], tmp_reg13);
vs_out_reg0.y = dot_s(vs_pica.f[87], tmp_reg13);
vs_out_reg0.z = dot_s(vs_pica.f[88], tmp_reg13);
vs_out_reg0.w = dot_s(vs_pica.f[89], tmp_reg13);
return true;
}
// shader: 8B30, E9645DA51C12D048
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
if (gl_FragCoord.x < scissor_x1 || gl_FragCoord.y < scissor_y1 || gl_FragCoord.x >= scissor_x2 || gl_FragCoord.y >= scissor_y2) discard;
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
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 3D3906209907445E
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
if (gl_FragCoord.x < scissor_x1 || gl_FragCoord.y < scissor_y1 || gl_FragCoord.x >= scissor_x2 || gl_FragCoord.y >= scissor_y2) discard;
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((const_color[0].rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.g), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((rounded_primary_color.rgb), (vec3(1) - texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 7E3F2BF7F888C0AB, 20E9550E8AC8843A
// reference: 8218002DA5302646, E9645DA51C12D048
// reference: 0A020F0B337114AE, 3D3906209907445E
// program: 20E9550E8AC8843A, 0000000000000000, E9645DA51C12D048
// program: 80D08F984545513A, 0000000000000000, 3D3906209907445E
// shader: 8B30, A3DC88665A51402A
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
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
vec3 surface_normal = vec3(0, 0, 1);
vec3 surface_tangent = vec3(1, 0, 0);
vec4 normalized_normquat = normalize(normquat);
vec3 normal = QuaternionRotate(normalized_normquat, surface_normal);
vec3 tangent = QuaternionRotate(normalized_normquat, surface_tangent);
vec4 shadow = vec4(1);
light_vector = normalize(light_src[0].position);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(half_vector)));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTSigned(lut_offset, dot(normal, normalize(view.xyz)));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(fma((vec3(1) - secondary_fragment_color.aaa), (const_color[0].rgb), (primary_fragment_color.rgb)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((texcolor0.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) + (const_color[2].rgb) - vec3(0.5), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_3 = ByteRound(clamp(fma((texcolor1.rgb), (secondary_fragment_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_4 = ByteRound(clamp(min((rounded_primary_color.rgb) + (const_color[4].rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp(fma((last_tev_out.rgb), (combiner_buffer.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_5 = (last_tev_out.a);
last_tev_out = vec4(color_output_5 * 2.0, alpha_output_5 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, D3C042975390C139
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
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
vec3 surface_normal = vec3(0, 0, 1);
vec3 surface_tangent = vec3(1, 0, 0);
vec4 normalized_normquat = normalize(normquat);
vec3 normal = QuaternionRotate(normalized_normquat, surface_normal);
vec3 tangent = QuaternionRotate(normalized_normquat, surface_tangent);
vec4 shadow = vec4(1);
light_vector = normalize(light_src[0].position);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
specular_sum.a = lut_scale_fr * lut_value;
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += ((light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(fma((vec3(1) - secondary_fragment_color.aaa), (const_color[0].rgb), (primary_fragment_color.rgb)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((texcolor0.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) + (const_color[2].rgb) - vec3(0.5), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_3 = ByteRound(clamp(mix((last_tev_out.rgb), (vec3(1) - last_tev_out.rgb), (texcolor1.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_4 = ByteRound(clamp(min((rounded_primary_color.rgb) + (const_color[4].rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp(fma((last_tev_out.rgb), (combiner_buffer.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_5 = (last_tev_out.a);
last_tev_out = vec4(color_output_5 * 2.0, alpha_output_5 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: F6F3B874CA429DDA, A3DC88665A51402A
// reference: 40ED462BD5D901F4, D3C042975390C139
// program: 8BDB60558C9403BE, 0000000000000000, A3DC88665A51402A
// program: 8BDB60558C9403BE, 0000000000000000, D3C042975390C139
// shader: 8B30, B99E2405D249695D
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
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((rounded_primary_color.rgb), (vec3(1) - texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((const_color[3].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((const_color[3].a) * (1.0 - texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((const_color[4].rgb), (texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((const_color[4].a), (texcolor0.a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 4FC2355825E932FD, B99E2405D249695D
// program: 6089902024F82DD6, 0000000000000000, B99E2405D249695D
// shader: 8B30, 2C200D7B7A3600F1
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
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
vec3 surface_normal = vec3(0, 0, 1);
vec3 surface_tangent = vec3(1, 0, 0);
vec4 normalized_normquat = normalize(normquat);
vec3 normal = QuaternionRotate(normalized_normquat, surface_normal);
vec3 tangent = QuaternionRotate(normalized_normquat, surface_tangent);
vec4 shadow = vec4(1);
light_vector = normalize(light_src[0].position);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
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
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 4FA238C48451F8D0
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
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
vec3 surface_normal = vec3(0, 0, 1);
vec3 surface_tangent = vec3(1, 0, 0);
vec4 normalized_normquat = normalize(normquat);
vec3 normal = QuaternionRotate(normalized_normquat, surface_normal);
vec3 tangent = QuaternionRotate(normalized_normquat, surface_tangent);
vec4 shadow = vec4(1);
light_vector = normalize(light_src[0].position);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
geo_factor = dot(half_vector, half_vector);
geo_factor = geo_factor == 0.0 ? 0.0 : min(dot_product / geo_factor, 1.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(half_vector)));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTSigned(lut_offset, dot(normal, normalize(view.xyz)));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[0].specular_0) * geo_factor) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(fma((vec3(1) - secondary_fragment_color.aaa), (const_color[0].rgb), (primary_fragment_color.rgb)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((texcolor0.rgb) * (const_color[1].rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (combiner_buffer.rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((secondary_fragment_color.rgb) + (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(min((rounded_primary_color.rgb) + (const_color[4].rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4 * 2.0, alpha_output_4 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, FB22805ACE94D23C
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
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
vec3 surface_normal = vec3(0, 0, 1);
vec3 surface_tangent = vec3(1, 0, 0);
vec4 normalized_normquat = normalize(normquat);
vec3 normal = QuaternionRotate(normalized_normquat, surface_normal);
vec3 tangent = QuaternionRotate(normalized_normquat, surface_tangent);
vec4 shadow = vec4(1);
light_vector = normalize(light_src[0].position);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
geo_factor = dot(half_vector, half_vector);
geo_factor = geo_factor == 0.0 ? 0.0 : min(dot_product / geo_factor, 1.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(half_vector)));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTSigned(lut_offset, dot(normal, normalize(view.xyz)));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[0].specular_0) * geo_factor) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(fma((vec3(1) - secondary_fragment_color.aaa), (const_color[0].rgb), (primary_fragment_color.rgb)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((texcolor0.rgb) * (const_color[1].rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (combiner_buffer.rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((secondary_fragment_color.rgb) + (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(min((rounded_primary_color.rgb) + (const_color[4].rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4 * 2.0, alpha_output_4 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 6F47F3FE2175F00D
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
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
vec3 surface_normal = vec3(0, 0, 1);
vec3 surface_tangent = vec3(1, 0, 0);
vec4 normalized_normquat = normalize(normquat);
vec3 normal = QuaternionRotate(normalized_normquat, surface_normal);
vec3 tangent = QuaternionRotate(normalized_normquat, surface_tangent);
vec4 shadow = vec4(1);
light_vector = normalize(light_src[0].position);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
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
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(mix((const_color[1].rgb), (primary_fragment_color.rgb), (texcolor0.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 7A387CE1242D2323
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
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
vec3 surface_normal = vec3(0, 0, 1);
vec3 surface_tangent = vec3(1, 0, 0);
vec4 normalized_normquat = normalize(normquat);
vec3 normal = QuaternionRotate(normalized_normquat, surface_normal);
vec3 tangent = QuaternionRotate(normalized_normquat, surface_tangent);
vec4 shadow = vec4(1);
light_vector = normalize(light_src[0].position);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
geo_factor = dot(half_vector, half_vector);
geo_factor = geo_factor == 0.0 ? 0.0 : min(dot_product / geo_factor, 1.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(half_vector)));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTSigned(lut_offset, dot(normal, normalize(view.xyz)));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[0].specular_0) * geo_factor) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(fma((vec3(1) - secondary_fragment_color.aaa), (const_color[0].rgb), (primary_fragment_color.rgb)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((texcolor0.rgb) * (const_color[1].rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) * (const_color[1].a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, D0B03464E1844E3C
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
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
vec3 surface_normal = vec3(0, 0, 1);
vec3 surface_tangent = vec3(1, 0, 0);
vec4 normalized_normquat = normalize(normquat);
vec3 normal = QuaternionRotate(normalized_normquat, surface_normal);
vec3 tangent = QuaternionRotate(normalized_normquat, surface_tangent);
vec4 shadow = vec4(1);
light_vector = normalize(light_src[0].position);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(half_vector)));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTSigned(lut_offset, dot(normal, normalize(view.xyz)));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(fma((vec3(1) - secondary_fragment_color.aaa), (const_color[0].rgb), (primary_fragment_color.rgb)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((texcolor0.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) + (const_color[2].rgb) - vec3(0.5), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_3 = ByteRound(clamp(mix((last_tev_out.rgb), (vec3(1) - last_tev_out.rgb), (secondary_fragment_color.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_4 = ByteRound(clamp(min((rounded_primary_color.rgb) + (const_color[4].rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp(fma((last_tev_out.rgb), (combiner_buffer.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_5 = (last_tev_out.a);
last_tev_out = vec4(color_output_5 * 2.0, alpha_output_5 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 1EC358E0E0D12E16
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
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
vec3 surface_normal = vec3(0, 0, 1);
vec3 surface_tangent = vec3(1, 0, 0);
vec4 normalized_normquat = normalize(normquat);
vec3 normal = QuaternionRotate(normalized_normquat, surface_normal);
vec3 tangent = QuaternionRotate(normalized_normquat, surface_tangent);
vec4 shadow = vec4(1);
light_vector = normalize(light_src[0].position);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
geo_factor = dot(half_vector, half_vector);
geo_factor = geo_factor == 0.0 ? 0.0 : min(dot_product / geo_factor, 1.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(half_vector)));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTSigned(lut_offset, dot(normal, normalize(view.xyz)));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[0].specular_0) * geo_factor) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(fma((vec3(1) - secondary_fragment_color.aaa), (const_color[0].rgb), (primary_fragment_color.rgb)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((texcolor0.rgb) * (const_color[1].rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (combiner_buffer.rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(fma((secondary_fragment_color.rgb), (texcolor1.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(min((rounded_primary_color.rgb) + (const_color[4].rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4 * 2.0, alpha_output_4 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B31, 34AE7018D30D47C9

#define mul_s(x, y) mix(x * y, vec4(0), isnan(x * y))
#define fma_s(x, y, z) (mul_s(x, y) + z)
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
layout(location=5) in vec4 vs_in_reg5;
vec4 vs_out_reg5;
layout(location=6) in vec4 vs_in_reg6;
vec4 vs_out_reg6;
layout(location=7) in vec4 vs_in_reg7;
layout(location=8) in vec4 vs_in_reg8;
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
vec4 vtx_color = vec4(vs_out_reg3.x,vs_out_reg3.y,vs_out_reg3.z,vs_out_reg3.w);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg4.x,vs_out_reg4.y,vs_out_reg4.z,1);
texcoord12 = vec4(vs_out_reg5.x,vs_out_reg5.y,vs_out_reg6.x,vs_out_reg6.y);
view = vec4(vs_out_reg2.x,vs_out_reg2.y,vs_out_reg2.z,1);
}
void main() {
vs_out_reg0 = vec4(0, 0, 0, 1);
vs_out_reg1 = vec4(0, 0, 0, 1);
vs_out_reg2 = vec4(0, 0, 0, 1);
vs_out_reg3 = vec4(0, 0, 0, 1);
vs_out_reg4 = vec4(0, 0, 0, 1);
vs_out_reg5 = vec4(0, 0, 0, 1);
vs_out_reg6 = vec4(0, 0, 0, 1);
ExecVS();
EmitVtx();
}
bvec2 bool_regs = bvec2(false);
ivec3 addr_regs = ivec3(0);
bool Vfn0();
bool Vfn22();
bool Vfn4();
bool Vfn10();
bool Vfn1();
bool Vfn2();
bool Vfn3();
bool Vfn5();
bool Vfn8();
bool Vfn9();
bool Vfn11();
bool Vfn21();
bool Vfn23();
bool Vfn25();
bool Vfn28();
bool Vfn29();
bool Vfn30();
bool Vfn6();
bool Vfn7();
bool Vfn12();
bool Vfn13();
bool Vfn15();
bool Vfn18();
bool Vfn33();
bool Vfn34();
bool Vfn36();
bool Vfn39();
bool Vfn40();
bool Vfn46();
bool Vfn48();
bool Vfn49();
bool Vfn51();
bool Vfn41();
bool Vfn43();
bool Vfn52();
bool Vfn53();
bool Vfn54();
bool Vfn55();
bool Vfn56();
bool Vfn58();
bool Vfn60();
bool Vfn61();
bool Vfn62();
bool Vfn63();
vec4 tmp_reg0;
vec4 tmp_reg1;
vec4 tmp_reg2;
vec4 tmp_reg3;
vec4 tmp_reg4;
vec4 tmp_reg5;
vec4 tmp_reg6;
vec4 tmp_reg7;
vec4 tmp_reg8;
vec4 tmp_reg9;
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
tmp_reg4 = vec4(0, 0, 0, 1);
tmp_reg5 = vec4(0, 0, 0, 1);
tmp_reg6 = vec4(0, 0, 0, 1);
tmp_reg7 = vec4(0, 0, 0, 1);
tmp_reg8 = vec4(0, 0, 0, 1);
tmp_reg9 = vec4(0, 0, 0, 1);
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
Vfn1();
Vfn33();
Vfn39();
Vfn53();
Vfn60();
return true;
}
bool Vfn22() {
addr_regs.x = (ivec2(tmp_reg1.xx)).x;
tmp_reg3.x = dot_s(vs_pica.f[25 + addr_regs.x], tmp_reg15);
tmp_reg3.y = dot_s(vs_pica.f[26 + addr_regs.x], tmp_reg15);
tmp_reg3.z = dot_s(vs_pica.f[27 + addr_regs.x], tmp_reg15);
tmp_reg7 = fma_s(tmp_reg1.wwww, tmp_reg3, tmp_reg7);
return false;
}
bool Vfn4() {
addr_regs.x = (ivec2(tmp_reg1.xx)).x;
tmp_reg3.x = dot_s(vs_pica.f[25 + addr_regs.x], tmp_reg15);
tmp_reg3.y = dot_s(vs_pica.f[26 + addr_regs.x], tmp_reg15);
tmp_reg3.z = dot_s(vs_pica.f[27 + addr_regs.x], tmp_reg15);
tmp_reg4.x = dot_3(vs_pica.f[25 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg4.y = dot_3(vs_pica.f[26 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg4.z = dot_3(vs_pica.f[27 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg7 = fma_s(tmp_reg1.wwww, tmp_reg3, tmp_reg7);
tmp_reg12 = fma_s(tmp_reg1.wwww, tmp_reg4, tmp_reg12);
return false;
}
bool Vfn10() {
addr_regs.x = (ivec2(tmp_reg1.xx)).x;
tmp_reg3.x = dot_s(vs_pica.f[25 + addr_regs.x], tmp_reg15);
tmp_reg3.y = dot_s(vs_pica.f[26 + addr_regs.x], tmp_reg15);
tmp_reg3.z = dot_s(vs_pica.f[27 + addr_regs.x], tmp_reg15);
tmp_reg4.x = dot_3(vs_pica.f[25 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg4.y = dot_3(vs_pica.f[26 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg4.z = dot_3(vs_pica.f[27 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg5.x = dot_3(vs_pica.f[25 + addr_regs.x].xyz, tmp_reg13.xyz);
tmp_reg5.y = dot_3(vs_pica.f[26 + addr_regs.x].xyz, tmp_reg13.xyz);
tmp_reg5.z = dot_3(vs_pica.f[27 + addr_regs.x].xyz, tmp_reg13.xyz);
tmp_reg7 = fma_s(tmp_reg1.wwww, tmp_reg3, tmp_reg7);
tmp_reg12 = fma_s(tmp_reg1.wwww, tmp_reg4, tmp_reg12);
tmp_reg11 = fma_s(tmp_reg1.wwww, tmp_reg5, tmp_reg11);
return false;
}
bool Vfn1() {
tmp_reg15.xyz = (mul_s(vs_pica.f[7].xxxx, vs_in_reg0)).xyz;
tmp_reg14.xyz = (mul_s(vs_pica.f[7].yyyy, vs_in_reg1)).xyz;
tmp_reg13.xyz = (mul_s(vs_pica.f[7].zzzz, vs_in_reg2)).xyz;
tmp_reg15.xyz = (vs_pica.f[6] + tmp_reg15).xyz;
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
if (vs_pica.b[1]) {
Vfn2();
} else {
Vfn25();
}
return false;
}
bool Vfn2() {
tmp_reg0 = vs_pica.f[7];
bool_regs = notEqual(vs_pica.f[93].xx, tmp_reg0.yz);
tmp_reg7 = vs_pica.f[93].xxxx;
tmp_reg12 = vs_pica.f[93].xxxx;
tmp_reg11 = vs_pica.f[93].xxxx;
tmp_reg2 = mul_s(vs_pica.f[93].wwww, vs_in_reg7);
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
Vfn3();
} else {
Vfn8();
}
vs_out_reg2 = -tmp_reg15;
tmp_reg0.x = dot_s(vs_pica.f[86], tmp_reg15);
tmp_reg0.y = dot_s(vs_pica.f[87], tmp_reg15);
tmp_reg0.z = dot_s(vs_pica.f[88], tmp_reg15);
tmp_reg0.w = dot_s(vs_pica.f[89], tmp_reg15);
tmp_reg1.x = (-tmp_reg0.wwww).x;
tmp_reg1.y = (mul_s(vs_pica.f[95].zzzz, -tmp_reg0.wwww)).y;
bool_regs.x = tmp_reg0.xxxx.x > tmp_reg1.xyyy.x;
bool_regs.y = tmp_reg0.xxxx.y < tmp_reg1.xyyy.y;
if (all(bool_regs)) {
tmp_reg0.x = (-tmp_reg0.wwww).x;
}
vs_out_reg0 = tmp_reg0;
return false;
}
bool Vfn3() {
bool_regs = notEqual(vs_pica.f[93].xx, vs_in_reg8.zw);
tmp_reg1.xy = (tmp_reg2.xxxx).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.xxxx)).w;
Vfn4();
tmp_reg1.xy = (tmp_reg2.yyyy).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.yyyy)).w;
Vfn4();
tmp_reg1.xy = (tmp_reg2.zzzz).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.zzzz)).w;
if (bool_regs.x) {
Vfn4();
}
if (vs_pica.b[8]) {
Vfn5();
}
tmp_reg7.w = (vs_pica.f[93].yyyy).w;
tmp_reg10.x = dot_s(vs_pica.f[0], tmp_reg7);
tmp_reg10.y = dot_s(vs_pica.f[1], tmp_reg7);
tmp_reg10.z = dot_s(vs_pica.f[2], tmp_reg7);
tmp_reg10.w = (vs_pica.f[93].yyyy).w;
Vfn6();
tmp_reg15.x = dot_s(vs_pica.f[90], tmp_reg10);
tmp_reg15.y = dot_s(vs_pica.f[91], tmp_reg10);
tmp_reg15.z = dot_s(vs_pica.f[92], tmp_reg10);
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
tmp_reg14.x = dot_3(vs_pica.f[3].xyz, tmp_reg12.xyz);
tmp_reg14.y = dot_3(vs_pica.f[4].xyz, tmp_reg12.xyz);
tmp_reg14.z = dot_3(vs_pica.f[5].xyz, tmp_reg12.xyz);
Vfn7();
return false;
}
bool Vfn5() {
tmp_reg1.xy = (tmp_reg2.wwww).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.wwww)).w;
if (bool_regs.y) {
Vfn4();
}
return false;
}
bool Vfn8() {
if (all(bool_regs)) {
Vfn9();
} else {
Vfn21();
}
return false;
}
bool Vfn9() {
bool_regs = notEqual(vs_pica.f[93].xx, vs_in_reg8.zw);
tmp_reg1.xy = (tmp_reg2.xxxx).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.xxxx)).w;
Vfn10();
tmp_reg1.xy = (tmp_reg2.yyyy).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.yyyy)).w;
Vfn10();
tmp_reg1.xy = (tmp_reg2.zzzz).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.zzzz)).w;
if (bool_regs.x) {
Vfn10();
}
if (vs_pica.b[8]) {
Vfn11();
}
tmp_reg7.w = (vs_pica.f[93].yyyy).w;
tmp_reg10.x = dot_s(vs_pica.f[0], tmp_reg7);
tmp_reg10.y = dot_s(vs_pica.f[1], tmp_reg7);
tmp_reg10.z = dot_s(vs_pica.f[2], tmp_reg7);
tmp_reg10.w = (vs_pica.f[93].yyyy).w;
Vfn6();
tmp_reg13.x = dot_3(vs_pica.f[3].xyz, tmp_reg11.xyz);
tmp_reg13.y = dot_3(vs_pica.f[4].xyz, tmp_reg11.xyz);
tmp_reg13.z = dot_3(vs_pica.f[5].xyz, tmp_reg11.xyz);
tmp_reg14.x = dot_3(vs_pica.f[3].xyz, tmp_reg12.xyz);
tmp_reg14.y = dot_3(vs_pica.f[4].xyz, tmp_reg12.xyz);
tmp_reg14.z = dot_3(vs_pica.f[5].xyz, tmp_reg12.xyz);
tmp_reg15.x = dot_s(vs_pica.f[90], tmp_reg10);
tmp_reg15.y = dot_s(vs_pica.f[91], tmp_reg10);
tmp_reg15.z = dot_s(vs_pica.f[92], tmp_reg10);
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
Vfn12();
return false;
}
bool Vfn11() {
tmp_reg1.xy = (tmp_reg2.wwww).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.wwww)).w;
if (bool_regs.y) {
Vfn10();
}
return false;
}
bool Vfn21() {
bool_regs = notEqual(vs_pica.f[93].xx, vs_in_reg8.zw);
tmp_reg1.xy = (tmp_reg2.xxxx).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.xxxx)).w;
Vfn22();
tmp_reg1.xy = (tmp_reg2.yyyy).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.yyyy)).w;
Vfn22();
tmp_reg1.xy = (tmp_reg2.zzzz).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.zzzz)).w;
if (bool_regs.x) {
Vfn22();
}
if (vs_pica.b[8]) {
Vfn23();
}
tmp_reg7.w = (vs_pica.f[93].yyyy).w;
tmp_reg10.x = dot_s(vs_pica.f[0], tmp_reg7);
tmp_reg10.y = dot_s(vs_pica.f[1], tmp_reg7);
tmp_reg10.z = dot_s(vs_pica.f[2], tmp_reg7);
tmp_reg10.w = (vs_pica.f[93].yyyy).w;
tmp_reg15.x = dot_s(vs_pica.f[90], tmp_reg10);
tmp_reg15.y = dot_s(vs_pica.f[91], tmp_reg10);
tmp_reg15.z = dot_s(vs_pica.f[92], tmp_reg10);
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
vs_out_reg1 = vs_pica.f[93].xxxx;
return false;
}
bool Vfn23() {
tmp_reg1.xy = (tmp_reg2.wwww).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.wwww)).w;
if (bool_regs.y) {
Vfn22();
}
return false;
}
bool Vfn25() {
tmp_reg0 = vs_pica.f[7];
bool_regs = notEqual(vs_pica.f[93].xx, tmp_reg0.yz);
if (vs_pica.b[2]) {
tmp_reg1.x = (mul_s(vs_pica.f[93].wwww, vs_in_reg7.xxxx)).x;
addr_regs.x = (ivec2(tmp_reg1.xx)).x;
tmp_reg7.x = dot_s(vs_pica.f[25 + addr_regs.x], tmp_reg15);
tmp_reg7.y = dot_s(vs_pica.f[26 + addr_regs.x], tmp_reg15);
tmp_reg7.z = dot_s(vs_pica.f[27 + addr_regs.x], tmp_reg15);
tmp_reg7.w = (vs_pica.f[93].yyyy).w;
tmp_reg10.x = dot_s(vs_pica.f[0], tmp_reg7);
tmp_reg10.y = dot_s(vs_pica.f[1], tmp_reg7);
tmp_reg10.z = dot_s(vs_pica.f[2], tmp_reg7);
tmp_reg10.w = (vs_pica.f[93].yyyy).w;
} else {
addr_regs.x = (ivec2(vs_pica.f[93].xx)).x;
tmp_reg10.x = dot_s(vs_pica.f[25], tmp_reg15);
tmp_reg10.y = dot_s(vs_pica.f[26], tmp_reg15);
tmp_reg10.z = dot_s(vs_pica.f[27], tmp_reg15);
tmp_reg10.w = (vs_pica.f[93].yyyy).w;
}
Vfn6();
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
Vfn28();
} else {
Vfn29();
}
vs_out_reg2 = -tmp_reg15;
tmp_reg0.x = dot_s(vs_pica.f[86], tmp_reg15);
tmp_reg0.y = dot_s(vs_pica.f[87], tmp_reg15);
tmp_reg0.z = dot_s(vs_pica.f[88], tmp_reg15);
tmp_reg0.w = dot_s(vs_pica.f[89], tmp_reg15);
tmp_reg1.x = (-tmp_reg0.wwww).x;
tmp_reg1.y = (mul_s(vs_pica.f[95].zzzz, -tmp_reg0.wwww)).y;
bool_regs.x = tmp_reg0.xxxx.x > tmp_reg1.xyyy.x;
bool_regs.y = tmp_reg0.xxxx.y < tmp_reg1.xyyy.y;
if (all(bool_regs)) {
tmp_reg0.x = (-tmp_reg0.wwww).x;
}
vs_out_reg0 = tmp_reg0;
return false;
}
bool Vfn28() {
tmp_reg12.x = dot_3(vs_pica.f[25 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg12.y = dot_3(vs_pica.f[26 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg12.z = dot_3(vs_pica.f[27 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg15.x = dot_s(vs_pica.f[90], tmp_reg10);
tmp_reg15.y = dot_s(vs_pica.f[91], tmp_reg10);
tmp_reg15.z = dot_s(vs_pica.f[92], tmp_reg10);
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
tmp_reg14.x = dot_3(vs_pica.f[3].xyz, tmp_reg12.xyz);
tmp_reg14.y = dot_3(vs_pica.f[4].xyz, tmp_reg12.xyz);
tmp_reg14.z = dot_3(vs_pica.f[5].xyz, tmp_reg12.xyz);
Vfn7();
return false;
}
bool Vfn29() {
if (all(bool_regs)) {
Vfn30();
} else {
tmp_reg15.x = dot_s(vs_pica.f[90], tmp_reg10);
tmp_reg15.y = dot_s(vs_pica.f[91], tmp_reg10);
tmp_reg15.z = dot_s(vs_pica.f[92], tmp_reg10);
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
vs_out_reg1 = vs_pica.f[93].xxxx;
}
return false;
}
bool Vfn30() {
tmp_reg12.x = dot_3(vs_pica.f[25 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg12.y = dot_3(vs_pica.f[26 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg12.z = dot_3(vs_pica.f[27 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg11.x = dot_3(vs_pica.f[25 + addr_regs.x].xyz, tmp_reg13.xyz);
tmp_reg11.y = dot_3(vs_pica.f[26 + addr_regs.x].xyz, tmp_reg13.xyz);
tmp_reg11.z = dot_3(vs_pica.f[27 + addr_regs.x].xyz, tmp_reg13.xyz);
tmp_reg15.x = dot_s(vs_pica.f[90], tmp_reg10);
tmp_reg15.y = dot_s(vs_pica.f[91], tmp_reg10);
tmp_reg15.z = dot_s(vs_pica.f[92], tmp_reg10);
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
tmp_reg14.x = dot_3(vs_pica.f[3].xyz, tmp_reg12.xyz);
tmp_reg14.y = dot_3(vs_pica.f[4].xyz, tmp_reg12.xyz);
tmp_reg14.z = dot_3(vs_pica.f[5].xyz, tmp_reg12.xyz);
tmp_reg13.x = dot_3(vs_pica.f[3].xyz, tmp_reg11.xyz);
tmp_reg13.y = dot_3(vs_pica.f[4].xyz, tmp_reg11.xyz);
tmp_reg13.z = dot_3(vs_pica.f[5].xyz, tmp_reg11.xyz);
Vfn12();
return false;
}
bool Vfn6() {
tmp_reg0.x = (vs_pica.f[81].xxxx + tmp_reg10.zzzz).x;
tmp_reg1.x = rcp_s(tmp_reg0.x);
tmp_reg1.y = (-vs_pica.f[80].xxxx + tmp_reg0.xxxx).y;
tmp_reg1.z = (mul_s(tmp_reg1.xxxx, tmp_reg1.yyyy)).z;
tmp_reg10.x = (fma_s(tmp_reg1.zzzz, vs_pica.f[80].yyyy, tmp_reg10.xxxx)).x;
return false;
}
bool Vfn7() {
uint jmp_to = 222u;
while (true) {
switch (jmp_to) {
case 222u:
tmp_reg6.x = dot_3(tmp_reg14.xyz, tmp_reg14.xyz);
tmp_reg7.x = dot_3(tmp_reg12.xyz, tmp_reg12.xyz);
tmp_reg6.x = rsq_s(tmp_reg6.x);
tmp_reg7.x = rsq_s(tmp_reg7.x);
tmp_reg14.xyz = (mul_s(tmp_reg14.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg12.xyz = (mul_s(tmp_reg12.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg0 = vs_pica.f[93].yxxx;
if (!vs_pica.b[15]) {
jmp_to = 238u; break;
}
tmp_reg4 = vs_pica.f[93].yyyy + tmp_reg14.zzzz;
tmp_reg4 = mul_s(vs_pica.f[94].zzzz, tmp_reg4);
bool_regs = greaterThanEqual(vs_pica.f[93].xx, tmp_reg4.xx);
tmp_reg4 = vec4(rsq_s(tmp_reg4.x));
tmp_reg5 = mul_s(vs_pica.f[94].zzzz, tmp_reg14);
if (bool_regs.x) {
jmp_to = 238u; break;
}
tmp_reg0.z = rcp_s(tmp_reg4.x);
tmp_reg0.xy = (mul_s(tmp_reg5, tmp_reg4)).xy;
case 238u:
vs_out_reg1 = tmp_reg0;
default: return false;
}
}
return false;
}
bool Vfn12() {
uint jmp_to = 239u;
while (true) {
switch (jmp_to) {
case 239u:
tmp_reg6.x = dot_3(tmp_reg14.xyz, tmp_reg14.xyz);
tmp_reg7.x = dot_3(tmp_reg12.xyz, tmp_reg12.xyz);
tmp_reg6.x = rsq_s(tmp_reg6.x);
tmp_reg7.x = rsq_s(tmp_reg7.x);
tmp_reg14.xyz = (mul_s(tmp_reg14.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg12.xyz = (mul_s(tmp_reg12.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg13.xyz = (mul_s(tmp_reg13.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg11.xyz = (mul_s(tmp_reg11.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg0 = vs_pica.f[93].yxxx;
if (!vs_pica.b[15]) {
jmp_to = 314u; break;
}
tmp_reg13.xyz = (mul_s(tmp_reg13.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg11.xyz = (mul_s(tmp_reg11.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg5 = mul_s(tmp_reg14.yzxx, tmp_reg13.zxyy);
tmp_reg5 = fma_s(-tmp_reg13.yzxx, tmp_reg14.zxyy, tmp_reg5);
tmp_reg5.w = dot_3(tmp_reg5.xyz, tmp_reg5.xyz);
tmp_reg5.w = rsq_s(tmp_reg5.w);
tmp_reg5 = mul_s(tmp_reg5, tmp_reg5.wwww);
tmp_reg6.w = (tmp_reg14.zzzz + tmp_reg5.yyyy).w;
tmp_reg13 = mul_s(tmp_reg5.yzxx, tmp_reg14.zxyy);
tmp_reg13 = fma_s(-tmp_reg14.yzxx, tmp_reg5.zxyy, tmp_reg13);
tmp_reg6.w = (tmp_reg13.xxxx + tmp_reg6).w;
tmp_reg13.w = (tmp_reg5.zzzz).w;
tmp_reg5.z = (tmp_reg13.xxxx).z;
tmp_reg6.w = (vs_pica.f[93].yyyy + tmp_reg6).w;
tmp_reg14.w = (tmp_reg5.xxxx).w;
tmp_reg5.x = (tmp_reg14.zzzz).x;
bool_regs = lessThan(vs_pica.f[94].yy, tmp_reg6.ww);
tmp_reg6.x = (vs_pica.f[93].yyyy).x;
tmp_reg6.y = (-vs_pica.f[93].yyyy).y;
if (!bool_regs.x) {
jmp_to = 276u; break;
}
tmp_reg7.xz = (tmp_reg13.wwyy + -tmp_reg14.yyww).xz;
tmp_reg7.y = (tmp_reg14.xxxx + -tmp_reg13.zzzz).y;
tmp_reg7.w = (tmp_reg6).w;
tmp_reg6 = vec4(dot_s(tmp_reg7, tmp_reg7));
tmp_reg6 = vec4(rsq_s(tmp_reg6.x));
tmp_reg0 = mul_s(tmp_reg7, tmp_reg6);
if (vs_pica.b[0]) {
jmp_to = 314u; break;
}
case 276u:
bool_regs = greaterThan(tmp_reg5.zy, tmp_reg5.yx);
if (bool_regs.x) {
Vfn13();
} else {
Vfn18();
}
tmp_reg6 = vec4(dot_s(tmp_reg8, tmp_reg8));
tmp_reg6 = vec4(rsq_s(tmp_reg6.x));
tmp_reg0 = mul_s(tmp_reg8, tmp_reg6);
case 314u:
vs_out_reg1 = tmp_reg0;
default: return false;
}
}
return false;
}
bool Vfn13() {
if (bool_regs.y) {
tmp_reg8 = mul_s(tmp_reg13.yyzw, tmp_reg6.xxxy);
tmp_reg8.x = (vs_pica.f[93].yyyy + -tmp_reg5.yyyy).x;
tmp_reg9 = tmp_reg5.zzzz + -tmp_reg5.xxxx;
tmp_reg8.yzw = (tmp_reg8 + tmp_reg14.wwxy).yzw;
tmp_reg8.x = (tmp_reg9 + tmp_reg8).x;
} else {
Vfn15();
}
tmp_reg8.w = (-tmp_reg8).w;
return false;
}
bool Vfn15() {
bool_regs = greaterThan(tmp_reg5.zz, tmp_reg5.xx);
tmp_reg8 = mul_s(tmp_reg13.yyzw, tmp_reg6.xxxy);
tmp_reg8.x = (vs_pica.f[93].yyyy + -tmp_reg5.yyyy).x;
if (bool_regs.x) {
tmp_reg9 = tmp_reg5.zzzz + -tmp_reg5.xxxx;
tmp_reg8.yzw = (tmp_reg8 + tmp_reg14.wwxy).yzw;
tmp_reg8.x = (tmp_reg9 + tmp_reg8).x;
} else {
tmp_reg8 = mul_s(tmp_reg13.zwwy, tmp_reg6.xxxy);
tmp_reg8.z = (vs_pica.f[93].yyyy + -tmp_reg5.zzzz).z;
tmp_reg9 = tmp_reg5.xxxx + -tmp_reg5.yyyy;
tmp_reg8.xyw = (tmp_reg8 + tmp_reg14.xyyw).xyw;
tmp_reg8.z = (tmp_reg9 + tmp_reg8).z;
}
return false;
}
bool Vfn18() {
if (bool_regs.y) {
tmp_reg8 = mul_s(tmp_reg13.yywz, tmp_reg6.xxxy);
tmp_reg8.y = (vs_pica.f[93].yyyy + -tmp_reg5.zzzz).y;
tmp_reg9 = tmp_reg5.yyyy + -tmp_reg5.xxxx;
tmp_reg8.xzw = (tmp_reg8 + tmp_reg14.wwyx).xzw;
tmp_reg8.y = (tmp_reg9 + tmp_reg8).y;
} else {
tmp_reg8 = mul_s(tmp_reg13.zwwy, tmp_reg6.xxxy);
tmp_reg8.z = (vs_pica.f[93].yyyy + -tmp_reg5.zzzz).z;
tmp_reg9 = tmp_reg5.xxxx + -tmp_reg5.yyyy;
tmp_reg8.xyw = (tmp_reg8 + tmp_reg14.xyyw).xyw;
tmp_reg8.z = (tmp_reg9 + tmp_reg8).z;
tmp_reg8.w = (-tmp_reg8).w;
}
return false;
}
bool Vfn33() {
tmp_reg8.xy = (vs_pica.f[93].xxxx).xy;
tmp_reg0.y = (vs_pica.f[7].wwww).y;
bool_regs = notEqual(vs_pica.f[93].xx, tmp_reg0.xy);
tmp_reg9.xyz = (vs_pica.f[93].xxxx).xyz;
tmp_reg9.w = (vs_pica.f[21].wwww).w;
if (bool_regs.y) {
Vfn34();
}
if (vs_pica.b[5]) {
Vfn36();
}
bool_regs = equal(vs_pica.f[93].xx, tmp_reg8.xy);
if (all(bool_regs)) {
tmp_reg9 = vs_pica.f[21];
}
vs_out_reg3 = max_s(vs_pica.f[93].xxxx, tmp_reg9);
return false;
}
bool Vfn34() {
tmp_reg0 = mul_s(vs_pica.f[7].wwww, vs_in_reg3);
if (vs_pica.b[7]) {
tmp_reg9.w = (mul_s(tmp_reg9.wwww, tmp_reg0.wwww)).w;
}
tmp_reg9.xyz = (mul_s(vs_pica.f[20].wwww, tmp_reg0.xyzz)).xyz;
tmp_reg8.x = (vs_pica.f[93].yyyy).x;
return false;
}
bool Vfn36() {
tmp_reg1 = vec4(dot_3(vs_pica.f[24].xyz, tmp_reg14.xyz));
tmp_reg2 = vs_pica.f[24].wwww;
tmp_reg1 = fma_s(tmp_reg1, tmp_reg2, tmp_reg2);
tmp_reg3 = vs_pica.f[22];
tmp_reg2 = vs_pica.f[23] + -tmp_reg3;
tmp_reg4 = fma_s(tmp_reg2, tmp_reg1, tmp_reg3);
if (vs_pica.b[6]) {
tmp_reg4 = mul_s(tmp_reg4, tmp_reg9.wwww);
}
tmp_reg9.xyz = (fma_s(tmp_reg4, vs_pica.f[21], tmp_reg9)).xyz;
tmp_reg8.x = (vs_pica.f[93].yyyy).x;
return false;
}
bool Vfn39() {
tmp_reg0.xy = (vs_pica.f[10].xxxx).xy;
if (vs_pica.b[9]) {
Vfn40();
} else {
Vfn46();
}
return false;
}
bool Vfn40() {
Vfn41();
tmp_reg3.x = dot_s(vs_pica.f[11].xywz, tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12].xywz, tmp_reg6);
tmp_reg3.zw = (vs_pica.f[93].xxxx).zw;
vs_out_reg4 = tmp_reg3;
return false;
}
bool Vfn46() {
bool_regs = equal(vs_pica.f[95].xy, tmp_reg0.xy);
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
if (all(not(bool_regs))) {
tmp_reg6 = tmp_reg10;
tmp_reg3.x = dot_s(vs_pica.f[11], tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12], tmp_reg6);
tmp_reg3.z = dot_s(vs_pica.f[13], tmp_reg6);
tmp_reg0.xy = (mul_s(vs_pica.f[19].xyyy, tmp_reg3.zzzz)).xy;
tmp_reg3.xy = (tmp_reg3.xyyy + tmp_reg0.xyyy).xy;
} else {
Vfn48();
}
vs_out_reg4 = tmp_reg3;
return false;
}
bool Vfn48() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
Vfn49();
} else {
Vfn51();
}
return false;
}
bool Vfn49() {
tmp_reg2 = -tmp_reg15;
tmp_reg2.w = dot_3(tmp_reg2.xyz, tmp_reg2.xyz);
tmp_reg2.w = rsq_s(tmp_reg2.w);
tmp_reg2 = mul_s(tmp_reg2, tmp_reg2.wwww);
tmp_reg1 = vec4(dot_3(tmp_reg2.xyz, tmp_reg14.xyz));
tmp_reg1 = tmp_reg1 + tmp_reg1;
tmp_reg6 = fma_s(tmp_reg1, tmp_reg14, -tmp_reg2);
tmp_reg3.x = dot_3(vs_pica.f[11].xyz, tmp_reg6.xyz);
tmp_reg3.y = dot_3(vs_pica.f[12].xyz, tmp_reg6.xyz);
tmp_reg3.z = dot_3(vs_pica.f[13].xyz, tmp_reg6.xyz);
return false;
}
bool Vfn51() {
Vfn52();
tmp_reg3.x = dot_s(vs_pica.f[11], tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12], tmp_reg6);
return false;
}
bool Vfn41() {
bool_regs = equal(vs_pica.f[93].yz, tmp_reg0.xy);
if (all(not(bool_regs))) {
tmp_reg6.xy = (mul_s(vs_pica.f[8].xxxx, vs_in_reg4.xyyy)).xy;
} else {
Vfn43();
}
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
return false;
}
bool Vfn43() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
tmp_reg6.xy = (mul_s(vs_pica.f[8].yyyy, vs_in_reg5.xyyy)).xy;
} else {
tmp_reg6.xy = (mul_s(vs_pica.f[8].zzzz, vs_in_reg6.xyyy)).xy;
}
return false;
}
bool Vfn52() {
tmp_reg1.xy = (vs_pica.f[94].zzzz).xy;
tmp_reg1.zw = (vs_pica.f[93].xxxx).zw;
tmp_reg6 = fma_s(tmp_reg14, tmp_reg1, tmp_reg1);
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
return false;
}
bool Vfn53() {
tmp_reg0.xy = (vs_pica.f[10].yyyy).xy;
if (vs_pica.b[10]) {
Vfn54();
} else {
Vfn55();
}
return false;
}
bool Vfn54() {
Vfn41();
tmp_reg4.x = dot_s(vs_pica.f[14].xywz, tmp_reg6);
tmp_reg4.y = dot_s(vs_pica.f[15].xywz, tmp_reg6);
vs_out_reg5 = tmp_reg4;
return false;
}
bool Vfn55() {
if (vs_pica.b[13]) {
Vfn56();
} else {
vs_out_reg5 = vs_pica.f[93].xxxx;
}
return false;
}
bool Vfn56() {
bool_regs = equal(vs_pica.f[95].xy, tmp_reg0.xy);
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
if (all(not(bool_regs))) {
tmp_reg6 = tmp_reg10;
tmp_reg4.x = dot_s(vs_pica.f[14], tmp_reg6);
tmp_reg4.y = dot_s(vs_pica.f[15], tmp_reg6);
tmp_reg4.z = dot_s(vs_pica.f[16], tmp_reg6);
tmp_reg6.w = rcp_s(tmp_reg4.z);
tmp_reg4.xy = (mul_s(tmp_reg4.xyyy, tmp_reg6.wwww)).xy;
tmp_reg4.xy = (vs_pica.f[19].zwww + tmp_reg4.xyyy).xy;
} else {
Vfn58();
}
vs_out_reg5 = tmp_reg4;
return false;
}
bool Vfn58() {
Vfn52();
tmp_reg4.x = dot_s(vs_pica.f[14], tmp_reg6);
tmp_reg4.y = dot_s(vs_pica.f[15], tmp_reg6);
return false;
}
bool Vfn60() {
tmp_reg0.xy = (vs_pica.f[10].zzzz).xy;
if (vs_pica.b[11]) {
Vfn61();
} else {
Vfn62();
}
return false;
}
bool Vfn61() {
Vfn41();
tmp_reg5.x = dot_s(vs_pica.f[17].xywz, tmp_reg6);
tmp_reg5.y = dot_s(vs_pica.f[18].xywz, tmp_reg6);
vs_out_reg6 = tmp_reg5;
return false;
}
bool Vfn62() {
if (vs_pica.b[14]) {
Vfn63();
} else {
vs_out_reg6 = vs_pica.f[93].xxxx;
}
return false;
}
bool Vfn63() {
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
tmp_reg5.zw = (tmp_reg6.zwww).zw;
Vfn52();
tmp_reg5.x = dot_s(vs_pica.f[17], tmp_reg6);
tmp_reg5.y = dot_s(vs_pica.f[18], tmp_reg6);
vs_out_reg6 = tmp_reg5;
return false;
}
// shader: 8B30, 8229022C021EA128
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
vec3 surface_normal = vec3(0, 0, 1);
vec3 surface_tangent = vec3(1, 0, 0);
vec4 normalized_normquat = normalize(normquat);
vec3 normal = QuaternionRotate(normalized_normquat, surface_normal);
vec3 tangent = QuaternionRotate(normalized_normquat, surface_tangent);
vec4 shadow = vec4(1);
light_vector = normalize(light_src[0].position);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(view.xyz)));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rrr) * (const_color[0].aaa), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (texcolor1.ggg), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(fma((last_tev_out.rgb), (texcolor2.bbb), (secondary_fragment_color.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) + (last_tev_out.rgb) - vec3(0.5), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((last_tev_out.r) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3 * 4.0, alpha_output_3 * 4.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_4 = ByteRound(clamp(min((last_tev_out.rgb) + (const_color[4].rgb), vec3(1)) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4 * 1.0, alpha_output_4 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp(fma((combiner_buffer.rgb), (const_color[5].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_5 = (last_tev_out.a);
last_tev_out = vec4(color_output_5 * 1.0, alpha_output_5 * 4.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 73384AF3AC69EE1C
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
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
vec3 surface_normal = vec3(0, 0, 1);
vec3 surface_tangent = vec3(1, 0, 0);
vec4 normalized_normquat = normalize(normquat);
vec3 normal = QuaternionRotate(normalized_normquat, surface_normal);
vec3 tangent = QuaternionRotate(normalized_normquat, surface_tangent);
vec4 shadow = vec4(1);
light_vector = normalize(light_src[0].position);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
geo_factor = dot(half_vector, half_vector);
geo_factor = geo_factor == 0.0 ? 0.0 : min(dot_product / geo_factor, 1.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(half_vector)));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTSigned(lut_offset, dot(normal, normalize(view.xyz)));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[0].specular_0) * geo_factor) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(fma((vec3(1) - secondary_fragment_color.aaa), (const_color[0].rgb), (primary_fragment_color.rgb)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((texcolor0.rgb) * (const_color[1].rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (combiner_buffer.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((last_tev_out.a) * (const_color[2].a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((secondary_fragment_color.rgb) + (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(min((rounded_primary_color.rgb) + (const_color[4].rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4 * 2.0, alpha_output_4 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 07BA723CE730463B
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
vec3 color_output_0 = ByteRound(clamp(mix((const_color[0].rgb), (texcolor0.rgb), (rounded_primary_color.rgb)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor0.a) * (rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = (last_tev_out.rgb);
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) * (const_color[1].a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a > alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, DD1A4B55F906AB98
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
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) + (const_color[1].rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) * (const_color[1].a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 3FF284848920097A
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
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp((texcolor1.aaa) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((texcolor1.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(fma((vec3(1) - const_color[3].aaa), (texcolor1.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp(fma((1.0 - const_color[3].a), (texcolor1.a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((combiner_buffer.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(mix((combiner_buffer.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, CB1735EA6B047189
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
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp((texcolor1.aaa) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((texcolor1.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((const_color[3].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((const_color[3].a) * (1.0 - texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((const_color[4].rgb), (texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((const_color[4].a), (texcolor0.a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 9450D8DC38BFD9F3
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
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp((texcolor1.aaa) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((texcolor1.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((vec3(1) - texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, D957D2337FD70735
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
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp((texcolor1.aaa) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((texcolor1.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((const_color[3].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((const_color[3].a) * (1.0 - texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(min((texcolor0.rgb) + (const_color[4].rgb), vec3(1)) * (texcolor0.aaa), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp((texcolor1.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_4 * 1.0, alpha_output_4 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = (texcolor1.rgb);
float alpha_output_5 = ByteRound(clamp(mix((last_tev_out.a), (const_color[5].r), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 14C22D89F9A86B25
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
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp((texcolor1.aaa) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((texcolor1.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((vec3(1) - texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (const_color[5].rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (const_color[5].a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, BF37F14B52729302
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
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp((texcolor1.aaa) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((texcolor1.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((vec3(1) - texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 43A91D10C03E6FAF, 2C200D7B7A3600F1
// reference: ADD0DC02EDFD32FF, 4FA238C48451F8D0
// reference: F8A67AC4EDFD32FF, FB22805ACE94D23C
// reference: 37224322E1CBFC05, 6F47F3FE2175F00D
// reference: F189D8976A7B30B3, 7A387CE1242D2323
// reference: 8A3EC8A4323072F8, D0B03464E1844E3C
// reference: 7D8532AA1E48D9E2, 1EC358E0E0D12E16
// reference: D551283291F9B20D, 34AE7018D30D47C9
// reference: 9ADB94A1CE8BF6A6, 8229022C021EA128
// reference: 42A5259E94D981DA, 73384AF3AC69EE1C
// reference: 975E017CB13615BB, 07BA723CE730463B
// reference: 014EA0C107F145C6, DD1A4B55F906AB98
// reference: 8CBD8CC511FD3148, 3FF284848920097A
// reference: 891746631B61117F, CB1735EA6B047189
// reference: 35FD4CCD5F7C7FDF, 9450D8DC38BFD9F3
// reference: 992CF0DABD4CB6F4, D957D2337FD70735
// reference: 35FD4CCDB1EBFF3F, 14C22D89F9A86B25
// reference: 468FA29C5F7C7FDF, BF37F14B52729302
// program: 68FD505661AD5B02, 0000000000000000, 2C200D7B7A3600F1
// program: 68FD505661AD5B02, 0000000000000000, 4FA238C48451F8D0
// program: 68FD505661AD5B02, 0000000000000000, FB22805ACE94D23C
// program: 68FD505661AD5B02, 0000000000000000, 6F47F3FE2175F00D
// program: 68FD505661AD5B02, 0000000000000000, 7A387CE1242D2323
// program: 68FD505661AD5B02, 0000000000000000, D0B03464E1844E3C
// program: 8BDB60558C9403BE, 0000000000000000, 1EC358E0E0D12E16
// program: 34AE7018D30D47C9, 0000000000000000, 8229022C021EA128
// program: 68FD505661AD5B02, 0000000000000000, 73384AF3AC69EE1C
// program: 68FD505661AD5B02, 0000000000000000, 07BA723CE730463B
// program: 68FD505661AD5B02, 0000000000000000, DD1A4B55F906AB98
// program: 6089902024F82DD6, 0000000000000000, 3FF284848920097A
// program: 6089902024F82DD6, 0000000000000000, CB1735EA6B047189
// program: 6089902024F82DD6, 0000000000000000, 9450D8DC38BFD9F3
// program: 6089902024F82DD6, 0000000000000000, D957D2337FD70735
// program: 6089902024F82DD6, 0000000000000000, 14C22D89F9A86B25
// program: 6089902024F82DD6, 0000000000000000, BF37F14B52729302
// shader: 8B30, 359A8BCBC9773A97
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
vec3 color_output_0 = ByteRound(clamp((const_color[0].rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((rounded_primary_color.rgb), (vec3(1) - texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((texcolor1.aaa) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((texcolor1.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(fma((vec3(1) - const_color[3].aaa), (texcolor1.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp(fma((1.0 - const_color[3].a), (texcolor1.a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((combiner_buffer.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(mix((combiner_buffer.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, EBFE1FDE6B2DBEDA
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
vec3 color_output_0 = ByteRound(clamp((const_color[0].rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((rounded_primary_color.rgb), (vec3(1) - texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((texcolor1.aaa) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((texcolor1.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((const_color[3].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((const_color[3].a) * (1.0 - texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((const_color[4].rgb), (texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((const_color[4].a), (texcolor0.a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 272C0337C2B52122
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
vec3 color_output_0 = ByteRound(clamp((const_color[0].rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((rounded_primary_color.rgb), (vec3(1) - texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((texcolor1.aaa) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((texcolor1.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((vec3(1) - texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 7F1BDCBADDAB793F
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
vec3 color_output_0 = ByteRound(clamp((const_color[0].rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((rounded_primary_color.rgb), (vec3(1) - texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((texcolor1.aaa) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((texcolor1.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((const_color[3].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((const_color[3].a) * (1.0 - texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(min((texcolor0.rgb) + (const_color[4].rgb), vec3(1)) * (texcolor0.aaa), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp((texcolor1.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_4 * 1.0, alpha_output_4 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = (texcolor1.rgb);
float alpha_output_5 = ByteRound(clamp(mix((last_tev_out.a), (const_color[5].r), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 157DD7E26840B04F
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
vec3 color_output_0 = ByteRound(clamp((const_color[0].rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((rounded_primary_color.rgb), (vec3(1) - texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((texcolor1.aaa) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((texcolor1.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((vec3(1) - texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (const_color[5].rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (const_color[5].a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 71D78B63230DC889
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
vec3 color_output_0 = ByteRound(clamp((const_color[0].rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((rounded_primary_color.rgb), (vec3(1) - texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((texcolor1.aaa) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((texcolor1.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((vec3(1) - texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, C06783D7AB2FAFCD
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
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((rounded_primary_color.rgb), (vec3(1) - texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((vec3(1) - texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 58A05DF0A0BC326C
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
vec3 color_output_0 = ByteRound(clamp((const_color[0].rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((rounded_primary_color.rgb), (vec3(1) - texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((const_color[3].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((const_color[3].a) * (1.0 - texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(min((texcolor0.rgb) + (const_color[4].rgb), vec3(1)) * (texcolor0.aaa), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp((texcolor1.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_4 * 1.0, alpha_output_4 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = (texcolor1.rgb);
float alpha_output_5 = ByteRound(clamp(mix((last_tev_out.a), (const_color[5].r), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, E76F3FA73EE89BA1
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
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((rounded_primary_color.rgb), (vec3(1) - texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((vec3(1) - texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (const_color[5].rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (const_color[5].a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, EAFD1F87231B6DA3
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
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((rounded_primary_color.rgb), (vec3(1) - texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((vec3(1) - texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: C44726B63D8C83CF, 359A8BCBC9773A97
// reference: C1EDEC103710A3F8, EBFE1FDE6B2DBEDA
// reference: 7D07E6BE730DCD58, 272C0337C2B52122
// reference: D1D65AA9913D0473, 7F1BDCBADDAB793F
// reference: 7D07E6BE9D9A4DB8, 157DD7E26840B04F
// reference: 0E7508EF730DCD58, 71D78B63230DC889
// reference: F3283FF661F45C5D, C06783D7AB2FAFCD
// reference: 5FF983E183C49576, 58A05DF0A0BC326C
// reference: F3283FF68F63DCBD, E76F3FA73EE89BA1
// reference: 805AD1A761F45C5D, EAFD1F87231B6DA3
// program: 6089902024F82DD6, 0000000000000000, 359A8BCBC9773A97
// program: 6089902024F82DD6, 0000000000000000, EBFE1FDE6B2DBEDA
// program: 6089902024F82DD6, 0000000000000000, 272C0337C2B52122
// program: 6089902024F82DD6, 0000000000000000, 7F1BDCBADDAB793F
// program: 6089902024F82DD6, 0000000000000000, 157DD7E26840B04F
// program: 6089902024F82DD6, 0000000000000000, 71D78B63230DC889
// program: 6089902024F82DD6, 0000000000000000, C06783D7AB2FAFCD
// program: 6089902024F82DD6, 0000000000000000, 58A05DF0A0BC326C
// program: 6089902024F82DD6, 0000000000000000, E76F3FA73EE89BA1
// program: 6089902024F82DD6, 0000000000000000, EAFD1F87231B6DA3
// shader: 8B30, 377C1B7E115CD78F
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
vec3 color_output_3 = ByteRound(clamp((const_color[3].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((const_color[3].a) * (1.0 - texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(min((texcolor0.rgb) + (const_color[4].rgb), vec3(1)) * (texcolor0.aaa), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp((texcolor1.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_4 * 1.0, alpha_output_4 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = (texcolor1.rgb);
float alpha_output_5 = ByteRound(clamp(mix((last_tev_out.a), (const_color[5].r), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 3E9A23DB82DFFE47
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
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((vec3(1) - texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 660BC6A59CDE92B4
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
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((const_color[3].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((const_color[3].a) * (1.0 - texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((const_color[4].rgb), (texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((const_color[4].a), (texcolor0.a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, C6B6967664FF9A4D
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
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((const_color[3].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((const_color[3].a) * (1.0 - texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(min((texcolor0.rgb) + (const_color[4].rgb), vec3(1)) * (texcolor0.aaa), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp((texcolor1.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_4 * 1.0, alpha_output_4 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = (texcolor1.rgb);
float alpha_output_5 = ByteRound(clamp(mix((last_tev_out.a), (const_color[5].r), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, E15586E2468E1B8E
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
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((vec3(1) - texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (const_color[5].rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (const_color[5].a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, E26F0F2CF9D81580
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
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((vec3(1) - texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 170329921585A79E, 377C1B7E115CD78F
// reference: BBD29585118B193B, 3E9A23DB82DFFE47
// reference: 07389F2B5596779B, 660BC6A59CDE92B4
// reference: 17032992F3BBD010, C6B6967664FF9A4D
// reference: BBD29585FF1C99DB, E15586E2468E1B8E
// reference: C8A07BD4118B193B, E26F0F2CF9D81580
// program: 6089902024F82DD6, 0000000000000000, 377C1B7E115CD78F
// program: 6089902024F82DD6, 0000000000000000, 3E9A23DB82DFFE47
// program: 6089902024F82DD6, 0000000000000000, 660BC6A59CDE92B4
// program: 6089902024F82DD6, 0000000000000000, C6B6967664FF9A4D
// program: 6089902024F82DD6, 0000000000000000, E15586E2468E1B8E
// program: 6089902024F82DD6, 0000000000000000, E26F0F2CF9D81580
// shader: 8B30, D140A0E9D8A4CE16
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
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp((texcolor1.aaa) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((texcolor1.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(fma((const_color[3].aaa), (texcolor1.aaa), (texcolor0.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (texcolor0.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((combiner_buffer.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(mix((combiner_buffer.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: F7DBC15673B46EC4, D140A0E9D8A4CE16
// program: 6089902024F82DD6, 0000000000000000, D140A0E9D8A4CE16
// shader: 8B30, 0677812E96E25631
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
vec3 color_output_0 = ByteRound(clamp(mix((texcolor1.rgb), (texcolor0.rgb), (const_color[0].aaa)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp(mix((texcolor1.a), (texcolor0.a), (const_color[0].a)), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 4A21144F09E17454
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
vec3 color_output_0 = ByteRound(clamp(mix((texcolor1.rgb), (texcolor0.rgb), (const_color[0].aaa)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp(mix((texcolor1.a), (texcolor0.a), (const_color[0].a)), 0.0, 1.0));
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
// shader: 8B30, 99170FE974D9FF49
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
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
vec3 surface_normal = vec3(0, 0, 1);
vec3 surface_tangent = vec3(1, 0, 0);
vec4 normalized_normquat = normalize(normquat);
vec3 normal = QuaternionRotate(normalized_normquat, surface_normal);
vec3 tangent = QuaternionRotate(normalized_normquat, surface_tangent);
vec4 shadow = vec4(1);
light_vector = normalize(light_src[0].position);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
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
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 66FE1F82E6AB0384
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
vec3 color_output_2 = ByteRound(clamp((texcolor1.aaa) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((texcolor1.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(fma((vec3(1) - const_color[3].aaa), (texcolor1.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp(fma((1.0 - const_color[3].a), (texcolor1.a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((combiner_buffer.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(mix((combiner_buffer.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, EDB2FEC3ECEBFE04
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
vec3 color_output_2 = ByteRound(clamp((texcolor1.aaa) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((texcolor1.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((const_color[3].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((const_color[3].a) * (1.0 - texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((const_color[4].rgb), (texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((const_color[4].a), (texcolor0.a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 442A613B2039E2ED
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
vec3 color_output_2 = ByteRound(clamp((texcolor1.aaa) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((texcolor1.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((vec3(1) - texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, A592889076C26AB9
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
vec3 color_output_2 = ByteRound(clamp((texcolor1.aaa) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((texcolor1.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((vec3(1) - texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, BF62657E97424403
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
vec3 color_output_2 = ByteRound(clamp((texcolor1.aaa) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((texcolor1.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((const_color[3].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((const_color[3].a) * (1.0 - texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((const_color[4].rgb), (texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((const_color[4].a), (texcolor0.a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (const_color[5].rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (const_color[5].a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: CF00398664E3EC12, 0677812E96E25631
// reference: B7A22B4E391F9A77, 4A21144F09E17454
// reference: B33349BC61D279B8, 99170FE974D9FF49
// reference: 8CBD8CC5ABCDB127, 66FE1F82E6AB0384
// reference: 89174663A1519110, EDB2FEC3ECEBFE04
// reference: 35FD4CCDE54CFFB0, 442A613B2039E2ED
// reference: 468FA29CE54CFFB0, A592889076C26AB9
// reference: 891746634FC611F0, BF62657E97424403
// program: 8BDB60558C9403BE, 0000000000000000, 0677812E96E25631
// program: 8BDB60558C9403BE, 0000000000000000, 4A21144F09E17454
// program: 68FD505661AD5B02, 0000000000000000, 99170FE974D9FF49
// program: 6089902024F82DD6, 0000000000000000, 66FE1F82E6AB0384
// program: 6089902024F82DD6, 0000000000000000, EDB2FEC3ECEBFE04
// program: 6089902024F82DD6, 0000000000000000, 442A613B2039E2ED
// program: 6089902024F82DD6, 0000000000000000, A592889076C26AB9
// program: 6089902024F82DD6, 0000000000000000, BF62657E97424403
// shader: 8B30, 4C45BE16CE9E6E23
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
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((rounded_primary_color.rgb), (vec3(1) - texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((const_color[3].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((const_color[3].a) * (1.0 - texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((const_color[4].rgb), (texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((const_color[4].a), (texcolor0.a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (const_color[5].rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (const_color[5].a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 4FC23558CB7EB21D, 4C45BE16CE9E6E23
// program: 6089902024F82DD6, 0000000000000000, 4C45BE16CE9E6E23
// shader: 8B30, 8C362DE133AFFF2C
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
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.g), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((rounded_primary_color.rgb), (vec3(1) - texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, B99E24051BD63F42
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
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.g), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((rounded_primary_color.rgb), (vec3(1) - texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((const_color[3].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((const_color[3].a) * (1.0 - texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((const_color[4].rgb), (texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((const_color[4].a), (texcolor0.a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, C06783D762B0F9D2
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
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.g), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((rounded_primary_color.rgb), (vec3(1) - texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((vec3(1) - texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, EAFD1F87EA843BBC
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
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.g), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((rounded_primary_color.rgb), (vec3(1) - texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((vec3(1) - texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 4C45BE16435FFC80
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
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.g), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((rounded_primary_color.rgb), (vec3(1) - texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((const_color[3].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((const_color[3].a) * (1.0 - texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((const_color[4].rgb), (texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((const_color[4].a), (texcolor0.a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (const_color[5].rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (const_color[5].a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 9EC5B4F0337114AE, 8C362DE133AFFF2C
// reference: 8F22900D25E932FD, B99E24051BD63F42
// reference: 33C89AA361F45C5D, C06783D762B0F9D2
// reference: 40BA74F261F45C5D, EAFD1F87EA843BBC
// reference: 8F22900DCB7EB21D, 4C45BE16435FFC80
// program: 80D08F984545513A, 0000000000000000, 8C362DE133AFFF2C
// program: 6089902024F82DD6, 0000000000000000, B99E24051BD63F42
// program: 6089902024F82DD6, 0000000000000000, C06783D762B0F9D2
// program: 6089902024F82DD6, 0000000000000000, EAFD1F87EA843BBC
// program: 6089902024F82DD6, 0000000000000000, 4C45BE16435FFC80
// shader: 8B30, BED3A4D0733B62E4
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
if (gl_FragCoord.x < scissor_x1 || gl_FragCoord.y < scissor_y1 || gl_FragCoord.x >= scissor_x2 || gl_FragCoord.y >= scissor_y2) discard;
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((const_color[0].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((rounded_primary_color.rgb), (texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 2532FF498388F06D
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
if (gl_FragCoord.x < scissor_x1 || gl_FragCoord.y < scissor_y1 || gl_FragCoord.x >= scissor_x2 || gl_FragCoord.y >= scissor_y2) discard;
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (rounded_primary_color.rgb);
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 0AE138FB10A52C63
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
vec3 color_output_0 = ByteRound(clamp((const_color[0].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((rounded_primary_color.rgb), (texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((vec3(1) - texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 73189F2969C3EAF3
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
vec3 color_output_0 = ByteRound(clamp((const_color[0].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((rounded_primary_color.rgb), (texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((const_color[3].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((const_color[3].a) * (1.0 - texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((const_color[4].rgb), (texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((const_color[4].a), (texcolor0.a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 207BA4AB9891EE0D
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
vec3 color_output_0 = ByteRound(clamp((const_color[0].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((rounded_primary_color.rgb), (texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((vec3(1) - texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 7EF8503EFF4B6A4F
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
vec3 color_output_0 = ByteRound(clamp((const_color[0].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((rounded_primary_color.rgb), (texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((const_color[3].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((const_color[3].a) * (1.0 - texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((const_color[4].rgb), (texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((const_color[4].a), (texcolor0.a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (const_color[5].rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (const_color[5].a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 0E8785E90D37ECED
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
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((vec3(1) - texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, C2559900A4AF7315
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
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((const_color[3].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((const_color[3].a) * (1.0 - texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((const_color[4].rgb), (texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((const_color[4].a), (texcolor0.a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 587C0DBDEC8F0546
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
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((vec3(1) - texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 962E8F1AD09B0F12
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
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((const_color[3].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((const_color[3].a) * (1.0 - texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((const_color[4].rgb), (texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((const_color[4].a), (texcolor0.a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (const_color[5].rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (const_color[5].a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 35BF4050337114AE, BED3A4D0733B62E4
// reference: 5CA95A329C9A3A68, 2532FF498388F06D
// reference: 0C75D5F861F45C5D, 0AE138FB10A52C63
// reference: B09FDF5625E932FD, 73189F2969C3EAF3
// reference: 7F073BA961F45C5D, 207BA4AB9891EE0D
// reference: B09FDF56CB7EB21D, 7EF8503EFF4B6A4F
// reference: 6563CF9ACE1F729B, 0E8785E90D37ECED
// reference: D989C5348A021C3B, C2559900A4AF7315
// reference: 161121CBCE1F729B, 587C0DBDEC8F0546
// reference: D989C53464959CDB, 962E8F1AD09B0F12
// program: 80D08F984545513A, 0000000000000000, BED3A4D0733B62E4
// program: 80D08F984545513A, 0000000000000000, 2532FF498388F06D
// program: 6089902024F82DD6, 0000000000000000, 0AE138FB10A52C63
// program: 6089902024F82DD6, 0000000000000000, 73189F2969C3EAF3
// program: 6089902024F82DD6, 0000000000000000, 207BA4AB9891EE0D
// program: 6089902024F82DD6, 0000000000000000, 7EF8503EFF4B6A4F
// program: 6089902024F82DD6, 0000000000000000, 0E8785E90D37ECED
// program: 6089902024F82DD6, 0000000000000000, C2559900A4AF7315
// program: 6089902024F82DD6, 0000000000000000, 587C0DBDEC8F0546
// program: 6089902024F82DD6, 0000000000000000, 962E8F1AD09B0F12
// shader: 8B30, 5AA0AF1F2BC3C32A
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
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
vec3 surface_normal = vec3(0, 0, 1);
vec3 surface_tangent = vec3(1, 0, 0);
vec4 normalized_normquat = normalize(normquat);
vec3 normal = QuaternionRotate(normalized_normquat, surface_normal);
vec3 tangent = QuaternionRotate(normalized_normquat, surface_tangent);
vec4 shadow = vec4(1);
light_vector = normalize(light_src[0].position);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(half_vector)));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTSigned(lut_offset, dot(normal, normalize(view.xyz)));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (const_color[0].aaa), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) + (const_color[1].rgb) - vec3(0.5), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp(fma((vec3(1) - secondary_fragment_color.rgb), (last_tev_out.rgb), (secondary_fragment_color.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp(min((rounded_primary_color.rgb) + (const_color[3].rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((last_tev_out.rgb), (last_tev_out.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4 * 2.0, alpha_output_4 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 7D4FF714E02595A1, 5AA0AF1F2BC3C32A
// program: 68FD505661AD5B02, 0000000000000000, 5AA0AF1F2BC3C32A
// shader: 8B30, 54CFC7FE8388F06D
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
if (gl_FragCoord.x < scissor_x1 || gl_FragCoord.y < scissor_y1 || gl_FragCoord.x >= scissor_x2 || gl_FragCoord.y >= scissor_y2) discard;
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (rounded_primary_color.rgb);
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.g), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 0E8785E900DD3290
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
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.g), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((vec3(1) - texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, C2559900A945AD68
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
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.g), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((const_color[3].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((const_color[3].a) * (1.0 - texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((const_color[4].rgb), (texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((const_color[4].a), (texcolor0.a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 587C0DBDE165DB3B
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
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.g), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((vec3(1) - texcolor0.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((texcolor0.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((1.0 - texcolor0.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 962E8F1AFE22E84D
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
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.g), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((const_color[3].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((const_color[3].a) * (1.0 - texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((const_color[4].rgb), (texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(fma((const_color[4].a), (texcolor0.a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (const_color[5].rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (const_color[5].a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 9C49FF679C9A3A68, 54CFC7FE8388F06D
// reference: A5836ACFCE1F729B, 0E8785E900DD3290
// reference: 196960618A021C3B, C2559900A945AD68
// reference: D6F1849ECE1F729B, 587C0DBDE165DB3B
// reference: 1969606164959CDB, 962E8F1AFE22E84D
// program: 80D08F984545513A, 0000000000000000, 54CFC7FE8388F06D
// program: 6089902024F82DD6, 0000000000000000, 0E8785E900DD3290
// program: 6089902024F82DD6, 0000000000000000, C2559900A945AD68
// program: 6089902024F82DD6, 0000000000000000, 587C0DBDE165DB3B
// program: 6089902024F82DD6, 0000000000000000, 962E8F1AFE22E84D
// shader: 8B30, 8C362DE1B27E18F5
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
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((rounded_primary_color.rgb), (vec3(1) - texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 5E2511A5337114AE, 8C362DE1B27E18F5
// program: 80D08F984545513A, 0000000000000000, 8C362DE1B27E18F5
// shader: 8B30, 531DA31DD4BEE8F0
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
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
vec3 surface_normal = vec3(0, 0, 1);
vec3 surface_tangent = vec3(1, 0, 0);
vec4 normalized_normquat = normalize(normquat);
vec3 normal = QuaternionRotate(normalized_normquat, surface_normal);
vec3 tangent = QuaternionRotate(normalized_normquat, surface_tangent);
vec4 shadow = vec4(1);
light_vector = normalize(light_src[0].position);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(view.xyz)));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTSigned(lut_offset, dot(normal, normalize(view.xyz)));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(fma((vec3(1) - secondary_fragment_color.aaa), (const_color[0].rgb), (primary_fragment_color.rgb)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((texcolor0.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) + (const_color[2].rgb) - vec3(0.5), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_3 = ByteRound(clamp(fma((texcolor1.rgb), (secondary_fragment_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_4 = ByteRound(clamp(min((rounded_primary_color.rgb) + (const_color[4].rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp(fma((last_tev_out.rgb), (combiner_buffer.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_5 = (last_tev_out.a);
last_tev_out = vec4(color_output_5 * 2.0, alpha_output_5 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 33E8E51FCA429DDA, 531DA31DD4BEE8F0
// program: 8BDB60558C9403BE, 0000000000000000, 531DA31DD4BEE8F0
// shader: 8B30, 427820C36C244891
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
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
vec3 surface_normal = vec3(0, 0, 1);
vec3 surface_tangent = vec3(1, 0, 0);
vec4 normalized_normquat = normalize(normquat);
vec3 normal = QuaternionRotate(normalized_normquat, surface_normal);
vec3 tangent = QuaternionRotate(normalized_normquat, surface_tangent);
vec4 shadow = vec4(1);
light_vector = normalize(light_src[0].position);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(half_vector)));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTSigned(lut_offset, dot(normal, normalize(view.xyz)));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(fma((vec3(1) - secondary_fragment_color.aaa), (const_color[0].rgb), (primary_fragment_color.rgb)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((texcolor0.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) + (const_color[2].rgb) - vec3(0.5), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(fma((vec3(1) - combiner_buffer.rgb), (secondary_fragment_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(min((rounded_primary_color.rgb) + (const_color[4].rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp(fma((last_tev_out.rgb), (last_tev_out.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_5 = (last_tev_out.a);
last_tev_out = vec4(color_output_5 * 2.0, alpha_output_5 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 4626178553B4F218, 427820C36C244891
// program: 68FD505661AD5B02, 0000000000000000, 427820C36C244891
// shader: 8B30, 6126C978B2081524
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
if (gl_FragCoord.x < scissor_x1 || gl_FragCoord.y < scissor_y1 || gl_FragCoord.x >= scissor_x2 || gl_FragCoord.y >= scissor_y2) discard;
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(fma((const_color[0].rgb), (texcolor0.rgb), (rounded_primary_color.rgb)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B31, 1EDEF06A237BA2AE

#define mul_s(x, y) mix(x * y, vec4(0), isnan(x * y))
#define fma_s(x, y, z) (mul_s(x, y) + z)
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
vec4 vtx_color = vec4(vs_out_reg2.x,vs_out_reg2.y,vs_out_reg2.z,vs_out_reg2.w);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg1.x,vs_out_reg1.y,1,1);
texcoord12 = vec4(1,1,1,1);
view = vec4(1,1,1,1);
}
void main() {
vs_out_reg0 = vec4(0, 0, 0, 1);
vs_out_reg1 = vec4(0, 0, 0, 1);
vs_out_reg2 = vec4(0, 0, 0, 1);
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
vec4 tmp_reg4;
vec4 tmp_reg5;
vec4 tmp_reg10;
vec4 tmp_reg11;
vec4 tmp_reg13;
vec4 tmp_reg14;
bool ExecVS() {
tmp_reg0 = vec4(0, 0, 0, 1);
tmp_reg1 = vec4(0, 0, 0, 1);
tmp_reg2 = vec4(0, 0, 0, 1);
tmp_reg3 = vec4(0, 0, 0, 1);
tmp_reg4 = vec4(0, 0, 0, 1);
tmp_reg5 = vec4(0, 0, 0, 1);
tmp_reg10 = vec4(0, 0, 0, 1);
tmp_reg11 = vec4(0, 0, 0, 1);
tmp_reg13 = vec4(0, 0, 0, 1);
tmp_reg14 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn0() {
tmp_reg0.w = (vs_pica.f[85].zzzz).w;
tmp_reg1.w = (vs_pica.f[85].zzzz).w;
tmp_reg10 = vs_pica.f[85].xxxx;
bool_regs = equal(vs_pica.f[13].ww, tmp_reg10.xy);
if (bool_regs.x) {
Vfn1();
} else {
tmp_reg0.xyz = (vs_in_reg0).xyz;
}
tmp_reg2.x = (vs_pica.f[81].xxxx).x;
tmp_reg3.x = (-vs_pica.f[80].xxxx + tmp_reg2.xxxx).x;
tmp_reg4.x = rcp_s(tmp_reg2.x);
tmp_reg5.x = (mul_s(tmp_reg3.xxxx, tmp_reg4.xxxx)).x;
tmp_reg0.x = (fma_s(tmp_reg5.xxxx, vs_pica.f[80].yyyy, tmp_reg0.xxxx)).x;
tmp_reg1.x = dot_s(vs_pica.f[90], tmp_reg0);
tmp_reg1.y = dot_s(vs_pica.f[91], tmp_reg0);
tmp_reg1.z = dot_s(vs_pica.f[92], tmp_reg0);
vs_out_reg0.x = dot_s(vs_pica.f[86], tmp_reg1);
vs_out_reg0.y = dot_s(vs_pica.f[87], tmp_reg1);
vs_out_reg0.z = dot_s(vs_pica.f[88], tmp_reg1);
vs_out_reg0.w = dot_s(vs_pica.f[89], tmp_reg1);
tmp_reg10.xy = (mul_s(vs_pica.f[12].xyyy, vs_in_reg1.xyyy)).xy;
tmp_reg11.xy = (vs_pica.f[12].zwww + tmp_reg10.xyyy).xy;
vs_out_reg1.x = (tmp_reg11.xxxx).x;
vs_out_reg1.y = (vs_pica.f[85].zzzz + -tmp_reg11.yyyy).y;
vs_out_reg1.zw = (vs_pica.f[85].zzzz).zw;
vs_out_reg2.xyz = (vs_pica.f[13].xyzz).xyz;
vs_out_reg2.w = (vs_in_reg1.zzzz).w;
return true;
}
bool Vfn1() {
tmp_reg13.xyz = (mul_s(-vs_pica.f[3].yzxx, vs_in_reg2.zxyy)).xyz;
tmp_reg13.xyz = (fma_s(vs_in_reg2.yzxx, vs_pica.f[3].zxyy, tmp_reg13)).xyz;
tmp_reg11.x = dot_3(tmp_reg13.xyz, tmp_reg13.xyz);
bool_regs = greaterThanEqual(vs_pica.f[84].yy, tmp_reg11.xx);
if (bool_regs.x) {
tmp_reg11.x = (vs_pica.f[85].xxxx).x;
} else {
tmp_reg11.x = rsq_s(tmp_reg11.x);
}
tmp_reg14.xyz = (mul_s(tmp_reg13.xyzz, tmp_reg11.xxxx)).xyz;
tmp_reg10 = vs_in_reg2.wwww;
tmp_reg0.xyz = (fma_s(tmp_reg14.xyzz, tmp_reg10.xyzz, vs_in_reg0.xyzz)).xyz;
return false;
}
// reference: 1F96958FFCF3C46D, 6126C978B2081524
// reference: F6DAD3CB45BE0584, 1EDEF06A237BA2AE
// program: 80D08F984545513A, 0000000000000000, 6126C978B2081524
// program: 1EDEF06A237BA2AE, 0000000000000000, 7C5A33F69907445E
// shader: 8B30, DEEEDA864B46C6D2
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
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 9D18470FF08670E4, DEEEDA864B46C6D2
// program: 68FD505661AD5B02, 0000000000000000, DEEEDA864B46C6D2
// shader: 8B30, 4DF107C0E602965D
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
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp(fma((const_color[3].aaa), (texcolor1.aaa), (texcolor0.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (texcolor0.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((combiner_buffer.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(mix((combiner_buffer.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, A8BB91F91AF8E12C
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
vec3 color_output_0 = ByteRound(clamp((const_color[0].rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((rounded_primary_color.rgb), (vec3(1) - texcolor0.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(fma((const_color[3].aaa), (texcolor1.aaa), (texcolor0.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (texcolor0.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((combiner_buffer.rgb), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(mix((combiner_buffer.a), (const_color[4].a), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 79F4181E3D430820, 4DF107C0E602965D
// reference: 310EB26D4D3C4D46, A8BB91F91AF8E12C
// program: 6089902024F82DD6, 0000000000000000, 4DF107C0E602965D
// program: 6089902024F82DD6, 0000000000000000, A8BB91F91AF8E12C
// shader: 8B31, DA979597C9FF66DD

#define mul_s(x, y) mix(x * y, vec4(0), isnan(x * y))
#define fma_s(x, y, z) (mul_s(x, y) + z)
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
vec4 vtx_color = vec4(vs_out_reg2.x,vs_out_reg2.y,vs_out_reg2.z,vs_out_reg2.w);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg1.x,vs_out_reg1.y,1,1);
texcoord12 = vec4(1,1,1,1);
view = vec4(1,1,1,1);
}
void main() {
vs_out_reg0 = vec4(0, 0, 0, 1);
vs_out_reg1 = vec4(0, 0, 0, 1);
vs_out_reg2 = vec4(0, 0, 0, 1);
ExecVS();
EmitVtx();
}
bvec2 bool_regs = bvec2(false);
ivec3 addr_regs = ivec3(0);
bool Vfn0();
vec4 tmp_reg0;
vec4 tmp_reg1;
vec4 tmp_reg3;
vec4 tmp_reg7;
vec4 tmp_reg8;
vec4 tmp_reg10;
vec4 tmp_reg11;
vec4 tmp_reg13;
vec4 tmp_reg14;
vec4 tmp_reg15;
bool ExecVS() {
tmp_reg0 = vec4(0, 0, 0, 1);
tmp_reg1 = vec4(0, 0, 0, 1);
tmp_reg3 = vec4(0, 0, 0, 1);
tmp_reg7 = vec4(0, 0, 0, 1);
tmp_reg8 = vec4(0, 0, 0, 1);
tmp_reg10 = vec4(0, 0, 0, 1);
tmp_reg11 = vec4(0, 0, 0, 1);
tmp_reg13 = vec4(0, 0, 0, 1);
tmp_reg14 = vec4(0, 0, 0, 1);
tmp_reg15 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn0() {
tmp_reg14.xyz = (vs_in_reg0.xyzz).xyz;
tmp_reg10.x = (vs_pica.f[30].xxxx + -vs_in_reg0.wwww).x;
tmp_reg0.xyz = (-vs_pica.f[28].xyzz + tmp_reg14.xyzz).xyz;
tmp_reg3.x = dot_s(tmp_reg0.xyzz, tmp_reg0.xyzz);
tmp_reg3.x = rsq_s(tmp_reg3.x);
tmp_reg3.xyz = (mul_s(tmp_reg0.xyzz, tmp_reg3.xxxx)).xyz;
tmp_reg1.x = dot_s(vs_in_reg2.xyzz, vs_in_reg2.xyzz);
tmp_reg1.x = rsq_s(tmp_reg1.x);
tmp_reg1.xyz = (mul_s(vs_in_reg2.xyzz, tmp_reg1.xxxx)).xyz;
tmp_reg0.xyz = (mul_s(tmp_reg1.yzxx, tmp_reg3.zxyy)).xyz;
tmp_reg0.xyz = (fma_s(-tmp_reg3.yzxx, tmp_reg1.zxyy, tmp_reg0)).xyz;
tmp_reg1.x = dot_s(tmp_reg0.xyzz, tmp_reg0.xyzz);
tmp_reg1.x = rsq_s(tmp_reg1.x);
tmp_reg1.xyz = (mul_s(tmp_reg0.xyzz, tmp_reg1.xxxx)).xyz;
tmp_reg0.xyz = (mul_s(tmp_reg1.xyzz, vs_in_reg2.wwww)).xyz;
tmp_reg0.xyz = (mul_s(vs_pica.f[28].wwww, tmp_reg0.xyzz)).xyz;
tmp_reg14.xyz = (tmp_reg14.xyzz + tmp_reg0.xyzz).xyz;
tmp_reg7.x = (vs_pica.f[81].xxxx).x;
tmp_reg8.x = rcp_s(tmp_reg7.x);
tmp_reg8.y = (-vs_pica.f[80].xxxx + tmp_reg7.xxxx).y;
tmp_reg8.z = (mul_s(tmp_reg8.xxxx, tmp_reg8.yyyy)).z;
tmp_reg14.x = (fma_s(tmp_reg8.zzzz, vs_pica.f[80].yyyy, tmp_reg14.xxxx)).x;
tmp_reg14.w = (vs_pica.f[70].zzzz).w;
tmp_reg15.w = (vs_pica.f[70].zzzz).w;
tmp_reg15.xyz = (tmp_reg14).xyz;
tmp_reg14.x = dot_s(vs_pica.f[90], tmp_reg15);
tmp_reg14.y = dot_s(vs_pica.f[91], tmp_reg15);
tmp_reg14.z = dot_s(vs_pica.f[92], tmp_reg15);
tmp_reg11.y = (vs_in_reg1.yyyy).y;
tmp_reg11.x = (mul_s(vs_pica.f[30].yyyy, tmp_reg10.xxxx)).x;
tmp_reg13 = vs_pica.f[29];
tmp_reg0.x = (-vs_pica.f[31].xxxx + tmp_reg10.xxxx).x;
tmp_reg0.x = (max_s(vs_pica.f[70].xxxx, tmp_reg0.xxxx)).x;
tmp_reg0.x = (mul_s(vs_pica.f[31].yyyy, tmp_reg0.xxxx)).x;
tmp_reg0.x = (vs_pica.f[70].zzzz + -tmp_reg0.xxxx).x;
tmp_reg0.x = (max_s(vs_pica.f[70].xxxx, tmp_reg0.xxxx)).x;
tmp_reg13.w = (mul_s(tmp_reg13.wwww, tmp_reg0.xxxx)).w;
vs_out_reg0.x = dot_s(vs_pica.f[86], tmp_reg14);
vs_out_reg0.y = dot_s(vs_pica.f[87], tmp_reg14);
vs_out_reg0.z = dot_s(vs_pica.f[88], tmp_reg14);
vs_out_reg0.w = dot_s(vs_pica.f[89], tmp_reg14);
vs_out_reg1 = tmp_reg11.xyyy;
vs_out_reg2 = tmp_reg13;
return true;
}
// shader: 8B30, FE107D06386462A4
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
if (gl_FragCoord.x < scissor_x1 || gl_FragCoord.y < scissor_y1 || gl_FragCoord.x >= scissor_x2 || gl_FragCoord.y >= scissor_y2) discard;
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
// reference: 547C5A149D050777, DA979597C9FF66DD
// reference: 98DD90BC2A89FBBD, FE107D06386462A4
// program: DA979597C9FF66DD, 0000000000000000, FE107D06386462A4
// shader: 8B30, 0B1EC6E27740FBCF
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
if (gl_FragCoord.x < scissor_x1 || gl_FragCoord.y < scissor_y1 || gl_FragCoord.x >= scissor_x2 || gl_FragCoord.y >= scissor_y2) discard;
float z_over_w = 2.0 * gl_FragCoord.z - 1.0;
float depth = z_over_w * depth_scale + depth_offset;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(fma((vec3(1) - secondary_fragment_color.aaa), (const_color[0].rgb), (primary_fragment_color.rgb)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((texcolor0.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) + (const_color[2].rgb) - vec3(0.5), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(fma((vec3(1) - combiner_buffer.rgb), (secondary_fragment_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(min((rounded_primary_color.rgb) + (const_color[4].rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp(fma((last_tev_out.rgb), (last_tev_out.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_5 = (last_tev_out.a);
last_tev_out = vec4(color_output_5 * 2.0, alpha_output_5 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: ABC7001474B5FFD1, 0B1EC6E27740FBCF
// program: 68FD505661AD5B02, 0000000000000000, 0B1EC6E27740FBCF
// shader: 8B30, DF9A78AE3CD49D57
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
vec3 color_output_0 = ByteRound(clamp(mix((texcolor1.rgb), (texcolor0.rgb), (const_color[0].aaa)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp(mix((texcolor1.a), (texcolor0.a), (const_color[0].a)), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (const_color[2].rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2 * 2.0, alpha_output_2 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, E8FA19DB9886667D
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
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
vec3 surface_normal = vec3(0, 0, 1);
vec3 surface_tangent = vec3(1, 0, 0);
vec4 normalized_normquat = normalize(normquat);
vec3 normal = QuaternionRotate(normalized_normquat, surface_normal);
vec3 tangent = QuaternionRotate(normalized_normquat, surface_tangent);
vec4 shadow = vec4(1);
light_vector = normalize(light_src[0].position);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
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
vec3 color_output_0 = ByteRound(clamp(mix((texcolor1.rgb), (texcolor0.rgb), (const_color[0].aaa)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp(mix((texcolor1.a), (texcolor0.a), (const_color[0].a)), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
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
// shader: 8B30, 1FAFB12387869664
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
float alpha_output_0 = ByteRound(clamp((texcolor0.a) * (rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (const_color[1].rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) * (const_color[1].a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: D695595DC7EDC73C, DF9A78AE3CD49D57
// reference: D695595D7F94B1F0, E8FA19DB9886667D
// reference: BB14838B69BBA697, 1FAFB12387869664
// program: 8BDB60558C9403BE, 0000000000000000, DF9A78AE3CD49D57
// program: 8BDB60558C9403BE, 0000000000000000, E8FA19DB9886667D
// program: 8BDB60558C9403BE, 0000000000000000, 1FAFB12387869664
// shader: 8B30, 8B585ED16BC784C4
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
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
vec3 surface_normal = vec3(0, 0, 1);
vec3 surface_tangent = vec3(1, 0, 0);
vec4 normalized_normquat = normalize(normquat);
vec3 normal = QuaternionRotate(normalized_normquat, surface_normal);
vec3 tangent = QuaternionRotate(normalized_normquat, surface_tangent);
vec4 shadow = vec4(1);
light_vector = normalize(light_src[0].position);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(view.xyz)));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTSigned(lut_offset, dot(normal, normalize(view.xyz)));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(fma((vec3(1) - secondary_fragment_color.aaa), (const_color[0].rgb), (primary_fragment_color.rgb)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((texcolor0.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) + (const_color[2].rgb) - vec3(0.5), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(fma((vec3(1) - combiner_buffer.rgb), (secondary_fragment_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(min((rounded_primary_color.rgb) + (const_color[4].rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp(fma((last_tev_out.rgb), (last_tev_out.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_5 = (last_tev_out.a);
last_tev_out = vec4(color_output_5 * 2.0, alpha_output_5 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: D64BEC2853B4F218, 8B585ED16BC784C4
// program: 68FD505661AD5B02, 0000000000000000, 8B585ED16BC784C4
// shader: 8B30, 3E82EEDB7EAEBFE8
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
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
vec3 surface_normal = vec3(0, 0, 1);
vec3 surface_tangent = vec3(1, 0, 0);
vec4 normalized_normquat = normalize(normquat);
vec3 normal = QuaternionRotate(normalized_normquat, surface_normal);
vec3 tangent = QuaternionRotate(normalized_normquat, surface_tangent);
vec4 shadow = vec4(1);
light_vector = normalize(light_src[0].position);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(half_vector)));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTSigned(lut_offset, dot(normal, normalize(view.xyz)));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (const_color[0].aaa), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) + (const_color[1].rgb) - vec3(0.5), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp(fma((vec3(1) - secondary_fragment_color.rgb), (last_tev_out.rgb), (secondary_fragment_color.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((last_tev_out.a) * (const_color[2].a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp(min((rounded_primary_color.rgb) + (const_color[3].rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((last_tev_out.rgb), (last_tev_out.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4 * 2.0, alpha_output_4 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 923A0E8899012684, 3E82EEDB7EAEBFE8
// program: 68FD505661AD5B02, 0000000000000000, 3E82EEDB7EAEBFE8
