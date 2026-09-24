// shader: 8B31, B753A1567A802E0D

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
layout(location=7) in vec4 vs_in_reg7;
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
bool Vfn1();
bool Vfn4();
bool Vfn6();
bool Vfn7();
bool Vfn5();
bool Vfn8();
bool Vfn9();
bool Vfn11();
bool Vfn14();
bool Vfn18();
bool Vfn19();
bool Vfn21();
bool Vfn23();
bool Vfn25();
bool Vfn26();
bool Vfn28();
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

bool Vfn1() {
tmp_reg15.xyz = (mul_s(vs_pica.f[7].xxxx, vs_in_reg0)).xyz;
tmp_reg14.xyz = (mul_s(vs_pica.f[7].yyyy, vs_in_reg1)).xyz;
tmp_reg13.xyz = (mul_s(vs_pica.f[7].zzzz, vs_in_reg2)).xyz;
tmp_reg15.xyz = (vs_pica.f[6] + tmp_reg15).xyz;
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
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
Vfn4();
} else {
Vfn6();
}
vs_out_reg2 = -tmp_reg15;
vs_out_reg0.x = dot_s(vs_pica.f[86], tmp_reg15);
vs_out_reg0.y = dot_s(vs_pica.f[87], tmp_reg15);
vs_out_reg0.z = dot_s(vs_pica.f[88], tmp_reg15);
vs_out_reg0.w = dot_s(vs_pica.f[89], tmp_reg15);
return false;
}
bool Vfn4() {
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
Vfn5();
return false;
}
bool Vfn6() {
if (all(bool_regs)) {
Vfn7();
} else {
tmp_reg15.x = dot_s(vs_pica.f[90], tmp_reg10);
tmp_reg15.y = dot_s(vs_pica.f[91], tmp_reg10);
tmp_reg15.z = dot_s(vs_pica.f[92], tmp_reg10);
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
vs_out_reg1 = vs_pica.f[93].xxxx;
}
return false;
}
bool Vfn7() {
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
Vfn8();
return false;
}
bool Vfn5() {
uint jmp_to = 73u;
while (true) {
switch (jmp_to) {
case 73u:
tmp_reg6.x = dot_3(tmp_reg14.xyz, tmp_reg14.xyz);
tmp_reg7.x = dot_3(tmp_reg12.xyz, tmp_reg12.xyz);
tmp_reg6.x = rsq_s(tmp_reg6.x);
tmp_reg7.x = rsq_s(tmp_reg7.x);
tmp_reg14.xyz = (mul_s(tmp_reg14.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg12.xyz = (mul_s(tmp_reg12.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg0 = vs_pica.f[93].yxxx;
if (!vs_pica.b[3]) {
jmp_to = 89u; break;
}
tmp_reg4 = vs_pica.f[93].yyyy + tmp_reg14.zzzz;
tmp_reg4 = mul_s(vs_pica.f[94].zzzz, tmp_reg4);
bool_regs = greaterThanEqual(vs_pica.f[93].xx, tmp_reg4.xx);
tmp_reg4 = vec4(rsq_s(tmp_reg4.x));
tmp_reg5 = mul_s(vs_pica.f[94].zzzz, tmp_reg14);
if (bool_regs.x) {
jmp_to = 89u; break;
}
tmp_reg0.z = rcp_s(tmp_reg4.x);
tmp_reg0.xy = (mul_s(tmp_reg5, tmp_reg4)).xy;
case 89u:
vs_out_reg1 = tmp_reg0;
default: return false;
}
}
return false;
}
bool Vfn8() {
uint jmp_to = 90u;
while (true) {
switch (jmp_to) {
case 90u:
tmp_reg6.x = dot_3(tmp_reg14.xyz, tmp_reg14.xyz);
tmp_reg7.x = dot_3(tmp_reg12.xyz, tmp_reg12.xyz);
tmp_reg6.x = rsq_s(tmp_reg6.x);
tmp_reg7.x = rsq_s(tmp_reg7.x);
tmp_reg14.xyz = (mul_s(tmp_reg14.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg12.xyz = (mul_s(tmp_reg12.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg13.xyz = (mul_s(tmp_reg13.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg11.xyz = (mul_s(tmp_reg11.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg0 = vs_pica.f[93].yxxx;
if (!vs_pica.b[3]) {
jmp_to = 165u; break;
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
jmp_to = 127u; break;
}
tmp_reg7.xz = (tmp_reg13.wwyy + -tmp_reg14.yyww).xz;
tmp_reg7.y = (tmp_reg14.xxxx + -tmp_reg13.zzzz).y;
tmp_reg7.w = (tmp_reg6).w;
tmp_reg6 = vec4(dot_s(tmp_reg7, tmp_reg7));
tmp_reg6 = vec4(rsq_s(tmp_reg6.x));
tmp_reg0 = mul_s(tmp_reg7, tmp_reg6);
if (vs_pica.b[0]) {
jmp_to = 165u; break;
}
case 127u:
bool_regs = greaterThan(tmp_reg5.zy, tmp_reg5.yx);
if (bool_regs.x) {
Vfn9();
} else {
Vfn14();
}
tmp_reg6 = vec4(dot_s(tmp_reg8, tmp_reg8));
tmp_reg6 = vec4(rsq_s(tmp_reg6.x));
tmp_reg0 = mul_s(tmp_reg8, tmp_reg6);
case 165u:
vs_out_reg1 = tmp_reg0;
default: return false;
}
}
return false;
}
bool Vfn9() {
if (bool_regs.y) {
tmp_reg8 = mul_s(tmp_reg13.yyzw, tmp_reg6.xxxy);
tmp_reg8.x = (vs_pica.f[93].yyyy + -tmp_reg5.yyyy).x;
tmp_reg9 = tmp_reg5.zzzz + -tmp_reg5.xxxx;
tmp_reg8.yzw = (tmp_reg8 + tmp_reg14.wwxy).yzw;
tmp_reg8.x = (tmp_reg9 + tmp_reg8).x;
} else {
Vfn11();
}
tmp_reg8.w = (-tmp_reg8).w;
return false;
}
bool Vfn11() {
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
bool Vfn14() {
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
bool Vfn18() {
tmp_reg0.y = (vs_pica.f[7].wwww).y;
bool_regs = notEqual(vs_pica.f[93].xx, tmp_reg0.xy);
tmp_reg9 = vs_pica.f[21];
tmp_reg0 = mul_s(vs_pica.f[7].wwww, vs_in_reg3);
if (bool_regs.y) {
Vfn19();
}
vs_out_reg3 = max_s(vs_pica.f[93].xxxx, tmp_reg9);
return false;
}
bool Vfn19() {
if (vs_pica.b[7]) {
tmp_reg9.w = (mul_s(tmp_reg9.wwww, tmp_reg0.wwww)).w;
}
tmp_reg9.xyz = (mul_s(vs_pica.f[20].wwww, tmp_reg0.xyzz)).xyz;
tmp_reg8.x = (vs_pica.f[93].yyyy).x;
return false;
}
bool Vfn21() {
tmp_reg0.xy = (vs_pica.f[10].xxxx).xy;
if (vs_pica.b[9]) {
tmp_reg6.xy = (mul_s(vs_pica.f[8].xxxx, vs_in_reg4.xyyy)).xy;
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
tmp_reg3.x = dot_s(vs_pica.f[11].xywz, tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12].xywz, tmp_reg6);
tmp_reg3.zw = (vs_pica.f[93].xxxx).zw;
vs_out_reg4 = tmp_reg3;
} else {
Vfn23();
}
return false;
}
bool Vfn23() {
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
Vfn25();
}
vs_out_reg4 = tmp_reg3;
return false;
}
bool Vfn25() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
Vfn26();
} else {
Vfn28();
}
return false;
}
bool Vfn26() {
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
bool Vfn28() {
tmp_reg1.xy = (vs_pica.f[94].zzzz).xy;
tmp_reg1.zw = (vs_pica.f[93].xxxx).zw;
tmp_reg6 = fma_s(tmp_reg14, tmp_reg1, tmp_reg1);
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
tmp_reg3.x = dot_s(vs_pica.f[11], tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12], tmp_reg6);
return false;
}
bool Vfn0() {
Vfn1();
Vfn18();
Vfn21();
return true;
}
// shader: 8B30, 48C05068C97A61DA
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
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(half_vector)));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(half_vector)));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp((secondary_fragment_color.rgb) * (texcolor0.aaa), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp((last_tev_out.rgb) + (combiner_buffer.rgb), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4, alpha_output_4);
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
// shader: 8B30, 7EE0F9D674AE3188
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
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(half_vector)));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[0].specular_0) * geo_factor) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
geo_factor = dot(half_vector, half_vector);
geo_factor = geo_factor == 0.0 ? 0.0 : min(dot_product / geo_factor, 1.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(half_vector)));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[1].specular_0) * geo_factor) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (texcolor0.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(fma((texcolor0.rgb), (secondary_fragment_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B31, E6B24856ED2B97B8

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
bool Vfn40();
bool Vfn42();
bool Vfn43();
bool Vfn45();
bool Vfn35();
bool Vfn37();
bool Vfn46();
bool Vfn47();
bool Vfn48();
bool Vfn49();
bool Vfn50();
bool Vfn52();
bool Vfn54();
bool Vfn55();
bool Vfn56();
bool Vfn57();
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
Vfn33();
Vfn47();
Vfn54();
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
if (!vs_pica.b[3]) {
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
if (!vs_pica.b[3]) {
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
tmp_reg0.y = (vs_pica.f[7].wwww).y;
bool_regs = notEqual(vs_pica.f[93].xx, tmp_reg0.xy);
tmp_reg9 = vs_pica.f[21];
tmp_reg0 = mul_s(vs_pica.f[7].wwww, vs_in_reg3);
if (bool_regs.y) {
Vfn31();
}
vs_out_reg3 = max_s(vs_pica.f[93].xxxx, tmp_reg9);
return false;
}
bool Vfn31() {
if (vs_pica.b[7]) {
tmp_reg9.w = (mul_s(tmp_reg9.wwww, tmp_reg0.wwww)).w;
}
tmp_reg9.xyz = (mul_s(vs_pica.f[20].wwww, tmp_reg0.xyzz)).xyz;
tmp_reg8.x = (vs_pica.f[93].yyyy).x;
return false;
}
bool Vfn33() {
tmp_reg0.xy = (vs_pica.f[10].xxxx).xy;
if (vs_pica.b[9]) {
Vfn34();
} else {
Vfn40();
}
return false;
}
bool Vfn34() {
Vfn35();
tmp_reg3.x = dot_s(vs_pica.f[11].xywz, tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12].xywz, tmp_reg6);
tmp_reg3.zw = (vs_pica.f[93].xxxx).zw;
vs_out_reg4 = tmp_reg3;
return false;
}
bool Vfn40() {
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
Vfn42();
}
vs_out_reg4 = tmp_reg3;
return false;
}
bool Vfn42() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
Vfn43();
} else {
Vfn45();
}
return false;
}
bool Vfn43() {
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
bool Vfn45() {
Vfn46();
tmp_reg3.x = dot_s(vs_pica.f[11], tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12], tmp_reg6);
return false;
}
bool Vfn35() {
bool_regs = equal(vs_pica.f[93].yz, tmp_reg0.xy);
if (all(not(bool_regs))) {
tmp_reg6.xy = (mul_s(vs_pica.f[8].xxxx, vs_in_reg4.xyyy)).xy;
} else {
Vfn37();
}
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
return false;
}
bool Vfn37() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
tmp_reg6.xy = (mul_s(vs_pica.f[8].yyyy, vs_in_reg5.xyyy)).xy;
} else {
tmp_reg6.xy = (mul_s(vs_pica.f[8].zzzz, vs_in_reg6.xyyy)).xy;
}
return false;
}
bool Vfn46() {
tmp_reg1.xy = (vs_pica.f[94].zzzz).xy;
tmp_reg1.zw = (vs_pica.f[93].xxxx).zw;
tmp_reg6 = fma_s(tmp_reg14, tmp_reg1, tmp_reg1);
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
return false;
}
bool Vfn47() {
tmp_reg0.xy = (vs_pica.f[10].yyyy).xy;
if (vs_pica.b[10]) {
Vfn48();
} else {
Vfn49();
}
return false;
}
bool Vfn48() {
Vfn35();
tmp_reg4.x = dot_s(vs_pica.f[14].xywz, tmp_reg6);
tmp_reg4.y = dot_s(vs_pica.f[15].xywz, tmp_reg6);
vs_out_reg5 = tmp_reg4;
return false;
}
bool Vfn49() {
if (vs_pica.b[13]) {
Vfn50();
} else {
vs_out_reg5 = vs_pica.f[93].xxxx;
}
return false;
}
bool Vfn50() {
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
Vfn52();
}
vs_out_reg5 = tmp_reg4;
return false;
}
bool Vfn52() {
Vfn46();
tmp_reg4.x = dot_s(vs_pica.f[14], tmp_reg6);
tmp_reg4.y = dot_s(vs_pica.f[15], tmp_reg6);
return false;
}
bool Vfn54() {
tmp_reg0.xy = (vs_pica.f[10].zzzz).xy;
if (vs_pica.b[11]) {
Vfn55();
} else {
Vfn56();
}
return false;
}
bool Vfn55() {
Vfn35();
tmp_reg5.x = dot_s(vs_pica.f[17].xywz, tmp_reg6);
tmp_reg5.y = dot_s(vs_pica.f[18].xywz, tmp_reg6);
vs_out_reg6 = tmp_reg5;
return false;
}
bool Vfn56() {
if (vs_pica.b[14]) {
Vfn57();
} else {
vs_out_reg6 = vs_pica.f[93].xxxx;
}
return false;
}
bool Vfn57() {
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
tmp_reg5.zw = (tmp_reg6.zwww).zw;
Vfn46();
tmp_reg5.x = dot_s(vs_pica.f[17], tmp_reg6);
tmp_reg5.y = dot_s(vs_pica.f[18], tmp_reg6);
vs_out_reg6 = tmp_reg5;
return false;
}
// shader: 8B30, C281D48145A550C9
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
d0_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.a = lut_scale_fr * lut_value;
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + ((lut_scale_d1 * d1_value) * light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((secondary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((secondary_fragment_color.aaa), (texcolor0.rrr), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp((texcolor1.rgb) * (const_color[2].rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp(fma((texcolor2.rgb), (last_tev_out.rgb), (combiner_buffer.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp((last_tev_out.rgb) + (const_color[4].rgb), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4, alpha_output_4);
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
// shader: 8B30, 6CBCDC1C2B6B9DB5
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
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[0].specular_0) * geo_factor) + (((lut_scale_d1 * d1_value) * light_src[0].specular_1) * geo_factor)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
geo_factor = dot(half_vector, half_vector);
geo_factor = geo_factor == 0.0 ? 0.0 : min(dot_product / geo_factor, 1.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[1].specular_0) * geo_factor) + (((lut_scale_d1 * d1_value) * light_src[1].specular_1) * geo_factor)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (const_color[0].aaa), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) + (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) * (const_color[1].a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) + (const_color[2].aaa), vec3(0), vec3(1)));
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
// shader: 8B31, DCC8066544A8F65A

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
bool Vfn40();
bool Vfn42();
bool Vfn43();
bool Vfn45();
bool Vfn35();
bool Vfn37();
bool Vfn46();
bool Vfn47();
bool Vfn48();
bool Vfn49();
bool Vfn50();
bool Vfn52();
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
if (!vs_pica.b[3]) {
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
if (!vs_pica.b[3]) {
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
tmp_reg0.y = (vs_pica.f[7].wwww).y;
bool_regs = notEqual(vs_pica.f[93].xx, tmp_reg0.xy);
tmp_reg9 = vs_pica.f[21];
tmp_reg0 = mul_s(vs_pica.f[7].wwww, vs_in_reg3);
if (bool_regs.y) {
Vfn31();
}
vs_out_reg3 = max_s(vs_pica.f[93].xxxx, tmp_reg9);
return false;
}
bool Vfn31() {
if (vs_pica.b[7]) {
tmp_reg9.w = (mul_s(tmp_reg9.wwww, tmp_reg0.wwww)).w;
}
tmp_reg9.xyz = (mul_s(vs_pica.f[20].wwww, tmp_reg0.xyzz)).xyz;
tmp_reg8.x = (vs_pica.f[93].yyyy).x;
return false;
}
bool Vfn33() {
tmp_reg0.xy = (vs_pica.f[10].xxxx).xy;
if (vs_pica.b[9]) {
Vfn34();
} else {
Vfn40();
}
return false;
}
bool Vfn34() {
Vfn35();
tmp_reg3.x = dot_s(vs_pica.f[11].xywz, tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12].xywz, tmp_reg6);
tmp_reg3.zw = (vs_pica.f[93].xxxx).zw;
vs_out_reg4 = tmp_reg3;
return false;
}
bool Vfn40() {
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
Vfn42();
}
vs_out_reg4 = tmp_reg3;
return false;
}
bool Vfn42() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
Vfn43();
} else {
Vfn45();
}
return false;
}
bool Vfn43() {
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
bool Vfn45() {
Vfn46();
tmp_reg3.x = dot_s(vs_pica.f[11], tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12], tmp_reg6);
return false;
}
bool Vfn35() {
bool_regs = equal(vs_pica.f[93].yz, tmp_reg0.xy);
if (all(not(bool_regs))) {
tmp_reg6.xy = (mul_s(vs_pica.f[8].xxxx, vs_in_reg4.xyyy)).xy;
} else {
Vfn37();
}
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
return false;
}
bool Vfn37() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
tmp_reg6.xy = (mul_s(vs_pica.f[8].yyyy, vs_in_reg5.xyyy)).xy;
} else {
tmp_reg6.xy = (mul_s(vs_pica.f[8].zzzz, vs_in_reg6.xyyy)).xy;
}
return false;
}
bool Vfn46() {
tmp_reg1.xy = (vs_pica.f[94].zzzz).xy;
tmp_reg1.zw = (vs_pica.f[93].xxxx).zw;
tmp_reg6 = fma_s(tmp_reg14, tmp_reg1, tmp_reg1);
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
return false;
}
bool Vfn47() {
tmp_reg0.xy = (vs_pica.f[10].yyyy).xy;
if (vs_pica.b[10]) {
Vfn48();
} else {
Vfn49();
}
return false;
}
bool Vfn48() {
Vfn35();
tmp_reg4.x = dot_s(vs_pica.f[14].xywz, tmp_reg6);
tmp_reg4.y = dot_s(vs_pica.f[15].xywz, tmp_reg6);
vs_out_reg5 = tmp_reg4;
return false;
}
bool Vfn49() {
if (vs_pica.b[13]) {
Vfn50();
} else {
vs_out_reg5 = vs_pica.f[93].xxxx;
}
return false;
}
bool Vfn50() {
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
Vfn52();
}
vs_out_reg5 = tmp_reg4;
return false;
}
bool Vfn52() {
Vfn46();
tmp_reg4.x = dot_s(vs_pica.f[14], tmp_reg6);
tmp_reg4.y = dot_s(vs_pica.f[15], tmp_reg6);
return false;
}
bool Vfn0() {
Vfn1();
Vfn30();
Vfn33();
Vfn47();
return true;
}
// shader: 8B30, 71719082BF66940E
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
d0_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + ((lut_scale_d1 * d1_value) * light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (const_color[0].a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) + (secondary_fragment_color.aaa), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(mix((last_tev_out.rgb), (texcolor0.rgb), (texcolor1.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) + (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
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
// shader: 8B31, F0D67A3BFB3E231B

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
bool Vfn1();
bool Vfn4();
bool Vfn6();
bool Vfn7();
bool Vfn5();
bool Vfn8();
bool Vfn9();
bool Vfn11();
bool Vfn14();
bool Vfn18();
bool Vfn19();
bool Vfn21();
bool Vfn23();
bool Vfn25();
bool Vfn26();
bool Vfn28();
bool Vfn29();
bool Vfn30();
bool Vfn32();
bool Vfn33();
bool Vfn35();
bool Vfn37();
bool Vfn39();
bool Vfn40();
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
Vfn18();
Vfn21();
Vfn30();
Vfn37();
return true;
}
bool Vfn1() {
tmp_reg15.xyz = (mul_s(vs_pica.f[7].xxxx, vs_in_reg0)).xyz;
tmp_reg14.xyz = (mul_s(vs_pica.f[7].yyyy, vs_in_reg1)).xyz;
tmp_reg13.xyz = (mul_s(vs_pica.f[7].zzzz, vs_in_reg2)).xyz;
tmp_reg15.xyz = (vs_pica.f[6] + tmp_reg15).xyz;
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
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
Vfn4();
} else {
Vfn6();
}
vs_out_reg2 = -tmp_reg15;
vs_out_reg0.x = dot_s(vs_pica.f[86], tmp_reg15);
vs_out_reg0.y = dot_s(vs_pica.f[87], tmp_reg15);
vs_out_reg0.z = dot_s(vs_pica.f[88], tmp_reg15);
vs_out_reg0.w = dot_s(vs_pica.f[89], tmp_reg15);
return false;
}
bool Vfn4() {
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
Vfn5();
return false;
}
bool Vfn6() {
if (all(bool_regs)) {
Vfn7();
} else {
tmp_reg15.x = dot_s(vs_pica.f[90], tmp_reg10);
tmp_reg15.y = dot_s(vs_pica.f[91], tmp_reg10);
tmp_reg15.z = dot_s(vs_pica.f[92], tmp_reg10);
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
vs_out_reg1 = vs_pica.f[93].xxxx;
}
return false;
}
bool Vfn7() {
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
Vfn8();
return false;
}
bool Vfn5() {
uint jmp_to = 73u;
while (true) {
switch (jmp_to) {
case 73u:
tmp_reg6.x = dot_3(tmp_reg14.xyz, tmp_reg14.xyz);
tmp_reg7.x = dot_3(tmp_reg12.xyz, tmp_reg12.xyz);
tmp_reg6.x = rsq_s(tmp_reg6.x);
tmp_reg7.x = rsq_s(tmp_reg7.x);
tmp_reg14.xyz = (mul_s(tmp_reg14.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg12.xyz = (mul_s(tmp_reg12.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg0 = vs_pica.f[93].yxxx;
if (!vs_pica.b[3]) {
jmp_to = 89u; break;
}
tmp_reg4 = vs_pica.f[93].yyyy + tmp_reg14.zzzz;
tmp_reg4 = mul_s(vs_pica.f[94].zzzz, tmp_reg4);
bool_regs = greaterThanEqual(vs_pica.f[93].xx, tmp_reg4.xx);
tmp_reg4 = vec4(rsq_s(tmp_reg4.x));
tmp_reg5 = mul_s(vs_pica.f[94].zzzz, tmp_reg14);
if (bool_regs.x) {
jmp_to = 89u; break;
}
tmp_reg0.z = rcp_s(tmp_reg4.x);
tmp_reg0.xy = (mul_s(tmp_reg5, tmp_reg4)).xy;
case 89u:
vs_out_reg1 = tmp_reg0;
default: return false;
}
}
return false;
}
bool Vfn8() {
uint jmp_to = 90u;
while (true) {
switch (jmp_to) {
case 90u:
tmp_reg6.x = dot_3(tmp_reg14.xyz, tmp_reg14.xyz);
tmp_reg7.x = dot_3(tmp_reg12.xyz, tmp_reg12.xyz);
tmp_reg6.x = rsq_s(tmp_reg6.x);
tmp_reg7.x = rsq_s(tmp_reg7.x);
tmp_reg14.xyz = (mul_s(tmp_reg14.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg12.xyz = (mul_s(tmp_reg12.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg13.xyz = (mul_s(tmp_reg13.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg11.xyz = (mul_s(tmp_reg11.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg0 = vs_pica.f[93].yxxx;
if (!vs_pica.b[3]) {
jmp_to = 165u; break;
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
jmp_to = 127u; break;
}
tmp_reg7.xz = (tmp_reg13.wwyy + -tmp_reg14.yyww).xz;
tmp_reg7.y = (tmp_reg14.xxxx + -tmp_reg13.zzzz).y;
tmp_reg7.w = (tmp_reg6).w;
tmp_reg6 = vec4(dot_s(tmp_reg7, tmp_reg7));
tmp_reg6 = vec4(rsq_s(tmp_reg6.x));
tmp_reg0 = mul_s(tmp_reg7, tmp_reg6);
if (vs_pica.b[0]) {
jmp_to = 165u; break;
}
case 127u:
bool_regs = greaterThan(tmp_reg5.zy, tmp_reg5.yx);
if (bool_regs.x) {
Vfn9();
} else {
Vfn14();
}
tmp_reg6 = vec4(dot_s(tmp_reg8, tmp_reg8));
tmp_reg6 = vec4(rsq_s(tmp_reg6.x));
tmp_reg0 = mul_s(tmp_reg8, tmp_reg6);
case 165u:
vs_out_reg1 = tmp_reg0;
default: return false;
}
}
return false;
}
bool Vfn9() {
if (bool_regs.y) {
tmp_reg8 = mul_s(tmp_reg13.yyzw, tmp_reg6.xxxy);
tmp_reg8.x = (vs_pica.f[93].yyyy + -tmp_reg5.yyyy).x;
tmp_reg9 = tmp_reg5.zzzz + -tmp_reg5.xxxx;
tmp_reg8.yzw = (tmp_reg8 + tmp_reg14.wwxy).yzw;
tmp_reg8.x = (tmp_reg9 + tmp_reg8).x;
} else {
Vfn11();
}
tmp_reg8.w = (-tmp_reg8).w;
return false;
}
bool Vfn11() {
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
bool Vfn14() {
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
bool Vfn18() {
tmp_reg0.y = (vs_pica.f[7].wwww).y;
bool_regs = notEqual(vs_pica.f[93].xx, tmp_reg0.xy);
tmp_reg9 = vs_pica.f[21];
tmp_reg0 = mul_s(vs_pica.f[7].wwww, vs_in_reg3);
if (bool_regs.y) {
Vfn19();
}
vs_out_reg3 = max_s(vs_pica.f[93].xxxx, tmp_reg9);
return false;
}
bool Vfn19() {
if (vs_pica.b[7]) {
tmp_reg9.w = (mul_s(tmp_reg9.wwww, tmp_reg0.wwww)).w;
}
tmp_reg9.xyz = (mul_s(vs_pica.f[20].wwww, tmp_reg0.xyzz)).xyz;
tmp_reg8.x = (vs_pica.f[93].yyyy).x;
return false;
}
bool Vfn21() {
tmp_reg0.xy = (vs_pica.f[10].xxxx).xy;
if (vs_pica.b[9]) {
tmp_reg6.xy = (mul_s(vs_pica.f[8].xxxx, vs_in_reg4.xyyy)).xy;
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
tmp_reg3.x = dot_s(vs_pica.f[11].xywz, tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12].xywz, tmp_reg6);
tmp_reg3.zw = (vs_pica.f[93].xxxx).zw;
vs_out_reg4 = tmp_reg3;
} else {
Vfn23();
}
return false;
}
bool Vfn23() {
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
Vfn25();
}
vs_out_reg4 = tmp_reg3;
return false;
}
bool Vfn25() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
Vfn26();
} else {
Vfn28();
}
return false;
}
bool Vfn26() {
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
bool Vfn28() {
Vfn29();
tmp_reg3.x = dot_s(vs_pica.f[11], tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12], tmp_reg6);
return false;
}
bool Vfn29() {
tmp_reg1.xy = (vs_pica.f[94].zzzz).xy;
tmp_reg1.zw = (vs_pica.f[93].xxxx).zw;
tmp_reg6 = fma_s(tmp_reg14, tmp_reg1, tmp_reg1);
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
return false;
}
bool Vfn30() {
tmp_reg0.xy = (vs_pica.f[10].yyyy).xy;
if (vs_pica.b[10]) {
tmp_reg6.xy = (mul_s(vs_pica.f[8].yyyy, vs_in_reg5.xyyy)).xy;
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
tmp_reg4.x = dot_s(vs_pica.f[14].xywz, tmp_reg6);
tmp_reg4.y = dot_s(vs_pica.f[15].xywz, tmp_reg6);
vs_out_reg5 = tmp_reg4;
} else {
Vfn32();
}
return false;
}
bool Vfn32() {
if (vs_pica.b[13]) {
Vfn33();
} else {
vs_out_reg5 = vs_pica.f[93].xxxx;
}
return false;
}
bool Vfn33() {
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
Vfn35();
}
vs_out_reg5 = tmp_reg4;
return false;
}
bool Vfn35() {
Vfn29();
tmp_reg4.x = dot_s(vs_pica.f[14], tmp_reg6);
tmp_reg4.y = dot_s(vs_pica.f[15], tmp_reg6);
return false;
}
bool Vfn37() {
tmp_reg0.xy = (vs_pica.f[10].zzzz).xy;
if (vs_pica.b[11]) {
tmp_reg6.xy = (mul_s(vs_pica.f[8].zzzz, vs_in_reg6.xyyy)).xy;
tmp_reg5.x = dot_s(vs_pica.f[17].xywz, tmp_reg6);
tmp_reg5.y = dot_s(vs_pica.f[18].xywz, tmp_reg6);
vs_out_reg6 = tmp_reg5;
} else {
Vfn39();
}
return false;
}
bool Vfn39() {
if (vs_pica.b[14]) {
Vfn40();
} else {
vs_out_reg6 = vs_pica.f[93].xxxx;
}
return false;
}
bool Vfn40() {
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
tmp_reg5.zw = (tmp_reg6.zwww).zw;
Vfn29();
tmp_reg5.x = dot_s(vs_pica.f[17], tmp_reg6);
tmp_reg5.y = dot_s(vs_pica.f[18], tmp_reg6);
vs_out_reg6 = tmp_reg5;
return false;
}
// shader: 8B30, 4D1185B4FE8B2481
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
depth /= gl_FragCoord.w;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 texcolor2 = textureLod(tex2, texcoord12.zw, GetLod(texcoord12.zw * vec2(textureSize(tex2, 0))) + tex_lod_bias[2]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor1.rgb) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor0.r) * (rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(mix((texcolor1.rgb), (texcolor2.rgb), (vec3(1) - last_tev_out.aaa)), vec3(0), vec3(1)));
float alpha_output_1 = (const_color[1].a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp((const_color[2].rgb) * (texcolor0.rrr), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.aaa), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((last_tev_out.rgb), (const_color[4].rgb), (combiner_buffer.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp(fma((const_color[5].rgb), (texcolor0.aaa), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_5 = (last_tev_out.a);
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 7A04013ADFB333E3
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
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
refl_value.r = lut_scale_rr * lut_value;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[0].specular_0) * geo_factor) + (refl_value * light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
geo_factor = dot(half_vector, half_vector);
geo_factor = geo_factor == 0.0 ? 0.0 : min(dot_product / geo_factor, 1.0);
lut_offset = lighting_lut_offset[1][2];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
refl_value.r = lut_scale_rr * lut_value;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[1].specular_0) * geo_factor) + (refl_value * light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((texcolor1.rgb), (secondary_fragment_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(fma((texcolor1.rgb), (secondary_fragment_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
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
// shader: 8B30, 37F2AFE9740824A3
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
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
refl_value.r = lut_scale_rr * lut_value;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[0].specular_0) * geo_factor) + (refl_value * light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
geo_factor = dot(half_vector, half_vector);
geo_factor = geo_factor == 0.0 ? 0.0 : min(dot_product / geo_factor, 1.0);
lut_offset = lighting_lut_offset[1][2];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
refl_value.r = lut_scale_rr * lut_value;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[1].specular_0) * geo_factor) + (refl_value * light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) + (const_color[1].rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(fma((texcolor1.rgb), (secondary_fragment_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(fma((texcolor1.rgb), (secondary_fragment_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_4 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_4, alpha_output_4);
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
// shader: 8B30, EA2CCCAAED32A330
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
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
refl_value.r = lut_scale_rr * lut_value;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[0].specular_0) * geo_factor) + (refl_value * light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
geo_factor = dot(half_vector, half_vector);
geo_factor = geo_factor == 0.0 ? 0.0 : min(dot_product / geo_factor, 1.0);
lut_offset = lighting_lut_offset[1][2];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
refl_value.r = lut_scale_rr * lut_value;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[1].specular_0) * geo_factor) + (refl_value * light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) + (const_color[0].rgb), vec3(0), vec3(1)));
float alpha_output_0 = (texcolor0.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_1 * 2.0, alpha_output_1 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(fma((texcolor1.rgb), (secondary_fragment_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
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
// shader: 8B30, 057F39C58F9BB607
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
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += ((light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
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
// shader: 8B30, A06C2394B48A588F
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
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
refl_value.r = lut_scale_rr * lut_value;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[0].specular_0) * geo_factor) + (refl_value * light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
geo_factor = dot(half_vector, half_vector);
geo_factor = geo_factor == 0.0 ? 0.0 : min(dot_product / geo_factor, 1.0);
lut_offset = lighting_lut_offset[1][2];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
refl_value.r = lut_scale_rr * lut_value;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[1].specular_0) * geo_factor) + (refl_value * light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (texcolor0.a);
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((texcolor1.rgb), (secondary_fragment_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(fma((texcolor1.rgb), (secondary_fragment_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (const_color[3].a);
last_tev_out = vec4(color_output_3, alpha_output_3);
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
// shader: 8B30, 7F8A88A5906AB195
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
d0_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((secondary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
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
// shader: 8B30, BDF5EDADE1E643F5
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
depth /= gl_FragCoord.w;
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
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((secondary_fragment_color.rgb) * (texcolor1.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
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
// shader: 8B30, 6AC6453ACCFCF40B
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
d0_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((secondary_fragment_color.rgb), (secondary_fragment_color.aaa), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(min((const_color[2].rgb) + (rounded_primary_color.rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
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
// shader: 8B30, 05503B0EB4BE5EEF
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
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
refl_value.r = lut_scale_rr * lut_value;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[0].specular_0) * geo_factor) + (refl_value * light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
geo_factor = dot(half_vector, half_vector);
geo_factor = geo_factor == 0.0 ? 0.0 : min(dot_product / geo_factor, 1.0);
lut_offset = lighting_lut_offset[1][2];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
refl_value.r = lut_scale_rr * lut_value;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[1].specular_0) * geo_factor) + (refl_value * light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor2.rgb) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor0.r) * (rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (const_color[1].rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(fma((texcolor1.rgb), (secondary_fragment_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(fma((texcolor1.rgb), (secondary_fragment_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4, alpha_output_4);
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
// shader: 8B30, 0AC3A335466A5F28
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
depth /= gl_FragCoord.w;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (texcolor1.rgb);
float alpha_output_0 = ByteRound(clamp((texcolor0.r) * (rounded_primary_color.r), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(mix((last_tev_out.rgb), (const_color[1].rgb), (texcolor0.aaa)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, FDEC3DF8508766CB
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
depth /= gl_FragCoord.w;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) + (const_color[0].rgb), vec3(0), vec3(1)));
float alpha_output_0 = (1.0 - texcolor0.r);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 73D285793F7A71B9
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
depth /= gl_FragCoord.w;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) + (const_color[0].rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (const_color[1].rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, E9DEB0C39CC7C2FD
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
d0_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((secondary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
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
// shader: 8B30, 927415A97E0D5ADA
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
d0_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1 * 2.0, alpha_output_1 * 1.0);
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
// shader: 8B30, 0CDE7B8F595A5B36
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
d0_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (texcolor0.a);
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((secondary_fragment_color.rgb), (secondary_fragment_color.aaa), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(min((const_color[2].rgb) + (rounded_primary_color.rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
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
// shader: 8B31, 67835C5F6BB3E883

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
layout(location=7) in vec4 vs_in_reg7;
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
texcoord0 = vec4(1,1,1,1);
texcoord12 = vec4(1,1,1,1);
view = vec4(vs_out_reg2.x,vs_out_reg2.y,vs_out_reg2.z,1);
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
bool Vfn1();
bool Vfn4();
bool Vfn6();
bool Vfn7();
bool Vfn5();
bool Vfn8();
bool Vfn9();
bool Vfn11();
bool Vfn14();
bool Vfn18();
bool Vfn19();
bool Vfn0();
vec4 tmp_reg0;
vec4 tmp_reg1;
vec4 tmp_reg2;
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

bool Vfn1() {
tmp_reg15.xyz = (mul_s(vs_pica.f[7].xxxx, vs_in_reg0)).xyz;
tmp_reg14.xyz = (mul_s(vs_pica.f[7].yyyy, vs_in_reg1)).xyz;
tmp_reg13.xyz = (mul_s(vs_pica.f[7].zzzz, vs_in_reg2)).xyz;
tmp_reg15.xyz = (vs_pica.f[6] + tmp_reg15).xyz;
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
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
Vfn4();
} else {
Vfn6();
}
vs_out_reg2 = -tmp_reg15;
vs_out_reg0.x = dot_s(vs_pica.f[86], tmp_reg15);
vs_out_reg0.y = dot_s(vs_pica.f[87], tmp_reg15);
vs_out_reg0.z = dot_s(vs_pica.f[88], tmp_reg15);
vs_out_reg0.w = dot_s(vs_pica.f[89], tmp_reg15);
return false;
}
bool Vfn4() {
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
Vfn5();
return false;
}
bool Vfn6() {
if (all(bool_regs)) {
Vfn7();
} else {
tmp_reg15.x = dot_s(vs_pica.f[90], tmp_reg10);
tmp_reg15.y = dot_s(vs_pica.f[91], tmp_reg10);
tmp_reg15.z = dot_s(vs_pica.f[92], tmp_reg10);
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
vs_out_reg1 = vs_pica.f[93].xxxx;
}
return false;
}
bool Vfn7() {
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
Vfn8();
return false;
}
bool Vfn5() {
uint jmp_to = 73u;
while (true) {
switch (jmp_to) {
case 73u:
tmp_reg6.x = dot_3(tmp_reg14.xyz, tmp_reg14.xyz);
tmp_reg7.x = dot_3(tmp_reg12.xyz, tmp_reg12.xyz);
tmp_reg6.x = rsq_s(tmp_reg6.x);
tmp_reg7.x = rsq_s(tmp_reg7.x);
tmp_reg14.xyz = (mul_s(tmp_reg14.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg12.xyz = (mul_s(tmp_reg12.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg0 = vs_pica.f[93].yxxx;
if (!vs_pica.b[3]) {
jmp_to = 89u; break;
}
tmp_reg4 = vs_pica.f[93].yyyy + tmp_reg14.zzzz;
tmp_reg4 = mul_s(vs_pica.f[94].zzzz, tmp_reg4);
bool_regs = greaterThanEqual(vs_pica.f[93].xx, tmp_reg4.xx);
tmp_reg4 = vec4(rsq_s(tmp_reg4.x));
tmp_reg5 = mul_s(vs_pica.f[94].zzzz, tmp_reg14);
if (bool_regs.x) {
jmp_to = 89u; break;
}
tmp_reg0.z = rcp_s(tmp_reg4.x);
tmp_reg0.xy = (mul_s(tmp_reg5, tmp_reg4)).xy;
case 89u:
vs_out_reg1 = tmp_reg0;
default: return false;
}
}
return false;
}
bool Vfn8() {
uint jmp_to = 90u;
while (true) {
switch (jmp_to) {
case 90u:
tmp_reg6.x = dot_3(tmp_reg14.xyz, tmp_reg14.xyz);
tmp_reg7.x = dot_3(tmp_reg12.xyz, tmp_reg12.xyz);
tmp_reg6.x = rsq_s(tmp_reg6.x);
tmp_reg7.x = rsq_s(tmp_reg7.x);
tmp_reg14.xyz = (mul_s(tmp_reg14.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg12.xyz = (mul_s(tmp_reg12.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg13.xyz = (mul_s(tmp_reg13.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg11.xyz = (mul_s(tmp_reg11.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg0 = vs_pica.f[93].yxxx;
if (!vs_pica.b[3]) {
jmp_to = 165u; break;
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
jmp_to = 127u; break;
}
tmp_reg7.xz = (tmp_reg13.wwyy + -tmp_reg14.yyww).xz;
tmp_reg7.y = (tmp_reg14.xxxx + -tmp_reg13.zzzz).y;
tmp_reg7.w = (tmp_reg6).w;
tmp_reg6 = vec4(dot_s(tmp_reg7, tmp_reg7));
tmp_reg6 = vec4(rsq_s(tmp_reg6.x));
tmp_reg0 = mul_s(tmp_reg7, tmp_reg6);
if (vs_pica.b[0]) {
jmp_to = 165u; break;
}
case 127u:
bool_regs = greaterThan(tmp_reg5.zy, tmp_reg5.yx);
if (bool_regs.x) {
Vfn9();
} else {
Vfn14();
}
tmp_reg6 = vec4(dot_s(tmp_reg8, tmp_reg8));
tmp_reg6 = vec4(rsq_s(tmp_reg6.x));
tmp_reg0 = mul_s(tmp_reg8, tmp_reg6);
case 165u:
vs_out_reg1 = tmp_reg0;
default: return false;
}
}
return false;
}
bool Vfn9() {
if (bool_regs.y) {
tmp_reg8 = mul_s(tmp_reg13.yyzw, tmp_reg6.xxxy);
tmp_reg8.x = (vs_pica.f[93].yyyy + -tmp_reg5.yyyy).x;
tmp_reg9 = tmp_reg5.zzzz + -tmp_reg5.xxxx;
tmp_reg8.yzw = (tmp_reg8 + tmp_reg14.wwxy).yzw;
tmp_reg8.x = (tmp_reg9 + tmp_reg8).x;
} else {
Vfn11();
}
tmp_reg8.w = (-tmp_reg8).w;
return false;
}
bool Vfn11() {
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
bool Vfn14() {
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
bool Vfn18() {
tmp_reg0.y = (vs_pica.f[7].wwww).y;
bool_regs = notEqual(vs_pica.f[93].xx, tmp_reg0.xy);
tmp_reg9 = vs_pica.f[21];
tmp_reg0 = mul_s(vs_pica.f[7].wwww, vs_in_reg3);
if (bool_regs.y) {
Vfn19();
}
vs_out_reg3 = max_s(vs_pica.f[93].xxxx, tmp_reg9);
return false;
}
bool Vfn19() {
if (vs_pica.b[7]) {
tmp_reg9.w = (mul_s(tmp_reg9.wwww, tmp_reg0.wwww)).w;
}
tmp_reg9.xyz = (mul_s(vs_pica.f[20].wwww, tmp_reg0.xyzz)).xyz;
tmp_reg8.x = (vs_pica.f[93].yyyy).x;
return false;
}
bool Vfn0() {
Vfn1();
Vfn18();
return true;
}
// shader: 8B30, 48E050DA75EAB0DE
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
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += ((light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
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
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 1BA60B9750FF54C4
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (const_color[0].rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (const_color[0].a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = (last_tev_out.rgb);
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) * (texcolor0.a), 0.0, 1.0));
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
// shader: 8B30, 895B1061E1F838C3
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
depth /= gl_FragCoord.w;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (rounded_primary_color.rgb);
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (const_color[0].a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (const_color[1].rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 299D93146B1BBE2D
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
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) + (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) + (const_color[0].a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B31, FAF5204C19D8EE05

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
texcoord0 = vec4(vs_out_reg2.x,vs_out_reg2.y,1,1);
texcoord12 = vec4(vs_out_reg3.x,vs_out_reg3.y,1,1);
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
bool Vfn7();
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
Vfn0();
return true;
}

bool Vfn7() {
tmp_reg2.x = rcp_s(vs_pica.f[81].y);
tmp_reg2.xy = (mul_s(vs_pica.f[2 + addr_regs.x].zwww, tmp_reg2.xxxx)).xy;
tmp_reg2.xy = (vs_pica.f[0].yyyy + tmp_reg2.xyyy).xy;
tmp_reg3.xy = (floor(tmp_reg2.xyyy)).xy;
tmp_reg2.xy = (mul_s(vs_pica.f[81].yyyy, tmp_reg3.xyyy)).xy;
tmp_reg2.xy = (vs_pica.f[2 + addr_regs.x].zwww + -tmp_reg2.xyyy).xy;
tmp_reg0.xy = (min_s(vs_pica.f[81].xxxx, -tmp_reg2.xyyy)).xy;
tmp_reg0.xy = (max_s(-vs_pica.f[81].xxxx, tmp_reg0.xyyy)).xy;
tmp_reg2 = vs_pica.f[95];
tmp_reg3 = vs_pica.f[94];
tmp_reg1.z = (mul_s(tmp_reg0.xxxx, tmp_reg0.xxxx)).z;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg2.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.zwww)).xy;
tmp_reg2 = vs_pica.f[93];
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.y = (mul_s(tmp_reg1.yyyy, tmp_reg0.xxxx)).y;
tmp_reg5.x = (vs_pica.f[5 + addr_regs.x].wwww).x;
tmp_reg14.x = (vs_in_reg0.xxxx).x;
tmp_reg14.y = (vs_in_reg0.yyyy).y;
bool_regs.x = vs_pica.f[0].xxxx.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].xxxx.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (vs_in_reg0.xxxx).x;
tmp_reg14.y = (vs_in_reg0.yyyy).y;
}
bool_regs.x = vs_pica.f[0].zzzz.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].zzzz.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (-vs_in_reg0.xxxx).x;
}
bool_regs.x = vs_pica.f[0].wwww.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].wwww.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.y = (-vs_in_reg0.yyyy).y;
}
bool_regs.x = vs_pica.f[0].wwww.x < tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].wwww.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (-vs_in_reg0.xxxx).x;
tmp_reg14.y = (-vs_in_reg0.yyyy).y;
}
tmp_reg4.xy = (mul_s(tmp_reg14.xxxx, tmp_reg1.xyyy)).xy;
tmp_reg4.x = (fma_s(-tmp_reg14.yyyy, tmp_reg1.yyyy, tmp_reg4.xxxx)).x;
tmp_reg4.y = (fma_s(tmp_reg14.yyyy, tmp_reg1.xxxx, tmp_reg4.yyyy)).y;
tmp_reg5.x = (vs_pica.f[0].yyyy + tmp_reg4.xxxx).x;
tmp_reg5.y = (-vs_pica.f[0].yyyy + tmp_reg4.yyyy).y;
tmp_reg4.z = (vs_pica.f[83].xxxx).z;
tmp_reg4.w = (-vs_pica.f[83].yyyy).w;
tmp_reg5.xy = (fma_s(tmp_reg5.xyyy, tmp_reg4.zwww, vs_pica.f[3 + addr_regs.x].xyyy)).xy;
tmp_reg4.z = (-vs_pica.f[3 + addr_regs.x].zzzz).z;
tmp_reg4.w = (-vs_pica.f[3 + addr_regs.x].wwww).w;
tmp_reg5.z = (vs_pica.f[0].zzzz + tmp_reg4.zzzz).z;
tmp_reg5.w = (vs_pica.f[0].zzzz + tmp_reg4.wwww).w;
tmp_reg5.x = (fma_s(-tmp_reg5.zzzz, tmp_reg4.xxxx, tmp_reg5.xxxx)).x;
tmp_reg5.y = (fma_s(tmp_reg5.wwww, tmp_reg4.yyyy, tmp_reg5.yyyy)).y;
tmp_reg11.xy = (tmp_reg5.xyyy).xy;
tmp_reg2 = vs_pica.f[95];
tmp_reg3 = vs_pica.f[94];
tmp_reg1.z = (mul_s(tmp_reg0.yyyy, tmp_reg0.yyyy)).z;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg2.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.zwww)).xy;
tmp_reg2 = vs_pica.f[93];
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.y = (mul_s(tmp_reg1.yyyy, tmp_reg0.yyyy)).y;
tmp_reg5.x = (vs_pica.f[6 + addr_regs.x].wwww).x;
tmp_reg14.x = (vs_in_reg0.xxxx).x;
tmp_reg14.y = (vs_in_reg0.yyyy).y;
bool_regs.x = vs_pica.f[0].xxxx.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].xxxx.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (vs_in_reg0.xxxx).x;
tmp_reg14.y = (vs_in_reg0.yyyy).y;
}
bool_regs.x = vs_pica.f[0].zzzz.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].zzzz.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (-vs_in_reg0.xxxx).x;
}
bool_regs.x = vs_pica.f[0].wwww.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].wwww.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.y = (-vs_in_reg0.yyyy).y;
}
bool_regs.x = vs_pica.f[0].wwww.x < tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].wwww.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (-vs_in_reg0.xxxx).x;
tmp_reg14.y = (-vs_in_reg0.yyyy).y;
}
tmp_reg4.xy = (mul_s(tmp_reg14.xxxx, tmp_reg1.xyyy)).xy;
tmp_reg4.x = (fma_s(-tmp_reg14.yyyy, tmp_reg1.yyyy, tmp_reg4.xxxx)).x;
tmp_reg4.y = (fma_s(tmp_reg14.yyyy, tmp_reg1.xxxx, tmp_reg4.yyyy)).y;
tmp_reg5.x = (vs_pica.f[0].yyyy + tmp_reg4.xxxx).x;
tmp_reg5.y = (-vs_pica.f[0].yyyy + tmp_reg4.yyyy).y;
tmp_reg4.z = (vs_pica.f[83].zzzz).z;
tmp_reg4.w = (-vs_pica.f[83].wwww).w;
tmp_reg5.xy = (fma_s(tmp_reg5.xyyy, tmp_reg4.zwww, vs_pica.f[4 + addr_regs.x].xyyy)).xy;
tmp_reg4.z = (-vs_pica.f[4 + addr_regs.x].zzzz).z;
tmp_reg4.w = (-vs_pica.f[4 + addr_regs.x].wwww).w;
tmp_reg5.z = (vs_pica.f[0].zzzz + tmp_reg4.zzzz).z;
tmp_reg5.w = (vs_pica.f[0].zzzz + tmp_reg4.wwww).w;
tmp_reg5.x = (fma_s(-tmp_reg5.zzzz, tmp_reg4.xxxx, tmp_reg5.xxxx)).x;
tmp_reg5.y = (fma_s(tmp_reg5.wwww, tmp_reg4.yyyy, tmp_reg5.yyyy)).y;
tmp_reg12.xy = (tmp_reg5.xyyy).xy;
return false;
}
bool Vfn0() {
addr_regs.x = (ivec2(vs_in_reg0.zz)).x;
tmp_reg10 = vs_pica.f[0].xxxz;
tmp_reg10.xy = (vs_in_reg0.xyyy).xy;
tmp_reg11 = vs_pica.f[0].xxxx;
tmp_reg12 = vs_pica.f[0].xxxx;
tmp_reg13 = vs_pica.f[0].zzzz;
tmp_reg4 = vs_pica.f[0].xxxx;
tmp_reg5 = vs_pica.f[0].xxxx;
tmp_reg10.xy = (vs_pica.f[84].xyyy + tmp_reg10.xyyy).xy;
tmp_reg10.xy = (mul_s(vs_pica.f[2 + addr_regs.x].xyyy, tmp_reg10.xyyy)).xy;
tmp_reg0 = vs_pica.f[7 + addr_regs.x];
tmp_reg6.xyz = (-tmp_reg0.xyzz).xyz;
tmp_reg6.w = (vs_pica.f[0].xxxx).w;
tmp_reg7.xyz = vec3(rcp_s(vs_pica.f[81].y));
tmp_reg8.xyz = (fma_s(tmp_reg6.xyzz, tmp_reg7.xyzz, vs_pica.f[0].yyyy)).xyz;
tmp_reg7.xyz = (floor(tmp_reg8.xyzz)).xyz;
tmp_reg6.xyz = (fma_s(tmp_reg7.xyzz, -vs_pica.f[81].yyyy, tmp_reg6.xyzz)).xyz;
tmp_reg6 = min_s(vs_pica.f[81].xxxx, tmp_reg6);
tmp_reg6 = max_s(-vs_pica.f[81].xxxx, tmp_reg6);
tmp_reg2 = vs_pica.f[95];
tmp_reg3 = vs_pica.f[94];
tmp_reg1.z = (mul_s(tmp_reg6.xxxx, tmp_reg6.xxxx)).z;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg2.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.zwww)).xy;
tmp_reg2 = vs_pica.f[93];
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.y = (mul_s(tmp_reg1.yyyy, tmp_reg6.xxxx)).y;
tmp_reg4.x = (tmp_reg1.xxxx).x;
tmp_reg5.x = (tmp_reg1.yyyy).x;
tmp_reg2 = vs_pica.f[95];
tmp_reg3 = vs_pica.f[94];
tmp_reg1.z = (mul_s(tmp_reg6.yyyy, tmp_reg6.yyyy)).z;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg2.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.zwww)).xy;
tmp_reg2 = vs_pica.f[93];
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.y = (mul_s(tmp_reg1.yyyy, tmp_reg6.yyyy)).y;
tmp_reg4.y = (tmp_reg1.xxxx).y;
tmp_reg5.y = (tmp_reg1.yyyy).y;
tmp_reg2 = vs_pica.f[95];
tmp_reg3 = vs_pica.f[94];
tmp_reg1.z = (mul_s(tmp_reg6.zzzz, tmp_reg6.zzzz)).z;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg2.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.zwww)).xy;
tmp_reg2 = vs_pica.f[93];
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.y = (mul_s(tmp_reg1.yyyy, tmp_reg6.zzzz)).y;
tmp_reg4.z = (tmp_reg1.xxxx).z;
tmp_reg5.z = (tmp_reg1.yyyy).z;
tmp_reg2.x = (mul_s(tmp_reg4.yyyy, tmp_reg5.zzzz)).x;
tmp_reg2.y = (mul_s(tmp_reg5.yyyy, tmp_reg5.zzzz)).y;
tmp_reg6.x = (mul_s(tmp_reg4.yyyy, tmp_reg4.zzzz)).x;
tmp_reg6.y = (tmp_reg5.zzzz).y;
tmp_reg6.z = (mul_s(-tmp_reg5.yyyy, tmp_reg4.zzzz)).z;
tmp_reg6.w = (vs_pica.f[0].xxxx).w;
tmp_reg7.x = (mul_s(-tmp_reg2.xxxx, tmp_reg4.xxxx)).x;
tmp_reg7.x = (fma_s(tmp_reg5.yyyy, tmp_reg5.xxxx, tmp_reg7.xxxx)).x;
tmp_reg7.y = (mul_s(tmp_reg4.zzzz, tmp_reg4.xxxx)).y;
tmp_reg7.z = (mul_s(tmp_reg2.yyyy, tmp_reg4.xxxx)).z;
tmp_reg7.z = (fma_s(tmp_reg4.yyyy, tmp_reg5.xxxx, tmp_reg7.zzzz)).z;
tmp_reg7.w = (vs_pica.f[0].xxxx).w;
tmp_reg8.x = (mul_s(tmp_reg2.xxxx, tmp_reg5.xxxx)).x;
tmp_reg8.x = (fma_s(tmp_reg5.yyyy, tmp_reg4.xxxx, tmp_reg8.xxxx)).x;
tmp_reg8.y = (mul_s(-tmp_reg4.zzzz, tmp_reg5.xxxx)).y;
tmp_reg8.z = (mul_s(-tmp_reg2.yyyy, tmp_reg5.xxxx)).z;
tmp_reg8.z = (fma_s(tmp_reg4.yyyy, tmp_reg4.xxxx, tmp_reg8.zzzz)).z;
tmp_reg8.w = (vs_pica.f[0].xxxx).w;
tmp_reg9 = vs_pica.f[0].xxxz;
tmp_reg2.x = dot_s(tmp_reg10, tmp_reg6);
tmp_reg2.y = dot_s(tmp_reg10, tmp_reg7);
tmp_reg2.z = dot_s(tmp_reg10, tmp_reg8);
tmp_reg2.w = dot_s(tmp_reg10, tmp_reg9);
tmp_reg10 = tmp_reg2;
tmp_reg6.x = (vs_pica.f[90].xxxx).x;
tmp_reg6.y = (vs_pica.f[91].xxxx).y;
tmp_reg6.z = (vs_pica.f[92].xxxx).z;
tmp_reg6.w = (vs_pica.f[0].xxxx).w;
tmp_reg7.x = (vs_pica.f[90].yyyy).x;
tmp_reg7.y = (vs_pica.f[91].yyyy).y;
tmp_reg7.z = (vs_pica.f[92].yyyy).z;
tmp_reg7.w = (vs_pica.f[0].xxxx).w;
tmp_reg8.x = (vs_pica.f[90].zzzz).x;
tmp_reg8.y = (vs_pica.f[91].zzzz).y;
tmp_reg8.z = (vs_pica.f[92].zzzz).z;
tmp_reg8.w = (vs_pica.f[0].xxxx).w;
tmp_reg9.x = (vs_pica.f[90].wwww).x;
tmp_reg9.y = (vs_pica.f[91].wwww).y;
tmp_reg9.z = (vs_pica.f[92].wwww).z;
tmp_reg9.w = (vs_pica.f[0].zzzz).w;
tmp_reg2.x = dot_s(tmp_reg10, tmp_reg6);
tmp_reg2.y = dot_s(tmp_reg10, tmp_reg7);
tmp_reg2.z = dot_s(tmp_reg10, tmp_reg8);
tmp_reg2.w = dot_s(vs_pica.f[0].xxxz, tmp_reg10);
tmp_reg3.xyz = (vs_pica.f[5 + addr_regs.x].xyzz).xyz;
tmp_reg3.xyz = (vs_pica.f[85].xyzz + -tmp_reg3.xyzz).xyz;
tmp_reg4.x = dot_3(tmp_reg3.xyz, tmp_reg3.xyz);
bool_regs.x = vs_pica.f[0].xxxx.x >= tmp_reg4.x;
bool_regs.y = vs_pica.f[0].xxxx.y == tmp_reg4.y;
if (bool_regs.x) {
tmp_reg4.x = (vs_pica.f[0].zzzz).x;
} else {
tmp_reg4.x = rsq_s(tmp_reg4.x);
}
tmp_reg3.xyz = (mul_s(tmp_reg3.xyzz, tmp_reg4.xxxx)).xyz;
tmp_reg10.xyz = (vs_pica.f[5 + addr_regs.x].xyzz + tmp_reg2.xyzz).xyz;
tmp_reg10.xyz = (fma_s(tmp_reg3.xyzz, vs_pica.f[84].zzzz, tmp_reg10.xyzz)).xyz;
tmp_reg2 = vs_pica.f[90];
tmp_reg3 = vs_pica.f[91];
tmp_reg4 = vs_pica.f[92];
tmp_reg5 = vs_pica.f[0].xxxz;
tmp_reg6 = mul_s(vs_pica.f[86].xxxx, tmp_reg2);
tmp_reg6 = fma_s(tmp_reg3, vs_pica.f[86].yyyy, tmp_reg6);
tmp_reg6 = fma_s(tmp_reg4, vs_pica.f[86].zzzz, tmp_reg6);
tmp_reg6 = fma_s(tmp_reg5, vs_pica.f[86].wwww, tmp_reg6);
tmp_reg7 = mul_s(vs_pica.f[87].xxxx, tmp_reg2);
tmp_reg7 = fma_s(tmp_reg3, vs_pica.f[87].yyyy, tmp_reg7);
tmp_reg7 = fma_s(tmp_reg4, vs_pica.f[87].zzzz, tmp_reg7);
tmp_reg7 = fma_s(tmp_reg5, vs_pica.f[87].wwww, tmp_reg7);
tmp_reg8 = mul_s(vs_pica.f[88].xxxx, tmp_reg2);
tmp_reg8 = fma_s(tmp_reg3, vs_pica.f[88].yyyy, tmp_reg8);
tmp_reg8 = fma_s(tmp_reg4, vs_pica.f[88].zzzz, tmp_reg8);
tmp_reg8 = fma_s(tmp_reg5, vs_pica.f[88].wwww, tmp_reg8);
tmp_reg9 = mul_s(vs_pica.f[89].xxxx, tmp_reg2);
tmp_reg9 = fma_s(tmp_reg3, vs_pica.f[89].yyyy, tmp_reg9);
tmp_reg9 = fma_s(tmp_reg4, vs_pica.f[89].zzzz, tmp_reg9);
tmp_reg9 = fma_s(tmp_reg5, vs_pica.f[89].wwww, tmp_reg9);
tmp_reg2 = tmp_reg10;
tmp_reg10.x = dot_s(tmp_reg2, tmp_reg6);
tmp_reg10.y = dot_s(tmp_reg2, tmp_reg7);
tmp_reg10.z = dot_s(tmp_reg2, tmp_reg8);
tmp_reg10.w = dot_s(tmp_reg2, tmp_reg9);
tmp_reg2 = vs_pica.f[1 + addr_regs.x];
tmp_reg3 = max_s(vs_pica.f[0].xxxx, tmp_reg2);
tmp_reg2 = min_s(vs_pica.f[0].zzzz, tmp_reg3);
tmp_reg13 = tmp_reg2;
Vfn7();
vs_out_reg0 = tmp_reg10;
tmp_reg13 = mul_s(vs_pica.f[82], tmp_reg13);
vs_out_reg1 = tmp_reg13;
tmp_reg11.y = (vs_pica.f[0].zzzz + -tmp_reg11.yyyy).y;
tmp_reg12.y = (vs_pica.f[0].zzzz + -tmp_reg12.yyyy).y;
tmp_reg14.y = (vs_pica.f[81].wwww).y;
tmp_reg14.x = (mul_s(vs_pica.f[0].wwww, tmp_reg14.yyyy)).x;
tmp_reg2.x = rcp_s(tmp_reg14.x);
tmp_reg14.z = (tmp_reg2.xxxx).z;
tmp_reg3.xy = (vs_pica.f[81].wwww + tmp_reg11.xyyy).xy;
tmp_reg5.xy = (mul_s(tmp_reg3.xyyy, tmp_reg14.zzzz)).xy;
tmp_reg4.xy = (floor(tmp_reg5.xyyy)).xy;
tmp_reg4.xy = (mul_s(tmp_reg4.xyyy, tmp_reg14.xxxx)).xy;
tmp_reg4.xy = (tmp_reg3.xyyy + -tmp_reg4.xyyy).xy;
tmp_reg11.xy = (-vs_pica.f[81].wwww + tmp_reg4.xyyy).xy;
tmp_reg3.xy = (vs_pica.f[81].wwww + tmp_reg12.xyyy).xy;
tmp_reg5.xy = (mul_s(tmp_reg3.xyyy, tmp_reg14.zzzz)).xy;
tmp_reg4.xy = (floor(tmp_reg5.xyyy)).xy;
tmp_reg4.xy = (mul_s(tmp_reg4.xyyy, tmp_reg14.xxxx)).xy;
tmp_reg4.xy = (tmp_reg3.xyyy + -tmp_reg4.xyyy).xy;
tmp_reg12.xy = (-vs_pica.f[81].wwww + tmp_reg4.xyyy).xy;
vs_out_reg2 = tmp_reg11;
vs_out_reg3 = tmp_reg12;
return true;
}
// shader: 8B30, 654F77C7685FDF16
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
depth /= gl_FragCoord.w;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (texcolor1.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor0.r) + (texcolor1.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) - (1.0 - rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1 * 1.0, alpha_output_1 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp((vec3(1) - combiner_buffer.rgb) * (const_color[2].rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) + (combiner_buffer.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, FE419FE67868D9C9
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
depth /= gl_FragCoord.w;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (texcolor0.rgb);
float alpha_output_0 = (texcolor0.r);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp((vec3(1) - combiner_buffer.rgb) * (const_color[2].rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) + (combiner_buffer.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B31, F42B212618922492

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
texcoord0 = vec4(vs_out_reg2.x,vs_out_reg2.y,1,1);
texcoord12 = vec4(vs_out_reg3.x,vs_out_reg3.y,1,1);
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
bool Vfn10();
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
Vfn0();
return true;
}

bool Vfn10() {
tmp_reg2.x = rcp_s(vs_pica.f[81].y);
tmp_reg2.xy = (mul_s(vs_pica.f[2].zwww, tmp_reg2.xxxx)).xy;
tmp_reg2.xy = (vs_pica.f[0].yyyy + tmp_reg2.xyyy).xy;
tmp_reg3.xy = (floor(tmp_reg2.xyyy)).xy;
tmp_reg2.xy = (mul_s(vs_pica.f[81].yyyy, tmp_reg3.xyyy)).xy;
tmp_reg2.xy = (vs_pica.f[2].zwww + -tmp_reg2.xyyy).xy;
tmp_reg0.xy = (min_s(vs_pica.f[81].xxxx, tmp_reg2.xyyy)).xy;
tmp_reg0.xy = (max_s(-vs_pica.f[81].xxxx, tmp_reg0.xyyy)).xy;
tmp_reg2 = vs_pica.f[95];
tmp_reg3 = vs_pica.f[94];
tmp_reg1.z = (mul_s(tmp_reg0.xxxx, tmp_reg0.xxxx)).z;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg2.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.zwww)).xy;
tmp_reg2 = vs_pica.f[93];
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.y = (mul_s(tmp_reg1.yyyy, tmp_reg0.xxxx)).y;
tmp_reg5.x = (vs_pica.f[5].wwww).x;
tmp_reg14.xy = (vs_in_reg1.xyyy).xy;
bool_regs.x = vs_pica.f[0].xxxx.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].xxxx.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.xy = (vs_in_reg1.xyyy).xy;
}
bool_regs.x = vs_pica.f[0].zzzz.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].zzzz.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (vs_pica.f[0].zzzz + -vs_in_reg1.xxxx).x;
}
bool_regs.x = vs_pica.f[0].wwww.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].wwww.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.y = (vs_pica.f[0].zzzz + -vs_in_reg1.yyyy).y;
}
bool_regs.x = vs_pica.f[0].wwww.x < tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].wwww.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (vs_pica.f[0].zzzz + -vs_in_reg1.xxxx).x;
tmp_reg14.y = (vs_pica.f[0].zzzz + -vs_in_reg1.yyyy).y;
}
tmp_reg3 = tmp_reg14.xyxy;
tmp_reg3.y = (vs_pica.f[0].zzzz + -tmp_reg3.yyyy).y;
tmp_reg3.w = (vs_pica.f[0].zzzz + -tmp_reg3.wwww).w;
tmp_reg2 = mul_s(vs_pica.f[83].xxyy, tmp_reg3);
tmp_reg2 = -vs_pica.f[0].yyyy + tmp_reg2;
tmp_reg2 = mul_s(tmp_reg2, tmp_reg1.xyyx);
tmp_reg2.x = (tmp_reg2.xxxx + -tmp_reg2.yyyy).x;
tmp_reg2.y = (tmp_reg2.zzzz + tmp_reg2.wwww).y;
tmp_reg4.xy = (vs_pica.f[3].xyyy).xy;
tmp_reg3.xy = (fma_s(tmp_reg2.xyyy, vs_pica.f[3].zwww, tmp_reg4.xyyy)).xy;
tmp_reg3.xy = (vs_pica.f[0].yyyy + tmp_reg3.xyyy).xy;
tmp_reg11.xy = (tmp_reg3.xyyy).xy;
tmp_reg2 = vs_pica.f[95];
tmp_reg3 = vs_pica.f[94];
tmp_reg1.z = (mul_s(tmp_reg0.yyyy, tmp_reg0.yyyy)).z;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg2.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.zwww)).xy;
tmp_reg2 = vs_pica.f[93];
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.y = (mul_s(tmp_reg1.yyyy, tmp_reg0.yyyy)).y;
tmp_reg5.x = (vs_pica.f[6].wwww).x;
tmp_reg14.xy = (vs_in_reg1.xyyy).xy;
bool_regs.x = vs_pica.f[0].xxxx.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].xxxx.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.xy = (vs_in_reg1.xyyy).xy;
}
bool_regs.x = vs_pica.f[0].zzzz.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].zzzz.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (vs_pica.f[0].zzzz + -vs_in_reg1.xxxx).x;
}
bool_regs.x = vs_pica.f[0].wwww.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].wwww.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.y = (vs_pica.f[0].zzzz + -vs_in_reg1.yyyy).y;
}
bool_regs.x = vs_pica.f[0].wwww.x < tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].wwww.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (vs_pica.f[0].zzzz + -vs_in_reg1.xxxx).x;
tmp_reg14.y = (vs_pica.f[0].zzzz + -vs_in_reg1.yyyy).y;
}
tmp_reg3 = tmp_reg14.xyxy;
tmp_reg3.y = (vs_pica.f[0].zzzz + -tmp_reg3.yyyy).y;
tmp_reg3.w = (vs_pica.f[0].zzzz + -tmp_reg3.wwww).w;
tmp_reg2 = mul_s(vs_pica.f[83].zzww, tmp_reg3);
tmp_reg2 = -vs_pica.f[0].yyyy + tmp_reg2;
tmp_reg2 = mul_s(tmp_reg2, tmp_reg1.xyyx);
tmp_reg2.x = (tmp_reg2.xxxx + -tmp_reg2.yyyy).x;
tmp_reg2.y = (tmp_reg2.zzzz + tmp_reg2.wwww).y;
tmp_reg4.xy = (vs_pica.f[4].xyyy).xy;
tmp_reg3.xy = (fma_s(tmp_reg2.xyyy, vs_pica.f[4].zwww, tmp_reg4.xyyy)).xy;
tmp_reg3.xy = (vs_pica.f[0].yyyy + tmp_reg3.xyyy).xy;
tmp_reg12.xy = (tmp_reg3.xyyy).xy;
return false;
}
bool Vfn0() {
tmp_reg10 = vs_pica.f[0].xxxz;
tmp_reg10.xyz = (vs_in_reg0.xyzz).xyz;
tmp_reg11 = vs_pica.f[0].xxxx;
tmp_reg12 = vs_pica.f[0].xxxx;
tmp_reg11.xy = (vs_in_reg1.xyyy).xy;
tmp_reg13 = vs_pica.f[0].zzzz;
tmp_reg4 = vs_pica.f[0].xxxx;
tmp_reg5 = vs_pica.f[0].xxxx;
tmp_reg10.xy = (vs_pica.f[84].xyyy + tmp_reg10.xyyy).xy;
tmp_reg10.xyz = (mul_s(vs_pica.f[2].xyxx, tmp_reg10.xyzz)).xyz;
tmp_reg1.xyz = (vs_pica.f[92].xyzz).xyz;
tmp_reg1.w = (vs_pica.f[0].xxxx).w;
tmp_reg2.xyz = (-tmp_reg1.xyzz).xyz;
tmp_reg3.xyz = (vs_pica.f[6].xyzz).xyz;
tmp_reg4.x = dot_3(tmp_reg3.xyz, tmp_reg3.xyz);
bool_regs.x = vs_pica.f[0].xxxx.x >= tmp_reg4.x;
bool_regs.y = vs_pica.f[0].xxxx.y == tmp_reg4.y;
if (bool_regs.x) {
tmp_reg4.x = (vs_pica.f[0].zzzz).x;
} else {
tmp_reg4.x = rsq_s(tmp_reg4.x);
}
tmp_reg3.xyz = (mul_s(tmp_reg3.xyzz, tmp_reg4.xxxx)).xyz;
tmp_reg4.xyz = (mul_s(tmp_reg2.yzxx, tmp_reg3.zxyy)).xyz;
tmp_reg4.xyz = (fma_s(-tmp_reg3.yzxx, tmp_reg2.zxyy, tmp_reg4)).xyz;
tmp_reg5.x = dot_3(tmp_reg4.xyz, tmp_reg4.xyz);
bool_regs.x = vs_pica.f[0].xxxx.x >= tmp_reg5.x;
bool_regs.y = vs_pica.f[0].xxxx.y == tmp_reg5.y;
if (bool_regs.x) {
tmp_reg5.x = (vs_pica.f[0].zzzz).x;
} else {
tmp_reg5.x = rsq_s(tmp_reg5.x);
}
tmp_reg4.xyz = (mul_s(tmp_reg4.xyzz, tmp_reg5.xxxx)).xyz;
tmp_reg5.xyz = (mul_s(tmp_reg4.yzxx, tmp_reg3.zxyy)).xyz;
tmp_reg5.xyz = (fma_s(-tmp_reg3.yzxx, tmp_reg4.zxyy, tmp_reg5)).xyz;
tmp_reg6.x = (tmp_reg4.xxxx).x;
tmp_reg6.y = (tmp_reg3.xxxx).y;
tmp_reg6.z = (tmp_reg5.xxxx).z;
tmp_reg6.w = (vs_pica.f[0].xxxx).w;
tmp_reg7.x = (tmp_reg4.yyyy).x;
tmp_reg7.y = (tmp_reg3.yyyy).y;
tmp_reg7.z = (tmp_reg5.yyyy).z;
tmp_reg7.w = (vs_pica.f[0].xxxx).w;
tmp_reg8.x = (tmp_reg4.zzzz).x;
tmp_reg8.y = (tmp_reg3.zzzz).y;
tmp_reg8.z = (tmp_reg5.zzzz).z;
tmp_reg8.w = (vs_pica.f[0].xxxx).w;
tmp_reg9 = vs_pica.f[0].xxxz;
tmp_reg2.x = dot_s(tmp_reg10, tmp_reg6);
tmp_reg2.y = dot_s(tmp_reg10, tmp_reg7);
tmp_reg2.z = dot_s(tmp_reg10, tmp_reg8);
tmp_reg2.w = dot_s(tmp_reg10, tmp_reg9);
tmp_reg3.xyz = (vs_pica.f[5].xyzz).xyz;
tmp_reg3.xyz = (-vs_pica.f[85].xyzz + tmp_reg3.xyzz).xyz;
tmp_reg4.x = dot_3(tmp_reg3.xyz, tmp_reg3.xyz);
bool_regs.x = vs_pica.f[0].xxxx.x >= tmp_reg4.x;
bool_regs.y = vs_pica.f[0].xxxx.y == tmp_reg4.y;
if (bool_regs.x) {
tmp_reg4.x = (vs_pica.f[0].zzzz).x;
} else {
tmp_reg4.x = rsq_s(tmp_reg4.x);
}
tmp_reg3.xyz = (mul_s(tmp_reg3.xyzz, tmp_reg4.xxxx)).xyz;
tmp_reg10.xyz = (vs_pica.f[5].xyzz + tmp_reg2.xyzz).xyz;
tmp_reg10.xyz = (fma_s(tmp_reg3.xyzz, -vs_pica.f[84].zzzz, tmp_reg10.xyzz)).xyz;
tmp_reg2 = vs_pica.f[90];
tmp_reg3 = vs_pica.f[91];
tmp_reg4 = vs_pica.f[92];
tmp_reg5 = vs_pica.f[0].xxxz;
tmp_reg6 = mul_s(vs_pica.f[86].xxxx, tmp_reg2);
tmp_reg6 = fma_s(tmp_reg3, vs_pica.f[86].yyyy, tmp_reg6);
tmp_reg6 = fma_s(tmp_reg4, vs_pica.f[86].zzzz, tmp_reg6);
tmp_reg6 = fma_s(tmp_reg5, vs_pica.f[86].wwww, tmp_reg6);
tmp_reg7 = mul_s(vs_pica.f[87].xxxx, tmp_reg2);
tmp_reg7 = fma_s(tmp_reg3, vs_pica.f[87].yyyy, tmp_reg7);
tmp_reg7 = fma_s(tmp_reg4, vs_pica.f[87].zzzz, tmp_reg7);
tmp_reg7 = fma_s(tmp_reg5, vs_pica.f[87].wwww, tmp_reg7);
tmp_reg8 = mul_s(vs_pica.f[88].xxxx, tmp_reg2);
tmp_reg8 = fma_s(tmp_reg3, vs_pica.f[88].yyyy, tmp_reg8);
tmp_reg8 = fma_s(tmp_reg4, vs_pica.f[88].zzzz, tmp_reg8);
tmp_reg8 = fma_s(tmp_reg5, vs_pica.f[88].wwww, tmp_reg8);
tmp_reg9 = mul_s(vs_pica.f[89].xxxx, tmp_reg2);
tmp_reg9 = fma_s(tmp_reg3, vs_pica.f[89].yyyy, tmp_reg9);
tmp_reg9 = fma_s(tmp_reg4, vs_pica.f[89].zzzz, tmp_reg9);
tmp_reg9 = fma_s(tmp_reg5, vs_pica.f[89].wwww, tmp_reg9);
tmp_reg2 = tmp_reg10;
tmp_reg10.x = dot_s(tmp_reg2, tmp_reg6);
tmp_reg10.y = dot_s(tmp_reg2, tmp_reg7);
tmp_reg10.z = dot_s(tmp_reg2, tmp_reg8);
tmp_reg10.w = dot_s(tmp_reg2, tmp_reg9);
tmp_reg2 = vs_pica.f[1];
tmp_reg3 = max_s(vs_pica.f[0].xxxx, tmp_reg2);
tmp_reg2 = min_s(vs_pica.f[0].zzzz, tmp_reg3);
tmp_reg13 = tmp_reg2;
Vfn10();
vs_out_reg0 = tmp_reg10;
tmp_reg13 = mul_s(vs_pica.f[82], tmp_reg13);
vs_out_reg1 = mul_s(vs_in_reg2, tmp_reg13);
tmp_reg11.y = (vs_pica.f[0].zzzz + -tmp_reg11.yyyy).y;
tmp_reg12.y = (vs_pica.f[0].zzzz + -tmp_reg12.yyyy).y;
tmp_reg14.y = (vs_pica.f[81].wwww).y;
tmp_reg14.x = (mul_s(vs_pica.f[0].wwww, tmp_reg14.yyyy)).x;
tmp_reg2.x = rcp_s(tmp_reg14.x);
tmp_reg14.z = (tmp_reg2.xxxx).z;
tmp_reg3.xy = (vs_pica.f[81].wwww + tmp_reg11.xyyy).xy;
tmp_reg5.xy = (mul_s(tmp_reg3.xyyy, tmp_reg14.zzzz)).xy;
tmp_reg4.xy = (floor(tmp_reg5.xyyy)).xy;
tmp_reg4.xy = (mul_s(tmp_reg4.xyyy, tmp_reg14.xxxx)).xy;
tmp_reg4.xy = (tmp_reg3.xyyy + -tmp_reg4.xyyy).xy;
tmp_reg11.xy = (-vs_pica.f[81].wwww + tmp_reg4.xyyy).xy;
tmp_reg3.xy = (vs_pica.f[81].wwww + tmp_reg12.xyyy).xy;
tmp_reg5.xy = (mul_s(tmp_reg3.xyyy, tmp_reg14.zzzz)).xy;
tmp_reg4.xy = (floor(tmp_reg5.xyyy)).xy;
tmp_reg4.xy = (mul_s(tmp_reg4.xyyy, tmp_reg14.xxxx)).xy;
tmp_reg4.xy = (tmp_reg3.xyyy + -tmp_reg4.xyyy).xy;
tmp_reg12.xy = (-vs_pica.f[81].wwww + tmp_reg4.xyyy).xy;
vs_out_reg2 = tmp_reg11;
vs_out_reg3 = tmp_reg12;
return true;
}
// shader: 8B31, 2F3C73A7BC805FD9

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
texcoord0 = vec4(vs_out_reg2.x,vs_out_reg2.y,1,1);
texcoord12 = vec4(vs_out_reg3.x,vs_out_reg3.y,1,1);
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
bool Vfn10();
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
Vfn0();
return true;
}

bool Vfn10() {
tmp_reg2.x = rcp_s(vs_pica.f[81].y);
tmp_reg2.xy = (mul_s(vs_pica.f[2 + addr_regs.x].zwww, tmp_reg2.xxxx)).xy;
tmp_reg2.xy = (vs_pica.f[0].yyyy + tmp_reg2.xyyy).xy;
tmp_reg3.xy = (floor(tmp_reg2.xyyy)).xy;
tmp_reg2.xy = (mul_s(vs_pica.f[81].yyyy, tmp_reg3.xyyy)).xy;
tmp_reg2.xy = (vs_pica.f[2 + addr_regs.x].zwww + -tmp_reg2.xyyy).xy;
tmp_reg0.xy = (min_s(vs_pica.f[81].xxxx, -tmp_reg2.xyyy)).xy;
tmp_reg0.xy = (max_s(-vs_pica.f[81].xxxx, tmp_reg0.xyyy)).xy;
tmp_reg2 = vs_pica.f[95];
tmp_reg3 = vs_pica.f[94];
tmp_reg1.z = (mul_s(tmp_reg0.xxxx, tmp_reg0.xxxx)).z;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg2.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.zwww)).xy;
tmp_reg2 = vs_pica.f[93];
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.y = (mul_s(tmp_reg1.yyyy, tmp_reg0.xxxx)).y;
tmp_reg5.x = (vs_pica.f[5 + addr_regs.x].wwww).x;
tmp_reg14.x = (vs_in_reg0.xxxx).x;
tmp_reg14.y = (vs_in_reg0.yyyy).y;
bool_regs.x = vs_pica.f[0].xxxx.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].xxxx.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (vs_in_reg0.xxxx).x;
tmp_reg14.y = (vs_in_reg0.yyyy).y;
}
bool_regs.x = vs_pica.f[0].zzzz.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].zzzz.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (-vs_in_reg0.xxxx).x;
}
bool_regs.x = vs_pica.f[0].wwww.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].wwww.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.y = (-vs_in_reg0.yyyy).y;
}
bool_regs.x = vs_pica.f[0].wwww.x < tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].wwww.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (-vs_in_reg0.xxxx).x;
tmp_reg14.y = (-vs_in_reg0.yyyy).y;
}
tmp_reg4.xy = (mul_s(tmp_reg14.xxxx, tmp_reg1.xyyy)).xy;
tmp_reg4.x = (fma_s(-tmp_reg14.yyyy, tmp_reg1.yyyy, tmp_reg4.xxxx)).x;
tmp_reg4.y = (fma_s(tmp_reg14.yyyy, tmp_reg1.xxxx, tmp_reg4.yyyy)).y;
tmp_reg5.x = (vs_pica.f[0].yyyy + tmp_reg4.xxxx).x;
tmp_reg5.y = (-vs_pica.f[0].yyyy + tmp_reg4.yyyy).y;
tmp_reg4.z = (vs_pica.f[83].xxxx).z;
tmp_reg4.w = (-vs_pica.f[83].yyyy).w;
tmp_reg5.xy = (fma_s(tmp_reg5.xyyy, tmp_reg4.zwww, vs_pica.f[3 + addr_regs.x].xyyy)).xy;
tmp_reg4.z = (-vs_pica.f[3 + addr_regs.x].zzzz).z;
tmp_reg4.w = (-vs_pica.f[3 + addr_regs.x].wwww).w;
tmp_reg5.z = (vs_pica.f[0].zzzz + tmp_reg4.zzzz).z;
tmp_reg5.w = (vs_pica.f[0].zzzz + tmp_reg4.wwww).w;
tmp_reg5.x = (fma_s(-tmp_reg5.zzzz, tmp_reg4.xxxx, tmp_reg5.xxxx)).x;
tmp_reg5.y = (fma_s(tmp_reg5.wwww, tmp_reg4.yyyy, tmp_reg5.yyyy)).y;
tmp_reg11.xy = (tmp_reg5.xyyy).xy;
tmp_reg2 = vs_pica.f[95];
tmp_reg3 = vs_pica.f[94];
tmp_reg1.z = (mul_s(tmp_reg0.yyyy, tmp_reg0.yyyy)).z;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg2.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.zwww)).xy;
tmp_reg2 = vs_pica.f[93];
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.y = (mul_s(tmp_reg1.yyyy, tmp_reg0.yyyy)).y;
tmp_reg5.x = (vs_pica.f[6 + addr_regs.x].wwww).x;
tmp_reg14.x = (vs_in_reg0.xxxx).x;
tmp_reg14.y = (vs_in_reg0.yyyy).y;
bool_regs.x = vs_pica.f[0].xxxx.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].xxxx.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (vs_in_reg0.xxxx).x;
tmp_reg14.y = (vs_in_reg0.yyyy).y;
}
bool_regs.x = vs_pica.f[0].zzzz.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].zzzz.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (-vs_in_reg0.xxxx).x;
}
bool_regs.x = vs_pica.f[0].wwww.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].wwww.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.y = (-vs_in_reg0.yyyy).y;
}
bool_regs.x = vs_pica.f[0].wwww.x < tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].wwww.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (-vs_in_reg0.xxxx).x;
tmp_reg14.y = (-vs_in_reg0.yyyy).y;
}
tmp_reg4.xy = (mul_s(tmp_reg14.xxxx, tmp_reg1.xyyy)).xy;
tmp_reg4.x = (fma_s(-tmp_reg14.yyyy, tmp_reg1.yyyy, tmp_reg4.xxxx)).x;
tmp_reg4.y = (fma_s(tmp_reg14.yyyy, tmp_reg1.xxxx, tmp_reg4.yyyy)).y;
tmp_reg5.x = (vs_pica.f[0].yyyy + tmp_reg4.xxxx).x;
tmp_reg5.y = (-vs_pica.f[0].yyyy + tmp_reg4.yyyy).y;
tmp_reg4.z = (vs_pica.f[83].zzzz).z;
tmp_reg4.w = (-vs_pica.f[83].wwww).w;
tmp_reg5.xy = (fma_s(tmp_reg5.xyyy, tmp_reg4.zwww, vs_pica.f[4 + addr_regs.x].xyyy)).xy;
tmp_reg4.z = (-vs_pica.f[4 + addr_regs.x].zzzz).z;
tmp_reg4.w = (-vs_pica.f[4 + addr_regs.x].wwww).w;
tmp_reg5.z = (vs_pica.f[0].zzzz + tmp_reg4.zzzz).z;
tmp_reg5.w = (vs_pica.f[0].zzzz + tmp_reg4.wwww).w;
tmp_reg5.x = (fma_s(-tmp_reg5.zzzz, tmp_reg4.xxxx, tmp_reg5.xxxx)).x;
tmp_reg5.y = (fma_s(tmp_reg5.wwww, tmp_reg4.yyyy, tmp_reg5.yyyy)).y;
tmp_reg12.xy = (tmp_reg5.xyyy).xy;
return false;
}
bool Vfn0() {
addr_regs.x = (ivec2(vs_in_reg0.zz)).x;
tmp_reg10 = vs_pica.f[0].xxxz;
tmp_reg10.xy = (vs_in_reg0.xyyy).xy;
tmp_reg11 = vs_pica.f[0].xxxx;
tmp_reg12 = vs_pica.f[0].xxxx;
tmp_reg13 = vs_pica.f[0].zzzz;
tmp_reg4 = vs_pica.f[0].xxxx;
tmp_reg5 = vs_pica.f[0].xxxx;
tmp_reg10.xy = (vs_pica.f[84].xyyy + tmp_reg10.xyyy).xy;
tmp_reg10.xy = (mul_s(vs_pica.f[2 + addr_regs.x].xyyy, tmp_reg10.xyyy)).xy;
tmp_reg14 = tmp_reg10;
tmp_reg0 = vs_pica.f[7 + addr_regs.x];
tmp_reg6.xyz = (-tmp_reg0.xyzz).xyz;
tmp_reg6.w = (vs_pica.f[0].xxxx).w;
tmp_reg7.xyz = vec3(rcp_s(vs_pica.f[81].y));
tmp_reg8.xyz = (fma_s(tmp_reg6.xyzz, tmp_reg7.xyzz, vs_pica.f[0].yyyy)).xyz;
tmp_reg7.xyz = (floor(tmp_reg8.xyzz)).xyz;
tmp_reg6.xyz = (fma_s(tmp_reg7.xyzz, -vs_pica.f[81].yyyy, tmp_reg6.xyzz)).xyz;
tmp_reg6 = min_s(vs_pica.f[81].xxxx, tmp_reg6);
tmp_reg6 = max_s(-vs_pica.f[81].xxxx, tmp_reg6);
tmp_reg2 = vs_pica.f[95];
tmp_reg3 = vs_pica.f[94];
tmp_reg1.z = (mul_s(tmp_reg6.xxxx, tmp_reg6.xxxx)).z;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg2.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.zwww)).xy;
tmp_reg2 = vs_pica.f[93];
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.y = (mul_s(tmp_reg1.yyyy, tmp_reg6.xxxx)).y;
tmp_reg4.x = (tmp_reg1.xxxx).x;
tmp_reg5.x = (tmp_reg1.yyyy).x;
tmp_reg2 = vs_pica.f[95];
tmp_reg3 = vs_pica.f[94];
tmp_reg1.z = (mul_s(tmp_reg6.yyyy, tmp_reg6.yyyy)).z;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg2.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.zwww)).xy;
tmp_reg2 = vs_pica.f[93];
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.y = (mul_s(tmp_reg1.yyyy, tmp_reg6.yyyy)).y;
tmp_reg4.y = (tmp_reg1.xxxx).y;
tmp_reg5.y = (tmp_reg1.yyyy).y;
tmp_reg2 = vs_pica.f[95];
tmp_reg3 = vs_pica.f[94];
tmp_reg1.z = (mul_s(tmp_reg6.zzzz, tmp_reg6.zzzz)).z;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg2.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.zwww)).xy;
tmp_reg2 = vs_pica.f[93];
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.y = (mul_s(tmp_reg1.yyyy, tmp_reg6.zzzz)).y;
tmp_reg4.z = (tmp_reg1.xxxx).z;
tmp_reg5.z = (tmp_reg1.yyyy).z;
tmp_reg2.x = (mul_s(tmp_reg4.yyyy, tmp_reg5.zzzz)).x;
tmp_reg2.y = (mul_s(tmp_reg5.yyyy, tmp_reg5.zzzz)).y;
tmp_reg6.x = (mul_s(tmp_reg4.yyyy, tmp_reg4.zzzz)).x;
tmp_reg6.y = (tmp_reg5.zzzz).y;
tmp_reg6.z = (mul_s(-tmp_reg5.yyyy, tmp_reg4.zzzz)).z;
tmp_reg6.w = (vs_pica.f[0].xxxx).w;
tmp_reg7.x = (mul_s(-tmp_reg2.xxxx, tmp_reg4.xxxx)).x;
tmp_reg7.x = (fma_s(tmp_reg5.yyyy, tmp_reg5.xxxx, tmp_reg7.xxxx)).x;
tmp_reg7.y = (mul_s(tmp_reg4.zzzz, tmp_reg4.xxxx)).y;
tmp_reg7.z = (mul_s(tmp_reg2.yyyy, tmp_reg4.xxxx)).z;
tmp_reg7.z = (fma_s(tmp_reg4.yyyy, tmp_reg5.xxxx, tmp_reg7.zzzz)).z;
tmp_reg7.w = (vs_pica.f[0].xxxx).w;
tmp_reg8.x = (mul_s(tmp_reg2.xxxx, tmp_reg5.xxxx)).x;
tmp_reg8.x = (fma_s(tmp_reg5.yyyy, tmp_reg4.xxxx, tmp_reg8.xxxx)).x;
tmp_reg8.y = (mul_s(-tmp_reg4.zzzz, tmp_reg5.xxxx)).y;
tmp_reg8.z = (mul_s(-tmp_reg2.yyyy, tmp_reg5.xxxx)).z;
tmp_reg8.z = (fma_s(tmp_reg4.yyyy, tmp_reg4.xxxx, tmp_reg8.zzzz)).z;
tmp_reg8.w = (vs_pica.f[0].xxxx).w;
tmp_reg9 = vs_pica.f[0].xxxz;
tmp_reg10.x = dot_s(tmp_reg14, tmp_reg6);
tmp_reg10.y = dot_s(tmp_reg14, tmp_reg7);
tmp_reg10.z = dot_s(tmp_reg14, tmp_reg8);
tmp_reg10.w = dot_s(tmp_reg14, tmp_reg9);
tmp_reg2.x = (vs_pica.f[8 + addr_regs.x].yyyy).x;
tmp_reg2.y = (vs_pica.f[9 + addr_regs.x].yyyy).y;
tmp_reg2.z = (vs_pica.f[10 + addr_regs.x].yyyy).z;
tmp_reg3.xyz = (vs_pica.f[6 + addr_regs.x].xyzz).xyz;
tmp_reg4.x = dot_3(tmp_reg3.xyz, tmp_reg3.xyz);
bool_regs.x = vs_pica.f[0].xxxx.x >= tmp_reg4.x;
bool_regs.y = vs_pica.f[0].xxxx.y == tmp_reg4.y;
if (bool_regs.x) {
tmp_reg4.x = (vs_pica.f[0].zzzz).x;
} else {
tmp_reg4.x = rsq_s(tmp_reg4.x);
}
tmp_reg3.xyz = (mul_s(tmp_reg3.xyzz, tmp_reg4.xxxx)).xyz;
tmp_reg4.xyz = (mul_s(tmp_reg2.yzxx, tmp_reg3.zxyy)).xyz;
tmp_reg4.xyz = (fma_s(-tmp_reg3.yzxx, tmp_reg2.zxyy, tmp_reg4)).xyz;
tmp_reg5.x = dot_3(tmp_reg4.xyz, tmp_reg4.xyz);
bool_regs.x = vs_pica.f[0].xxxx.x >= tmp_reg5.x;
bool_regs.y = vs_pica.f[0].xxxx.y == tmp_reg5.y;
if (bool_regs.x) {
tmp_reg5.x = (vs_pica.f[0].zzzz).x;
} else {
tmp_reg5.x = rsq_s(tmp_reg5.x);
}
tmp_reg4.xyz = (mul_s(tmp_reg4.xyzz, tmp_reg5.xxxx)).xyz;
tmp_reg5.xyz = (mul_s(tmp_reg4.yzxx, tmp_reg3.zxyy)).xyz;
tmp_reg5.xyz = (fma_s(-tmp_reg3.yzxx, tmp_reg4.zxyy, tmp_reg5)).xyz;
tmp_reg6.x = (tmp_reg4.xxxx).x;
tmp_reg6.y = (tmp_reg3.xxxx).y;
tmp_reg6.z = (tmp_reg5.xxxx).z;
tmp_reg6.w = (vs_pica.f[0].xxxx).w;
tmp_reg7.x = (tmp_reg4.yyyy).x;
tmp_reg7.y = (tmp_reg3.yyyy).y;
tmp_reg7.z = (tmp_reg5.yyyy).z;
tmp_reg7.w = (vs_pica.f[0].xxxx).w;
tmp_reg8.x = (tmp_reg4.zzzz).x;
tmp_reg8.y = (tmp_reg3.zzzz).y;
tmp_reg8.z = (tmp_reg5.zzzz).z;
tmp_reg8.w = (vs_pica.f[0].xxxx).w;
tmp_reg9 = vs_pica.f[0].xxxz;
tmp_reg2.x = dot_s(tmp_reg10, tmp_reg6);
tmp_reg2.y = dot_s(tmp_reg10, tmp_reg7);
tmp_reg2.z = dot_s(tmp_reg10, tmp_reg8);
tmp_reg2.w = dot_s(tmp_reg10, tmp_reg9);
tmp_reg3.xyz = (vs_pica.f[5 + addr_regs.x].xyzz).xyz;
tmp_reg3.xyz = (vs_pica.f[85].xyzz + -tmp_reg3.xyzz).xyz;
tmp_reg4.x = dot_3(tmp_reg3.xyz, tmp_reg3.xyz);
bool_regs.x = vs_pica.f[0].xxxx.x >= tmp_reg4.x;
bool_regs.y = vs_pica.f[0].xxxx.y == tmp_reg4.y;
if (bool_regs.x) {
tmp_reg4.x = (vs_pica.f[0].zzzz).x;
} else {
tmp_reg4.x = rsq_s(tmp_reg4.x);
}
tmp_reg3.xyz = (mul_s(tmp_reg3.xyzz, tmp_reg4.xxxx)).xyz;
tmp_reg10.xyz = (vs_pica.f[5 + addr_regs.x].xyzz + tmp_reg2.xyzz).xyz;
tmp_reg10.xyz = (fma_s(tmp_reg3.xyzz, vs_pica.f[84].zzzz, tmp_reg10.xyzz)).xyz;
tmp_reg2 = vs_pica.f[90];
tmp_reg3 = vs_pica.f[91];
tmp_reg4 = vs_pica.f[92];
tmp_reg5 = vs_pica.f[0].xxxz;
tmp_reg6 = mul_s(vs_pica.f[86].xxxx, tmp_reg2);
tmp_reg6 = fma_s(tmp_reg3, vs_pica.f[86].yyyy, tmp_reg6);
tmp_reg6 = fma_s(tmp_reg4, vs_pica.f[86].zzzz, tmp_reg6);
tmp_reg6 = fma_s(tmp_reg5, vs_pica.f[86].wwww, tmp_reg6);
tmp_reg7 = mul_s(vs_pica.f[87].xxxx, tmp_reg2);
tmp_reg7 = fma_s(tmp_reg3, vs_pica.f[87].yyyy, tmp_reg7);
tmp_reg7 = fma_s(tmp_reg4, vs_pica.f[87].zzzz, tmp_reg7);
tmp_reg7 = fma_s(tmp_reg5, vs_pica.f[87].wwww, tmp_reg7);
tmp_reg8 = mul_s(vs_pica.f[88].xxxx, tmp_reg2);
tmp_reg8 = fma_s(tmp_reg3, vs_pica.f[88].yyyy, tmp_reg8);
tmp_reg8 = fma_s(tmp_reg4, vs_pica.f[88].zzzz, tmp_reg8);
tmp_reg8 = fma_s(tmp_reg5, vs_pica.f[88].wwww, tmp_reg8);
tmp_reg9 = mul_s(vs_pica.f[89].xxxx, tmp_reg2);
tmp_reg9 = fma_s(tmp_reg3, vs_pica.f[89].yyyy, tmp_reg9);
tmp_reg9 = fma_s(tmp_reg4, vs_pica.f[89].zzzz, tmp_reg9);
tmp_reg9 = fma_s(tmp_reg5, vs_pica.f[89].wwww, tmp_reg9);
tmp_reg2 = tmp_reg10;
tmp_reg10.x = dot_s(tmp_reg2, tmp_reg6);
tmp_reg10.y = dot_s(tmp_reg2, tmp_reg7);
tmp_reg10.z = dot_s(tmp_reg2, tmp_reg8);
tmp_reg10.w = dot_s(tmp_reg2, tmp_reg9);
tmp_reg2 = vs_pica.f[1 + addr_regs.x];
tmp_reg3 = max_s(vs_pica.f[0].xxxx, tmp_reg2);
tmp_reg2 = min_s(vs_pica.f[0].zzzz, tmp_reg3);
tmp_reg13 = tmp_reg2;
Vfn10();
vs_out_reg0 = tmp_reg10;
tmp_reg13 = mul_s(vs_pica.f[82], tmp_reg13);
vs_out_reg1 = tmp_reg13;
tmp_reg11.y = (vs_pica.f[0].zzzz + -tmp_reg11.yyyy).y;
tmp_reg12.y = (vs_pica.f[0].zzzz + -tmp_reg12.yyyy).y;
tmp_reg14.y = (vs_pica.f[81].wwww).y;
tmp_reg14.x = (mul_s(vs_pica.f[0].wwww, tmp_reg14.yyyy)).x;
tmp_reg2.x = rcp_s(tmp_reg14.x);
tmp_reg14.z = (tmp_reg2.xxxx).z;
tmp_reg3.xy = (vs_pica.f[81].wwww + tmp_reg11.xyyy).xy;
tmp_reg5.xy = (mul_s(tmp_reg3.xyyy, tmp_reg14.zzzz)).xy;
tmp_reg4.xy = (floor(tmp_reg5.xyyy)).xy;
tmp_reg4.xy = (mul_s(tmp_reg4.xyyy, tmp_reg14.xxxx)).xy;
tmp_reg4.xy = (tmp_reg3.xyyy + -tmp_reg4.xyyy).xy;
tmp_reg11.xy = (-vs_pica.f[81].wwww + tmp_reg4.xyyy).xy;
tmp_reg3.xy = (vs_pica.f[81].wwww + tmp_reg12.xyyy).xy;
tmp_reg5.xy = (mul_s(tmp_reg3.xyyy, tmp_reg14.zzzz)).xy;
tmp_reg4.xy = (floor(tmp_reg5.xyyy)).xy;
tmp_reg4.xy = (mul_s(tmp_reg4.xyyy, tmp_reg14.xxxx)).xy;
tmp_reg4.xy = (tmp_reg3.xyyy + -tmp_reg4.xyyy).xy;
tmp_reg12.xy = (-vs_pica.f[81].wwww + tmp_reg4.xyyy).xy;
vs_out_reg2 = tmp_reg11;
vs_out_reg3 = tmp_reg12;
return true;
}
// shader: 8B30, 6755027729C6CC09
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
depth /= gl_FragCoord.w;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (texcolor1.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor0.r) * (texcolor1.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp((vec3(1) - combiner_buffer.rgb) * (const_color[2].rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) + (combiner_buffer.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, F4EFC46253DCC9D3
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
depth /= gl_FragCoord.w;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 texcolor2 = textureLod(tex2, texcoord12.zw, GetLod(texcoord12.zw * vec2(textureSize(tex2, 0))) + tex_lod_bias[2]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(min((texcolor1.rgb) + (texcolor2.rgb), vec3(1)) * (const_color[0].rgb), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(fma((texcolor0.rgb), (const_color[2].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) * (const_color[3].aaa), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B31, 43C849DD166EF6F5

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
bool Vfn20();
bool Vfn3();
bool Vfn8();
bool Vfn1();
bool Vfn2();
bool Vfn4();
bool Vfn6();
bool Vfn7();
bool Vfn9();
bool Vfn19();
bool Vfn21();
bool Vfn5();
bool Vfn10();
bool Vfn11();
bool Vfn13();
bool Vfn16();
bool Vfn22();
bool Vfn23();
bool Vfn25();
bool Vfn27();
bool Vfn29();
bool Vfn30();
bool Vfn32();
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

bool Vfn20() {
addr_regs.x = (ivec2(tmp_reg1.xx)).x;
tmp_reg3.x = dot_s(vs_pica.f[25 + addr_regs.x], tmp_reg15);
tmp_reg3.y = dot_s(vs_pica.f[26 + addr_regs.x], tmp_reg15);
tmp_reg3.z = dot_s(vs_pica.f[27 + addr_regs.x], tmp_reg15);
tmp_reg7 = fma_s(tmp_reg1.wwww, tmp_reg3, tmp_reg7);
return false;
}
bool Vfn3() {
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
bool Vfn8() {
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
tmp_reg0 = vs_pica.f[7];
bool_regs = notEqual(vs_pica.f[93].xx, tmp_reg0.yz);
tmp_reg7 = vs_pica.f[93].xxxx;
tmp_reg12 = vs_pica.f[93].xxxx;
tmp_reg11 = vs_pica.f[93].xxxx;
tmp_reg2 = mul_s(vs_pica.f[93].wwww, vs_in_reg7);
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
Vfn2();
} else {
Vfn6();
}
vs_out_reg2 = -tmp_reg15;
vs_out_reg0.x = dot_s(vs_pica.f[86], tmp_reg15);
vs_out_reg0.y = dot_s(vs_pica.f[87], tmp_reg15);
vs_out_reg0.z = dot_s(vs_pica.f[88], tmp_reg15);
vs_out_reg0.w = dot_s(vs_pica.f[89], tmp_reg15);
return false;
}
bool Vfn2() {
bool_regs = notEqual(vs_pica.f[93].xx, vs_in_reg8.zw);
tmp_reg1.xy = (tmp_reg2.xxxx).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.xxxx)).w;
Vfn3();
tmp_reg1.xy = (tmp_reg2.yyyy).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.yyyy)).w;
Vfn3();
tmp_reg1.xy = (tmp_reg2.zzzz).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.zzzz)).w;
if (bool_regs.x) {
Vfn3();
}
if (vs_pica.b[8]) {
Vfn4();
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
Vfn5();
return false;
}
bool Vfn4() {
tmp_reg1.xy = (tmp_reg2.wwww).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.wwww)).w;
if (bool_regs.y) {
Vfn3();
}
return false;
}
bool Vfn6() {
if (all(bool_regs)) {
Vfn7();
} else {
Vfn19();
}
return false;
}
bool Vfn7() {
bool_regs = notEqual(vs_pica.f[93].xx, vs_in_reg8.zw);
tmp_reg1.xy = (tmp_reg2.xxxx).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.xxxx)).w;
Vfn8();
tmp_reg1.xy = (tmp_reg2.yyyy).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.yyyy)).w;
Vfn8();
tmp_reg1.xy = (tmp_reg2.zzzz).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.zzzz)).w;
if (bool_regs.x) {
Vfn8();
}
if (vs_pica.b[8]) {
Vfn9();
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
Vfn10();
return false;
}
bool Vfn9() {
tmp_reg1.xy = (tmp_reg2.wwww).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.wwww)).w;
if (bool_regs.y) {
Vfn8();
}
return false;
}
bool Vfn19() {
bool_regs = notEqual(vs_pica.f[93].xx, vs_in_reg8.zw);
tmp_reg1.xy = (tmp_reg2.xxxx).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.xxxx)).w;
Vfn20();
tmp_reg1.xy = (tmp_reg2.yyyy).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.yyyy)).w;
Vfn20();
tmp_reg1.xy = (tmp_reg2.zzzz).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.zzzz)).w;
if (bool_regs.x) {
Vfn20();
}
if (vs_pica.b[8]) {
Vfn21();
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
bool Vfn21() {
tmp_reg1.xy = (tmp_reg2.wwww).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.wwww)).w;
if (bool_regs.y) {
Vfn20();
}
return false;
}
bool Vfn5() {
uint jmp_to = 139u;
while (true) {
switch (jmp_to) {
case 139u:
tmp_reg6.x = dot_3(tmp_reg14.xyz, tmp_reg14.xyz);
tmp_reg7.x = dot_3(tmp_reg12.xyz, tmp_reg12.xyz);
tmp_reg6.x = rsq_s(tmp_reg6.x);
tmp_reg7.x = rsq_s(tmp_reg7.x);
tmp_reg14.xyz = (mul_s(tmp_reg14.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg12.xyz = (mul_s(tmp_reg12.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg0 = vs_pica.f[93].yxxx;
if (!vs_pica.b[3]) {
jmp_to = 155u; break;
}
tmp_reg4 = vs_pica.f[93].yyyy + tmp_reg14.zzzz;
tmp_reg4 = mul_s(vs_pica.f[94].zzzz, tmp_reg4);
bool_regs = greaterThanEqual(vs_pica.f[93].xx, tmp_reg4.xx);
tmp_reg4 = vec4(rsq_s(tmp_reg4.x));
tmp_reg5 = mul_s(vs_pica.f[94].zzzz, tmp_reg14);
if (bool_regs.x) {
jmp_to = 155u; break;
}
tmp_reg0.z = rcp_s(tmp_reg4.x);
tmp_reg0.xy = (mul_s(tmp_reg5, tmp_reg4)).xy;
case 155u:
vs_out_reg1 = tmp_reg0;
default: return false;
}
}
return false;
}
bool Vfn10() {
uint jmp_to = 156u;
while (true) {
switch (jmp_to) {
case 156u:
tmp_reg6.x = dot_3(tmp_reg14.xyz, tmp_reg14.xyz);
tmp_reg7.x = dot_3(tmp_reg12.xyz, tmp_reg12.xyz);
tmp_reg6.x = rsq_s(tmp_reg6.x);
tmp_reg7.x = rsq_s(tmp_reg7.x);
tmp_reg14.xyz = (mul_s(tmp_reg14.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg12.xyz = (mul_s(tmp_reg12.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg13.xyz = (mul_s(tmp_reg13.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg11.xyz = (mul_s(tmp_reg11.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg0 = vs_pica.f[93].yxxx;
if (!vs_pica.b[3]) {
jmp_to = 231u; break;
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
jmp_to = 193u; break;
}
tmp_reg7.xz = (tmp_reg13.wwyy + -tmp_reg14.yyww).xz;
tmp_reg7.y = (tmp_reg14.xxxx + -tmp_reg13.zzzz).y;
tmp_reg7.w = (tmp_reg6).w;
tmp_reg6 = vec4(dot_s(tmp_reg7, tmp_reg7));
tmp_reg6 = vec4(rsq_s(tmp_reg6.x));
tmp_reg0 = mul_s(tmp_reg7, tmp_reg6);
if (vs_pica.b[0]) {
jmp_to = 231u; break;
}
case 193u:
bool_regs = greaterThan(tmp_reg5.zy, tmp_reg5.yx);
if (bool_regs.x) {
Vfn11();
} else {
Vfn16();
}
tmp_reg6 = vec4(dot_s(tmp_reg8, tmp_reg8));
tmp_reg6 = vec4(rsq_s(tmp_reg6.x));
tmp_reg0 = mul_s(tmp_reg8, tmp_reg6);
case 231u:
vs_out_reg1 = tmp_reg0;
default: return false;
}
}
return false;
}
bool Vfn11() {
if (bool_regs.y) {
tmp_reg8 = mul_s(tmp_reg13.yyzw, tmp_reg6.xxxy);
tmp_reg8.x = (vs_pica.f[93].yyyy + -tmp_reg5.yyyy).x;
tmp_reg9 = tmp_reg5.zzzz + -tmp_reg5.xxxx;
tmp_reg8.yzw = (tmp_reg8 + tmp_reg14.wwxy).yzw;
tmp_reg8.x = (tmp_reg9 + tmp_reg8).x;
} else {
Vfn13();
}
tmp_reg8.w = (-tmp_reg8).w;
return false;
}
bool Vfn13() {
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
bool Vfn16() {
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
bool Vfn22() {
tmp_reg0.y = (vs_pica.f[7].wwww).y;
bool_regs = notEqual(vs_pica.f[93].xx, tmp_reg0.xy);
tmp_reg9 = vs_pica.f[21];
tmp_reg0 = mul_s(vs_pica.f[7].wwww, vs_in_reg3);
if (bool_regs.y) {
Vfn23();
}
vs_out_reg3 = max_s(vs_pica.f[93].xxxx, tmp_reg9);
return false;
}
bool Vfn23() {
if (vs_pica.b[7]) {
tmp_reg9.w = (mul_s(tmp_reg9.wwww, tmp_reg0.wwww)).w;
}
tmp_reg9.xyz = (mul_s(vs_pica.f[20].wwww, tmp_reg0.xyzz)).xyz;
tmp_reg8.x = (vs_pica.f[93].yyyy).x;
return false;
}
bool Vfn25() {
tmp_reg0.xy = (vs_pica.f[10].xxxx).xy;
if (vs_pica.b[9]) {
tmp_reg6.xy = (mul_s(vs_pica.f[8].xxxx, vs_in_reg4.xyyy)).xy;
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
tmp_reg3.x = dot_s(vs_pica.f[11].xywz, tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12].xywz, tmp_reg6);
tmp_reg3.zw = (vs_pica.f[93].xxxx).zw;
vs_out_reg4 = tmp_reg3;
} else {
Vfn27();
}
return false;
}
bool Vfn27() {
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
Vfn29();
}
vs_out_reg4 = tmp_reg3;
return false;
}
bool Vfn29() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
Vfn30();
} else {
Vfn32();
}
return false;
}
bool Vfn30() {
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
bool Vfn32() {
tmp_reg1.xy = (vs_pica.f[94].zzzz).xy;
tmp_reg1.zw = (vs_pica.f[93].xxxx).zw;
tmp_reg6 = fma_s(tmp_reg14, tmp_reg1, tmp_reg1);
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
tmp_reg3.x = dot_s(vs_pica.f[11], tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12], tmp_reg6);
return false;
}
bool Vfn0() {
Vfn1();
Vfn22();
Vfn25();
return true;
}
// shader: 8B30, 76E787E99E41DBF3
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
depth /= gl_FragCoord.w;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (const_color[0].rgb), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
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
// shader: 8B30, 4B4F7526A0D839B5
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
depth /= gl_FragCoord.w;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((const_color[0].rgb) * (const_color[0].aaa), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.aaa), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B31, 2DE4619EDA6BD2CD

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
bool Vfn5();
bool Vfn6();
bool Vfn15();
bool Vfn17();
bool Vfn22();
bool Vfn23();
bool Vfn25();
bool Vfn26();
bool Vfn29();
bool Vfn1();
bool Vfn0();
bool Vfn3();
vec4 tmp_reg0;
vec4 tmp_reg1;
vec4 tmp_reg2;
vec4 tmp_reg3;
vec4 tmp_reg4;
vec4 tmp_reg7;
vec4 tmp_reg8;
vec4 tmp_reg9;
vec4 tmp_reg10;
vec4 tmp_reg11;
vec4 tmp_reg12;
vec4 tmp_reg13;
vec4 tmp_reg14;
bool ExecVS() {
tmp_reg0 = vec4(0, 0, 0, 1);
tmp_reg1 = vec4(0, 0, 0, 1);
tmp_reg2 = vec4(0, 0, 0, 1);
tmp_reg3 = vec4(0, 0, 0, 1);
tmp_reg4 = vec4(0, 0, 0, 1);
tmp_reg7 = vec4(0, 0, 0, 1);
tmp_reg8 = vec4(0, 0, 0, 1);
tmp_reg9 = vec4(0, 0, 0, 1);
tmp_reg10 = vec4(0, 0, 0, 1);
tmp_reg11 = vec4(0, 0, 0, 1);
tmp_reg12 = vec4(0, 0, 0, 1);
tmp_reg13 = vec4(0, 0, 0, 1);
tmp_reg14 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn5() {
tmp_reg13 = floor(tmp_reg0.xxxx);
tmp_reg13 = tmp_reg0.xxxx + -tmp_reg13;
addr_regs.y = (ivec2(tmp_reg11.zz)).y;
bool_regs = lessThanEqual(vs_pica.f[5].ww, tmp_reg13.xx);
if (bool_regs.x) {
Vfn6();
}
bool_regs = lessThanEqual(vs_pica.f[5].yy, tmp_reg11.xy);
if (!bool_regs.y) {
Vfn15();
} else {
Vfn22();
}
return false;
}
bool Vfn6() {
tmp_reg12.xy = (vs_pica.f[5].xyyy + vs_in_reg0.zwww).xy;
tmp_reg14.xy = (vs_pica.f[6].wzzz).xy;
tmp_reg13.xy = (mul_s(vs_pica.f[5].zzzz, tmp_reg0.xxxx)).xy;
tmp_reg13.y = (floor(tmp_reg13)).y;
tmp_reg13.x = (tmp_reg13.xxxx + -tmp_reg13.yyyy).x;
bool_regs = lessThanEqual(vs_pica.f[5].ww, tmp_reg13.xx);
if (bool_regs.x) {
tmp_reg14.xy = (tmp_reg14.yxxx).xy;
}
tmp_reg14.xy = (mul_s(tmp_reg14, tmp_reg2)).xy;
tmp_reg13.x = (mul_s(vs_pica.f[5].zzzz, tmp_reg13.xxxx)).x;
tmp_reg13 = mul_s(vs_pica.f[5].zyzy, tmp_reg13.xxxx);
tmp_reg13.zw = (floor(tmp_reg13)).zw;
tmp_reg13.xy = (tmp_reg13.xyyy + -tmp_reg13.zwww).xy;
bool_regs = lessThanEqual(vs_pica.f[5].ww, tmp_reg13.xy);
if (bool_regs.y) {
tmp_reg12.x = (mul_s(tmp_reg12.xxxx, tmp_reg14.xxxx)).x;
}
if (bool_regs.x) {
tmp_reg12.y = (fma_s(tmp_reg12.yyyy, tmp_reg14.yyyy, vs_pica.f[5].yyyy)).y;
tmp_reg12.y = (tmp_reg12.yyyy + -tmp_reg14.yyyy).y;
}
tmp_reg14.xy = (vs_pica.f[5].yyyy + -tmp_reg14.xyyy).xy;
tmp_reg13.x = (mul_s(vs_pica.f[5].zzzz, tmp_reg13.xxxx)).x;
tmp_reg13 = mul_s(vs_pica.f[5].zyzy, tmp_reg13.xxxx);
tmp_reg13.zw = (floor(tmp_reg13)).zw;
tmp_reg13.xy = (tmp_reg13.xyyy + -tmp_reg13.zwww).xy;
bool_regs = lessThanEqual(vs_pica.f[5].ww, tmp_reg13.xy);
if (bool_regs.y) {
tmp_reg12.x = (tmp_reg12.xxxx + tmp_reg14.xxxx).x;
}
if (bool_regs.x) {
tmp_reg12.y = (tmp_reg12.yyyy + -tmp_reg14.yyyy).y;
}
tmp_reg13.x = (mul_s(vs_pica.f[5].zzzz, tmp_reg13.xxxx)).x;
tmp_reg13 = mul_s(vs_pica.f[5].zyzy, tmp_reg13.xxxx);
tmp_reg13.zw = (floor(tmp_reg13)).zw;
tmp_reg13.xy = (tmp_reg13.xyyy + -tmp_reg13.zwww).xy;
bool_regs = lessThanEqual(vs_pica.f[5].ww, tmp_reg13.xy);
if (bool_regs.y) {
tmp_reg12.x = (vs_pica.f[5].yyyy + -tmp_reg12.xxxx).x;
}
if (bool_regs.x) {
tmp_reg12.y = (vs_pica.f[5].yyyy + -tmp_reg12.yyyy).y;
}
tmp_reg13.xy = (mul_s(vs_pica.f[5].zzzz, tmp_reg0.xxxx)).xy;
tmp_reg13.y = (floor(tmp_reg13)).y;
tmp_reg13.x = (tmp_reg13.xxxx + -tmp_reg13.yyyy).x;
bool_regs = lessThanEqual(vs_pica.f[5].ww, tmp_reg13.xx);
if (bool_regs.x) {
tmp_reg12.xy = (vs_pica.f[5].yyyy + -tmp_reg12.yxxx).xy;
}
tmp_reg12.y = (vs_pica.f[5].yyyy + -tmp_reg12.yyyy).y;
return false;
}
bool Vfn15() {
tmp_reg13.x = (floor(tmp_reg0.xxxx)).x;
tmp_reg13.x = (tmp_reg0.xxxx + -tmp_reg13).x;
bool_regs = lessThanEqual(vs_pica.f[5].ww, tmp_reg13.xx);
tmp_reg13 = vs_pica.f[32 + addr_regs.y].wzyx;
if (bool_regs.x) {
tmp_reg11.xy = (fma_s(tmp_reg12.xyyy, tmp_reg13.xyyy, tmp_reg13.zwww)).xy;
tmp_reg11.xy = (mul_s(tmp_reg11.xyyy, tmp_reg14.zwww)).xy;
tmp_reg11.y = (vs_pica.f[5].yyyy + -tmp_reg11.yyyy).y;
} else {
Vfn17();
}
tmp_reg11.z = (vs_pica.f[5].yyyy + tmp_reg11.zzzz).z;
return false;
}
bool Vfn17() {
bool_regs = notEqual(vs_pica.f[5].xx, vs_in_reg0.zw);
if (!bool_regs.x) {
tmp_reg11.x = (tmp_reg13.xxxx).x;
} else {
tmp_reg11.x = (tmp_reg13.zzzz).x;
}
if (!bool_regs.y) {
tmp_reg11.y = (tmp_reg13.yyyy).y;
} else {
tmp_reg11.y = (tmp_reg13.wwww).y;
}
return false;
}
bool Vfn22() {
if (!bool_regs.x) {
Vfn23();
} else {
tmp_reg11.x = dot_s(vs_pica.f[32 + addr_regs.y].wzyx, tmp_reg1);
tmp_reg11.y = dot_s(vs_pica.f[33 + addr_regs.y].wzyx, tmp_reg1);
}
tmp_reg11.z = (vs_pica.f[5].zzzz + tmp_reg11.zzzz).z;
return false;
}
bool Vfn23() {
tmp_reg13.x = (floor(tmp_reg0.xxxx)).x;
tmp_reg13.x = (tmp_reg0.xxxx + -tmp_reg13).x;
bool_regs = lessThanEqual(vs_pica.f[5].ww, tmp_reg13.xx);
if (bool_regs.x) {
tmp_reg12.zw = (vs_pica.f[5].xxxy).zw;
tmp_reg11.x = dot_s(vs_pica.f[32 + addr_regs.y].wzyx, tmp_reg12);
tmp_reg11.y = dot_s(vs_pica.f[33 + addr_regs.y].wzyx, tmp_reg12);
tmp_reg11.xy = (mul_s(tmp_reg11.xyyy, tmp_reg14.zwww)).xy;
tmp_reg11.y = (vs_pica.f[5].yyyy + -tmp_reg11.yyyy).y;
} else {
Vfn25();
}
return false;
}
bool Vfn25() {
tmp_reg14 = vs_pica.f[32 + addr_regs.y].wzyx;
tmp_reg13 = vs_pica.f[33 + addr_regs.y].wzyx;
bool_regs = notEqual(vs_pica.f[5].xx, vs_in_reg0.zw);
if (!bool_regs.y) {
Vfn26();
} else {
Vfn29();
}
return false;
}
bool Vfn26() {
if (!bool_regs.x) {
tmp_reg11.xy = (tmp_reg14.xyyy).xy;
} else {
tmp_reg11.xy = (tmp_reg13.zwww).xy;
}
return false;
}
bool Vfn29() {
if (!bool_regs.x) {
tmp_reg11.xy = (tmp_reg13.xyyy).xy;
} else {
tmp_reg11.xy = (tmp_reg14.zwww).xy;
}
return false;
}
bool Vfn1() {
uint jmp_to = 97u;
while (true) {
switch (jmp_to) {
case 97u:
tmp_reg3.x = dot_s(vs_pica.f[32 + addr_regs.x].wzyx, tmp_reg1);
tmp_reg3.y = dot_s(vs_pica.f[33 + addr_regs.x].wzyx, tmp_reg1);
tmp_reg3.z = dot_s(vs_pica.f[34 + addr_regs.x].wzyx, tmp_reg1);
tmp_reg3.w = (tmp_reg1.wwww).w;
tmp_reg11 = vs_pica.f[4].wzyx;
tmp_reg11.z = (-vs_pica.f[34 + addr_regs.x].xxxx + tmp_reg11.zzzz).z;
bool_regs.x = vs_pica.f[5].xxxx.x != tmp_reg11.xzzz.x;
bool_regs.y = vs_pica.f[5].xxxx.y < tmp_reg11.xzzz.y;
if (any(not(bool_regs))) {
jmp_to = 108u; break;
}
tmp_reg11.z = rcp_s(tmp_reg11.z);
tmp_reg3.x = (tmp_reg3.xxxx + tmp_reg11.xxxx).x;
tmp_reg3.x = (fma_s(-tmp_reg11.yyyy, tmp_reg11.zzzz, tmp_reg3.xxxx)).x;
case 108u:
default: return false;
}
}
return false;
}
bool Vfn0() {
uint jmp_to = 109u;
while (true) {
switch (jmp_to) {
case 109u:
addr_regs.x = (ivec2(vs_in_reg0.xx)).x;
tmp_reg0 = vs_pica.f[9 + addr_regs.x].wzyx;
tmp_reg1.xy = (vs_in_reg0.zwzw).xy;
tmp_reg1.zw = (vs_pica.f[5].xyxy).zw;
addr_regs.xy = ivec2(tmp_reg0.xy);
tmp_reg2 = vs_pica.f[32 + addr_regs.y].wzyx;
if (vs_pica.b[0]) {
jmp_to = 191u; break;
}
tmp_reg4 = vs_pica.f[31 + addr_regs.x].wzyx;
tmp_reg1.xy = (fma_s(tmp_reg1.xyyy, tmp_reg2.xyyy, tmp_reg2.zwww)).xy;
Vfn1();
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
tmp_reg11.z = (tmp_reg0.zzzz).z;
tmp_reg9 = mul_s(vs_pica.f[5].zyzy, tmp_reg0.zzzz);
tmp_reg9.xy = (floor(tmp_reg9)).xy;
tmp_reg9.xy = (tmp_reg9.zwww + -tmp_reg9.xyyy).xy;
tmp_reg9 = mul_s(vs_pica.f[5].zzzz, tmp_reg9);
tmp_reg14 = vs_pica.f[6].wzyx;
tmp_reg11.xy = (tmp_reg9.xyyy).xy;
Vfn5();
if (vs_pica.b[1]) {
tmp_reg11.xy = (tmp_reg11.yxxx).xy;
tmp_reg11.y = (vs_pica.f[5].yyyy + -tmp_reg11.yyyy).y;
}
if (vs_pica.b[2]) {
tmp_reg11.xy = (vs_pica.f[5].yyyy + -tmp_reg11.yxxx).xy;
}
vs_out_reg2 = tmp_reg11.xyyy;
tmp_reg9 = mul_s(vs_pica.f[5].zyzy, tmp_reg9.xxxx);
tmp_reg9.xy = (floor(tmp_reg9)).xy;
tmp_reg9.xy = (tmp_reg9.zwww + -tmp_reg9.xyyy).xy;
tmp_reg9 = mul_s(vs_pica.f[5].zzzz, tmp_reg9);
tmp_reg14 = vs_pica.f[7].wzyx;
tmp_reg11.xy = (tmp_reg9.xyyy).xy;
Vfn5();
if (vs_pica.b[3]) {
tmp_reg11.xy = (tmp_reg11.yxxx).xy;
tmp_reg11.y = (vs_pica.f[5].yyyy + -tmp_reg11.yyyy).y;
}
if (vs_pica.b[4]) {
tmp_reg11.xy = (vs_pica.f[5].yyyy + -tmp_reg11.yxxx).xy;
}
vs_out_reg3 = tmp_reg11.xyyy;
tmp_reg9 = mul_s(vs_pica.f[5].zyzy, tmp_reg9.xxxx);
tmp_reg9.xy = (floor(tmp_reg9)).xy;
tmp_reg9.xy = (tmp_reg9.zwww + -tmp_reg9.xyyy).xy;
tmp_reg9 = mul_s(vs_pica.f[5].zzzz, tmp_reg9);
tmp_reg14 = vs_pica.f[8].wzyx;
tmp_reg11.xy = (tmp_reg9.xyyy).xy;
Vfn5();
if (vs_pica.b[5]) {
tmp_reg11.xy = (tmp_reg11.yxxx).xy;
tmp_reg11.y = (vs_pica.f[5].yyyy + -tmp_reg11.yyyy).y;
}
if (vs_pica.b[6]) {
tmp_reg11.xy = (vs_pica.f[5].yyyy + -tmp_reg11.yxxx).xy;
}
vs_out_reg4 = tmp_reg11.xyyy;
return true;
case 191u:
tmp_reg2.w = (tmp_reg2.wwww + tmp_reg2.yyyy).w;
tmp_reg1.y = (-vs_pica.f[5].yyyy + -tmp_reg1.yyyy).y;
tmp_reg13.xy = (mul_s(vs_pica.f[36 + addr_regs.x].wzzz, tmp_reg2.xyyy)).xy;
tmp_reg11.x = (mul_s(vs_pica.f[35 + addr_regs.x].wwww, -tmp_reg1.yyyy)).x;
tmp_reg1.xy = (mul_s(tmp_reg1.xyyy, tmp_reg13.xyyy)).xy;
tmp_reg1.x = (tmp_reg1.xxxx + tmp_reg11.xxxx).x;
if (vs_pica.b[1]) {
tmp_reg13.xzw = (mul_s(vs_pica.f[5].wxxx, tmp_reg13.xxxx)).xzw;
tmp_reg13.y = (mul_s(vs_pica.f[34 + addr_regs.y].yyyy, tmp_reg13.yyyy)).y;
tmp_reg11 = fma_s(tmp_reg1, vs_pica.f[5].yyxx, -tmp_reg13);
tmp_reg14 = vs_pica.f[33 + addr_regs.y].wzyx;
tmp_reg1.x = dot_3(tmp_reg11.xyz, tmp_reg14.xyy);
tmp_reg1.y = dot_3(tmp_reg11.xyz, tmp_reg14.zww);
tmp_reg14 = vs_pica.f[34 + addr_regs.y].wzyx;
tmp_reg1.z = dot_s(vec4(tmp_reg11.xyz, 1.0), tmp_reg14);
tmp_reg1.xy = (tmp_reg1.xyyy + tmp_reg13.xyyy).xy;
}
tmp_reg1.xy = (tmp_reg1.xyyy + tmp_reg2.zwww).xy;
tmp_reg1.xy = (vs_pica.f[36 + addr_regs.x].yxxx + tmp_reg1.xyyy).xy;
Vfn1();
vs_out_reg0.x = dot_s(vs_pica.f[0].wzyx, tmp_reg3);
vs_out_reg0.y = dot_s(vs_pica.f[1].wzyx, tmp_reg3);
vs_out_reg0.z = dot_s(vs_pica.f[2].wzyx, tmp_reg3);
vs_out_reg0.w = dot_s(vs_pica.f[3].wzyx, tmp_reg3);
if (vs_pica.b[2]) {
tmp_reg11 = abs(vs_in_reg0.zwzw);
tmp_reg14.w = (floor(tmp_reg0.zzzz)).w;
tmp_reg14.w = (tmp_reg0.zzzz + -tmp_reg14).w;
addr_regs.xy = ivec2(tmp_reg0.zx);
tmp_reg14.w = (mul_s(vs_pica.f[5].zzzz, tmp_reg14.wwww)).w;
tmp_reg14.xyz = (vs_pica.f[5].yyyy).xyz;
tmp_reg7 = mul_s(vs_pica.f[37 + addr_regs.y].wzyx, tmp_reg14);
tmp_reg8 = mul_s(vs_pica.f[38 + addr_regs.y].wzyx, tmp_reg14);
} else {
tmp_reg11 = abs(vs_in_reg0.zwzw);
addr_regs.xy = ivec2(tmp_reg0.zw);
tmp_reg7 = vs_pica.f[32 + addr_regs.y].wzyx;
tmp_reg8 = vs_pica.f[33 + addr_regs.y].wzyx;
}
tmp_reg8 = tmp_reg8 + -tmp_reg7;
vs_out_reg1 = fma_s(tmp_reg8, tmp_reg11.yyyy, tmp_reg7);
tmp_reg9.xy = (mul_s(vs_pica.f[32 + addr_regs.x].yxxx, tmp_reg11)).xy;
tmp_reg11.zw = (vec4(lessThan(tmp_reg11, vs_pica.f[5].yyyy))).zw;
tmp_reg9.xy = (fma_s(tmp_reg11.zwww, vs_pica.f[32 + addr_regs.x].wzzz, tmp_reg9.xyyy)).xy;
tmp_reg9.y = (vs_pica.f[5].yyyy + -tmp_reg9.yyyy).y;
vs_out_reg2 = tmp_reg9;
vs_out_reg3 = tmp_reg9;
vs_out_reg4 = tmp_reg9;
return true;
default: return false;
}
}
return false;
}
bool Vfn3() {
addr_regs.y = (ivec2(tmp_reg0.ww)).y;
tmp_reg7 = vs_pica.f[32 + addr_regs.y].wzyx;
tmp_reg8 = vs_pica.f[33 + addr_regs.y].wzyx;
tmp_reg9 = vs_pica.f[34 + addr_regs.y].wzyx;
tmp_reg10 = vs_pica.f[35 + addr_regs.y].wzyx;
tmp_reg11.xy = (vs_in_reg0.zwww).xy;
tmp_reg14.x = (floor(tmp_reg0.yyyy)).x;
tmp_reg14.x = (tmp_reg0.yyyy + -tmp_reg14.xxxx).x;
bool_regs = lessThanEqual(vs_pica.f[5].ww, tmp_reg14.xx);
if (bool_regs.x) {
tmp_reg11.z = rcp_s(tmp_reg4.x);
tmp_reg11.w = rcp_s(tmp_reg4.y);
tmp_reg11.xy = (tmp_reg1.xyyy + -tmp_reg4.zwww).xy;
tmp_reg11.xy = (mul_s(tmp_reg11.xyyy, tmp_reg11.zwww)).xy;
}
tmp_reg11.xy = (abs(tmp_reg11.xyyy)).xy;
tmp_reg8 = tmp_reg8 + -tmp_reg7;
tmp_reg8 = fma_s(tmp_reg8, tmp_reg11.xxxx, tmp_reg7);
tmp_reg10 = tmp_reg10 + -tmp_reg9;
tmp_reg10 = fma_s(tmp_reg10, tmp_reg11.xxxx, tmp_reg9);
tmp_reg10 = tmp_reg10 + -tmp_reg8;
tmp_reg10 = fma_s(tmp_reg10, tmp_reg11.yyyy, tmp_reg8);
vs_out_reg1 = tmp_reg10;
return false;
}
// shader: 8B30, A86F809D764EED28
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
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.aaa), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = (const_color[3].rgb);
float alpha_output_3 = (const_color[3].a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((last_tev_out.rgb), (const_color[4].rgb), (combiner_buffer.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(mix((last_tev_out.a), (const_color[4].a), (combiner_buffer.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 1AA86287CCCEBF36, B753A1567A802E0D
// reference: 041F690AC4A8E5FD, 48C05068C97A61DA
// reference: 90DF7CD698E50983, 7EE0F9D674AE3188
// reference: 4887B9C4CFF08CA1, E6B24856ED2B97B8
// reference: AF01A59B3DC84F70, C281D48145A550C9
// reference: 8B7148D65CAA80BC, 6CBCDC1C2B6B9DB5
// reference: CD12A912D2528168, DCC8066544A8F65A
// reference: 606B07BD28E1A248, 71719082BF66940E
// reference: 55DCD8B920E98474, F0D67A3BFB3E231B
// reference: 7283AC0E6E9AF8BA, 4D1185B4FE8B2481
// reference: 90331D4631ADC977, 7A04013ADFB333E3
// reference: 8112203E24806941, 37F2AFE9740824A3
// reference: D720EBBD7F24C2DE, 7A04013ADFB333E3
// reference: 760EEB152BD39388, EA2CCCAAED32A330
// reference: FE89E375BE00286A, 057F39C58F9BB607
// reference: D720EBBD1AF354CA, A06C2394B48A588F
// reference: B4A7938BFC346190, 7F8A88A5906AB195
// reference: 2207DEC5A143C33B, BDF5EDADE1E643F5
// reference: 5D032CD70D5E0B07, 6AC6453ACCFCF40B
// reference: 51B33FF52C4BEB7F, 05503B0EB4BE5EEF
// reference: 2BF4801C27AB5C6A, 0AC3A335466A5F28
// reference: 16A0C90E62C2E0D6, 05503B0EB4BE5EEF
// reference: 230BEDD14843D17A, FDEC3DF8508766CB
// reference: A6EA4A7B4C420A2A, 73D285793F7A71B9
// reference: 443DC72727D01AAE, E9DEB0C39CC7C2FD
// reference: B4A7938BF5E2BBAB, 927415A97E0D5ADA
// reference: 5D032CD7C2A21E73, 0CDE7B8F595A5B36
// reference: F7ABEA77565EA876, 67835C5F6BB3E883
// reference: A883DCD8D5A01014, 48E050DA75EAB0DE
// reference: 02B75F848DC00708, 1BA60B9750FF54C4
// reference: A21D598B2F3CB0DE, 895B1061E1F838C3
// reference: 43B9A7E5B745AF6F, 299D93146B1BBE2D
// reference: 915E0B4DEFA3D263, FAF5204C19D8EE05
// reference: 5869EB8151CD20F4, 654F77C7685FDF16
// reference: 820DF930CF3F6BA3, FE419FE67868D9C9
// reference: 423590E628189590, F42B212618922492
// reference: 90C6AE015E9D07F0, 2F3C73A7BC805FD9
// reference: 98C869A1F0A39100, 6755027729C6CC09
// reference: 4E1371E592F5177D, F4EFC46253DCC9D3
// reference: C6B0ABA05FBDA2C6, 43C849DD166EF6F5
// reference: CF5D937055F84C00, 76E787E99E41DBF3
// reference: A21D598BABF554C2, 895B1061E1F838C3
// reference: 9D121B47C1A937A0, 4B4F7526A0D839B5
// reference: AEF9118224FC1759, 2DE4619EDA6BD2CD
// reference: A8E292535D413270, A86F809D764EED28
// program: B753A1567A802E0D, 0000000000000000, 48C05068C97A61DA
// program: B753A1567A802E0D, 0000000000000000, 7EE0F9D674AE3188
// program: E6B24856ED2B97B8, 0000000000000000, C281D48145A550C9
// program: B753A1567A802E0D, 0000000000000000, 6CBCDC1C2B6B9DB5
// program: DCC8066544A8F65A, 0000000000000000, 71719082BF66940E
// program: F0D67A3BFB3E231B, 0000000000000000, 4D1185B4FE8B2481
// program: DCC8066544A8F65A, 0000000000000000, 7A04013ADFB333E3
// program: DCC8066544A8F65A, 0000000000000000, 37F2AFE9740824A3
// program: DCC8066544A8F65A, 0000000000000000, EA2CCCAAED32A330
// program: B753A1567A802E0D, 0000000000000000, 057F39C58F9BB607
// program: DCC8066544A8F65A, 0000000000000000, A06C2394B48A588F
// program: B753A1567A802E0D, 0000000000000000, 7F8A88A5906AB195
// program: DCC8066544A8F65A, 0000000000000000, BDF5EDADE1E643F5
// program: B753A1567A802E0D, 0000000000000000, 6AC6453ACCFCF40B
// program: E6B24856ED2B97B8, 0000000000000000, 05503B0EB4BE5EEF
// program: F0D67A3BFB3E231B, 0000000000000000, 0AC3A335466A5F28
// program: B753A1567A802E0D, 0000000000000000, FDEC3DF8508766CB
// program: B753A1567A802E0D, 0000000000000000, 73D285793F7A71B9
// program: B753A1567A802E0D, 0000000000000000, E9DEB0C39CC7C2FD
// program: B753A1567A802E0D, 0000000000000000, 927415A97E0D5ADA
// program: B753A1567A802E0D, 0000000000000000, 0CDE7B8F595A5B36
// program: 67835C5F6BB3E883, 0000000000000000, 48E050DA75EAB0DE
// program: B753A1567A802E0D, 0000000000000000, 1BA60B9750FF54C4
// program: 67835C5F6BB3E883, 0000000000000000, 895B1061E1F838C3
// program: 67835C5F6BB3E883, 0000000000000000, 299D93146B1BBE2D
// program: FAF5204C19D8EE05, 0000000000000000, 654F77C7685FDF16
// program: FAF5204C19D8EE05, 0000000000000000, FE419FE67868D9C9
// program: F42B212618922492, 0000000000000000, FE419FE67868D9C9
// program: 2F3C73A7BC805FD9, 0000000000000000, FE419FE67868D9C9
// program: FAF5204C19D8EE05, 0000000000000000, 6755027729C6CC09
// program: E6B24856ED2B97B8, 0000000000000000, F4EFC46253DCC9D3
// program: 43C849DD166EF6F5, 0000000000000000, 76E787E99E41DBF3
// program: 67835C5F6BB3E883, 0000000000000000, 4B4F7526A0D839B5
// program: 2DE4619EDA6BD2CD, 0000000000000000, A86F809D764EED28
// reference: C601D6C524806941, 37F2AFE9740824A3
// reference: 90331D467F24C2DE, 7A04013ADFB333E3
// reference: 311D1DEE2BD39388, EA2CCCAAED32A330
// reference: 90331D461AF354CA, A06C2394B48A588F
// reference: 16A0C90E2C4BEB7F, 05503B0EB4BE5EEF
// reference: 8112203E6A0962E8, 37F2AFE9740824A3
// shader: 8B30, 022E9264412C0B93
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
depth /= gl_FragCoord.w;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (const_color[0].rgb);
float alpha_output_0 = ByteRound(clamp((const_color[0].a) * (texcolor0.r), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, F1C1E1D2B63B6F7E
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
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (const_color[1].aaa), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = (const_color[3].rgb);
float alpha_output_3 = (const_color[3].a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((last_tev_out.rgb), (const_color[4].rgb), (combiner_buffer.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(mix((last_tev_out.a), (const_color[4].a), (combiner_buffer.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, BF11DF99666DC21A
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
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp(fma((texcolor0.rgb), (const_color[2].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = (const_color[3].rgb);
float alpha_output_3 = (const_color[3].a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((last_tev_out.rgb), (const_color[4].rgb), (combiner_buffer.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(mix((last_tev_out.a), (const_color[4].a), (combiner_buffer.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B31, EA2B8F207887AD03

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
texcoord0 = vec4(vs_out_reg2.x,vs_out_reg2.y,1,1);
texcoord12 = vec4(vs_out_reg3.x,vs_out_reg3.y,1,1);
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
bool Vfn10();
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
Vfn0();
return true;
}

bool Vfn10() {
tmp_reg2.x = rcp_s(vs_pica.f[81].y);
tmp_reg2.xy = (mul_s(vs_pica.f[2 + addr_regs.x].zwww, tmp_reg2.xxxx)).xy;
tmp_reg2.xy = (vs_pica.f[0].yyyy + tmp_reg2.xyyy).xy;
tmp_reg3.xy = (floor(tmp_reg2.xyyy)).xy;
tmp_reg2.xy = (mul_s(vs_pica.f[81].yyyy, tmp_reg3.xyyy)).xy;
tmp_reg2.xy = (vs_pica.f[2 + addr_regs.x].zwww + -tmp_reg2.xyyy).xy;
tmp_reg0.xy = (min_s(vs_pica.f[81].xxxx, -tmp_reg2.xyyy)).xy;
tmp_reg0.xy = (max_s(-vs_pica.f[81].xxxx, tmp_reg0.xyyy)).xy;
tmp_reg2 = vs_pica.f[95];
tmp_reg3 = vs_pica.f[94];
tmp_reg1.z = (mul_s(tmp_reg0.xxxx, tmp_reg0.xxxx)).z;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg2.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.zwww)).xy;
tmp_reg2 = vs_pica.f[93];
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.y = (mul_s(tmp_reg1.yyyy, tmp_reg0.xxxx)).y;
tmp_reg5.x = (vs_pica.f[5 + addr_regs.x].wwww).x;
tmp_reg14.x = (vs_in_reg0.xxxx).x;
tmp_reg14.y = (vs_in_reg0.yyyy).y;
bool_regs.x = vs_pica.f[0].xxxx.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].xxxx.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (vs_in_reg0.xxxx).x;
tmp_reg14.y = (vs_in_reg0.yyyy).y;
}
bool_regs.x = vs_pica.f[0].zzzz.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].zzzz.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (-vs_in_reg0.xxxx).x;
}
bool_regs.x = vs_pica.f[0].wwww.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].wwww.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.y = (-vs_in_reg0.yyyy).y;
}
bool_regs.x = vs_pica.f[0].wwww.x < tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].wwww.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (-vs_in_reg0.xxxx).x;
tmp_reg14.y = (-vs_in_reg0.yyyy).y;
}
tmp_reg4.xy = (mul_s(tmp_reg14.xxxx, tmp_reg1.xyyy)).xy;
tmp_reg4.x = (fma_s(-tmp_reg14.yyyy, tmp_reg1.yyyy, tmp_reg4.xxxx)).x;
tmp_reg4.y = (fma_s(tmp_reg14.yyyy, tmp_reg1.xxxx, tmp_reg4.yyyy)).y;
tmp_reg5.x = (vs_pica.f[0].yyyy + tmp_reg4.xxxx).x;
tmp_reg5.y = (-vs_pica.f[0].yyyy + tmp_reg4.yyyy).y;
tmp_reg4.z = (vs_pica.f[83].xxxx).z;
tmp_reg4.w = (-vs_pica.f[83].yyyy).w;
tmp_reg5.xy = (fma_s(tmp_reg5.xyyy, tmp_reg4.zwww, vs_pica.f[3 + addr_regs.x].xyyy)).xy;
tmp_reg4.z = (-vs_pica.f[3 + addr_regs.x].zzzz).z;
tmp_reg4.w = (-vs_pica.f[3 + addr_regs.x].wwww).w;
tmp_reg5.z = (vs_pica.f[0].zzzz + tmp_reg4.zzzz).z;
tmp_reg5.w = (vs_pica.f[0].zzzz + tmp_reg4.wwww).w;
tmp_reg5.x = (fma_s(-tmp_reg5.zzzz, tmp_reg4.xxxx, tmp_reg5.xxxx)).x;
tmp_reg5.y = (fma_s(tmp_reg5.wwww, tmp_reg4.yyyy, tmp_reg5.yyyy)).y;
tmp_reg11.xy = (tmp_reg5.xyyy).xy;
tmp_reg2 = vs_pica.f[95];
tmp_reg3 = vs_pica.f[94];
tmp_reg1.z = (mul_s(tmp_reg0.yyyy, tmp_reg0.yyyy)).z;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg2.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.zwww)).xy;
tmp_reg2 = vs_pica.f[93];
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.y = (mul_s(tmp_reg1.yyyy, tmp_reg0.yyyy)).y;
tmp_reg5.x = (vs_pica.f[6 + addr_regs.x].wwww).x;
tmp_reg14.x = (vs_in_reg0.xxxx).x;
tmp_reg14.y = (vs_in_reg0.yyyy).y;
bool_regs.x = vs_pica.f[0].xxxx.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].xxxx.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (vs_in_reg0.xxxx).x;
tmp_reg14.y = (vs_in_reg0.yyyy).y;
}
bool_regs.x = vs_pica.f[0].zzzz.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].zzzz.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (-vs_in_reg0.xxxx).x;
}
bool_regs.x = vs_pica.f[0].wwww.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].wwww.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.y = (-vs_in_reg0.yyyy).y;
}
bool_regs.x = vs_pica.f[0].wwww.x < tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].wwww.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (-vs_in_reg0.xxxx).x;
tmp_reg14.y = (-vs_in_reg0.yyyy).y;
}
tmp_reg4.xy = (mul_s(tmp_reg14.xxxx, tmp_reg1.xyyy)).xy;
tmp_reg4.x = (fma_s(-tmp_reg14.yyyy, tmp_reg1.yyyy, tmp_reg4.xxxx)).x;
tmp_reg4.y = (fma_s(tmp_reg14.yyyy, tmp_reg1.xxxx, tmp_reg4.yyyy)).y;
tmp_reg5.x = (vs_pica.f[0].yyyy + tmp_reg4.xxxx).x;
tmp_reg5.y = (-vs_pica.f[0].yyyy + tmp_reg4.yyyy).y;
tmp_reg4.z = (vs_pica.f[83].zzzz).z;
tmp_reg4.w = (-vs_pica.f[83].wwww).w;
tmp_reg5.xy = (fma_s(tmp_reg5.xyyy, tmp_reg4.zwww, vs_pica.f[4 + addr_regs.x].xyyy)).xy;
tmp_reg4.z = (-vs_pica.f[4 + addr_regs.x].zzzz).z;
tmp_reg4.w = (-vs_pica.f[4 + addr_regs.x].wwww).w;
tmp_reg5.z = (vs_pica.f[0].zzzz + tmp_reg4.zzzz).z;
tmp_reg5.w = (vs_pica.f[0].zzzz + tmp_reg4.wwww).w;
tmp_reg5.x = (fma_s(-tmp_reg5.zzzz, tmp_reg4.xxxx, tmp_reg5.xxxx)).x;
tmp_reg5.y = (fma_s(tmp_reg5.wwww, tmp_reg4.yyyy, tmp_reg5.yyyy)).y;
tmp_reg12.xy = (tmp_reg5.xyyy).xy;
return false;
}
bool Vfn0() {
addr_regs.x = (ivec2(vs_in_reg0.zz)).x;
tmp_reg10 = vs_pica.f[0].xxxz;
tmp_reg10.xy = (vs_in_reg0.xyyy).xy;
tmp_reg11 = vs_pica.f[0].xxxx;
tmp_reg12 = vs_pica.f[0].xxxx;
tmp_reg13 = vs_pica.f[0].zzzz;
tmp_reg4 = vs_pica.f[0].xxxx;
tmp_reg5 = vs_pica.f[0].xxxx;
tmp_reg10.xy = (vs_pica.f[84].xyyy + tmp_reg10.xyyy).xy;
tmp_reg10.xy = (mul_s(vs_pica.f[2 + addr_regs.x].xyyy, tmp_reg10.xyyy)).xy;
tmp_reg1.xyz = (vs_pica.f[92].xyzz).xyz;
tmp_reg1.w = (vs_pica.f[0].xxxx).w;
tmp_reg2.xyz = (tmp_reg1.xyzz).xyz;
tmp_reg3.xyz = (vs_pica.f[6 + addr_regs.x].xyzz).xyz;
tmp_reg4.x = dot_3(tmp_reg3.xyz, tmp_reg3.xyz);
bool_regs.x = vs_pica.f[0].xxxx.x >= tmp_reg4.x;
bool_regs.y = vs_pica.f[0].xxxx.y == tmp_reg4.y;
if (bool_regs.x) {
tmp_reg4.x = (vs_pica.f[0].zzzz).x;
} else {
tmp_reg4.x = rsq_s(tmp_reg4.x);
}
tmp_reg3.xyz = (mul_s(tmp_reg3.xyzz, tmp_reg4.xxxx)).xyz;
tmp_reg4.xyz = (mul_s(tmp_reg3.yzxx, tmp_reg2.zxyy)).xyz;
tmp_reg4.xyz = (fma_s(-tmp_reg2.yzxx, tmp_reg3.zxyy, tmp_reg4)).xyz;
tmp_reg5.x = dot_3(tmp_reg4.xyz, tmp_reg4.xyz);
bool_regs.x = vs_pica.f[0].xxxx.x >= tmp_reg5.x;
bool_regs.y = vs_pica.f[0].xxxx.y == tmp_reg5.y;
if (bool_regs.x) {
tmp_reg5.x = (vs_pica.f[0].zzzz).x;
} else {
tmp_reg5.x = rsq_s(tmp_reg5.x);
}
tmp_reg4.xyz = (mul_s(tmp_reg4.xyzz, tmp_reg5.xxxx)).xyz;
tmp_reg5.xyz = (mul_s(tmp_reg3.yzxx, tmp_reg4.zxyy)).xyz;
tmp_reg5.xyz = (fma_s(-tmp_reg4.yzxx, tmp_reg3.zxyy, tmp_reg5)).xyz;
tmp_reg6.x = (tmp_reg4.xxxx).x;
tmp_reg6.y = (tmp_reg3.xxxx).y;
tmp_reg6.z = (tmp_reg5.xxxx).z;
tmp_reg6.w = (vs_pica.f[0].xxxx).w;
tmp_reg7.x = (tmp_reg4.yyyy).x;
tmp_reg7.y = (tmp_reg3.yyyy).y;
tmp_reg7.z = (tmp_reg5.yyyy).z;
tmp_reg7.w = (vs_pica.f[0].xxxx).w;
tmp_reg8.x = (tmp_reg4.zzzz).x;
tmp_reg8.y = (tmp_reg3.zzzz).y;
tmp_reg8.z = (tmp_reg5.zzzz).z;
tmp_reg8.w = (vs_pica.f[0].xxxx).w;
tmp_reg9 = vs_pica.f[0].xxxz;
tmp_reg2.x = dot_s(tmp_reg10, tmp_reg6);
tmp_reg2.y = dot_s(tmp_reg10, tmp_reg7);
tmp_reg2.z = dot_s(tmp_reg10, tmp_reg8);
tmp_reg2.w = dot_s(tmp_reg10, tmp_reg9);
tmp_reg3.xyz = (vs_pica.f[5 + addr_regs.x].xyzz).xyz;
tmp_reg3.xyz = (-vs_pica.f[85].xyzz + tmp_reg3.xyzz).xyz;
tmp_reg4.x = dot_3(tmp_reg3.xyz, tmp_reg3.xyz);
bool_regs.x = vs_pica.f[0].xxxx.x >= tmp_reg4.x;
bool_regs.y = vs_pica.f[0].xxxx.y == tmp_reg4.y;
if (bool_regs.x) {
tmp_reg4.x = (vs_pica.f[0].zzzz).x;
} else {
tmp_reg4.x = rsq_s(tmp_reg4.x);
}
tmp_reg3.xyz = (mul_s(tmp_reg3.xyzz, tmp_reg4.xxxx)).xyz;
tmp_reg10.xyz = (vs_pica.f[5 + addr_regs.x].xyzz + tmp_reg2.xyzz).xyz;
tmp_reg10.xyz = (fma_s(tmp_reg3.xyzz, -vs_pica.f[84].zzzz, tmp_reg10.xyzz)).xyz;
tmp_reg2 = vs_pica.f[90];
tmp_reg3 = vs_pica.f[91];
tmp_reg4 = vs_pica.f[92];
tmp_reg5 = vs_pica.f[0].xxxz;
tmp_reg6 = mul_s(vs_pica.f[86].xxxx, tmp_reg2);
tmp_reg6 = fma_s(tmp_reg3, vs_pica.f[86].yyyy, tmp_reg6);
tmp_reg6 = fma_s(tmp_reg4, vs_pica.f[86].zzzz, tmp_reg6);
tmp_reg6 = fma_s(tmp_reg5, vs_pica.f[86].wwww, tmp_reg6);
tmp_reg7 = mul_s(vs_pica.f[87].xxxx, tmp_reg2);
tmp_reg7 = fma_s(tmp_reg3, vs_pica.f[87].yyyy, tmp_reg7);
tmp_reg7 = fma_s(tmp_reg4, vs_pica.f[87].zzzz, tmp_reg7);
tmp_reg7 = fma_s(tmp_reg5, vs_pica.f[87].wwww, tmp_reg7);
tmp_reg8 = mul_s(vs_pica.f[88].xxxx, tmp_reg2);
tmp_reg8 = fma_s(tmp_reg3, vs_pica.f[88].yyyy, tmp_reg8);
tmp_reg8 = fma_s(tmp_reg4, vs_pica.f[88].zzzz, tmp_reg8);
tmp_reg8 = fma_s(tmp_reg5, vs_pica.f[88].wwww, tmp_reg8);
tmp_reg9 = mul_s(vs_pica.f[89].xxxx, tmp_reg2);
tmp_reg9 = fma_s(tmp_reg3, vs_pica.f[89].yyyy, tmp_reg9);
tmp_reg9 = fma_s(tmp_reg4, vs_pica.f[89].zzzz, tmp_reg9);
tmp_reg9 = fma_s(tmp_reg5, vs_pica.f[89].wwww, tmp_reg9);
tmp_reg2 = tmp_reg10;
tmp_reg10.x = dot_s(tmp_reg2, tmp_reg6);
tmp_reg10.y = dot_s(tmp_reg2, tmp_reg7);
tmp_reg10.z = dot_s(tmp_reg2, tmp_reg8);
tmp_reg10.w = dot_s(tmp_reg2, tmp_reg9);
tmp_reg2 = vs_pica.f[1 + addr_regs.x];
tmp_reg3 = max_s(vs_pica.f[0].xxxx, tmp_reg2);
tmp_reg2 = min_s(vs_pica.f[0].zzzz, tmp_reg3);
tmp_reg13 = tmp_reg2;
Vfn10();
vs_out_reg0 = tmp_reg10;
tmp_reg13 = mul_s(vs_pica.f[82], tmp_reg13);
vs_out_reg1 = tmp_reg13;
tmp_reg11.y = (vs_pica.f[0].zzzz + -tmp_reg11.yyyy).y;
tmp_reg12.y = (vs_pica.f[0].zzzz + -tmp_reg12.yyyy).y;
tmp_reg14.y = (vs_pica.f[81].wwww).y;
tmp_reg14.x = (mul_s(vs_pica.f[0].wwww, tmp_reg14.yyyy)).x;
tmp_reg2.x = rcp_s(tmp_reg14.x);
tmp_reg14.z = (tmp_reg2.xxxx).z;
tmp_reg3.xy = (vs_pica.f[81].wwww + tmp_reg11.xyyy).xy;
tmp_reg5.xy = (mul_s(tmp_reg3.xyyy, tmp_reg14.zzzz)).xy;
tmp_reg4.xy = (floor(tmp_reg5.xyyy)).xy;
tmp_reg4.xy = (mul_s(tmp_reg4.xyyy, tmp_reg14.xxxx)).xy;
tmp_reg4.xy = (tmp_reg3.xyyy + -tmp_reg4.xyyy).xy;
tmp_reg11.xy = (-vs_pica.f[81].wwww + tmp_reg4.xyyy).xy;
tmp_reg3.xy = (vs_pica.f[81].wwww + tmp_reg12.xyyy).xy;
tmp_reg5.xy = (mul_s(tmp_reg3.xyyy, tmp_reg14.zzzz)).xy;
tmp_reg4.xy = (floor(tmp_reg5.xyyy)).xy;
tmp_reg4.xy = (mul_s(tmp_reg4.xyyy, tmp_reg14.xxxx)).xy;
tmp_reg4.xy = (tmp_reg3.xyyy + -tmp_reg4.xyyy).xy;
tmp_reg12.xy = (-vs_pica.f[81].wwww + tmp_reg4.xyyy).xy;
vs_out_reg2 = tmp_reg11;
vs_out_reg3 = tmp_reg12;
return true;
}
// shader: 8B30, 2BBDF6053C100310
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
depth /= gl_FragCoord.w;
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
vec3 color_output_1 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, BBCE113ED5A67B1F
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
depth /= gl_FragCoord.w;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (texcolor0.rgb);
float alpha_output_0 = (texcolor0.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: BDAB7D22C4B14A06, 022E9264412C0B93
// reference: A8E2925320FCE9FF, F1C1E1D2B63B6F7E
// reference: FCE0BEE4D793B133, BF11DF99666DC21A
// reference: DB4D6D5FB2DA55EB, EA2B8F207887AD03
// reference: 339C1615C23E91C5, 2BBDF6053C100310
// reference: 29598684FDA26B66, BBCE113ED5A67B1F
// program: B753A1567A802E0D, 0000000000000000, 022E9264412C0B93
// program: 2DE4619EDA6BD2CD, 0000000000000000, F1C1E1D2B63B6F7E
// program: 2DE4619EDA6BD2CD, 0000000000000000, BF11DF99666DC21A
// program: EA2B8F207887AD03, 0000000000000000, 2BBDF6053C100310
// program: EA2B8F207887AD03, 0000000000000000, BBCE113ED5A67B1F
// shader: 8B30, 928EE172913A8D3B
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (texcolor1.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor0.r) * (texcolor1.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp((vec3(1) - combiner_buffer.rgb) * (const_color[2].rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) + (combiner_buffer.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, C2EF3825CD80EF3A
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (texcolor0.rgb);
float alpha_output_0 = (texcolor0.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) - (1.0 - rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1 * 1.0, alpha_output_1 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp((vec3(1) - combiner_buffer.rgb) * (const_color[2].rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) + (combiner_buffer.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B31, 18D6C060DACA46E7

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
texcoord0 = vec4(vs_out_reg2.x,vs_out_reg2.y,1,1);
texcoord12 = vec4(vs_out_reg3.x,vs_out_reg3.y,1,1);
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
bool Vfn11();
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
Vfn0();
return true;
}

bool Vfn11() {
tmp_reg2.x = rcp_s(vs_pica.f[81].y);
tmp_reg2.xy = (mul_s(vs_pica.f[2 + addr_regs.x].zwww, tmp_reg2.xxxx)).xy;
tmp_reg2.xy = (vs_pica.f[0].yyyy + tmp_reg2.xyyy).xy;
tmp_reg3.xy = (floor(tmp_reg2.xyyy)).xy;
tmp_reg2.xy = (mul_s(vs_pica.f[81].yyyy, tmp_reg3.xyyy)).xy;
tmp_reg2.xy = (vs_pica.f[2 + addr_regs.x].zwww + -tmp_reg2.xyyy).xy;
tmp_reg0.xy = (min_s(vs_pica.f[81].xxxx, -tmp_reg2.xyyy)).xy;
tmp_reg0.xy = (max_s(-vs_pica.f[81].xxxx, tmp_reg0.xyyy)).xy;
tmp_reg2 = vs_pica.f[95];
tmp_reg3 = vs_pica.f[94];
tmp_reg1.z = (mul_s(tmp_reg0.xxxx, tmp_reg0.xxxx)).z;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg2.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.zwww)).xy;
tmp_reg2 = vs_pica.f[93];
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.y = (mul_s(tmp_reg1.yyyy, tmp_reg0.xxxx)).y;
tmp_reg5.x = (vs_pica.f[5 + addr_regs.x].wwww).x;
tmp_reg14.x = (vs_in_reg0.xxxx).x;
tmp_reg14.y = (vs_in_reg0.yyyy).y;
bool_regs.x = vs_pica.f[0].xxxx.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].xxxx.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (vs_in_reg0.xxxx).x;
tmp_reg14.y = (vs_in_reg0.yyyy).y;
}
bool_regs.x = vs_pica.f[0].zzzz.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].zzzz.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (-vs_in_reg0.xxxx).x;
}
bool_regs.x = vs_pica.f[0].wwww.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].wwww.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.y = (-vs_in_reg0.yyyy).y;
}
bool_regs.x = vs_pica.f[0].wwww.x < tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].wwww.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (-vs_in_reg0.xxxx).x;
tmp_reg14.y = (-vs_in_reg0.yyyy).y;
}
tmp_reg4.xy = (mul_s(tmp_reg14.xxxx, tmp_reg1.xyyy)).xy;
tmp_reg4.x = (fma_s(-tmp_reg14.yyyy, tmp_reg1.yyyy, tmp_reg4.xxxx)).x;
tmp_reg4.y = (fma_s(tmp_reg14.yyyy, tmp_reg1.xxxx, tmp_reg4.yyyy)).y;
tmp_reg5.x = (vs_pica.f[0].yyyy + tmp_reg4.xxxx).x;
tmp_reg5.y = (-vs_pica.f[0].yyyy + tmp_reg4.yyyy).y;
tmp_reg4.z = (vs_pica.f[83].xxxx).z;
tmp_reg4.w = (-vs_pica.f[83].yyyy).w;
tmp_reg5.xy = (fma_s(tmp_reg5.xyyy, tmp_reg4.zwww, vs_pica.f[3 + addr_regs.x].xyyy)).xy;
tmp_reg4.z = (-vs_pica.f[3 + addr_regs.x].zzzz).z;
tmp_reg4.w = (-vs_pica.f[3 + addr_regs.x].wwww).w;
tmp_reg5.z = (vs_pica.f[0].zzzz + tmp_reg4.zzzz).z;
tmp_reg5.w = (vs_pica.f[0].zzzz + tmp_reg4.wwww).w;
tmp_reg5.x = (fma_s(-tmp_reg5.zzzz, tmp_reg4.xxxx, tmp_reg5.xxxx)).x;
tmp_reg5.y = (fma_s(tmp_reg5.wwww, tmp_reg4.yyyy, tmp_reg5.yyyy)).y;
tmp_reg11.xy = (tmp_reg5.xyyy).xy;
tmp_reg2 = vs_pica.f[95];
tmp_reg3 = vs_pica.f[94];
tmp_reg1.z = (mul_s(tmp_reg0.yyyy, tmp_reg0.yyyy)).z;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg2.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.zwww)).xy;
tmp_reg2 = vs_pica.f[93];
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.y = (mul_s(tmp_reg1.yyyy, tmp_reg0.yyyy)).y;
tmp_reg5.x = (vs_pica.f[6 + addr_regs.x].wwww).x;
tmp_reg14.x = (vs_in_reg0.xxxx).x;
tmp_reg14.y = (vs_in_reg0.yyyy).y;
bool_regs.x = vs_pica.f[0].xxxx.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].xxxx.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (vs_in_reg0.xxxx).x;
tmp_reg14.y = (vs_in_reg0.yyyy).y;
}
bool_regs.x = vs_pica.f[0].zzzz.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].zzzz.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (-vs_in_reg0.xxxx).x;
}
bool_regs.x = vs_pica.f[0].wwww.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].wwww.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.y = (-vs_in_reg0.yyyy).y;
}
bool_regs.x = vs_pica.f[0].wwww.x < tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].wwww.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (-vs_in_reg0.xxxx).x;
tmp_reg14.y = (-vs_in_reg0.yyyy).y;
}
tmp_reg4.xy = (mul_s(tmp_reg14.xxxx, tmp_reg1.xyyy)).xy;
tmp_reg4.x = (fma_s(-tmp_reg14.yyyy, tmp_reg1.yyyy, tmp_reg4.xxxx)).x;
tmp_reg4.y = (fma_s(tmp_reg14.yyyy, tmp_reg1.xxxx, tmp_reg4.yyyy)).y;
tmp_reg5.x = (vs_pica.f[0].yyyy + tmp_reg4.xxxx).x;
tmp_reg5.y = (-vs_pica.f[0].yyyy + tmp_reg4.yyyy).y;
tmp_reg4.z = (vs_pica.f[83].zzzz).z;
tmp_reg4.w = (-vs_pica.f[83].wwww).w;
tmp_reg5.xy = (fma_s(tmp_reg5.xyyy, tmp_reg4.zwww, vs_pica.f[4 + addr_regs.x].xyyy)).xy;
tmp_reg4.z = (-vs_pica.f[4 + addr_regs.x].zzzz).z;
tmp_reg4.w = (-vs_pica.f[4 + addr_regs.x].wwww).w;
tmp_reg5.z = (vs_pica.f[0].zzzz + tmp_reg4.zzzz).z;
tmp_reg5.w = (vs_pica.f[0].zzzz + tmp_reg4.wwww).w;
tmp_reg5.x = (fma_s(-tmp_reg5.zzzz, tmp_reg4.xxxx, tmp_reg5.xxxx)).x;
tmp_reg5.y = (fma_s(tmp_reg5.wwww, tmp_reg4.yyyy, tmp_reg5.yyyy)).y;
tmp_reg12.xy = (tmp_reg5.xyyy).xy;
return false;
}
bool Vfn0() {
addr_regs.x = (ivec2(vs_in_reg0.zz)).x;
tmp_reg10 = vs_pica.f[0].xxxz;
tmp_reg10.xy = (vs_in_reg0.xyyy).xy;
tmp_reg11 = vs_pica.f[0].xxxx;
tmp_reg12 = vs_pica.f[0].xxxx;
tmp_reg13 = vs_pica.f[0].zzzz;
tmp_reg4 = vs_pica.f[0].xxxx;
tmp_reg5 = vs_pica.f[0].xxxx;
tmp_reg10.xy = (vs_pica.f[84].xyyy + tmp_reg10.xyyy).xy;
tmp_reg10.xy = (mul_s(vs_pica.f[2 + addr_regs.x].xyyy, tmp_reg10.xyyy)).xy;
tmp_reg0 = vs_pica.f[7 + addr_regs.x];
tmp_reg6.xyz = (-tmp_reg0.xyzz).xyz;
tmp_reg6.w = (vs_pica.f[0].xxxx).w;
tmp_reg7.xyz = vec3(rcp_s(vs_pica.f[81].y));
tmp_reg8.xyz = (fma_s(tmp_reg6.xyzz, tmp_reg7.xyzz, vs_pica.f[0].yyyy)).xyz;
tmp_reg7.xyz = (floor(tmp_reg8.xyzz)).xyz;
tmp_reg6.xyz = (fma_s(tmp_reg7.xyzz, -vs_pica.f[81].yyyy, tmp_reg6.xyzz)).xyz;
tmp_reg6 = min_s(vs_pica.f[81].xxxx, tmp_reg6);
tmp_reg6 = max_s(-vs_pica.f[81].xxxx, tmp_reg6);
tmp_reg2 = vs_pica.f[95];
tmp_reg3 = vs_pica.f[94];
tmp_reg1.z = (mul_s(tmp_reg6.xxxx, tmp_reg6.xxxx)).z;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg2.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.zwww)).xy;
tmp_reg2 = vs_pica.f[93];
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.y = (mul_s(tmp_reg1.yyyy, tmp_reg6.xxxx)).y;
tmp_reg4.x = (tmp_reg1.xxxx).x;
tmp_reg5.x = (tmp_reg1.yyyy).x;
tmp_reg2 = vs_pica.f[95];
tmp_reg3 = vs_pica.f[94];
tmp_reg1.z = (mul_s(tmp_reg6.yyyy, tmp_reg6.yyyy)).z;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg2.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.zwww)).xy;
tmp_reg2 = vs_pica.f[93];
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.y = (mul_s(tmp_reg1.yyyy, tmp_reg6.yyyy)).y;
tmp_reg4.y = (tmp_reg1.xxxx).y;
tmp_reg5.y = (tmp_reg1.yyyy).y;
tmp_reg2 = vs_pica.f[95];
tmp_reg3 = vs_pica.f[94];
tmp_reg1.z = (mul_s(tmp_reg6.zzzz, tmp_reg6.zzzz)).z;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg2.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.zwww)).xy;
tmp_reg2 = vs_pica.f[93];
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.y = (mul_s(tmp_reg1.yyyy, tmp_reg6.zzzz)).y;
tmp_reg4.z = (tmp_reg1.xxxx).z;
tmp_reg5.z = (tmp_reg1.yyyy).z;
tmp_reg2.x = (mul_s(tmp_reg4.yyyy, tmp_reg5.zzzz)).x;
tmp_reg2.y = (mul_s(tmp_reg5.yyyy, tmp_reg5.zzzz)).y;
tmp_reg6.x = (mul_s(tmp_reg4.yyyy, tmp_reg4.zzzz)).x;
tmp_reg6.y = (tmp_reg5.zzzz).y;
tmp_reg6.z = (mul_s(-tmp_reg5.yyyy, tmp_reg4.zzzz)).z;
tmp_reg6.w = (vs_pica.f[0].xxxx).w;
tmp_reg7.x = (mul_s(-tmp_reg2.xxxx, tmp_reg4.xxxx)).x;
tmp_reg7.x = (fma_s(tmp_reg5.yyyy, tmp_reg5.xxxx, tmp_reg7.xxxx)).x;
tmp_reg7.y = (mul_s(tmp_reg4.zzzz, tmp_reg4.xxxx)).y;
tmp_reg7.z = (mul_s(tmp_reg2.yyyy, tmp_reg4.xxxx)).z;
tmp_reg7.z = (fma_s(tmp_reg4.yyyy, tmp_reg5.xxxx, tmp_reg7.zzzz)).z;
tmp_reg7.w = (vs_pica.f[0].xxxx).w;
tmp_reg8.x = (mul_s(tmp_reg2.xxxx, tmp_reg5.xxxx)).x;
tmp_reg8.x = (fma_s(tmp_reg5.yyyy, tmp_reg4.xxxx, tmp_reg8.xxxx)).x;
tmp_reg8.y = (mul_s(-tmp_reg4.zzzz, tmp_reg5.xxxx)).y;
tmp_reg8.z = (mul_s(-tmp_reg2.yyyy, tmp_reg5.xxxx)).z;
tmp_reg8.z = (fma_s(tmp_reg4.yyyy, tmp_reg4.xxxx, tmp_reg8.zzzz)).z;
tmp_reg8.w = (vs_pica.f[0].xxxx).w;
tmp_reg9 = vs_pica.f[0].xxxz;
tmp_reg2.x = dot_s(tmp_reg10, tmp_reg6);
tmp_reg2.y = dot_s(tmp_reg10, tmp_reg7);
tmp_reg2.z = dot_s(tmp_reg10, tmp_reg8);
tmp_reg2.w = dot_s(tmp_reg10, tmp_reg9);
tmp_reg10 = tmp_reg2;
tmp_reg1.xyz = (vs_pica.f[92].xyzz).xyz;
tmp_reg1.w = (vs_pica.f[0].xxxx).w;
tmp_reg2.xyz = (tmp_reg1.xyzz).xyz;
tmp_reg3.xyz = (vs_pica.f[6 + addr_regs.x].xyzz).xyz;
tmp_reg4.x = dot_3(tmp_reg3.xyz, tmp_reg3.xyz);
bool_regs.x = vs_pica.f[0].xxxx.x >= tmp_reg4.x;
bool_regs.y = vs_pica.f[0].xxxx.y == tmp_reg4.y;
if (bool_regs.x) {
tmp_reg4.x = (vs_pica.f[0].zzzz).x;
} else {
tmp_reg4.x = rsq_s(tmp_reg4.x);
}
tmp_reg3.xyz = (mul_s(tmp_reg3.xyzz, tmp_reg4.xxxx)).xyz;
tmp_reg4.xyz = (mul_s(tmp_reg3.yzxx, tmp_reg2.zxyy)).xyz;
tmp_reg4.xyz = (fma_s(-tmp_reg2.yzxx, tmp_reg3.zxyy, tmp_reg4)).xyz;
tmp_reg5.x = dot_3(tmp_reg4.xyz, tmp_reg4.xyz);
bool_regs.x = vs_pica.f[0].xxxx.x >= tmp_reg5.x;
bool_regs.y = vs_pica.f[0].xxxx.y == tmp_reg5.y;
if (bool_regs.x) {
tmp_reg5.x = (vs_pica.f[0].zzzz).x;
} else {
tmp_reg5.x = rsq_s(tmp_reg5.x);
}
tmp_reg4.xyz = (mul_s(tmp_reg4.xyzz, tmp_reg5.xxxx)).xyz;
tmp_reg5.xyz = (mul_s(tmp_reg3.yzxx, tmp_reg4.zxyy)).xyz;
tmp_reg5.xyz = (fma_s(-tmp_reg4.yzxx, tmp_reg3.zxyy, tmp_reg5)).xyz;
tmp_reg6.x = (tmp_reg4.xxxx).x;
tmp_reg6.y = (tmp_reg3.xxxx).y;
tmp_reg6.z = (tmp_reg5.xxxx).z;
tmp_reg6.w = (vs_pica.f[0].xxxx).w;
tmp_reg7.x = (tmp_reg4.yyyy).x;
tmp_reg7.y = (tmp_reg3.yyyy).y;
tmp_reg7.z = (tmp_reg5.yyyy).z;
tmp_reg7.w = (vs_pica.f[0].xxxx).w;
tmp_reg8.x = (tmp_reg4.zzzz).x;
tmp_reg8.y = (tmp_reg3.zzzz).y;
tmp_reg8.z = (tmp_reg5.zzzz).z;
tmp_reg8.w = (vs_pica.f[0].xxxx).w;
tmp_reg9 = vs_pica.f[0].xxxz;
tmp_reg2.x = dot_s(tmp_reg10, tmp_reg6);
tmp_reg2.y = dot_s(tmp_reg10, tmp_reg7);
tmp_reg2.z = dot_s(tmp_reg10, tmp_reg8);
tmp_reg2.w = dot_s(tmp_reg10, tmp_reg9);
tmp_reg3.xyz = (vs_pica.f[5 + addr_regs.x].xyzz).xyz;
tmp_reg3.xyz = (-vs_pica.f[85].xyzz + tmp_reg3.xyzz).xyz;
tmp_reg4.x = dot_3(tmp_reg3.xyz, tmp_reg3.xyz);
bool_regs.x = vs_pica.f[0].xxxx.x >= tmp_reg4.x;
bool_regs.y = vs_pica.f[0].xxxx.y == tmp_reg4.y;
if (bool_regs.x) {
tmp_reg4.x = (vs_pica.f[0].zzzz).x;
} else {
tmp_reg4.x = rsq_s(tmp_reg4.x);
}
tmp_reg3.xyz = (mul_s(tmp_reg3.xyzz, tmp_reg4.xxxx)).xyz;
tmp_reg10.xyz = (vs_pica.f[5 + addr_regs.x].xyzz + tmp_reg2.xyzz).xyz;
tmp_reg10.xyz = (fma_s(tmp_reg3.xyzz, -vs_pica.f[84].zzzz, tmp_reg10.xyzz)).xyz;
tmp_reg2 = vs_pica.f[90];
tmp_reg3 = vs_pica.f[91];
tmp_reg4 = vs_pica.f[92];
tmp_reg5 = vs_pica.f[0].xxxz;
tmp_reg6 = mul_s(vs_pica.f[86].xxxx, tmp_reg2);
tmp_reg6 = fma_s(tmp_reg3, vs_pica.f[86].yyyy, tmp_reg6);
tmp_reg6 = fma_s(tmp_reg4, vs_pica.f[86].zzzz, tmp_reg6);
tmp_reg6 = fma_s(tmp_reg5, vs_pica.f[86].wwww, tmp_reg6);
tmp_reg7 = mul_s(vs_pica.f[87].xxxx, tmp_reg2);
tmp_reg7 = fma_s(tmp_reg3, vs_pica.f[87].yyyy, tmp_reg7);
tmp_reg7 = fma_s(tmp_reg4, vs_pica.f[87].zzzz, tmp_reg7);
tmp_reg7 = fma_s(tmp_reg5, vs_pica.f[87].wwww, tmp_reg7);
tmp_reg8 = mul_s(vs_pica.f[88].xxxx, tmp_reg2);
tmp_reg8 = fma_s(tmp_reg3, vs_pica.f[88].yyyy, tmp_reg8);
tmp_reg8 = fma_s(tmp_reg4, vs_pica.f[88].zzzz, tmp_reg8);
tmp_reg8 = fma_s(tmp_reg5, vs_pica.f[88].wwww, tmp_reg8);
tmp_reg9 = mul_s(vs_pica.f[89].xxxx, tmp_reg2);
tmp_reg9 = fma_s(tmp_reg3, vs_pica.f[89].yyyy, tmp_reg9);
tmp_reg9 = fma_s(tmp_reg4, vs_pica.f[89].zzzz, tmp_reg9);
tmp_reg9 = fma_s(tmp_reg5, vs_pica.f[89].wwww, tmp_reg9);
tmp_reg2 = tmp_reg10;
tmp_reg10.x = dot_s(tmp_reg2, tmp_reg6);
tmp_reg10.y = dot_s(tmp_reg2, tmp_reg7);
tmp_reg10.z = dot_s(tmp_reg2, tmp_reg8);
tmp_reg10.w = dot_s(tmp_reg2, tmp_reg9);
tmp_reg2 = vs_pica.f[1 + addr_regs.x];
tmp_reg3 = max_s(vs_pica.f[0].xxxx, tmp_reg2);
tmp_reg2 = min_s(vs_pica.f[0].zzzz, tmp_reg3);
tmp_reg13 = tmp_reg2;
Vfn11();
vs_out_reg0 = tmp_reg10;
tmp_reg13 = mul_s(vs_pica.f[82], tmp_reg13);
vs_out_reg1 = tmp_reg13;
tmp_reg11.y = (vs_pica.f[0].zzzz + -tmp_reg11.yyyy).y;
tmp_reg12.y = (vs_pica.f[0].zzzz + -tmp_reg12.yyyy).y;
tmp_reg14.y = (vs_pica.f[81].wwww).y;
tmp_reg14.x = (mul_s(vs_pica.f[0].wwww, tmp_reg14.yyyy)).x;
tmp_reg2.x = rcp_s(tmp_reg14.x);
tmp_reg14.z = (tmp_reg2.xxxx).z;
tmp_reg3.xy = (vs_pica.f[81].wwww + tmp_reg11.xyyy).xy;
tmp_reg5.xy = (mul_s(tmp_reg3.xyyy, tmp_reg14.zzzz)).xy;
tmp_reg4.xy = (floor(tmp_reg5.xyyy)).xy;
tmp_reg4.xy = (mul_s(tmp_reg4.xyyy, tmp_reg14.xxxx)).xy;
tmp_reg4.xy = (tmp_reg3.xyyy + -tmp_reg4.xyyy).xy;
tmp_reg11.xy = (-vs_pica.f[81].wwww + tmp_reg4.xyyy).xy;
tmp_reg3.xy = (vs_pica.f[81].wwww + tmp_reg12.xyyy).xy;
tmp_reg5.xy = (mul_s(tmp_reg3.xyyy, tmp_reg14.zzzz)).xy;
tmp_reg4.xy = (floor(tmp_reg5.xyyy)).xy;
tmp_reg4.xy = (mul_s(tmp_reg4.xyyy, tmp_reg14.xxxx)).xy;
tmp_reg4.xy = (tmp_reg3.xyyy + -tmp_reg4.xyyy).xy;
tmp_reg12.xy = (-vs_pica.f[81].wwww + tmp_reg4.xyyy).xy;
vs_out_reg2 = tmp_reg11;
vs_out_reg3 = tmp_reg12;
return true;
}
// shader: 8B30, 0F33A602714910EF
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (texcolor0.rgb);
float alpha_output_0 = (texcolor0.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp((vec3(1) - combiner_buffer.rgb) * (const_color[2].rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) + (combiner_buffer.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 58823F53CBBC985E
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (texcolor1.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor0.r) * (texcolor1.r), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) - (1.0 - rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1 * 1.0, alpha_output_1 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp((vec3(1) - combiner_buffer.rgb) * (const_color[2].rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) + (combiner_buffer.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 4C4C6A734C41D3DB
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
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) - (1.0 - rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1 * 1.0, alpha_output_1 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp((vec3(1) - combiner_buffer.rgb) * (const_color[2].rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = (const_color[3].rgb);
float alpha_output_3 = (const_color[3].a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((last_tev_out.rgb), (const_color[4].rgb), (combiner_buffer.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(mix((last_tev_out.a), (const_color[4].a), (combiner_buffer.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 0C0FD25AF0A39100, 928EE172913A8D3B
// reference: 9F8DB7C86E51DA57, C2EF3825CD80EF3A
// reference: DB4D6D5F44918E4A, 18D6C060DACA46E7
// reference: C8C06C3BCF3F6BA3, 0F33A602714910EF
// reference: D68AD82351CD20F4, 58823F53CBBC985E
// reference: D7EE32FB9FEC4428, 4C4C6A734C41D3DB
// program: EA2B8F207887AD03, 0000000000000000, 928EE172913A8D3B
// program: EA2B8F207887AD03, 0000000000000000, C2EF3825CD80EF3A
// program: 18D6C060DACA46E7, 0000000000000000, 0F33A602714910EF
// program: 18D6C060DACA46E7, 0000000000000000, 58823F53CBBC985E
// program: 2DE4619EDA6BD2CD, 0000000000000000, 4C4C6A734C41D3DB
// shader: 8B30, A1DF63E31D4B7D11
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
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp((vec3(1) - combiner_buffer.rgb) * (const_color[2].rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = (const_color[3].rgb);
float alpha_output_3 = (const_color[3].a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((last_tev_out.rgb), (const_color[4].rgb), (combiner_buffer.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(mix((last_tev_out.a), (const_color[4].a), (combiner_buffer.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B31, 599CFF24BA71B7B3

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
texcoord0 = vec4(vs_out_reg2.x,vs_out_reg2.y,1,1);
texcoord12 = vec4(vs_out_reg3.x,vs_out_reg3.y,1,1);
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
bool Vfn6();
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
Vfn0();
return true;
}

bool Vfn6() {
tmp_reg2.x = rcp_s(vs_pica.f[81].y);
tmp_reg2.xy = (mul_s(vs_pica.f[2 + addr_regs.x].zwww, tmp_reg2.xxxx)).xy;
tmp_reg2.xy = (vs_pica.f[0].yyyy + tmp_reg2.xyyy).xy;
tmp_reg3.xy = (floor(tmp_reg2.xyyy)).xy;
tmp_reg2.xy = (mul_s(vs_pica.f[81].yyyy, tmp_reg3.xyyy)).xy;
tmp_reg2.xy = (vs_pica.f[2 + addr_regs.x].zwww + -tmp_reg2.xyyy).xy;
tmp_reg0.xy = (min_s(vs_pica.f[81].xxxx, -tmp_reg2.xyyy)).xy;
tmp_reg0.xy = (max_s(-vs_pica.f[81].xxxx, tmp_reg0.xyyy)).xy;
tmp_reg2 = vs_pica.f[95];
tmp_reg3 = vs_pica.f[94];
tmp_reg1.z = (mul_s(tmp_reg0.xxxx, tmp_reg0.xxxx)).z;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg2.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.zwww)).xy;
tmp_reg2 = vs_pica.f[93];
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.y = (mul_s(tmp_reg1.yyyy, tmp_reg0.xxxx)).y;
tmp_reg5.x = (vs_pica.f[5 + addr_regs.x].wwww).x;
tmp_reg14.x = (vs_in_reg0.xxxx).x;
tmp_reg14.y = (vs_in_reg0.yyyy).y;
bool_regs.x = vs_pica.f[0].xxxx.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].xxxx.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (vs_in_reg0.xxxx).x;
tmp_reg14.y = (vs_in_reg0.yyyy).y;
}
bool_regs.x = vs_pica.f[0].zzzz.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].zzzz.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (-vs_in_reg0.xxxx).x;
}
bool_regs.x = vs_pica.f[0].wwww.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].wwww.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.y = (-vs_in_reg0.yyyy).y;
}
bool_regs.x = vs_pica.f[0].wwww.x < tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].wwww.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (-vs_in_reg0.xxxx).x;
tmp_reg14.y = (-vs_in_reg0.yyyy).y;
}
tmp_reg4.xy = (mul_s(tmp_reg14.xxxx, tmp_reg1.xyyy)).xy;
tmp_reg4.x = (fma_s(-tmp_reg14.yyyy, tmp_reg1.yyyy, tmp_reg4.xxxx)).x;
tmp_reg4.y = (fma_s(tmp_reg14.yyyy, tmp_reg1.xxxx, tmp_reg4.yyyy)).y;
tmp_reg5.x = (vs_pica.f[0].yyyy + tmp_reg4.xxxx).x;
tmp_reg5.y = (-vs_pica.f[0].yyyy + tmp_reg4.yyyy).y;
tmp_reg4.z = (vs_pica.f[83].xxxx).z;
tmp_reg4.w = (-vs_pica.f[83].yyyy).w;
tmp_reg5.xy = (fma_s(tmp_reg5.xyyy, tmp_reg4.zwww, vs_pica.f[3 + addr_regs.x].xyyy)).xy;
tmp_reg4.z = (-vs_pica.f[3 + addr_regs.x].zzzz).z;
tmp_reg4.w = (-vs_pica.f[3 + addr_regs.x].wwww).w;
tmp_reg5.z = (vs_pica.f[0].zzzz + tmp_reg4.zzzz).z;
tmp_reg5.w = (vs_pica.f[0].zzzz + tmp_reg4.wwww).w;
tmp_reg5.x = (fma_s(-tmp_reg5.zzzz, tmp_reg4.xxxx, tmp_reg5.xxxx)).x;
tmp_reg5.y = (fma_s(tmp_reg5.wwww, tmp_reg4.yyyy, tmp_reg5.yyyy)).y;
tmp_reg11.xy = (tmp_reg5.xyyy).xy;
tmp_reg2 = vs_pica.f[95];
tmp_reg3 = vs_pica.f[94];
tmp_reg1.z = (mul_s(tmp_reg0.yyyy, tmp_reg0.yyyy)).z;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg2.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.zwww)).xy;
tmp_reg2 = vs_pica.f[93];
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg2.zwww)).xy;
tmp_reg1.y = (mul_s(tmp_reg1.yyyy, tmp_reg0.yyyy)).y;
tmp_reg5.x = (vs_pica.f[6 + addr_regs.x].wwww).x;
tmp_reg14.x = (vs_in_reg0.xxxx).x;
tmp_reg14.y = (vs_in_reg0.yyyy).y;
bool_regs.x = vs_pica.f[0].xxxx.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].xxxx.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (vs_in_reg0.xxxx).x;
tmp_reg14.y = (vs_in_reg0.yyyy).y;
}
bool_regs.x = vs_pica.f[0].zzzz.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].zzzz.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (-vs_in_reg0.xxxx).x;
}
bool_regs.x = vs_pica.f[0].wwww.x == tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].wwww.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.y = (-vs_in_reg0.yyyy).y;
}
bool_regs.x = vs_pica.f[0].wwww.x < tmp_reg5.xxxx.x;
bool_regs.y = vs_pica.f[0].wwww.y != tmp_reg5.xxxx.y;
if (bool_regs.x) {
tmp_reg14.x = (-vs_in_reg0.xxxx).x;
tmp_reg14.y = (-vs_in_reg0.yyyy).y;
}
tmp_reg4.xy = (mul_s(tmp_reg14.xxxx, tmp_reg1.xyyy)).xy;
tmp_reg4.x = (fma_s(-tmp_reg14.yyyy, tmp_reg1.yyyy, tmp_reg4.xxxx)).x;
tmp_reg4.y = (fma_s(tmp_reg14.yyyy, tmp_reg1.xxxx, tmp_reg4.yyyy)).y;
tmp_reg5.x = (vs_pica.f[0].yyyy + tmp_reg4.xxxx).x;
tmp_reg5.y = (-vs_pica.f[0].yyyy + tmp_reg4.yyyy).y;
tmp_reg4.z = (vs_pica.f[83].zzzz).z;
tmp_reg4.w = (-vs_pica.f[83].wwww).w;
tmp_reg5.xy = (fma_s(tmp_reg5.xyyy, tmp_reg4.zwww, vs_pica.f[4 + addr_regs.x].xyyy)).xy;
tmp_reg4.z = (-vs_pica.f[4 + addr_regs.x].zzzz).z;
tmp_reg4.w = (-vs_pica.f[4 + addr_regs.x].wwww).w;
tmp_reg5.z = (vs_pica.f[0].zzzz + tmp_reg4.zzzz).z;
tmp_reg5.w = (vs_pica.f[0].zzzz + tmp_reg4.wwww).w;
tmp_reg5.x = (fma_s(-tmp_reg5.zzzz, tmp_reg4.xxxx, tmp_reg5.xxxx)).x;
tmp_reg5.y = (fma_s(tmp_reg5.wwww, tmp_reg4.yyyy, tmp_reg5.yyyy)).y;
tmp_reg12.xy = (tmp_reg5.xyyy).xy;
return false;
}
bool Vfn0() {
addr_regs.x = (ivec2(vs_in_reg0.zz)).x;
tmp_reg10 = vs_pica.f[0].xxxz;
tmp_reg10.xy = (vs_in_reg0.xyyy).xy;
tmp_reg11 = vs_pica.f[0].xxxx;
tmp_reg12 = vs_pica.f[0].xxxx;
tmp_reg13 = vs_pica.f[0].zzzz;
tmp_reg4 = vs_pica.f[0].xxxx;
tmp_reg5 = vs_pica.f[0].xxxx;
tmp_reg10.xy = (vs_pica.f[84].xyyy + tmp_reg10.xyyy).xy;
tmp_reg10.xy = (mul_s(vs_pica.f[2 + addr_regs.x].xyyy, tmp_reg10.xyyy)).xy;
tmp_reg6.x = (vs_pica.f[90].xxxx).x;
tmp_reg6.y = (vs_pica.f[91].xxxx).y;
tmp_reg6.z = (vs_pica.f[92].xxxx).z;
tmp_reg6.w = (vs_pica.f[0].xxxx).w;
tmp_reg7.x = (vs_pica.f[90].yyyy).x;
tmp_reg7.y = (vs_pica.f[91].yyyy).y;
tmp_reg7.z = (vs_pica.f[92].yyyy).z;
tmp_reg7.w = (vs_pica.f[0].xxxx).w;
tmp_reg8.x = (vs_pica.f[90].zzzz).x;
tmp_reg8.y = (vs_pica.f[91].zzzz).y;
tmp_reg8.z = (vs_pica.f[92].zzzz).z;
tmp_reg8.w = (vs_pica.f[0].xxxx).w;
tmp_reg9.x = (vs_pica.f[90].wwww).x;
tmp_reg9.y = (vs_pica.f[91].wwww).y;
tmp_reg9.z = (vs_pica.f[92].wwww).z;
tmp_reg9.w = (vs_pica.f[0].zzzz).w;
tmp_reg2.x = dot_s(tmp_reg10, tmp_reg6);
tmp_reg2.y = dot_s(tmp_reg10, tmp_reg7);
tmp_reg2.z = dot_s(tmp_reg10, tmp_reg8);
tmp_reg2.w = dot_s(vs_pica.f[0].xxxz, tmp_reg10);
tmp_reg3.xyz = (vs_pica.f[5 + addr_regs.x].xyzz).xyz;
tmp_reg3.xyz = (vs_pica.f[85].xyzz + -tmp_reg3.xyzz).xyz;
tmp_reg4.x = dot_3(tmp_reg3.xyz, tmp_reg3.xyz);
bool_regs.x = vs_pica.f[0].xxxx.x >= tmp_reg4.x;
bool_regs.y = vs_pica.f[0].xxxx.y == tmp_reg4.y;
if (bool_regs.x) {
tmp_reg4.x = (vs_pica.f[0].zzzz).x;
} else {
tmp_reg4.x = rsq_s(tmp_reg4.x);
}
tmp_reg3.xyz = (mul_s(tmp_reg3.xyzz, tmp_reg4.xxxx)).xyz;
tmp_reg10.xyz = (vs_pica.f[5 + addr_regs.x].xyzz + tmp_reg2.xyzz).xyz;
tmp_reg10.xyz = (fma_s(tmp_reg3.xyzz, vs_pica.f[84].zzzz, tmp_reg10.xyzz)).xyz;
tmp_reg2 = vs_pica.f[90];
tmp_reg3 = vs_pica.f[91];
tmp_reg4 = vs_pica.f[92];
tmp_reg5 = vs_pica.f[0].xxxz;
tmp_reg6 = mul_s(vs_pica.f[86].xxxx, tmp_reg2);
tmp_reg6 = fma_s(tmp_reg3, vs_pica.f[86].yyyy, tmp_reg6);
tmp_reg6 = fma_s(tmp_reg4, vs_pica.f[86].zzzz, tmp_reg6);
tmp_reg6 = fma_s(tmp_reg5, vs_pica.f[86].wwww, tmp_reg6);
tmp_reg7 = mul_s(vs_pica.f[87].xxxx, tmp_reg2);
tmp_reg7 = fma_s(tmp_reg3, vs_pica.f[87].yyyy, tmp_reg7);
tmp_reg7 = fma_s(tmp_reg4, vs_pica.f[87].zzzz, tmp_reg7);
tmp_reg7 = fma_s(tmp_reg5, vs_pica.f[87].wwww, tmp_reg7);
tmp_reg8 = mul_s(vs_pica.f[88].xxxx, tmp_reg2);
tmp_reg8 = fma_s(tmp_reg3, vs_pica.f[88].yyyy, tmp_reg8);
tmp_reg8 = fma_s(tmp_reg4, vs_pica.f[88].zzzz, tmp_reg8);
tmp_reg8 = fma_s(tmp_reg5, vs_pica.f[88].wwww, tmp_reg8);
tmp_reg9 = mul_s(vs_pica.f[89].xxxx, tmp_reg2);
tmp_reg9 = fma_s(tmp_reg3, vs_pica.f[89].yyyy, tmp_reg9);
tmp_reg9 = fma_s(tmp_reg4, vs_pica.f[89].zzzz, tmp_reg9);
tmp_reg9 = fma_s(tmp_reg5, vs_pica.f[89].wwww, tmp_reg9);
tmp_reg2 = tmp_reg10;
tmp_reg10.x = dot_s(tmp_reg2, tmp_reg6);
tmp_reg10.y = dot_s(tmp_reg2, tmp_reg7);
tmp_reg10.z = dot_s(tmp_reg2, tmp_reg8);
tmp_reg10.w = dot_s(tmp_reg2, tmp_reg9);
tmp_reg2 = vs_pica.f[1 + addr_regs.x];
tmp_reg3 = max_s(vs_pica.f[0].xxxx, tmp_reg2);
tmp_reg2 = min_s(vs_pica.f[0].zzzz, tmp_reg3);
tmp_reg13 = tmp_reg2;
Vfn6();
vs_out_reg0 = tmp_reg10;
tmp_reg13 = mul_s(vs_pica.f[82], tmp_reg13);
vs_out_reg1 = tmp_reg13;
tmp_reg11.y = (vs_pica.f[0].zzzz + -tmp_reg11.yyyy).y;
tmp_reg12.y = (vs_pica.f[0].zzzz + -tmp_reg12.yyyy).y;
tmp_reg14.y = (vs_pica.f[81].wwww).y;
tmp_reg14.x = (mul_s(vs_pica.f[0].wwww, tmp_reg14.yyyy)).x;
tmp_reg2.x = rcp_s(tmp_reg14.x);
tmp_reg14.z = (tmp_reg2.xxxx).z;
tmp_reg3.xy = (vs_pica.f[81].wwww + tmp_reg11.xyyy).xy;
tmp_reg5.xy = (mul_s(tmp_reg3.xyyy, tmp_reg14.zzzz)).xy;
tmp_reg4.xy = (floor(tmp_reg5.xyyy)).xy;
tmp_reg4.xy = (mul_s(tmp_reg4.xyyy, tmp_reg14.xxxx)).xy;
tmp_reg4.xy = (tmp_reg3.xyyy + -tmp_reg4.xyyy).xy;
tmp_reg11.xy = (-vs_pica.f[81].wwww + tmp_reg4.xyyy).xy;
tmp_reg3.xy = (vs_pica.f[81].wwww + tmp_reg12.xyyy).xy;
tmp_reg5.xy = (mul_s(tmp_reg3.xyyy, tmp_reg14.zzzz)).xy;
tmp_reg4.xy = (floor(tmp_reg5.xyyy)).xy;
tmp_reg4.xy = (mul_s(tmp_reg4.xyyy, tmp_reg14.xxxx)).xy;
tmp_reg4.xy = (tmp_reg3.xyyy + -tmp_reg4.xyyy).xy;
tmp_reg12.xy = (-vs_pica.f[81].wwww + tmp_reg4.xyyy).xy;
vs_out_reg2 = tmp_reg11;
vs_out_reg3 = tmp_reg12;
return true;
}
// shader: 8B30, 1C37A8152BD8F439
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
vec3 color_output_0 = ByteRound(clamp((texcolor0.aaa) - (const_color[0].rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp(fma((texcolor0.a), (const_color[0].a), (texcolor0.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp(fma((texcolor0.rgb), (const_color[2].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = (const_color[3].rgb);
float alpha_output_3 = (const_color[3].a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((last_tev_out.rgb), (const_color[4].rgb), (combiner_buffer.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(mix((last_tev_out.a), (const_color[4].a), (combiner_buffer.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 70007CE72698E88D
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
vec3 color_output_0 = ByteRound(clamp((texcolor0.aaa) - (const_color[0].rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp(fma((texcolor0.a), (const_color[0].a), (texcolor0.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (const_color[1].aaa), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = (const_color[3].rgb);
float alpha_output_3 = (const_color[3].a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((last_tev_out.rgb), (const_color[4].rgb), (combiner_buffer.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(mix((last_tev_out.a), (const_color[4].a), (combiner_buffer.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 80A3E9083E82F5DC, A1DF63E31D4B7D11
// reference: E9A5CC25982E16AF, 599CFF24BA71B7B3
// reference: 4BDDD47B87C4EF82, 1C37A8152BD8F439
// reference: 1FDFF8CC70ABB74E, 70007CE72698E88D
// program: 2DE4619EDA6BD2CD, 0000000000000000, A1DF63E31D4B7D11
// program: 599CFF24BA71B7B3, 0000000000000000, C2EF3825CD80EF3A
// program: 599CFF24BA71B7B3, 0000000000000000, 0F33A602714910EF
// program: 2DE4619EDA6BD2CD, 0000000000000000, 1C37A8152BD8F439
// program: 2DE4619EDA6BD2CD, 0000000000000000, 70007CE72698E88D
// shader: 8B30, 9EC38C1535BE0549
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
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = (const_color[3].rgb);
float alpha_output_3 = (const_color[3].a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((last_tev_out.rgb), (const_color[4].rgb), (combiner_buffer.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(mix((last_tev_out.a), (const_color[4].a), (combiner_buffer.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, FB2C236B543C7FC0
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
vec3 color_output_0 = ByteRound(clamp((texcolor0.aaa) - (const_color[0].rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp(fma((texcolor0.a), (const_color[0].a), (texcolor0.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = (const_color[3].rgb);
float alpha_output_3 = (const_color[3].a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((last_tev_out.rgb), (const_color[4].rgb), (combiner_buffer.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(mix((last_tev_out.a), (const_color[4].a), (combiner_buffer.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: C0D1EC9059E27736, 9EC38C1535BE0549
// reference: 77EC860F09B52987, FB2C236B543C7FC0
// program: 2DE4619EDA6BD2CD, 0000000000000000, 9EC38C1535BE0549
// program: 2DE4619EDA6BD2CD, 0000000000000000, FB2C236B543C7FC0
// shader: 8B30, 20EF548781607E23
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
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (const_color[0].rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor0.a) * (const_color[0].a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 214DBC9F2327FD51, 20EF548781607E23
// program: BBF8939B2A39ABE0, 0000000000000000, 20EF548781607E23
// shader: 8B30, 36997E913ADC5331
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
vec3 color_output_0 = (texcolor0.rgb);
float alpha_output_0 = (texcolor0.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((texcolor1.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((texcolor1.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = (const_color[3].rgb);
float alpha_output_3 = (const_color[3].a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((last_tev_out.rgb), (const_color[4].rgb), (combiner_buffer.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(mix((last_tev_out.a), (const_color[4].a), (combiner_buffer.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 5CA84E39C2ED2B93
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
vec3 color_output_0 = (texcolor0.rgb);
float alpha_output_0 = (texcolor0.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp((texcolor1.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((texcolor1.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = (const_color[3].rgb);
float alpha_output_3 = (const_color[3].a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((last_tev_out.rgb), (const_color[4].rgb), (combiner_buffer.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(mix((last_tev_out.a), (const_color[4].a), (combiner_buffer.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, A17B8DF628F3FE99
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
vec3 color_output_0 = ByteRound(clamp((texcolor0.aaa) - (const_color[0].rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp(fma((texcolor0.a), (const_color[0].a), (texcolor0.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp((texcolor1.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((texcolor1.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = (const_color[3].rgb);
float alpha_output_3 = (const_color[3].a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((last_tev_out.rgb), (const_color[4].rgb), (combiner_buffer.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(mix((last_tev_out.a), (const_color[4].a), (combiner_buffer.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: D883EA89D6D66994, 36997E913ADC5331
// reference: 48E9AAF4D6D66994, 5CA84E39C2ED2B93
// reference: FFD4C06B86813725, A17B8DF628F3FE99
// program: 2DE4619EDA6BD2CD, 0000000000000000, 36997E913ADC5331
// program: 2DE4619EDA6BD2CD, 0000000000000000, 5CA84E39C2ED2B93
// program: 2DE4619EDA6BD2CD, 0000000000000000, A17B8DF628F3FE99
// reference: D720EBBD31ADC977, 7A04013ADFB333E3
// program: B753A1567A802E0D, 0000000000000000, 48C05068C97A61DA
// program: B753A1567A802E0D, 0000000000000000, 7EE0F9D674AE3188
// program: E6B24856ED2B97B8, 0000000000000000, C281D48145A550C9
// program: B753A1567A802E0D, 0000000000000000, 6CBCDC1C2B6B9DB5
// program: DCC8066544A8F65A, 0000000000000000, 71719082BF66940E
// program: F0D67A3BFB3E231B, 0000000000000000, 4D1185B4FE8B2481
// program: DCC8066544A8F65A, 0000000000000000, 7A04013ADFB333E3
// program: DCC8066544A8F65A, 0000000000000000, 37F2AFE9740824A3
// program: DCC8066544A8F65A, 0000000000000000, EA2CCCAAED32A330
// program: B753A1567A802E0D, 0000000000000000, 057F39C58F9BB607
// program: DCC8066544A8F65A, 0000000000000000, A06C2394B48A588F
// program: B753A1567A802E0D, 0000000000000000, 7F8A88A5906AB195
// program: DCC8066544A8F65A, 0000000000000000, BDF5EDADE1E643F5
// program: B753A1567A802E0D, 0000000000000000, 6AC6453ACCFCF40B
// program: E6B24856ED2B97B8, 0000000000000000, 05503B0EB4BE5EEF
// program: F0D67A3BFB3E231B, 0000000000000000, 0AC3A335466A5F28
// program: B753A1567A802E0D, 0000000000000000, FDEC3DF8508766CB
// program: B753A1567A802E0D, 0000000000000000, 73D285793F7A71B9
// program: B753A1567A802E0D, 0000000000000000, E9DEB0C39CC7C2FD
// program: B753A1567A802E0D, 0000000000000000, 927415A97E0D5ADA
// program: B753A1567A802E0D, 0000000000000000, 0CDE7B8F595A5B36
// program: 67835C5F6BB3E883, 0000000000000000, 48E050DA75EAB0DE
// program: B753A1567A802E0D, 0000000000000000, 1BA60B9750FF54C4
// program: 67835C5F6BB3E883, 0000000000000000, 895B1061E1F838C3
// program: 67835C5F6BB3E883, 0000000000000000, 299D93146B1BBE2D
// program: FAF5204C19D8EE05, 0000000000000000, 654F77C7685FDF16
// program: FAF5204C19D8EE05, 0000000000000000, FE419FE67868D9C9
// program: F42B212618922492, 0000000000000000, FE419FE67868D9C9
// program: 2F3C73A7BC805FD9, 0000000000000000, FE419FE67868D9C9
// program: FAF5204C19D8EE05, 0000000000000000, 6755027729C6CC09
// program: E6B24856ED2B97B8, 0000000000000000, F4EFC46253DCC9D3
// program: 43C849DD166EF6F5, 0000000000000000, 76E787E99E41DBF3
// program: 67835C5F6BB3E883, 0000000000000000, 4B4F7526A0D839B5
// program: 2DE4619EDA6BD2CD, 0000000000000000, A86F809D764EED28
// program: B753A1567A802E0D, 0000000000000000, 022E9264412C0B93
// program: 2DE4619EDA6BD2CD, 0000000000000000, F1C1E1D2B63B6F7E
// program: 2DE4619EDA6BD2CD, 0000000000000000, BF11DF99666DC21A
// program: EA2B8F207887AD03, 0000000000000000, 2BBDF6053C100310
// program: EA2B8F207887AD03, 0000000000000000, BBCE113ED5A67B1F
// program: EA2B8F207887AD03, 0000000000000000, 928EE172913A8D3B
// program: EA2B8F207887AD03, 0000000000000000, C2EF3825CD80EF3A
// program: 18D6C060DACA46E7, 0000000000000000, 0F33A602714910EF
// program: 18D6C060DACA46E7, 0000000000000000, 58823F53CBBC985E
// program: 2DE4619EDA6BD2CD, 0000000000000000, 4C4C6A734C41D3DB
// program: 2DE4619EDA6BD2CD, 0000000000000000, A1DF63E31D4B7D11
// program: 599CFF24BA71B7B3, 0000000000000000, C2EF3825CD80EF3A
// program: 599CFF24BA71B7B3, 0000000000000000, 0F33A602714910EF
// program: 2DE4619EDA6BD2CD, 0000000000000000, 1C37A8152BD8F439
// program: 2DE4619EDA6BD2CD, 0000000000000000, 70007CE72698E88D
// program: 2DE4619EDA6BD2CD, 0000000000000000, 9EC38C1535BE0549
// program: 2DE4619EDA6BD2CD, 0000000000000000, FB2C236B543C7FC0
// program: 2DE4619EDA6BD2CD, 0000000000000000, 36997E913ADC5331
// program: 2DE4619EDA6BD2CD, 0000000000000000, 5CA84E39C2ED2B93
// program: 2DE4619EDA6BD2CD, 0000000000000000, A17B8DF628F3FE99
// shader: 8B31, BBF8939B2A39ABE0

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
vec4 tmp_reg14;
vec4 tmp_reg15;
bool ExecVS() {
tmp_reg14 = vec4(0, 0, 0, 1);
tmp_reg15 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn0() {
tmp_reg14.xy = (vs_in_reg0).xy;
tmp_reg14.zw = (vs_pica.f[95].xyxy).zw;
tmp_reg15.x = dot_s(vs_pica.f[4], tmp_reg14);
tmp_reg15.y = dot_s(vs_pica.f[5], tmp_reg14);
tmp_reg15.z = (vs_pica.f[6].wwww).z;
tmp_reg15.w = (vs_pica.f[95].yyyy).w;
tmp_reg14.x = (vs_pica.f[7].xxxx).x;
tmp_reg14.z = (vs_pica.f[6].wwww).z;
bool_regs = notEqual(vs_pica.f[95].xx, tmp_reg14.xz);
if (all(bool_regs)) {
tmp_reg14.x = (vs_pica.f[7].xxxx).x;
tmp_reg14.z = (vs_pica.f[7].zzzz + tmp_reg14.zzzz).z;
tmp_reg14.y = (-vs_pica.f[7].yyyy + tmp_reg14.zzzz).y;
tmp_reg14.z = rcp_s(tmp_reg14.z);
tmp_reg14.z = (mul_s(tmp_reg14.yyyy, tmp_reg14.zzzz)).z;
tmp_reg15.x = (fma_s(tmp_reg14.xxxx, tmp_reg14.zzzz, tmp_reg15.xxxx)).x;
}
vs_out_reg0.x = dot_s(vs_pica.f[0], tmp_reg15);
vs_out_reg0.y = dot_s(vs_pica.f[1], tmp_reg15);
vs_out_reg0.z = dot_s(vs_pica.f[2], tmp_reg15);
vs_out_reg0.w = dot_s(vs_pica.f[3], tmp_reg15);
vs_out_reg1 = vs_in_reg1.xyxy;
return true;
}
// shader: 8B30, 712F04A0609FFDCF
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
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 83C006AC9A5E15F8
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
float alpha_output_0 = ByteRound(clamp((texcolor0.a) * (const_color[0].a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 653200C5FBBA40E0, BBF8939B2A39ABE0
// reference: 3B882C0EA825D922, 712F04A0609FFDCF
// reference: 3B882C0EA9E7B315, 712F04A0609FFDCF
// reference: FFFCE6807553326E, 83C006AC9A5E15F8
// program: BBF8939B2A39ABE0, 0000000000000000, 712F04A0609FFDCF
// program: BBF8939B2A39ABE0, 0000000000000000, 83C006AC9A5E15F8
// reference: 760EEB15655A9821, EA2CCCAAED32A330
// reference: 311D1DEE655A9821, EA2CCCAAED32A330
// reference: C601D6C56A0962E8, 37F2AFE9740824A3
// reference: D720EBBD547A5F63, A06C2394B48A588F
// shader: 8B31, 958C2F6E69E5F5F6

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
texcoord0 = vec4(vs_out_reg2.x,vs_out_reg2.y,1,1);
texcoord12 = vec4(vs_out_reg3.x,vs_out_reg3.y,1,1);
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
bool Vfn2();
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
Vfn0();
return true;
}

bool Vfn2() {
tmp_reg1.xyz = (vs_pica.f[92].xyzz).xyz;
tmp_reg1.w = (vs_pica.f[0].xxxx).w;
return false;
}
bool Vfn0() {
addr_regs.x = (ivec2(vs_in_reg0.xx)).x;
tmp_reg10 = vs_pica.f[0].xxxz;
tmp_reg10.xyz = (vs_pica.f[1 + addr_regs.x].xyzz).xyz;
tmp_reg11 = vs_pica.f[0].xxxx;
tmp_reg11.xy = (vs_pica.f[4 + addr_regs.x].xyyy).xy;
tmp_reg12 = vs_pica.f[0].xxxx;
tmp_reg12.xy = (vs_pica.f[4 + addr_regs.x].xyyy).xy;
tmp_reg13 = vs_pica.f[0].zzzz;
tmp_reg2 = vs_pica.f[0].xxxx;
tmp_reg3 = vs_pica.f[0].xxxx;
tmp_reg4 = vs_pica.f[0].xxxx;
Vfn2();
tmp_reg2 = tmp_reg1;
tmp_reg3.xyz = (mul_s(-vs_pica.f[2 + addr_regs.x].yzxx, tmp_reg2.zxyy)).xyz;
tmp_reg3.xyz = (fma_s(tmp_reg2.yzxx, vs_pica.f[2 + addr_regs.x].zxyy, tmp_reg3)).xyz;
tmp_reg4.x = dot_3(tmp_reg3.xyz, tmp_reg3.xyz);
tmp_reg4.x = rsq_s(tmp_reg4.x);
tmp_reg4.xyz = (mul_s(tmp_reg3.xyzz, tmp_reg4.xxxx)).xyz;
tmp_reg4.xyz = (mul_s(vs_pica.f[3 + addr_regs.x].wwww, tmp_reg4.xyzz)).xyz;
tmp_reg4.xyz = (mul_s(vs_pica.f[0].yyyy, tmp_reg4.xyzz)).xyz;
tmp_reg10.xyz = (tmp_reg10.xyzz + -tmp_reg4.xyzz).xyz;
Vfn2();
tmp_reg3 = tmp_reg1;
tmp_reg4.x = dot_3(tmp_reg3.xyz, tmp_reg3.xyz);
bool_regs.x = vs_pica.f[0].xxxx.x >= tmp_reg4.x;
bool_regs.y = vs_pica.f[0].xxxx.y == tmp_reg4.y;
if (bool_regs.x) {
tmp_reg4.x = (vs_pica.f[0].zzzz).x;
} else {
tmp_reg4.x = rsq_s(tmp_reg4.x);
}
tmp_reg3.xyz = (mul_s(tmp_reg3.xyzz, tmp_reg4.xxxx)).xyz;
tmp_reg10.xyz = (fma_s(tmp_reg3.xyzz, vs_pica.f[76].zzzz, tmp_reg10.xyzz)).xyz;
tmp_reg2 = vs_pica.f[90];
tmp_reg3 = vs_pica.f[91];
tmp_reg4 = vs_pica.f[92];
tmp_reg5 = vs_pica.f[0].xxxz;
tmp_reg6 = mul_s(vs_pica.f[86].xxxx, tmp_reg2);
tmp_reg6 = fma_s(tmp_reg3, vs_pica.f[86].yyyy, tmp_reg6);
tmp_reg6 = fma_s(tmp_reg4, vs_pica.f[86].zzzz, tmp_reg6);
tmp_reg6 = fma_s(tmp_reg5, vs_pica.f[86].wwww, tmp_reg6);
tmp_reg7 = mul_s(vs_pica.f[87].xxxx, tmp_reg2);
tmp_reg7 = fma_s(tmp_reg3, vs_pica.f[87].yyyy, tmp_reg7);
tmp_reg7 = fma_s(tmp_reg4, vs_pica.f[87].zzzz, tmp_reg7);
tmp_reg7 = fma_s(tmp_reg5, vs_pica.f[87].wwww, tmp_reg7);
tmp_reg8 = mul_s(vs_pica.f[88].xxxx, tmp_reg2);
tmp_reg8 = fma_s(tmp_reg3, vs_pica.f[88].yyyy, tmp_reg8);
tmp_reg8 = fma_s(tmp_reg4, vs_pica.f[88].zzzz, tmp_reg8);
tmp_reg8 = fma_s(tmp_reg5, vs_pica.f[88].wwww, tmp_reg8);
tmp_reg9 = mul_s(vs_pica.f[89].xxxx, tmp_reg2);
tmp_reg9 = fma_s(tmp_reg3, vs_pica.f[89].yyyy, tmp_reg9);
tmp_reg9 = fma_s(tmp_reg4, vs_pica.f[89].zzzz, tmp_reg9);
tmp_reg9 = fma_s(tmp_reg5, vs_pica.f[89].wwww, tmp_reg9);
tmp_reg2 = tmp_reg10;
tmp_reg10.x = dot_s(tmp_reg2, tmp_reg6);
tmp_reg10.y = dot_s(tmp_reg2, tmp_reg7);
tmp_reg10.z = dot_s(tmp_reg2, tmp_reg8);
tmp_reg10.w = dot_s(tmp_reg2, tmp_reg9);
tmp_reg2 = vs_pica.f[80];
tmp_reg2.w = (mul_s(vs_pica.f[1 + addr_regs.x].wwww, tmp_reg2.wwww)).w;
tmp_reg3 = max_s(vs_pica.f[0].xxxx, tmp_reg2);
tmp_reg2 = min_s(vs_pica.f[0].zzzz, tmp_reg3);
tmp_reg13 = tmp_reg2;
tmp_reg14.z = (vs_pica.f[78].zzzz).z;
tmp_reg14.w = (vs_pica.f[79].zzzz).w;
tmp_reg2.x = rcp_s(vs_pica.f[75].y);
tmp_reg2.xy = (mul_s(tmp_reg14.zwww, tmp_reg2.xxxx)).xy;
tmp_reg2.xy = (vs_pica.f[0].yyyy + tmp_reg2.xyyy).xy;
tmp_reg3.xy = (floor(tmp_reg2.xyyy)).xy;
tmp_reg2.xy = (mul_s(vs_pica.f[75].yyyy, tmp_reg3.xyyy)).xy;
tmp_reg2.xy = (tmp_reg14.zwww + -tmp_reg2.xyyy).xy;
tmp_reg0.xy = (min_s(vs_pica.f[75].xxxx, tmp_reg2.xyyy)).xy;
tmp_reg0.xy = (max_s(-vs_pica.f[75].xxxx, tmp_reg0.xyyy)).xy;
tmp_reg4 = vs_pica.f[95];
tmp_reg3 = vs_pica.f[94];
tmp_reg1.z = (mul_s(tmp_reg0.xxxx, tmp_reg0.xxxx)).z;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg4.xyyy, tmp_reg4.zwww)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.zwww)).xy;
tmp_reg4 = vs_pica.f[93];
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg4.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg4.zwww)).xy;
tmp_reg1.y = (mul_s(tmp_reg1.yyyy, tmp_reg0.xxxx)).y;
tmp_reg4 = vs_pica.f[4 + addr_regs.x].xxyy;
tmp_reg4 = -vs_pica.f[0].yyyy + tmp_reg4;
tmp_reg4 = mul_s(tmp_reg4, tmp_reg1.xyyx);
tmp_reg11.xy = (tmp_reg4.xyyy + tmp_reg4.zwww).xy;
tmp_reg5.xy = (vs_pica.f[78].xyyy).xy;
tmp_reg11.xy = (fma_s(tmp_reg11.xyyy, tmp_reg5.xyyy, vs_pica.f[77].xyyy)).xy;
tmp_reg11.xy = (vs_pica.f[0].yyyy + tmp_reg11.xyyy).xy;
tmp_reg4 = vs_pica.f[95];
tmp_reg3 = vs_pica.f[94];
tmp_reg1.z = (mul_s(tmp_reg0.yyyy, tmp_reg0.yyyy)).z;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg4.xyyy, tmp_reg4.zwww)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg3.zwww)).xy;
tmp_reg4 = vs_pica.f[93];
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg4.xyyy)).xy;
tmp_reg1.xy = (fma_s(tmp_reg1.zzzz, tmp_reg1.xyyy, tmp_reg4.zwww)).xy;
tmp_reg1.y = (mul_s(tmp_reg1.yyyy, tmp_reg0.yyyy)).y;
tmp_reg4 = vs_pica.f[4 + addr_regs.x].zzww;
tmp_reg4 = -vs_pica.f[0].yyyy + tmp_reg4;
tmp_reg4 = mul_s(tmp_reg4, tmp_reg1.xyyx);
tmp_reg12.xy = (tmp_reg4.xyyy + tmp_reg4.zwww).xy;
tmp_reg5.xy = (vs_pica.f[79].xyyy).xy;
tmp_reg12.xy = (fma_s(tmp_reg12.xyyy, tmp_reg5.xyyy, vs_pica.f[77].zwww)).xy;
tmp_reg12.xy = (vs_pica.f[0].yyyy + tmp_reg12.xyyy).xy;
vs_out_reg0 = tmp_reg10;
vs_out_reg1 = tmp_reg13;
tmp_reg11.y = (vs_pica.f[0].zzzz + -tmp_reg11.yyyy).y;
tmp_reg12.y = (vs_pica.f[0].zzzz + -tmp_reg12.yyyy).y;
tmp_reg14.y = (vs_pica.f[75].wwww).y;
tmp_reg14.x = (mul_s(vs_pica.f[0].wwww, tmp_reg14.yyyy)).x;
tmp_reg2.x = rcp_s(tmp_reg14.x);
tmp_reg14.z = (tmp_reg2.xxxx).z;
tmp_reg3.xy = (vs_pica.f[75].wwww + tmp_reg11.xyyy).xy;
tmp_reg5.xy = (mul_s(tmp_reg3.xyyy, tmp_reg14.zzzz)).xy;
tmp_reg4.xy = (floor(tmp_reg5.xyyy)).xy;
tmp_reg4.xy = (mul_s(tmp_reg4.xyyy, tmp_reg14.xxxx)).xy;
tmp_reg4.xy = (tmp_reg3.xyyy + -tmp_reg4.xyyy).xy;
tmp_reg11.xy = (-vs_pica.f[75].wwww + tmp_reg4.xyyy).xy;
tmp_reg3.xy = (vs_pica.f[75].wwww + tmp_reg12.xyyy).xy;
tmp_reg5.xy = (mul_s(tmp_reg3.xyyy, tmp_reg14.zzzz)).xy;
tmp_reg4.xy = (floor(tmp_reg5.xyyy)).xy;
tmp_reg4.xy = (mul_s(tmp_reg4.xyyy, tmp_reg14.xxxx)).xy;
tmp_reg4.xy = (tmp_reg3.xyyy + -tmp_reg4.xyyy).xy;
tmp_reg12.xy = (-vs_pica.f[75].wwww + tmp_reg4.xyyy).xy;
vs_out_reg2 = tmp_reg11;
vs_out_reg3 = tmp_reg12;
return true;
}
// shader: 8B30, 2FF8F91B7868D9C9
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
depth /= gl_FragCoord.w;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (texcolor0.rgb);
float alpha_output_0 = (texcolor0.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp((vec3(1) - combiner_buffer.rgb) * (const_color[2].rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) + (combiner_buffer.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 629EF6644011B4E9, 958C2F6E69E5F5F6
// reference: 5C07D7C0CF3F6BA3, 2FF8F91B7868D9C9
// program: 958C2F6E69E5F5F6, 0000000000000000, 2FF8F91B7868D9C9
// shader: 8B30, 8DB96180685FDF16
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
depth /= gl_FragCoord.w;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (texcolor1.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor0.r) * (texcolor1.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) - (1.0 - rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1 * 1.0, alpha_output_1 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp((vec3(1) - combiner_buffer.rgb) * (const_color[2].rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) + (combiner_buffer.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 858650AC96B0604D
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
depth /= gl_FragCoord.w;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (texcolor0.rgb);
float alpha_output_0 = (texcolor0.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) - (1.0 - rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1 * 1.0, alpha_output_1 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp((vec3(1) - combiner_buffer.rgb) * (const_color[2].rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) + (combiner_buffer.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, A706D788F09DB39E
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
d0_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.a = lut_scale_fr * lut_value;
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + ((lut_scale_d1 * d1_value) * light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((secondary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (const_color[0].a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((secondary_fragment_color.aaa), (texcolor0.rrr), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) + (const_color[2].rgb), vec3(0), vec3(1)));
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
// reference: CF85B25251CD20F4, 8DB96180685FDF16
// reference: 0B4A0C336E51DA57, 858650AC96B0604D
// reference: 90331D46547A5F63, A06C2394B48A588F
// reference: B44A814C43A38B88, A706D788F09DB39E
// program: FAF5204C19D8EE05, 0000000000000000, 8DB96180685FDF16
// program: FAF5204C19D8EE05, 0000000000000000, 2FF8F91B7868D9C9
// program: EA2B8F207887AD03, 0000000000000000, 2FF8F91B7868D9C9
// program: FAF5204C19D8EE05, 0000000000000000, 858650AC96B0604D
// program: EA2B8F207887AD03, 0000000000000000, FE419FE67868D9C9
// program: B753A1567A802E0D, 0000000000000000, A706D788F09DB39E
// shader: 8B30, 983418A496B0604D
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
depth /= gl_FragCoord.w;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (texcolor0.rgb);
float alpha_output_0 = (texcolor0.r);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) - (1.0 - rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1 * 1.0, alpha_output_1 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp((vec3(1) - combiner_buffer.rgb) * (const_color[2].rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) + (combiner_buffer.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 0F33A602B2942728
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (texcolor0.rgb);
float alpha_output_0 = (texcolor0.r);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp((vec3(1) - combiner_buffer.rgb) * (const_color[2].rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) + (combiner_buffer.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, C2EF3825D032A732
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (texcolor0.rgb);
float alpha_output_0 = (texcolor0.r);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) - (1.0 - rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1 * 1.0, alpha_output_1 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp((vec3(1) - combiner_buffer.rgb) * (const_color[2].rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) + (combiner_buffer.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: D54022C36E51DA57, 983418A496B0604D
// reference: 512919D69F4AD392, 0F33A602B2942728
// reference: 0664C2253E246266, C2EF3825D032A732
// program: EA2B8F207887AD03, 0000000000000000, 983418A496B0604D
// program: 599CFF24BA71B7B3, 0000000000000000, 2FF8F91B7868D9C9
// program: 599CFF24BA71B7B3, 0000000000000000, FE419FE67868D9C9
// program: 599CFF24BA71B7B3, 0000000000000000, 983418A496B0604D
// program: EA2B8F207887AD03, 0000000000000000, 0F33A602B2942728
// program: 599CFF24BA71B7B3, 0000000000000000, 0F33A602B2942728
// program: EA2B8F207887AD03, 0000000000000000, C2EF3825D032A732
// program: 599CFF24BA71B7B3, 0000000000000000, C2EF3825D032A732
// reference: 5CBDC13CCFF9B94E, 0F33A602B2942728
// shader: 8B30, 4076790D639CAE31
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
depth /= gl_FragCoord.w;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (const_color[0].rgb), vec3(0), vec3(1)));
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 2AA63C39F5DE650E, 4076790D639CAE31
// program: B753A1567A802E0D, 0000000000000000, 4076790D639CAE31
// shader: 8B30, 5D3C8A0E7C67FD76
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
d0_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((const_color[0].rgb) + (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(mix((texcolor0.rgb), (last_tev_out.rgb), (texcolor1.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2 * 2.0, alpha_output_2 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(fma((secondary_fragment_color.rgb), (secondary_fragment_color.aaa), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(min((const_color[4].rgb) + (rounded_primary_color.rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4 * 2.0, alpha_output_4 * 1.0);
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
// shader: 8B30, B404B8AC4159AA16
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
d0_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((secondary_fragment_color.rgb), (secondary_fragment_color.aaa), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1 * 2.0, alpha_output_1 * 1.0);
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
// shader: 8B30, A1486A5062EDD583
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
depth /= gl_FragCoord.w;
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
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((secondary_fragment_color.rgb) * (texcolor1.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1 * 2.0, alpha_output_1 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
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
// shader: 8B30, 6F9B9346FFF60389
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
d0_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(mix((texcolor1.rgb), (texcolor2.rgb), (vec3(1) - texcolor1.aaa)), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(fma((texcolor0.rgb), (const_color[2].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(fma((secondary_fragment_color.rgb), (secondary_fragment_color.aaa), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
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
// shader: 8B30, 78D0E82140B3F721
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
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(half_vector)));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(half_vector)));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (const_color[1].rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(fma((texcolor0.aaa), (vec3(1) - secondary_fragment_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
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
// shader: 8B30, 6C11A18AEA647669
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
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((secondary_fragment_color.rgb), (texcolor1.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(min((const_color[2].rgb) + (rounded_primary_color.rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) + (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp((last_tev_out.rgb) + (const_color[4].rgb), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4, alpha_output_4);
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
// shader: 8B30, AF4BBEFAD247DBB7
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
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (const_color[1].rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(fma((secondary_fragment_color.rgb), (texcolor1.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(min((const_color[3].rgb) + (rounded_primary_color.rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
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
// shader: 8B30, 55FA07387BF6805C
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
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((secondary_fragment_color.rgb), (texcolor1.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(min((const_color[2].rgb) + (rounded_primary_color.rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4, alpha_output_4);
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
// shader: 8B31, 94FCD61C88368EEE

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
layout(location=7) in vec4 vs_in_reg7;
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
bool Vfn1();
bool Vfn4();
bool Vfn6();
bool Vfn7();
bool Vfn5();
bool Vfn8();
bool Vfn9();
bool Vfn11();
bool Vfn14();
bool Vfn18();
bool Vfn19();
bool Vfn21();
bool Vfn23();
bool Vfn25();
bool Vfn26();
bool Vfn28();
bool Vfn29();
bool Vfn30();
bool Vfn32();
bool Vfn33();
bool Vfn35();
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

bool Vfn1() {
tmp_reg15.xyz = (mul_s(vs_pica.f[7].xxxx, vs_in_reg0)).xyz;
tmp_reg14.xyz = (mul_s(vs_pica.f[7].yyyy, vs_in_reg1)).xyz;
tmp_reg13.xyz = (mul_s(vs_pica.f[7].zzzz, vs_in_reg2)).xyz;
tmp_reg15.xyz = (vs_pica.f[6] + tmp_reg15).xyz;
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
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
Vfn4();
} else {
Vfn6();
}
vs_out_reg2 = -tmp_reg15;
vs_out_reg0.x = dot_s(vs_pica.f[86], tmp_reg15);
vs_out_reg0.y = dot_s(vs_pica.f[87], tmp_reg15);
vs_out_reg0.z = dot_s(vs_pica.f[88], tmp_reg15);
vs_out_reg0.w = dot_s(vs_pica.f[89], tmp_reg15);
return false;
}
bool Vfn4() {
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
Vfn5();
return false;
}
bool Vfn6() {
if (all(bool_regs)) {
Vfn7();
} else {
tmp_reg15.x = dot_s(vs_pica.f[90], tmp_reg10);
tmp_reg15.y = dot_s(vs_pica.f[91], tmp_reg10);
tmp_reg15.z = dot_s(vs_pica.f[92], tmp_reg10);
tmp_reg15.w = (vs_pica.f[93].yyyy).w;
vs_out_reg1 = vs_pica.f[93].xxxx;
}
return false;
}
bool Vfn7() {
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
Vfn8();
return false;
}
bool Vfn5() {
uint jmp_to = 73u;
while (true) {
switch (jmp_to) {
case 73u:
tmp_reg6.x = dot_3(tmp_reg14.xyz, tmp_reg14.xyz);
tmp_reg7.x = dot_3(tmp_reg12.xyz, tmp_reg12.xyz);
tmp_reg6.x = rsq_s(tmp_reg6.x);
tmp_reg7.x = rsq_s(tmp_reg7.x);
tmp_reg14.xyz = (mul_s(tmp_reg14.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg12.xyz = (mul_s(tmp_reg12.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg0 = vs_pica.f[93].yxxx;
if (!vs_pica.b[3]) {
jmp_to = 89u; break;
}
tmp_reg4 = vs_pica.f[93].yyyy + tmp_reg14.zzzz;
tmp_reg4 = mul_s(vs_pica.f[94].zzzz, tmp_reg4);
bool_regs = greaterThanEqual(vs_pica.f[93].xx, tmp_reg4.xx);
tmp_reg4 = vec4(rsq_s(tmp_reg4.x));
tmp_reg5 = mul_s(vs_pica.f[94].zzzz, tmp_reg14);
if (bool_regs.x) {
jmp_to = 89u; break;
}
tmp_reg0.z = rcp_s(tmp_reg4.x);
tmp_reg0.xy = (mul_s(tmp_reg5, tmp_reg4)).xy;
case 89u:
vs_out_reg1 = tmp_reg0;
default: return false;
}
}
return false;
}
bool Vfn8() {
uint jmp_to = 90u;
while (true) {
switch (jmp_to) {
case 90u:
tmp_reg6.x = dot_3(tmp_reg14.xyz, tmp_reg14.xyz);
tmp_reg7.x = dot_3(tmp_reg12.xyz, tmp_reg12.xyz);
tmp_reg6.x = rsq_s(tmp_reg6.x);
tmp_reg7.x = rsq_s(tmp_reg7.x);
tmp_reg14.xyz = (mul_s(tmp_reg14.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg12.xyz = (mul_s(tmp_reg12.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg13.xyz = (mul_s(tmp_reg13.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg11.xyz = (mul_s(tmp_reg11.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg0 = vs_pica.f[93].yxxx;
if (!vs_pica.b[3]) {
jmp_to = 165u; break;
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
jmp_to = 127u; break;
}
tmp_reg7.xz = (tmp_reg13.wwyy + -tmp_reg14.yyww).xz;
tmp_reg7.y = (tmp_reg14.xxxx + -tmp_reg13.zzzz).y;
tmp_reg7.w = (tmp_reg6).w;
tmp_reg6 = vec4(dot_s(tmp_reg7, tmp_reg7));
tmp_reg6 = vec4(rsq_s(tmp_reg6.x));
tmp_reg0 = mul_s(tmp_reg7, tmp_reg6);
if (vs_pica.b[0]) {
jmp_to = 165u; break;
}
case 127u:
bool_regs = greaterThan(tmp_reg5.zy, tmp_reg5.yx);
if (bool_regs.x) {
Vfn9();
} else {
Vfn14();
}
tmp_reg6 = vec4(dot_s(tmp_reg8, tmp_reg8));
tmp_reg6 = vec4(rsq_s(tmp_reg6.x));
tmp_reg0 = mul_s(tmp_reg8, tmp_reg6);
case 165u:
vs_out_reg1 = tmp_reg0;
default: return false;
}
}
return false;
}
bool Vfn9() {
if (bool_regs.y) {
tmp_reg8 = mul_s(tmp_reg13.yyzw, tmp_reg6.xxxy);
tmp_reg8.x = (vs_pica.f[93].yyyy + -tmp_reg5.yyyy).x;
tmp_reg9 = tmp_reg5.zzzz + -tmp_reg5.xxxx;
tmp_reg8.yzw = (tmp_reg8 + tmp_reg14.wwxy).yzw;
tmp_reg8.x = (tmp_reg9 + tmp_reg8).x;
} else {
Vfn11();
}
tmp_reg8.w = (-tmp_reg8).w;
return false;
}
bool Vfn11() {
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
bool Vfn14() {
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
bool Vfn18() {
tmp_reg0.y = (vs_pica.f[7].wwww).y;
bool_regs = notEqual(vs_pica.f[93].xx, tmp_reg0.xy);
tmp_reg9 = vs_pica.f[21];
tmp_reg0 = mul_s(vs_pica.f[7].wwww, vs_in_reg3);
if (bool_regs.y) {
Vfn19();
}
vs_out_reg3 = max_s(vs_pica.f[93].xxxx, tmp_reg9);
return false;
}
bool Vfn19() {
if (vs_pica.b[7]) {
tmp_reg9.w = (mul_s(tmp_reg9.wwww, tmp_reg0.wwww)).w;
}
tmp_reg9.xyz = (mul_s(vs_pica.f[20].wwww, tmp_reg0.xyzz)).xyz;
tmp_reg8.x = (vs_pica.f[93].yyyy).x;
return false;
}
bool Vfn21() {
tmp_reg0.xy = (vs_pica.f[10].xxxx).xy;
if (vs_pica.b[9]) {
tmp_reg6.xy = (mul_s(vs_pica.f[8].xxxx, vs_in_reg4.xyyy)).xy;
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
tmp_reg3.x = dot_s(vs_pica.f[11].xywz, tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12].xywz, tmp_reg6);
tmp_reg3.zw = (vs_pica.f[93].xxxx).zw;
vs_out_reg4 = tmp_reg3;
} else {
Vfn23();
}
return false;
}
bool Vfn23() {
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
Vfn25();
}
vs_out_reg4 = tmp_reg3;
return false;
}
bool Vfn25() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
Vfn26();
} else {
Vfn28();
}
return false;
}
bool Vfn26() {
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
bool Vfn28() {
Vfn29();
tmp_reg3.x = dot_s(vs_pica.f[11], tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12], tmp_reg6);
return false;
}
bool Vfn29() {
tmp_reg1.xy = (vs_pica.f[94].zzzz).xy;
tmp_reg1.zw = (vs_pica.f[93].xxxx).zw;
tmp_reg6 = fma_s(tmp_reg14, tmp_reg1, tmp_reg1);
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
return false;
}
bool Vfn30() {
tmp_reg0.xy = (vs_pica.f[10].yyyy).xy;
if (vs_pica.b[10]) {
tmp_reg6.xy = (mul_s(vs_pica.f[8].yyyy, vs_in_reg5.xyyy)).xy;
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
tmp_reg4.x = dot_s(vs_pica.f[14].xywz, tmp_reg6);
tmp_reg4.y = dot_s(vs_pica.f[15].xywz, tmp_reg6);
vs_out_reg5 = tmp_reg4;
} else {
Vfn32();
}
return false;
}
bool Vfn32() {
if (vs_pica.b[13]) {
Vfn33();
} else {
vs_out_reg5 = vs_pica.f[93].xxxx;
}
return false;
}
bool Vfn33() {
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
Vfn35();
}
vs_out_reg5 = tmp_reg4;
return false;
}
bool Vfn35() {
Vfn29();
tmp_reg4.x = dot_s(vs_pica.f[14], tmp_reg6);
tmp_reg4.y = dot_s(vs_pica.f[15], tmp_reg6);
return false;
}
bool Vfn0() {
Vfn1();
Vfn18();
Vfn21();
Vfn30();
return true;
}
// shader: 8B30, DEDCD606F8513B14
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
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(half_vector)));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(half_vector)));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(min((const_color[0].rgb) + (rounded_primary_color.rgb), vec3(1)) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (texcolor1.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(fma((vec3(1) - secondary_fragment_color.rgb), (texcolor0.aaa), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
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
// shader: 8B30, 3E57149DD00E1835
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
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
refl_value.r = lut_scale_rr * lut_value;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[0].specular_0) * geo_factor) + (refl_value * light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
geo_factor = dot(half_vector, half_vector);
geo_factor = geo_factor == 0.0 ? 0.0 : min(dot_product / geo_factor, 1.0);
lut_offset = lighting_lut_offset[1][2];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
refl_value.r = lut_scale_rr * lut_value;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[1].specular_0) * geo_factor) + (refl_value * light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((texcolor1.rgb), (secondary_fragment_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(fma((texcolor1.rgb), (secondary_fragment_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp((last_tev_out.rgb) + (const_color[4].rgb), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4, alpha_output_4);
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
// shader: 8B30, 54961CBE8C588AFA
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
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(half_vector)));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(half_vector)));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0 * 4.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(fma((secondary_fragment_color.rgb), (texcolor0.aaa), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
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
// shader: 8B30, A516ACF8241F90B1
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
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(half_vector)));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(half_vector)));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((last_tev_out.rgb), (texcolor0.rgb), (texcolor0.bbb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(min((const_color[2].rgb) + (texcolor2.aaa), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(fma((secondary_fragment_color.rgb), (texcolor0.aaa), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
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
// shader: 8B30, EE8E1D2EEB1A1514
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 texcolor1 = textureLod(tex1, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex1, 0))) + tex_lod_bias[1]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(fma((texcolor0.rgb), (texcolor0.rgb), (const_color[0].rgb)), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((last_tev_out.rgb), (texcolor1.rgb), (const_color[1].rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (const_color[2].rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(fma((const_color[3].rgb), (rounded_primary_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
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
// shader: 8B30, D7F9359C89A5358E
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
d0_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (texcolor0.a);
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((secondary_fragment_color.rgb), (secondary_fragment_color.aaa), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1 * 2.0, alpha_output_1 * 1.0);
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
// shader: 8B30, 229602AEB4667C0F
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
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
refl_value.r = lut_scale_rr * lut_value;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[0].specular_0) * geo_factor) + (refl_value * light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
geo_factor = dot(half_vector, half_vector);
geo_factor = geo_factor == 0.0 ? 0.0 : min(dot_product / geo_factor, 1.0);
lut_offset = lighting_lut_offset[1][2];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
refl_value.r = lut_scale_rr * lut_value;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[1].specular_0) * geo_factor) + (refl_value * light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) + (const_color[1].rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(fma((texcolor1.rgb), (vec3(1) - secondary_fragment_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(fma((texcolor1.rgb), (secondary_fragment_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_4 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, AE25418B9313B515
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
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
refl_value.r = lut_scale_rr * lut_value;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[0].specular_0) * geo_factor) + (refl_value * light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
geo_factor = dot(half_vector, half_vector);
geo_factor = geo_factor == 0.0 ? 0.0 : min(dot_product / geo_factor, 1.0);
lut_offset = lighting_lut_offset[1][2];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
refl_value.r = lut_scale_rr * lut_value;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[1].specular_0) * geo_factor) + (refl_value * light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(min((const_color[0].rgb) + (texcolor0.rgb), vec3(1)) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1 * 2.0, alpha_output_1 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(fma((texcolor1.rgb), (vec3(1) - secondary_fragment_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
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
// shader: 8B30, 0725D831C1CA28F3
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
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (const_color[0].a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(min((texcolor0.rgb) + (secondary_fragment_color.rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
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
// shader: 8B30, B615F03CBBD2FF06
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
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (texcolor0.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) + (const_color[1].rgb), vec3(0), vec3(1)));
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
// shader: 8B30, 80FB6E6AC89711C4
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
depth /= gl_FragCoord.w;
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
// shader: 8B30, 99FDD5F2D755E9D2
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
depth /= gl_FragCoord.w;
vec4 texcolor0 = textureLod(tex0, texcoord0.xy, GetLod(texcoord0.xy * vec2(textureSize(tex0, 0))) + tex_lod_bias[0]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((const_color[0].rgb) + (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 666B2B1960582B16
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
depth /= gl_FragCoord.w;
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (const_color[0].rgb), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 4118F2FB0C47D96C
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
depth /= gl_FragCoord.w;
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (rounded_primary_color.rgb);
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 2D06AF18931F2F72
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
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) + (const_color[0].rgb), vec3(0), vec3(1)));
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((vec3(1) - secondary_fragment_color.rgb) * (vec3(1) - last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = (vec3(1) - last_tev_out.rgb);
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, FA3C9A89987B9F65
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
depth /= gl_FragCoord.w;
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (const_color[0].rgb);
float alpha_output_0 = ByteRound(clamp((1.0 - rounded_primary_color.r) * (const_color[0].a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 99EE9DC4A09D5847
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
depth /= gl_FragCoord.w;
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (const_color[0].rgb);
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (const_color[0].a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 92952AEFDBBD2D86, 5D3C8A0E7C67FD76
// reference: 883D4AD4137741C2, B404B8AC4159AA16
// reference: 2207DEC551D99797, A1486A5062EDD583
// reference: 88F30A45E222B613, 6F9B9346FFF60389
// reference: 2728671CDC883203, 78D0E82140B3F721
// reference: 2950F28CE84533C9, 6C11A18AEA647669
// reference: 01E59347EF3C0C50, AF4BBEFAD247DBB7
// reference: 99C00DEE473C8C24, 55FA07387BF6805C
// reference: D049C86FFB50E596, 94FCD61C88368EEE
// reference: 98DB1409ED68BCD1, DEDCD606F8513B14
// reference: 328422893EB59907, 3E57149DD00E1835
// reference: 0A3BF893960D2A7D, 54961CBE8C588AFA
// reference: 71B0FEBD0BC76011, A516ACF8241F90B1
// reference: 0A9BEDDC781A9312, EE8E1D2EEB1A1514
// reference: 883D4AD4D85BF88D, D7F9359C89A5358E
// reference: F18A2CC407D8AAAE, 229602AEB4667C0F
// reference: BA1836C9C813067B, AE25418B9313B515
// reference: 0E0A3FCA23C4B786, 0725D831C1CA28F3
// reference: D1528E1D06710373, B615F03CBBD2FF06
// reference: 96F3C7A905F103D2, 80FB6E6AC89711C4
// reference: 9204D459C4B14A06, 99FDD5F2D755E9D2
// reference: 48429DB68138E7CE, 666B2B1960582B16
// reference: 96F3C7A996A0DFFA, 4118F2FB0C47D96C
// reference: CA93E5795EC6145C, 2D06AF18931F2F72
// reference: E38834AF1210BB3F, FA3C9A89987B9F65
// reference: 52870D2796D95F23, 99EE9DC4A09D5847
// program: EA2B8F207887AD03, 0000000000000000, 8DB96180685FDF16
// program: 599CFF24BA71B7B3, 0000000000000000, 8DB96180685FDF16
// program: FAF5204C19D8EE05, 0000000000000000, 983418A496B0604D
// program: DCC8066544A8F65A, 0000000000000000, 5D3C8A0E7C67FD76
// program: B753A1567A802E0D, 0000000000000000, B404B8AC4159AA16
// program: 43C849DD166EF6F5, 0000000000000000, B404B8AC4159AA16
// program: DCC8066544A8F65A, 0000000000000000, A1486A5062EDD583
// program: E6B24856ED2B97B8, 0000000000000000, 6F9B9346FFF60389
// program: B753A1567A802E0D, 0000000000000000, 78D0E82140B3F721
// program: DCC8066544A8F65A, 0000000000000000, 6C11A18AEA647669
// program: DCC8066544A8F65A, 0000000000000000, AF4BBEFAD247DBB7
// program: DCC8066544A8F65A, 0000000000000000, 55FA07387BF6805C
// program: 94FCD61C88368EEE, 0000000000000000, DEDCD606F8513B14
// program: DCC8066544A8F65A, 0000000000000000, 3E57149DD00E1835
// program: B753A1567A802E0D, 0000000000000000, 54961CBE8C588AFA
// program: F0D67A3BFB3E231B, 0000000000000000, A516ACF8241F90B1
// program: E6B24856ED2B97B8, 0000000000000000, EE8E1D2EEB1A1514
// program: B753A1567A802E0D, 0000000000000000, D7F9359C89A5358E
// program: DCC8066544A8F65A, 0000000000000000, 229602AEB4667C0F
// program: DCC8066544A8F65A, 0000000000000000, AE25418B9313B515
// program: B753A1567A802E0D, 0000000000000000, 0725D831C1CA28F3
// program: B753A1567A802E0D, 0000000000000000, B615F03CBBD2FF06
// program: 67835C5F6BB3E883, 0000000000000000, 80FB6E6AC89711C4
// program: B753A1567A802E0D, 0000000000000000, 99FDD5F2D755E9D2
// program: 67835C5F6BB3E883, 0000000000000000, 666B2B1960582B16
// program: 67835C5F6BB3E883, 0000000000000000, 4118F2FB0C47D96C
// program: 67835C5F6BB3E883, 0000000000000000, 2D06AF18931F2F72
// program: 67835C5F6BB3E883, 0000000000000000, FA3C9A89987B9F65
// program: 67835C5F6BB3E883, 0000000000000000, 99EE9DC4A09D5847
// reference: B699DA3F07D8AAAE, 229602AEB4667C0F
// reference: FD0BC032C813067B, AE25418B9313B515
// reference: 7597D4723EB59907, 3E57149DD00E1835
// reference: 4D881B27781A9312, EE8E1D2EEB1A1514
// reference: 0A9BEDDC369398BB, EE8E1D2EEB1A1514
// reference: B699DA3F4951A107, 229602AEB4667C0F
// shader: 8B30, 7FC5102729C6CC09
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
depth /= gl_FragCoord.w;
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
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp((vec3(1) - combiner_buffer.rgb) * (const_color[2].rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) + (combiner_buffer.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 928EE172FA494CDD
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
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((rounded_primary_color.a) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp((vec3(1) - combiner_buffer.rgb) * (const_color[2].rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) + (combiner_buffer.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 46C24751F0A39100, 7FC5102729C6CC09
// reference: 98727F5DF06543ED, 928EE172FA494CDD
// reference: D5FA343F6E9708BA, C2EF3825CD80EF3A
// program: 599CFF24BA71B7B3, 0000000000000000, 7FC5102729C6CC09
// program: 18D6C060DACA46E7, 0000000000000000, 858650AC96B0604D
// program: 599CFF24BA71B7B3, 0000000000000000, 928EE172FA494CDD
// program: 18D6C060DACA46E7, 0000000000000000, C2EF3825CD80EF3A
// program: EA2B8F207887AD03, 0000000000000000, 928EE172FA494CDD
// reference: 32842289703C92AE, 3E57149DD00E1835
// reference: FD0BC032869A0DD2, AE25418B9313B515
// reference: F18A2CC44951A107, 229602AEB4667C0F
// program: EA2B8F207887AD03, 0000000000000000, 7FC5102729C6CC09
// shader: 8B30, 555B72D265592861
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
d0_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((secondary_fragment_color.rgb), (secondary_fragment_color.aaa), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(min((const_color[2].rgb) + (rounded_primary_color.rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
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
// shader: 8B30, 7AFE98DB0527A58B
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
d0_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((secondary_fragment_color.rgb), (secondary_fragment_color.aaa), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(min((const_color[2].rgb) + (rounded_primary_color.rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2 * 2.0, alpha_output_2 * 1.0);
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
// shader: 8B31, A67486BBD8175EFA

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
bool Vfn20();
bool Vfn3();
bool Vfn8();
bool Vfn1();
bool Vfn2();
bool Vfn4();
bool Vfn6();
bool Vfn7();
bool Vfn9();
bool Vfn19();
bool Vfn21();
bool Vfn5();
bool Vfn10();
bool Vfn11();
bool Vfn13();
bool Vfn16();
bool Vfn22();
bool Vfn23();
bool Vfn25();
bool Vfn27();
bool Vfn29();
bool Vfn30();
bool Vfn32();
bool Vfn33();
bool Vfn34();
bool Vfn36();
bool Vfn37();
bool Vfn39();
bool Vfn41();
bool Vfn43();
bool Vfn44();
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
Vfn22();
Vfn25();
Vfn34();
Vfn41();
return true;
}
bool Vfn20() {
addr_regs.x = (ivec2(tmp_reg1.xx)).x;
tmp_reg3.x = dot_s(vs_pica.f[25 + addr_regs.x], tmp_reg15);
tmp_reg3.y = dot_s(vs_pica.f[26 + addr_regs.x], tmp_reg15);
tmp_reg3.z = dot_s(vs_pica.f[27 + addr_regs.x], tmp_reg15);
tmp_reg7 = fma_s(tmp_reg1.wwww, tmp_reg3, tmp_reg7);
return false;
}
bool Vfn3() {
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
bool Vfn8() {
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
tmp_reg0 = vs_pica.f[7];
bool_regs = notEqual(vs_pica.f[93].xx, tmp_reg0.yz);
tmp_reg7 = vs_pica.f[93].xxxx;
tmp_reg12 = vs_pica.f[93].xxxx;
tmp_reg11 = vs_pica.f[93].xxxx;
tmp_reg2 = mul_s(vs_pica.f[93].wwww, vs_in_reg7);
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
Vfn2();
} else {
Vfn6();
}
vs_out_reg2 = -tmp_reg15;
vs_out_reg0.x = dot_s(vs_pica.f[86], tmp_reg15);
vs_out_reg0.y = dot_s(vs_pica.f[87], tmp_reg15);
vs_out_reg0.z = dot_s(vs_pica.f[88], tmp_reg15);
vs_out_reg0.w = dot_s(vs_pica.f[89], tmp_reg15);
return false;
}
bool Vfn2() {
bool_regs = notEqual(vs_pica.f[93].xx, vs_in_reg8.zw);
tmp_reg1.xy = (tmp_reg2.xxxx).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.xxxx)).w;
Vfn3();
tmp_reg1.xy = (tmp_reg2.yyyy).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.yyyy)).w;
Vfn3();
tmp_reg1.xy = (tmp_reg2.zzzz).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.zzzz)).w;
if (bool_regs.x) {
Vfn3();
}
if (vs_pica.b[8]) {
Vfn4();
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
Vfn5();
return false;
}
bool Vfn4() {
tmp_reg1.xy = (tmp_reg2.wwww).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.wwww)).w;
if (bool_regs.y) {
Vfn3();
}
return false;
}
bool Vfn6() {
if (all(bool_regs)) {
Vfn7();
} else {
Vfn19();
}
return false;
}
bool Vfn7() {
bool_regs = notEqual(vs_pica.f[93].xx, vs_in_reg8.zw);
tmp_reg1.xy = (tmp_reg2.xxxx).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.xxxx)).w;
Vfn8();
tmp_reg1.xy = (tmp_reg2.yyyy).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.yyyy)).w;
Vfn8();
tmp_reg1.xy = (tmp_reg2.zzzz).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.zzzz)).w;
if (bool_regs.x) {
Vfn8();
}
if (vs_pica.b[8]) {
Vfn9();
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
Vfn10();
return false;
}
bool Vfn9() {
tmp_reg1.xy = (tmp_reg2.wwww).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.wwww)).w;
if (bool_regs.y) {
Vfn8();
}
return false;
}
bool Vfn19() {
bool_regs = notEqual(vs_pica.f[93].xx, vs_in_reg8.zw);
tmp_reg1.xy = (tmp_reg2.xxxx).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.xxxx)).w;
Vfn20();
tmp_reg1.xy = (tmp_reg2.yyyy).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.yyyy)).w;
Vfn20();
tmp_reg1.xy = (tmp_reg2.zzzz).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.zzzz)).w;
if (bool_regs.x) {
Vfn20();
}
if (vs_pica.b[8]) {
Vfn21();
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
bool Vfn21() {
tmp_reg1.xy = (tmp_reg2.wwww).xy;
tmp_reg1.w = (mul_s(vs_pica.f[8].wwww, vs_in_reg8.wwww)).w;
if (bool_regs.y) {
Vfn20();
}
return false;
}
bool Vfn5() {
uint jmp_to = 139u;
while (true) {
switch (jmp_to) {
case 139u:
tmp_reg6.x = dot_3(tmp_reg14.xyz, tmp_reg14.xyz);
tmp_reg7.x = dot_3(tmp_reg12.xyz, tmp_reg12.xyz);
tmp_reg6.x = rsq_s(tmp_reg6.x);
tmp_reg7.x = rsq_s(tmp_reg7.x);
tmp_reg14.xyz = (mul_s(tmp_reg14.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg12.xyz = (mul_s(tmp_reg12.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg0 = vs_pica.f[93].yxxx;
if (!vs_pica.b[3]) {
jmp_to = 155u; break;
}
tmp_reg4 = vs_pica.f[93].yyyy + tmp_reg14.zzzz;
tmp_reg4 = mul_s(vs_pica.f[94].zzzz, tmp_reg4);
bool_regs = greaterThanEqual(vs_pica.f[93].xx, tmp_reg4.xx);
tmp_reg4 = vec4(rsq_s(tmp_reg4.x));
tmp_reg5 = mul_s(vs_pica.f[94].zzzz, tmp_reg14);
if (bool_regs.x) {
jmp_to = 155u; break;
}
tmp_reg0.z = rcp_s(tmp_reg4.x);
tmp_reg0.xy = (mul_s(tmp_reg5, tmp_reg4)).xy;
case 155u:
vs_out_reg1 = tmp_reg0;
default: return false;
}
}
return false;
}
bool Vfn10() {
uint jmp_to = 156u;
while (true) {
switch (jmp_to) {
case 156u:
tmp_reg6.x = dot_3(tmp_reg14.xyz, tmp_reg14.xyz);
tmp_reg7.x = dot_3(tmp_reg12.xyz, tmp_reg12.xyz);
tmp_reg6.x = rsq_s(tmp_reg6.x);
tmp_reg7.x = rsq_s(tmp_reg7.x);
tmp_reg14.xyz = (mul_s(tmp_reg14.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg12.xyz = (mul_s(tmp_reg12.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg13.xyz = (mul_s(tmp_reg13.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg11.xyz = (mul_s(tmp_reg11.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg0 = vs_pica.f[93].yxxx;
if (!vs_pica.b[3]) {
jmp_to = 231u; break;
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
jmp_to = 193u; break;
}
tmp_reg7.xz = (tmp_reg13.wwyy + -tmp_reg14.yyww).xz;
tmp_reg7.y = (tmp_reg14.xxxx + -tmp_reg13.zzzz).y;
tmp_reg7.w = (tmp_reg6).w;
tmp_reg6 = vec4(dot_s(tmp_reg7, tmp_reg7));
tmp_reg6 = vec4(rsq_s(tmp_reg6.x));
tmp_reg0 = mul_s(tmp_reg7, tmp_reg6);
if (vs_pica.b[0]) {
jmp_to = 231u; break;
}
case 193u:
bool_regs = greaterThan(tmp_reg5.zy, tmp_reg5.yx);
if (bool_regs.x) {
Vfn11();
} else {
Vfn16();
}
tmp_reg6 = vec4(dot_s(tmp_reg8, tmp_reg8));
tmp_reg6 = vec4(rsq_s(tmp_reg6.x));
tmp_reg0 = mul_s(tmp_reg8, tmp_reg6);
case 231u:
vs_out_reg1 = tmp_reg0;
default: return false;
}
}
return false;
}
bool Vfn11() {
if (bool_regs.y) {
tmp_reg8 = mul_s(tmp_reg13.yyzw, tmp_reg6.xxxy);
tmp_reg8.x = (vs_pica.f[93].yyyy + -tmp_reg5.yyyy).x;
tmp_reg9 = tmp_reg5.zzzz + -tmp_reg5.xxxx;
tmp_reg8.yzw = (tmp_reg8 + tmp_reg14.wwxy).yzw;
tmp_reg8.x = (tmp_reg9 + tmp_reg8).x;
} else {
Vfn13();
}
tmp_reg8.w = (-tmp_reg8).w;
return false;
}
bool Vfn13() {
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
bool Vfn16() {
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
bool Vfn22() {
tmp_reg0.y = (vs_pica.f[7].wwww).y;
bool_regs = notEqual(vs_pica.f[93].xx, tmp_reg0.xy);
tmp_reg9 = vs_pica.f[21];
tmp_reg0 = mul_s(vs_pica.f[7].wwww, vs_in_reg3);
if (bool_regs.y) {
Vfn23();
}
vs_out_reg3 = max_s(vs_pica.f[93].xxxx, tmp_reg9);
return false;
}
bool Vfn23() {
if (vs_pica.b[7]) {
tmp_reg9.w = (mul_s(tmp_reg9.wwww, tmp_reg0.wwww)).w;
}
tmp_reg9.xyz = (mul_s(vs_pica.f[20].wwww, tmp_reg0.xyzz)).xyz;
tmp_reg8.x = (vs_pica.f[93].yyyy).x;
return false;
}
bool Vfn25() {
tmp_reg0.xy = (vs_pica.f[10].xxxx).xy;
if (vs_pica.b[9]) {
tmp_reg6.xy = (mul_s(vs_pica.f[8].xxxx, vs_in_reg4.xyyy)).xy;
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
tmp_reg3.x = dot_s(vs_pica.f[11].xywz, tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12].xywz, tmp_reg6);
tmp_reg3.zw = (vs_pica.f[93].xxxx).zw;
vs_out_reg4 = tmp_reg3;
} else {
Vfn27();
}
return false;
}
bool Vfn27() {
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
Vfn29();
}
vs_out_reg4 = tmp_reg3;
return false;
}
bool Vfn29() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
Vfn30();
} else {
Vfn32();
}
return false;
}
bool Vfn30() {
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
bool Vfn32() {
Vfn33();
tmp_reg3.x = dot_s(vs_pica.f[11], tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12], tmp_reg6);
return false;
}
bool Vfn33() {
tmp_reg1.xy = (vs_pica.f[94].zzzz).xy;
tmp_reg1.zw = (vs_pica.f[93].xxxx).zw;
tmp_reg6 = fma_s(tmp_reg14, tmp_reg1, tmp_reg1);
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
return false;
}
bool Vfn34() {
tmp_reg0.xy = (vs_pica.f[10].yyyy).xy;
if (vs_pica.b[10]) {
tmp_reg6.xy = (mul_s(vs_pica.f[8].yyyy, vs_in_reg5.xyyy)).xy;
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
tmp_reg4.x = dot_s(vs_pica.f[14].xywz, tmp_reg6);
tmp_reg4.y = dot_s(vs_pica.f[15].xywz, tmp_reg6);
vs_out_reg5 = tmp_reg4;
} else {
Vfn36();
}
return false;
}
bool Vfn36() {
if (vs_pica.b[13]) {
Vfn37();
} else {
vs_out_reg5 = vs_pica.f[93].xxxx;
}
return false;
}
bool Vfn37() {
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
Vfn39();
}
vs_out_reg5 = tmp_reg4;
return false;
}
bool Vfn39() {
Vfn33();
tmp_reg4.x = dot_s(vs_pica.f[14], tmp_reg6);
tmp_reg4.y = dot_s(vs_pica.f[15], tmp_reg6);
return false;
}
bool Vfn41() {
tmp_reg0.xy = (vs_pica.f[10].zzzz).xy;
if (vs_pica.b[11]) {
tmp_reg6.xy = (mul_s(vs_pica.f[8].zzzz, vs_in_reg6.xyyy)).xy;
tmp_reg5.x = dot_s(vs_pica.f[17].xywz, tmp_reg6);
tmp_reg5.y = dot_s(vs_pica.f[18].xywz, tmp_reg6);
vs_out_reg6 = tmp_reg5;
} else {
Vfn43();
}
return false;
}
bool Vfn43() {
if (vs_pica.b[14]) {
Vfn44();
} else {
vs_out_reg6 = vs_pica.f[93].xxxx;
}
return false;
}
bool Vfn44() {
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
tmp_reg5.zw = (tmp_reg6.zwww).zw;
Vfn33();
tmp_reg5.x = dot_s(vs_pica.f[17], tmp_reg6);
tmp_reg5.y = dot_s(vs_pica.f[18], tmp_reg6);
vs_out_reg6 = tmp_reg5;
return false;
}
// shader: 8B30, 12F60E19E391B7A7
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
d0_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor1.rgb) + (texcolor2.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(mix((texcolor0.rgb), (last_tev_out.rgb), (vec3(1) - texcolor0.aaa)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2 * 2.0, alpha_output_2 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(fma((secondary_fragment_color.rgb), (secondary_fragment_color.aaa), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(min((const_color[4].rgb) + (rounded_primary_color.rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4 * 2.0, alpha_output_4 * 1.0);
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
// shader: 8B30, 513C7CA6FECEF4FB
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
d0_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor1.rgb) + (texcolor2.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(mix((texcolor0.rgb), (last_tev_out.rgb), (vec3(1) - texcolor0.aaa)), vec3(0), vec3(1)));
float alpha_output_1 = (const_color[1].a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2 * 2.0, alpha_output_2 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(fma((secondary_fragment_color.rgb), (secondary_fragment_color.aaa), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(min((const_color[4].rgb) + (rounded_primary_color.rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4 * 2.0, alpha_output_4 * 1.0);
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
// shader: 8B30, 27FED7ADFB27BD0D
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
d0_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((secondary_fragment_color.rgb), (secondary_fragment_color.aaa), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(min((const_color[2].rgb) + (rounded_primary_color.rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2 * 2.0, alpha_output_2 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(mix((last_tev_out.rgb), (texcolor0.rgb), (texcolor0.aaa)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
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
// shader: 8B30, F6DB76D4A549BB27
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
d0_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((secondary_fragment_color.rgb), (secondary_fragment_color.aaa), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(min((const_color[2].rgb) + (rounded_primary_color.rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2 * 2.0, alpha_output_2 * 1.0);
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
// reference: 5D032CD71AC63333, 555B72D265592861
// reference: CC01409F0D5E0B07, 7AFE98DB0527A58B
// reference: 89C4119E916EF2EF, A67486BBD8175EFA
// reference: B024E1ED79A4A938, 12F60E19E391B7A7
// reference: B024E1ED17103FAA, 513C7CA6FECEF4FB
// reference: 4615F0D73673EFFB, 27FED7ADFB27BD0D
// reference: 08758A111AC63333, F6DB76D4A549BB27
// program: 43C849DD166EF6F5, 0000000000000000, 555B72D265592861
// program: B753A1567A802E0D, 0000000000000000, 7AFE98DB0527A58B
// program: A67486BBD8175EFA, 0000000000000000, 12F60E19E391B7A7
// program: A67486BBD8175EFA, 0000000000000000, 513C7CA6FECEF4FB
// program: B753A1567A802E0D, 0000000000000000, 555B72D265592861
// program: B753A1567A802E0D, 0000000000000000, 27FED7ADFB27BD0D
// program: B753A1567A802E0D, 0000000000000000, F6DB76D4A549BB27
