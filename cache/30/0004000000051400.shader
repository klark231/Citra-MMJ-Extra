// shader: 8B31, A291F69A4C715DD1

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
vec4 tmp_reg0;
vec4 tmp_reg1;
vec4 tmp_reg15;
bool ExecVS() {
tmp_reg0 = vec4(0, 0, 0, 1);
tmp_reg1 = vec4(0, 0, 0, 1);
tmp_reg15 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn0() {
tmp_reg0.xy = (vs_in_reg0.xyzz).xy;
tmp_reg0.zw = (vs_pica.f[95].zwww).zw;
tmp_reg15.x = dot_s(vs_pica.f[4], tmp_reg0);
tmp_reg15.y = dot_s(vs_pica.f[5], tmp_reg0);
tmp_reg15.z = dot_s(vs_pica.f[6], tmp_reg0);
tmp_reg15.w = dot_s(vs_pica.f[7], tmp_reg0);
vs_out_reg0.x = dot_s(vs_pica.f[0], tmp_reg15);
vs_out_reg0.y = dot_s(vs_pica.f[1], tmp_reg15);
vs_out_reg0.z = dot_s(vs_pica.f[2], tmp_reg15);
vs_out_reg0.w = dot_s(vs_pica.f[3], tmp_reg15);
vs_out_reg1 = mul_s(vs_pica.f[95].xxxx, vs_in_reg1.wzyx);
tmp_reg1.xy = (vs_in_reg2.xyyy).xy;
tmp_reg1.zw = (vs_pica.f[95].zwww).zw;
vs_out_reg2.x = dot_s(vs_pica.f[8], tmp_reg1);
vs_out_reg2.y = dot_s(vs_pica.f[9], tmp_reg1);
vs_out_reg2.z = dot_s(vs_pica.f[10], tmp_reg1);
vs_out_reg2.w = dot_s(vs_pica.f[11], tmp_reg1);
return true;
}
// shader: 8B30, 0F7DABD15E77894D
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
float alpha_output_0 = ByteRound(clamp((texcolor0.a) * (rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 1AE7DCF402CDBEF1, A291F69A4C715DD1
// reference: 43A91D1003B52CEE, 0F7DABD15E77894D
// program: A291F69A4C715DD1, 0000000000000000, 0F7DABD15E77894D
// shader: 8B31, FF1D8B78C0FF848B

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
bool Vfn21();
bool Vfn4();
bool Vfn9();
bool Vfn1();
bool Vfn2();
bool Vfn3();
bool Vfn5();
bool Vfn7();
bool Vfn8();
bool Vfn10();
bool Vfn20();
bool Vfn22();
bool Vfn23();
bool Vfn26();
bool Vfn27();
bool Vfn28();
bool Vfn6();
bool Vfn11();
bool Vfn12();
bool Vfn14();
bool Vfn17();
bool Vfn30();
bool Vfn31();
bool Vfn33();
bool Vfn34();
bool Vfn36();
bool Vfn38();
bool Vfn42();
bool Vfn45();
bool Vfn46();
bool Vfn52();
bool Vfn54();
bool Vfn55();
bool Vfn57();
bool Vfn47();
bool Vfn49();
bool Vfn58();
bool Vfn59();
bool Vfn60();
bool Vfn61();
bool Vfn62();
bool Vfn64();
bool Vfn66();
bool Vfn67();
bool Vfn68();
bool Vfn69();
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
Vfn30();
Vfn45();
Vfn59();
Vfn66();
return true;
}
bool Vfn21() {
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
bool Vfn9() {
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
Vfn23();
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
Vfn7();
}
vs_out_reg2 = -tmp_reg15;
vs_out_reg0.x = dot_s(vs_pica.f[86], tmp_reg15);
vs_out_reg0.y = dot_s(vs_pica.f[87], tmp_reg15);
vs_out_reg0.z = dot_s(vs_pica.f[88], tmp_reg15);
vs_out_reg0.w = dot_s(vs_pica.f[89], tmp_reg15);
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
tmp_reg15.x = dot_s(vs_pica.f[90], tmp_reg10);
tmp_reg15.y = dot_s(vs_pica.f[91], tmp_reg10);
tmp_reg15.z = dot_s(vs_pica.f[92], tmp_reg10);
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
tmp_reg14.x = dot_3(vs_pica.f[3].xyz, tmp_reg12.xyz);
tmp_reg14.y = dot_3(vs_pica.f[4].xyz, tmp_reg12.xyz);
tmp_reg14.z = dot_3(vs_pica.f[5].xyz, tmp_reg12.xyz);
Vfn6();
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
bool Vfn7() {
if (all(bool_regs)) {
Vfn8();
} else {
Vfn20();
}
return false;
}
bool Vfn8() {
bool_regs = notEqual(vs_pica.f[93].xx, vs_in_reg8.zw);
tmp_reg1.xy = (tmp_reg2.xxxx).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.xxxx)).w;
Vfn9();
tmp_reg1.xy = (tmp_reg2.yyyy).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.yyyy)).w;
Vfn9();
tmp_reg1.xy = (tmp_reg2.zzzz).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.zzzz)).w;
if (bool_regs.x) {
Vfn9();
}
if (vs_pica.b[8]) {
Vfn10();
}
tmp_reg7.w = (vs_pica.f[93].yyyy).w;
tmp_reg10.x = dot_s(vs_pica.f[0], tmp_reg7);
tmp_reg10.y = dot_s(vs_pica.f[1], tmp_reg7);
tmp_reg10.z = dot_s(vs_pica.f[2], tmp_reg7);
tmp_reg10.w = (vs_pica.f[93].yyyy).w;
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
Vfn11();
return false;
}
bool Vfn10() {
tmp_reg1.xy = (tmp_reg2.wwww).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.wwww)).w;
if (bool_regs.y) {
Vfn9();
}
return false;
}
bool Vfn20() {
bool_regs = notEqual(vs_pica.f[93].xx, vs_in_reg8.zw);
tmp_reg1.xy = (tmp_reg2.xxxx).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.xxxx)).w;
Vfn21();
tmp_reg1.xy = (tmp_reg2.yyyy).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.yyyy)).w;
Vfn21();
tmp_reg1.xy = (tmp_reg2.zzzz).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.zzzz)).w;
if (bool_regs.x) {
Vfn21();
}
if (vs_pica.b[8]) {
Vfn22();
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
bool Vfn22() {
tmp_reg1.xy = (tmp_reg2.wwww).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.wwww)).w;
if (bool_regs.y) {
Vfn21();
}
return false;
}
bool Vfn23() {
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
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
Vfn26();
} else {
Vfn27();
}
vs_out_reg2 = -tmp_reg15;
vs_out_reg0.x = dot_s(vs_pica.f[86], tmp_reg15);
vs_out_reg0.y = dot_s(vs_pica.f[87], tmp_reg15);
vs_out_reg0.z = dot_s(vs_pica.f[88], tmp_reg15);
vs_out_reg0.w = dot_s(vs_pica.f[89], tmp_reg15);
return false;
}
bool Vfn26() {
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
Vfn6();
return false;
}
bool Vfn27() {
if (all(bool_regs)) {
Vfn28();
} else {
tmp_reg15.x = dot_s(vs_pica.f[90], tmp_reg10);
tmp_reg15.y = dot_s(vs_pica.f[91], tmp_reg10);
tmp_reg15.z = dot_s(vs_pica.f[92], tmp_reg10);
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
vs_out_reg1 = vs_pica.f[93].xxxx;
}
return false;
}
bool Vfn28() {
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
Vfn11();
return false;
}
bool Vfn6() {
uint jmp_to = 202u;
while (true) {
switch (jmp_to) {
case 202u:
tmp_reg6.x = dot_3(tmp_reg14.xyz, tmp_reg14.xyz);
tmp_reg7.x = dot_3(tmp_reg12.xyz, tmp_reg12.xyz);
tmp_reg6.x = rsq_s(tmp_reg6.x);
tmp_reg7.x = rsq_s(tmp_reg7.x);
tmp_reg14.xyz = (mul_s(tmp_reg14.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg12.xyz = (mul_s(tmp_reg12.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg0 = vs_pica.f[93].yxxx;
if (!vs_pica.b[15]) {
jmp_to = 218u; break;
}
tmp_reg4 = vs_pica.f[93].yyyy + tmp_reg14.zzzz;
tmp_reg4 = mul_s(vs_pica.f[94].zzzz, tmp_reg4);
bool_regs = greaterThanEqual(vs_pica.f[93].xx, tmp_reg4.xx);
tmp_reg4 = vec4(rsq_s(tmp_reg4.x));
tmp_reg5 = mul_s(vs_pica.f[94].zzzz, tmp_reg14);
if (bool_regs.x) {
jmp_to = 218u; break;
}
tmp_reg0.z = rcp_s(tmp_reg4.x);
tmp_reg0.xy = (mul_s(tmp_reg5, tmp_reg4)).xy;
case 218u:
vs_out_reg1 = tmp_reg0;
default: return false;
}
}
return false;
}
bool Vfn11() {
uint jmp_to = 219u;
while (true) {
switch (jmp_to) {
case 219u:
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
jmp_to = 294u; break;
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
jmp_to = 256u; break;
}
tmp_reg7.xz = (tmp_reg13.wwyy + -tmp_reg14.yyww).xz;
tmp_reg7.y = (tmp_reg14.xxxx + -tmp_reg13.zzzz).y;
tmp_reg7.w = (tmp_reg6).w;
tmp_reg6 = vec4(dot_s(tmp_reg7, tmp_reg7));
tmp_reg6 = vec4(rsq_s(tmp_reg6.x));
tmp_reg0 = mul_s(tmp_reg7, tmp_reg6);
if (vs_pica.b[0]) {
jmp_to = 294u; break;
}
case 256u:
bool_regs = greaterThan(tmp_reg5.zy, tmp_reg5.yx);
if (bool_regs.x) {
Vfn12();
} else {
Vfn17();
}
tmp_reg6 = vec4(dot_s(tmp_reg8, tmp_reg8));
tmp_reg6 = vec4(rsq_s(tmp_reg6.x));
tmp_reg0 = mul_s(tmp_reg8, tmp_reg6);
case 294u:
vs_out_reg1 = tmp_reg0;
default: return false;
}
}
return false;
}
bool Vfn12() {
if (bool_regs.y) {
tmp_reg8 = mul_s(tmp_reg13.yyzw, tmp_reg6.xxxy);
tmp_reg8.x = (vs_pica.f[93].yyyy + -tmp_reg5.yyyy).x;
tmp_reg9 = tmp_reg5.zzzz + -tmp_reg5.xxxx;
tmp_reg8.yzw = (tmp_reg8 + tmp_reg14.wwxy).yzw;
tmp_reg8.x = (tmp_reg9 + tmp_reg8).x;
} else {
Vfn14();
}
tmp_reg8.w = (-tmp_reg8).w;
return false;
}
bool Vfn14() {
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
bool Vfn17() {
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
bool Vfn30() {
tmp_reg8.xy = (vs_pica.f[93].xxxx).xy;
tmp_reg0.y = (vs_pica.f[7].wwww).y;
bool_regs = notEqual(vs_pica.f[93].xx, tmp_reg0.xy);
tmp_reg9.xyz = (vs_pica.f[93].xxxx).xyz;
tmp_reg9.w = (vs_pica.f[21].wwww).w;
if (bool_regs.y) {
Vfn31();
}
if (vs_pica.b[12]) {
Vfn33();
}
if (vs_pica.b[5]) {
Vfn42();
}
bool_regs = equal(vs_pica.f[93].xx, tmp_reg8.xy);
if (all(bool_regs)) {
tmp_reg9 = vs_pica.f[21];
}
vs_out_reg3 = max_s(vs_pica.f[93].xxxx, tmp_reg9);
return false;
}
bool Vfn31() {
tmp_reg0 = mul_s(vs_pica.f[7].wwww, vs_in_reg3);
if (vs_pica.b[7]) {
tmp_reg9.w = (mul_s(tmp_reg9.wwww, tmp_reg0.wwww)).w;
}
tmp_reg9.xyz = (mul_s(vs_pica.f[20].wwww, tmp_reg0.xyzz)).xyz;
tmp_reg8.x = (vs_pica.f[93].yyyy).x;
return false;
}
bool Vfn33() {
tmp_reg1 = vs_pica.f[20];
tmp_reg2 = vs_pica.f[21];
tmp_reg3 = vs_pica.f[93].xxxx;
addr_regs.z = int(vs_pica.i[0].y);
for (uint i = 0u; i <= vs_pica.i[0].x; addr_regs.z += int(vs_pica.i[0].z), ++i) {
Vfn34();
}
tmp_reg8.x = (vs_pica.f[93].yyyy).x;
return false;
}
bool Vfn34() {
addr_regs.x = (ivec2(tmp_reg3.xy)).x;
tmp_reg4.x = (vs_pica.f[81 + addr_regs.x].wwww).x;
tmp_reg4.y = (vs_pica.f[83 + addr_regs.x].wwww).y;
bool_regs = equal(vs_pica.f[93].xy, tmp_reg4.xy);
if (bool_regs.x) {
tmp_reg6.x = dot_3(vs_pica.f[81 + addr_regs.x].xyz, tmp_reg14.xyz);
tmp_reg6.y = (vs_pica.f[93].yyyy).y;
} else {
Vfn36();
}
bool_regs.x = vs_pica.f[93].xxxx.x == tmp_reg6.xyyy.x;
bool_regs.y = vs_pica.f[93].xxxx.y < tmp_reg6.xyyy.y;
if (bool_regs.y) {
tmp_reg6.x = (max_s(vs_pica.f[93].xxxx, tmp_reg6.xxxx)).x;
tmp_reg9.xyz = (fma_s(tmp_reg1.xyzz, vs_pica.f[79 + addr_regs.x].xyzz, tmp_reg9.xyzz)).xyz;
tmp_reg4 = mul_s(vs_pica.f[80 + addr_regs.x], tmp_reg2);
tmp_reg5.xyz = (mul_s(tmp_reg6.xxxx, tmp_reg4.xyzz)).xyz;
tmp_reg5.xyz = (mul_s(tmp_reg6.yyyy, tmp_reg5.xyzz)).xyz;
tmp_reg9.xyz = (tmp_reg9.xyzz + tmp_reg5.xyzz).xyz;
tmp_reg9.w = (tmp_reg9.wwww + tmp_reg4.wwww).w;
}
tmp_reg3 = -vs_pica.f[95].wwww + tmp_reg3;
return false;
}
bool Vfn36() {
tmp_reg4 = vs_pica.f[81 + addr_regs.x] + -tmp_reg15;
tmp_reg6.y = (vs_pica.f[93].yyyy).y;
if (bool_regs.y) {
tmp_reg5.x = (vs_pica.f[93].yyyy).x;
tmp_reg5.z = dot_3(tmp_reg4.xyz, tmp_reg4.xyz);
tmp_reg5.y = (mul_s(tmp_reg5.zzzz, tmp_reg5.zzzz)).y;
tmp_reg6.y = dot_3(vs_pica.f[83 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg6.y = rcp_s(tmp_reg6.y);
}
tmp_reg5 = vs_pica.f[82 + addr_regs.x];
bool_regs = equal(vs_pica.f[93].yy, tmp_reg5.ww);
tmp_reg4.w = dot_3(tmp_reg4.xyz, tmp_reg4.xyz);
tmp_reg4.w = rsq_s(tmp_reg4.w);
tmp_reg4 = mul_s(tmp_reg4, tmp_reg4.wwww);
if (bool_regs.x) {
Vfn38();
}
tmp_reg6.x = dot_3(tmp_reg14.xyz, tmp_reg4.xyz);
return false;
}
bool Vfn38() {
tmp_reg5.x = dot_3(vs_pica.f[82 + addr_regs.x].xyz, -tmp_reg4.xyz);
tmp_reg5.y = (vec4(lessThan(tmp_reg5.xxxx, vs_pica.f[84 + addr_regs.x].yyyy))).y;
bool_regs = equal(vs_pica.f[93].yy, tmp_reg5.xy);
if (bool_regs.y) {
tmp_reg5.x = (vs_pica.f[93].xxxx).x;
} else {
tmp_reg5.y = log2(tmp_reg5.x);
tmp_reg5.y = (mul_s(vs_pica.f[84 + addr_regs.x].xxxx, tmp_reg5.yyyy)).y;
tmp_reg5.x = exp2(tmp_reg5.y);
}
tmp_reg6.y = (mul_s(tmp_reg6.yyyy, tmp_reg5.xxxx)).y;
return false;
}
bool Vfn42() {
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
bool Vfn45() {
tmp_reg0.xy = (vs_pica.f[10].xxxx).xy;
if (vs_pica.b[9]) {
Vfn46();
} else {
Vfn52();
}
return false;
}
bool Vfn46() {
Vfn47();
tmp_reg3.x = dot_s(vs_pica.f[11].xywz, tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12].xywz, tmp_reg6);
tmp_reg3.zw = (vs_pica.f[93].xxxx).zw;
vs_out_reg4 = tmp_reg3;
return false;
}
bool Vfn52() {
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
Vfn54();
}
vs_out_reg4 = tmp_reg3;
return false;
}
bool Vfn54() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
Vfn55();
} else {
Vfn57();
}
return false;
}
bool Vfn55() {
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
bool Vfn57() {
Vfn58();
tmp_reg3.x = dot_s(vs_pica.f[11], tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12], tmp_reg6);
return false;
}
bool Vfn47() {
bool_regs = equal(vs_pica.f[93].yz, tmp_reg0.xy);
if (all(not(bool_regs))) {
tmp_reg6.xy = (mul_s(vs_pica.f[8].xxxx, vs_in_reg4.xyyy)).xy;
} else {
Vfn49();
}
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
return false;
}
bool Vfn49() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
tmp_reg6.xy = (mul_s(vs_pica.f[8].yyyy, vs_in_reg5.xyyy)).xy;
} else {
tmp_reg6.xy = (mul_s(vs_pica.f[8].zzzz, vs_in_reg6.xyyy)).xy;
}
return false;
}
bool Vfn58() {
tmp_reg1.xy = (vs_pica.f[94].zzzz).xy;
tmp_reg1.zw = (vs_pica.f[93].xxxx).zw;
tmp_reg6 = fma_s(tmp_reg14, tmp_reg1, tmp_reg1);
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
return false;
}
bool Vfn59() {
tmp_reg0.xy = (vs_pica.f[10].yyyy).xy;
if (vs_pica.b[10]) {
Vfn60();
} else {
Vfn61();
}
return false;
}
bool Vfn60() {
Vfn47();
tmp_reg4.x = dot_s(vs_pica.f[14].xywz, tmp_reg6);
tmp_reg4.y = dot_s(vs_pica.f[15].xywz, tmp_reg6);
tmp_reg4.zw = (tmp_reg6.zwww).zw;
vs_out_reg5 = tmp_reg4;
return false;
}
bool Vfn61() {
if (vs_pica.b[13]) {
Vfn62();
} else {
vs_out_reg5 = vs_pica.f[93].xxxx;
}
return false;
}
bool Vfn62() {
bool_regs = equal(vs_pica.f[95].xy, tmp_reg0.xy);
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
tmp_reg4.zw = (tmp_reg6.zwww).zw;
if (all(not(bool_regs))) {
tmp_reg6 = tmp_reg10;
tmp_reg4.x = dot_s(vs_pica.f[14], tmp_reg6);
tmp_reg4.y = dot_s(vs_pica.f[15], tmp_reg6);
tmp_reg4.z = dot_s(vs_pica.f[16], tmp_reg6);
tmp_reg6.w = rcp_s(tmp_reg4.z);
tmp_reg4.xy = (mul_s(tmp_reg4.xyyy, tmp_reg6.wwww)).xy;
tmp_reg4.xy = (vs_pica.f[19].zwww + tmp_reg4.xyyy).xy;
} else {
Vfn64();
}
vs_out_reg5 = tmp_reg4;
return false;
}
bool Vfn64() {
Vfn58();
tmp_reg4.x = dot_s(vs_pica.f[14], tmp_reg6);
tmp_reg4.y = dot_s(vs_pica.f[15], tmp_reg6);
return false;
}
bool Vfn66() {
tmp_reg0.xy = (vs_pica.f[10].zzzz).xy;
if (vs_pica.b[11]) {
Vfn67();
} else {
Vfn68();
}
return false;
}
bool Vfn67() {
Vfn47();
tmp_reg5.x = dot_s(vs_pica.f[17].xywz, tmp_reg6);
tmp_reg5.y = dot_s(vs_pica.f[18].xywz, tmp_reg6);
tmp_reg5.zw = (tmp_reg6.zwww).zw;
vs_out_reg6 = tmp_reg5;
return false;
}
bool Vfn68() {
if (vs_pica.b[14]) {
Vfn69();
} else {
vs_out_reg6 = vs_pica.f[93].xxxx;
}
return false;
}
bool Vfn69() {
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
tmp_reg5.zw = (tmp_reg6.zwww).zw;
Vfn58();
tmp_reg5.x = dot_s(vs_pica.f[17], tmp_reg6);
tmp_reg5.y = dot_s(vs_pica.f[18], tmp_reg6);
vs_out_reg6 = tmp_reg5;
return false;
}
// shader: 8B30, F1A0C34EC9BB3047
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
float alpha_output_0 = (const_color[0].g);
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
// shader: 8B30, A13951B9D374C5AA
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
float alpha_output_0 = (const_color[0].g);
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
// shader: 8B31, F1FE120EDDE1826D

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
vec4 vtx_color = vec4(vs_out_reg1.x,vs_out_reg1.y,vs_out_reg1.z,vs_out_reg1.w);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(1,1,1,1);
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
vec4 tmp_reg15;
bool ExecVS() {
tmp_reg0 = vec4(0, 0, 0, 1);
tmp_reg15 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn0() {
tmp_reg0.xy = (vs_in_reg0.xyzz).xy;
tmp_reg0.zw = (vs_pica.f[95].zwww).zw;
tmp_reg15.x = dot_s(vs_pica.f[4], tmp_reg0);
tmp_reg15.y = dot_s(vs_pica.f[5], tmp_reg0);
tmp_reg15.z = dot_s(vs_pica.f[6], tmp_reg0);
tmp_reg15.w = dot_s(vs_pica.f[7], tmp_reg0);
vs_out_reg0.x = dot_s(vs_pica.f[0], tmp_reg15);
vs_out_reg0.y = dot_s(vs_pica.f[1], tmp_reg15);
vs_out_reg0.z = dot_s(vs_pica.f[2], tmp_reg15);
vs_out_reg0.w = dot_s(vs_pica.f[3], tmp_reg15);
vs_out_reg1 = mul_s(vs_pica.f[95].xxxx, vs_in_reg1.wzyx);
return true;
}
// shader: 8B30, 2382260E41E8C870
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
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: CBBA510E0A125891, FF1D8B78C0FF848B
// reference: 3E09D620B43A7622, F1A0C34EC9BB3047
// reference: E0B88C3FF53CFE43, A13951B9D374C5AA
// reference: FBE1C8C15DC7FC02, F1FE120EDDE1826D
// reference: 596C8D812B4B918A, 2382260E41E8C870
// program: FF1D8B78C0FF848B, 0000000000000000, F1A0C34EC9BB3047
// program: FF1D8B78C0FF848B, 0000000000000000, A13951B9D374C5AA
// program: F1FE120EDDE1826D, 0000000000000000, 2382260E41E8C870
// shader: 8B30, CC7E37A5288B071F
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
// shader: 8B30, 7442D116808A9A37
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
float alpha_output_0 = ByteRound(clamp((texcolor0.a) * (rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 43A91D10E2A4C677, CC7E37A5288B071F
// reference: 43A91D10629B871B, ADB5521579DAF431
// reference: 9D18470F03B52CEE, 7442D116808A9A37
// program: FF1D8B78C0FF848B, 0000000000000000, CC7E37A5288B071F
// program: FF1D8B78C0FF848B, 0000000000000000, ADB5521579DAF431
// program: A291F69A4C715DD1, 0000000000000000, 7442D116808A9A37
// shader: 8B30, 8075EB9A785852BE
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
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
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
// reference: 87DDD79EA754EB66, 8075EB9A785852BE
// program: FF1D8B78C0FF848B, 0000000000000000, 8075EB9A785852BE
// shader: 8B30, C6C3FEA5782B21E1
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
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(fma((texcolor0.rrr), (secondary_fragment_color.rgb), (texcolor0.ggg)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((const_color[0].a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp(fma((texcolor0.bbb), (const_color[1].rgb), (last_tev_out.aaa)), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((texcolor0.b) + (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp(mix((combiner_buffer.rgb), (last_tev_out.rgb), (last_tev_out.aaa)), vec3(0), vec3(1)));
float alpha_output_2 = (const_color[2].a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(mix((texcolor2.rgb), (last_tev_out.rgb), (last_tev_out.aaa)), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((primary_fragment_color.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((last_tev_out.rgb), (primary_fragment_color.rgb), (last_tev_out.aaa)), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = (last_tev_out.rgb);
float alpha_output_5 = (primary_fragment_color.a);
last_tev_out = vec4(color_output_5, alpha_output_5);
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
// shader: 8B30, 89BF9D5D6784842F
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform samplerCube tex0;
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
vec4 texcolor0 = texture(tex0, texcoord0.xyz);
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
lut_offset = lighting_lut_offset[1][2];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
refl_value.r = lut_scale_rr * lut_value;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[0].specular_0) * geo_factor) + (refl_value * light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor1.rgb) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor1.r) + (rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((texcolor0.rgb), (const_color[1].aaa), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) + (secondary_fragment_color.rgb), vec3(0), vec3(1)));
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
// shader: 8B30, D714D2C721869E24
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
// reference: 11CE9ED8D0F96817, C6C3FEA5782B21E1
// reference: B5818D5AFE8F403A, 89BF9D5D6784842F
// reference: 9D18470F0580672C, D714D2C721869E24
// program: FF1D8B78C0FF848B, 0000000000000000, C6C3FEA5782B21E1
// program: FF1D8B78C0FF848B, 0000000000000000, 89BF9D5D6784842F
// program: FF1D8B78C0FF848B, 0000000000000000, D714D2C721869E24
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
// reference: 43A91D10C1FC0598, 2C200D7B7A3600F1
// program: FF1D8B78C0FF848B, 0000000000000000, 2C200D7B7A3600F1
// shader: 8B30, 8BF6D38D480F8E13
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
vec3 color_output_0 = (primary_fragment_color.rgb);
float alpha_output_0 = (const_color[0].g);
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
// reference: 3E09D6203405374E, 8BF6D38D480F8E13
// program: FF1D8B78C0FF848B, 0000000000000000, 8BF6D38D480F8E13
