// shader: 8B31, 2EF16290DD3DB53B

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
vec4 vtx_color = vec4(vs_out_reg6.x,vs_out_reg6.y,vs_out_reg6.z,vs_out_reg6.w);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg3.x,vs_out_reg3.y,1,1);
texcoord12 = vec4(vs_out_reg4.x,vs_out_reg4.y,vs_out_reg5.x,vs_out_reg5.y);
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
bool Vfn19();
bool Vfn21();
bool Vfn4();
bool Vfn2();
bool Vfn7();
bool Vfn10();
bool Vfn0();
bool Vfn15();
bool Vfn25();
bool Vfn27();
bool Vfn29();
bool Vfn33();
vec4 tmp_reg0;
vec4 tmp_reg1;
vec4 tmp_reg2;
vec4 tmp_reg3;
vec4 tmp_reg4;
vec4 tmp_reg5;
vec4 tmp_reg6;
vec4 tmp_reg7;
vec4 tmp_reg8;
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
tmp_reg10 = vec4(0, 0, 0, 1);
tmp_reg11 = vec4(0, 0, 0, 1);
tmp_reg12 = vec4(0, 0, 0, 1);
tmp_reg13 = vec4(0, 0, 0, 1);
tmp_reg14 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn19() {
bool_regs = equal(vs_pica.f[17].yz, tmp_reg0.xy);
if (all(not(bool_regs))) {
tmp_reg0.xy = (vs_in_reg5.xyyy).xy;
} else {
Vfn21();
}
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
return false;
}
bool Vfn21() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
tmp_reg0.xy = (vs_in_reg6.xyyy).xy;
} else {
tmp_reg0.xy = (vs_in_reg7.xyyy).xy;
}
return false;
}
bool Vfn4() {
addr_regs.x = (ivec2(tmp_reg14.xx)).x;
if (vs_pica.b[4]) {
tmp_reg0.x = dot_3(vs_pica.f[19 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg0.y = dot_3(vs_pica.f[20 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg0.z = dot_3(vs_pica.f[21 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg6.xyz = (fma_s(tmp_reg14.wwww, tmp_reg0.xyzz, tmp_reg6.xyzz)).xyz;
}
tmp_reg0.x = dot_s(vs_pica.f[19 + addr_regs.x], tmp_reg10);
tmp_reg0.y = dot_s(vs_pica.f[20 + addr_regs.x], tmp_reg10);
tmp_reg0.z = dot_s(vs_pica.f[21 + addr_regs.x], tmp_reg10);
tmp_reg7.xyz = (fma_s(tmp_reg14.wwww, tmp_reg0.xyzz, tmp_reg7.xyzz)).xyz;
return false;
}
bool Vfn2() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.xxxx)).x;
tmp_reg14.w = (vs_in_reg4.xxxx).w;
Vfn4();
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.yyyy)).x;
tmp_reg14.w = (vs_in_reg4.yyyy).w;
Vfn4();
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.zzzz)).x;
tmp_reg14.w = (vs_in_reg4.zzzz).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn7() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.xxxx)).x;
tmp_reg14.w = (vs_pica.f[17].yyyy).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn10() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (vs_pica.f[17].xxxx).x;
tmp_reg14.w = (vs_pica.f[17].yyyy).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn0() {
tmp_reg10 = vs_pica.f[17].xxxy;
tmp_reg10.xyz = (vs_in_reg0).xyz;
if (vs_pica.b[4]) {
tmp_reg5.xyz = (vs_in_reg1).xyz;
}
if (vs_pica.b[3]) {
Vfn2();
}
if (vs_pica.b[2]) {
Vfn7();
}
if (vs_pica.b[1]) {
Vfn10();
}
tmp_reg8.x = dot_s(vs_pica.f[8], tmp_reg10);
tmp_reg8.y = dot_s(vs_pica.f[9], tmp_reg10);
tmp_reg8.z = dot_s(vs_pica.f[10], tmp_reg10);
tmp_reg8.w = (vs_pica.f[17].yyyy).w;
if (vs_pica.b[4]) {
tmp_reg4.x = dot_3(vs_pica.f[8].xyz, tmp_reg5.xyz);
tmp_reg4.y = dot_3(vs_pica.f[9].xyz, tmp_reg5.xyz);
tmp_reg4.z = dot_3(vs_pica.f[10].xyz, tmp_reg5.xyz);
}
tmp_reg12.x = dot_s(vs_pica.f[4], tmp_reg8);
tmp_reg12.y = dot_s(vs_pica.f[5], tmp_reg8);
tmp_reg12.z = dot_s(vs_pica.f[6], tmp_reg8);
tmp_reg12.w = (vs_pica.f[17].yyyy).w;
if (vs_pica.b[4]) {
tmp_reg0.x = dot_3(vs_pica.f[4].xyz, tmp_reg4.xyz);
tmp_reg0.y = dot_3(vs_pica.f[5].xyz, tmp_reg4.xyz);
tmp_reg0.z = dot_3(vs_pica.f[6].xyz, tmp_reg4.xyz);
tmp_reg3.x = dot_s(tmp_reg0.xyzz, tmp_reg0.xyzz);
tmp_reg3.x = rsq_s(tmp_reg3.x);
tmp_reg3.xyz = (mul_s(tmp_reg0.xyzz, tmp_reg3.xxxx)).xyz;
}
tmp_reg10.x = dot_s(vs_pica.f[0], tmp_reg12);
tmp_reg10.y = dot_s(vs_pica.f[1], tmp_reg12);
tmp_reg10.w = dot_s(vs_pica.f[3], tmp_reg12);
tmp_reg10.z = dot_s(vs_pica.f[2], tmp_reg12);
vs_out_reg0 = tmp_reg10;
if (vs_pica.b[4]) {
Vfn15();
} else {
vs_out_reg1 = vs_pica.f[17].yxxx;
}
vs_out_reg2 = -tmp_reg12;
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
tmp_reg0.xy = (vs_pica.f[95].xxxx).xy;
Vfn19();
tmp_reg2.zw = (vs_pica.f[17].xxxx).zw;
tmp_reg2.y = (vs_pica.f[17].yyyy).y;
tmp_reg2.y = (tmp_reg2.yyyy + -tmp_reg0.yyyy).y;
tmp_reg2.x = (tmp_reg0.xxxx).x;
vs_out_reg3 = tmp_reg2;
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
tmp_reg0.xy = (vs_pica.f[95].yyyy).xy;
Vfn19();
tmp_reg2.zw = (vs_pica.f[17].xxxx).zw;
tmp_reg2.y = (vs_pica.f[17].yyyy).y;
tmp_reg2.y = (tmp_reg2.yyyy + -tmp_reg0.yyyy).y;
tmp_reg2.x = (tmp_reg0.xxxx).x;
vs_out_reg4 = tmp_reg2;
tmp_reg0.xy = (vs_pica.f[95].zzzz).xy;
Vfn19();
tmp_reg2.zw = (vs_pica.f[17].xxxx).zw;
tmp_reg2.y = (vs_pica.f[17].yyyy).y;
tmp_reg2.y = (tmp_reg2.yyyy + -tmp_reg0.yyyy).y;
tmp_reg2.x = (tmp_reg0.xxxx).x;
vs_out_reg5 = tmp_reg2;
if (vs_pica.b[7]) {
tmp_reg10 = vs_pica.f[17].xxyx;
}
if (vs_pica.b[11]) {
Vfn25();
} else {
tmp_reg11.xyz = (vs_pica.f[17].yyyy).xyz;
}
if (vs_pica.b[7]) {
Vfn33();
} else {
tmp_reg11.w = (vs_pica.f[17].xxxx).w;
}
vs_out_reg6 = tmp_reg11;
return true;
}
bool Vfn15() {
tmp_reg0 = vs_pica.f[17].yyyy + tmp_reg3.zzzz;
tmp_reg0 = mul_s(vs_pica.f[18].xxxx, tmp_reg0);
bool_regs = greaterThanEqual(vs_pica.f[17].xx, tmp_reg0.xx);
tmp_reg0 = vec4(rsq_s(tmp_reg0.x));
tmp_reg1 = mul_s(vs_pica.f[18].xxxx, tmp_reg3.xyzz);
if (!bool_regs.x) {
vs_out_reg1.z = rcp_s(tmp_reg0.x);
vs_out_reg1.xy = (mul_s(tmp_reg1, tmp_reg0)).xy;
} else {
vs_out_reg1.xyz = (vs_pica.f[17].yxxx).xyz;
}
vs_out_reg1.w = (vs_pica.f[17].xxxx).w;
return false;
}
bool Vfn25() {
tmp_reg11.xyz = (vs_pica.f[17].xxxy).xyz;
if (vs_pica.b[6]) {
tmp_reg13.x = (max_s(vs_pica.f[17].xxxx, tmp_reg4.yyyy)).x;
tmp_reg0.xyz = (mul_s(vs_pica.f[93].xyzz, tmp_reg13.xxxx)).xyz;
tmp_reg11.xyz = (tmp_reg11.xyzz + tmp_reg0.xyzz).xyz;
tmp_reg13 = max_s(vs_pica.f[17].xxxy, tmp_reg11.xyzz);
tmp_reg11.xyz = (min_s(vs_pica.f[17].yyyy, tmp_reg13.xyzz)).xyz;
tmp_reg13.x = (max_s(vs_pica.f[17].xxxx, -tmp_reg4.yyyy)).x;
tmp_reg0.xyz = (mul_s(vs_pica.f[94].xyzz, tmp_reg13.xxxx)).xyz;
tmp_reg11.xyz = (tmp_reg11.xyzz + tmp_reg0.xyzz).xyz;
tmp_reg13 = max_s(vs_pica.f[17].xxxy, tmp_reg11.xyzz);
tmp_reg11.xyz = (min_s(vs_pica.f[17].yyyy, tmp_reg13.xyzz)).xyz;
}
if (vs_pica.b[5]) {
Vfn27();
}
return false;
}
bool Vfn27() {
if (vs_pica.b[7]) {
tmp_reg10.x = (max_s(tmp_reg11.xxxx, tmp_reg11.yyyy)).x;
tmp_reg10.x = (max_s(tmp_reg10.xxxx, tmp_reg11.zzzz)).x;
}
addr_regs.z = int(vs_pica.i[0].y);
for (uint i = 0u; i <= vs_pica.i[0].x; addr_regs.z += int(vs_pica.i[0].z), ++i) {
Vfn29();
}
if (vs_pica.b[7]) {
tmp_reg10.y = (max_s(tmp_reg11.xxxx, tmp_reg11.yyyy)).y;
tmp_reg10.y = (max_s(tmp_reg10.yyyy, tmp_reg11.zzzz)).y;
tmp_reg10.z = (tmp_reg10.yyyy + -tmp_reg10.xxxx).z;
tmp_reg10.z = (max_s(vs_pica.f[17].xxxx, tmp_reg10.zzzz)).z;
tmp_reg10.z = (min_s(vs_pica.f[17].yyyy, tmp_reg10.zzzz)).z;
tmp_reg10.z = (vs_pica.f[17].yyyy + -tmp_reg10.zzzz).z;
}
return false;
}
bool Vfn29() {
tmp_reg14.xyz = (vs_pica.f[81 + addr_regs.z].xyzz).xyz;
tmp_reg3.x = (vs_pica.f[81 + addr_regs.z].wwww).x;
tmp_reg2.xyz = (vs_pica.f[87 + addr_regs.z].xyzz).xyz;
tmp_reg3.y = (vs_pica.f[87 + addr_regs.z].wwww).y;
tmp_reg0.xyz = (tmp_reg2.xyzz + -tmp_reg8.xyzz).xyz;
tmp_reg0.w = dot_3(tmp_reg0.xyz, tmp_reg0.xyz);
tmp_reg6.xyz = vec3(rsq_s(tmp_reg0.w));
tmp_reg0.xyz = (mul_s(tmp_reg0.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg0.w = rcp_s(tmp_reg6.x);
tmp_reg1.x = dot_3(tmp_reg4.xyz, tmp_reg0.xyz);
tmp_reg6.x = (max_s(vs_pica.f[17].xxxy, tmp_reg1.xxxx)).x;
tmp_reg1.x = (min_s(vs_pica.f[17].yyyy, tmp_reg6.xxxx)).x;
tmp_reg6.x = (tmp_reg0.wwww + -tmp_reg3.xxxx).x;
tmp_reg6.z = (tmp_reg3.yyyy + -tmp_reg3.xxxx).z;
tmp_reg6.y = rcp_s(tmp_reg6.z);
tmp_reg6.z = (mul_s(tmp_reg6.xxxx, tmp_reg6.yyyy)).z;
tmp_reg6.x = (min_s(vs_pica.f[17].yyyy, tmp_reg6.zzzz)).x;
tmp_reg6.y = (max_s(vs_pica.f[17].xxxx, tmp_reg6.xxxx)).y;
tmp_reg6.x = (vs_pica.f[17].yyyy + -tmp_reg6.yyyy).x;
tmp_reg1.x = (mul_s(tmp_reg1.xxxx, tmp_reg6.xxxx)).x;
tmp_reg6.xyz = (mul_s(vs_pica.f[80].xyzz, tmp_reg14.xyzz)).xyz;
tmp_reg5.xyz = (mul_s(tmp_reg6.xyzz, tmp_reg1.xxxx)).xyz;
tmp_reg11.xyz = (tmp_reg11.xyzz + tmp_reg5.xyzz).xyz;
tmp_reg13 = max_s(vs_pica.f[17].xxxy, tmp_reg11.xyzz);
tmp_reg11.xyz = (min_s(vs_pica.f[17].yyyy, tmp_reg13.xyzz)).xyz;
return false;
}
bool Vfn33() {
tmp_reg13.w = (vs_pica.f[95].wwww).w;
bool_regs = lessThan(tmp_reg8.zz, tmp_reg13.ww);
if (bool_regs.x) {
tmp_reg11.w = (tmp_reg10.zzzz).w;
} else {
tmp_reg11.w = (vs_pica.f[17].xxxx).w;
}
return false;
}
// shader: 8B30, F307BCFA7453E50A
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
clamp_highlights = sign(dot_product);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(min((primary_fragment_color.rgb) + (secondary_fragment_color.rgb), vec3(1)) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor0.r) + (const_color[0].a) - 0.5, 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((texcolor0.rgb), (rounded_primary_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1 * 4.0, alpha_output_1 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (const_color[2].rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp(mix((combiner_buffer.rgb), (last_tev_out.rgb), (rounded_primary_color.aaa)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp((last_tev_out.rgb) * (const_color[4].aaa), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp((last_tev_out.a) * (const_color[4].a), 0.0, 1.0));
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
// shader: 8B31, 693DABDA141DA5AC

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
vec4 vtx_color = vec4(vs_out_reg6.x,vs_out_reg6.y,vs_out_reg6.z,vs_out_reg6.w);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg3.x,vs_out_reg3.y,1,1);
texcoord12 = vec4(vs_out_reg4.x,vs_out_reg4.y,vs_out_reg5.x,vs_out_reg5.y);
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
bool Vfn19();
bool Vfn21();
bool Vfn4();
bool Vfn2();
bool Vfn7();
bool Vfn10();
bool Vfn0();
bool Vfn15();
bool Vfn24();
bool Vfn26();
bool Vfn27();
vec4 tmp_reg0;
vec4 tmp_reg1;
vec4 tmp_reg2;
vec4 tmp_reg3;
vec4 tmp_reg4;
vec4 tmp_reg5;
vec4 tmp_reg6;
vec4 tmp_reg7;
vec4 tmp_reg8;
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
tmp_reg10 = vec4(0, 0, 0, 1);
tmp_reg11 = vec4(0, 0, 0, 1);
tmp_reg12 = vec4(0, 0, 0, 1);
tmp_reg13 = vec4(0, 0, 0, 1);
tmp_reg14 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn19() {
bool_regs = equal(vs_pica.f[17].yz, tmp_reg0.xy);
if (all(not(bool_regs))) {
tmp_reg0.xy = (vs_in_reg5.xyyy).xy;
} else {
Vfn21();
}
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
return false;
}
bool Vfn21() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
tmp_reg0.xy = (vs_in_reg6.xyyy).xy;
} else {
tmp_reg0.xy = (vs_in_reg7.xyyy).xy;
}
return false;
}
bool Vfn4() {
addr_regs.x = (ivec2(tmp_reg14.xx)).x;
if (vs_pica.b[4]) {
tmp_reg0.x = dot_3(vs_pica.f[19 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg0.y = dot_3(vs_pica.f[20 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg0.z = dot_3(vs_pica.f[21 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg6.xyz = (fma_s(tmp_reg14.wwww, tmp_reg0.xyzz, tmp_reg6.xyzz)).xyz;
}
tmp_reg0.x = dot_s(vs_pica.f[19 + addr_regs.x], tmp_reg10);
tmp_reg0.y = dot_s(vs_pica.f[20 + addr_regs.x], tmp_reg10);
tmp_reg0.z = dot_s(vs_pica.f[21 + addr_regs.x], tmp_reg10);
tmp_reg7.xyz = (fma_s(tmp_reg14.wwww, tmp_reg0.xyzz, tmp_reg7.xyzz)).xyz;
return false;
}
bool Vfn2() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.xxxx)).x;
tmp_reg14.w = (vs_in_reg4.xxxx).w;
Vfn4();
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.yyyy)).x;
tmp_reg14.w = (vs_in_reg4.yyyy).w;
Vfn4();
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.zzzz)).x;
tmp_reg14.w = (vs_in_reg4.zzzz).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn7() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.xxxx)).x;
tmp_reg14.w = (vs_pica.f[17].yyyy).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn10() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (vs_pica.f[17].xxxx).x;
tmp_reg14.w = (vs_pica.f[17].yyyy).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn0() {
tmp_reg10 = vs_pica.f[17].xxxy;
tmp_reg10.xyz = (vs_in_reg0).xyz;
if (vs_pica.b[4]) {
tmp_reg5.xyz = (vs_in_reg1).xyz;
}
if (vs_pica.b[3]) {
Vfn2();
}
if (vs_pica.b[2]) {
Vfn7();
}
if (vs_pica.b[1]) {
Vfn10();
}
tmp_reg8.x = dot_s(vs_pica.f[8], tmp_reg10);
tmp_reg8.y = dot_s(vs_pica.f[9], tmp_reg10);
tmp_reg8.z = dot_s(vs_pica.f[10], tmp_reg10);
tmp_reg8.w = (vs_pica.f[17].yyyy).w;
if (vs_pica.b[4]) {
tmp_reg4.x = dot_3(vs_pica.f[8].xyz, tmp_reg5.xyz);
tmp_reg4.y = dot_3(vs_pica.f[9].xyz, tmp_reg5.xyz);
tmp_reg4.z = dot_3(vs_pica.f[10].xyz, tmp_reg5.xyz);
}
tmp_reg12.x = dot_s(vs_pica.f[4], tmp_reg8);
tmp_reg12.y = dot_s(vs_pica.f[5], tmp_reg8);
tmp_reg12.z = dot_s(vs_pica.f[6], tmp_reg8);
tmp_reg12.w = (vs_pica.f[17].yyyy).w;
if (vs_pica.b[4]) {
tmp_reg0.x = dot_3(vs_pica.f[4].xyz, tmp_reg4.xyz);
tmp_reg0.y = dot_3(vs_pica.f[5].xyz, tmp_reg4.xyz);
tmp_reg0.z = dot_3(vs_pica.f[6].xyz, tmp_reg4.xyz);
tmp_reg3.x = dot_s(tmp_reg0.xyzz, tmp_reg0.xyzz);
tmp_reg3.x = rsq_s(tmp_reg3.x);
tmp_reg3.xyz = (mul_s(tmp_reg0.xyzz, tmp_reg3.xxxx)).xyz;
}
tmp_reg10.x = dot_s(vs_pica.f[0], tmp_reg12);
tmp_reg10.y = dot_s(vs_pica.f[1], tmp_reg12);
tmp_reg10.w = dot_s(vs_pica.f[3], tmp_reg12);
tmp_reg10.z = dot_s(vs_pica.f[2], tmp_reg12);
vs_out_reg0 = tmp_reg10;
if (vs_pica.b[4]) {
Vfn15();
} else {
vs_out_reg1 = vs_pica.f[17].yxxx;
}
vs_out_reg2 = -tmp_reg12;
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
tmp_reg0.xy = (vs_pica.f[95].xxxx).xy;
Vfn19();
tmp_reg2.zw = (vs_pica.f[17].xxxx).zw;
tmp_reg2.y = (vs_pica.f[17].yyyy).y;
tmp_reg2.y = (tmp_reg2.yyyy + -tmp_reg0.yyyy).y;
tmp_reg2.x = (tmp_reg0.xxxx).x;
vs_out_reg3 = tmp_reg2;
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
tmp_reg0.xy = (vs_pica.f[95].yyyy).xy;
Vfn19();
tmp_reg2.zw = (vs_pica.f[17].xxxx).zw;
tmp_reg2.y = (vs_pica.f[17].yyyy).y;
tmp_reg2.y = (tmp_reg2.yyyy + -tmp_reg0.yyyy).y;
tmp_reg2.x = (tmp_reg0.xxxx).x;
vs_out_reg4 = tmp_reg2;
tmp_reg0.xy = (vs_pica.f[95].zzzz).xy;
Vfn19();
tmp_reg2.zw = (vs_pica.f[17].xxxx).zw;
tmp_reg2.y = (vs_pica.f[17].yyyy).y;
tmp_reg2.y = (tmp_reg2.yyyy + -tmp_reg0.yyyy).y;
tmp_reg2.x = (tmp_reg0.xxxx).x;
vs_out_reg5 = tmp_reg2;
if (vs_pica.b[11]) {
Vfn24();
} else {
tmp_reg11.xyz = (vs_pica.f[17].yyyy).xyz;
}
tmp_reg11.w = (vs_pica.f[17].xxxx).w;
vs_out_reg6 = tmp_reg11;
return true;
}
bool Vfn15() {
tmp_reg0 = vs_pica.f[17].yyyy + tmp_reg3.zzzz;
tmp_reg0 = mul_s(vs_pica.f[18].xxxx, tmp_reg0);
bool_regs = greaterThanEqual(vs_pica.f[17].xx, tmp_reg0.xx);
tmp_reg0 = vec4(rsq_s(tmp_reg0.x));
tmp_reg1 = mul_s(vs_pica.f[18].xxxx, tmp_reg3.xyzz);
if (!bool_regs.x) {
vs_out_reg1.z = rcp_s(tmp_reg0.x);
vs_out_reg1.xy = (mul_s(tmp_reg1, tmp_reg0)).xy;
} else {
vs_out_reg1.xyz = (vs_pica.f[17].yxxx).xyz;
}
vs_out_reg1.w = (vs_pica.f[17].xxxx).w;
return false;
}
bool Vfn24() {
tmp_reg11.xyz = (vs_pica.f[17].xxxy).xyz;
if (vs_pica.b[6]) {
tmp_reg13.x = (max_s(vs_pica.f[17].xxxx, tmp_reg4.yyyy)).x;
tmp_reg0.xyz = (mul_s(vs_pica.f[93].xyzz, tmp_reg13.xxxx)).xyz;
tmp_reg11.xyz = (tmp_reg11.xyzz + tmp_reg0.xyzz).xyz;
tmp_reg13 = max_s(vs_pica.f[17].xxxy, tmp_reg11.xyzz);
tmp_reg11.xyz = (min_s(vs_pica.f[17].yyyy, tmp_reg13.xyzz)).xyz;
tmp_reg13.x = (max_s(vs_pica.f[17].xxxx, -tmp_reg4.yyyy)).x;
tmp_reg0.xyz = (mul_s(vs_pica.f[94].xyzz, tmp_reg13.xxxx)).xyz;
tmp_reg11.xyz = (tmp_reg11.xyzz + tmp_reg0.xyzz).xyz;
tmp_reg13 = max_s(vs_pica.f[17].xxxy, tmp_reg11.xyzz);
tmp_reg11.xyz = (min_s(vs_pica.f[17].yyyy, tmp_reg13.xyzz)).xyz;
}
if (vs_pica.b[5]) {
Vfn26();
}
return false;
}
bool Vfn26() {
addr_regs.z = int(vs_pica.i[0].y);
for (uint i = 0u; i <= vs_pica.i[0].x; addr_regs.z += int(vs_pica.i[0].z), ++i) {
Vfn27();
}
return false;
}
bool Vfn27() {
tmp_reg14.xyz = (vs_pica.f[81 + addr_regs.z].xyzz).xyz;
tmp_reg3.x = (vs_pica.f[81 + addr_regs.z].wwww).x;
tmp_reg2.xyz = (vs_pica.f[87 + addr_regs.z].xyzz).xyz;
tmp_reg3.y = (vs_pica.f[87 + addr_regs.z].wwww).y;
tmp_reg0.xyz = (tmp_reg2.xyzz + -tmp_reg8.xyzz).xyz;
tmp_reg0.w = dot_3(tmp_reg0.xyz, tmp_reg0.xyz);
tmp_reg6.xyz = vec3(rsq_s(tmp_reg0.w));
tmp_reg0.xyz = (mul_s(tmp_reg0.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg0.w = rcp_s(tmp_reg6.x);
tmp_reg1.x = dot_3(tmp_reg4.xyz, tmp_reg0.xyz);
tmp_reg6.x = (max_s(vs_pica.f[17].xxxy, tmp_reg1.xxxx)).x;
tmp_reg1.x = (min_s(vs_pica.f[17].yyyy, tmp_reg6.xxxx)).x;
tmp_reg6.x = (tmp_reg0.wwww + -tmp_reg3.xxxx).x;
tmp_reg6.z = (tmp_reg3.yyyy + -tmp_reg3.xxxx).z;
tmp_reg6.y = rcp_s(tmp_reg6.z);
tmp_reg6.z = (mul_s(tmp_reg6.xxxx, tmp_reg6.yyyy)).z;
tmp_reg6.x = (min_s(vs_pica.f[17].yyyy, tmp_reg6.zzzz)).x;
tmp_reg6.y = (max_s(vs_pica.f[17].xxxx, tmp_reg6.xxxx)).y;
tmp_reg6.x = (vs_pica.f[17].yyyy + -tmp_reg6.yyyy).x;
tmp_reg1.x = (mul_s(tmp_reg1.xxxx, tmp_reg6.xxxx)).x;
tmp_reg6.xyz = (mul_s(vs_pica.f[80].xyzz, tmp_reg14.xyzz)).xyz;
tmp_reg5.xyz = (mul_s(tmp_reg6.xyzz, tmp_reg1.xxxx)).xyz;
tmp_reg11.xyz = (tmp_reg11.xyzz + tmp_reg5.xyzz).xyz;
tmp_reg13 = max_s(vs_pica.f[17].xxxy, tmp_reg11.xyzz);
tmp_reg11.xyz = (min_s(vs_pica.f[17].yyyy, tmp_reg13.xyzz)).xyz;
return false;
}
// shader: 8B30, CB77F388701D396A
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
clamp_highlights = sign(dot_product);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(min((primary_fragment_color.rgb) + (secondary_fragment_color.rgb), vec3(1)) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((texcolor0.rgb), (rounded_primary_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1 * 4.0, alpha_output_1 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (const_color[2].aaa), vec3(0), vec3(1)));
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
// shader: 8B31, BA60DB7E186A4670

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
vec4 vtx_color = vec4(vs_out_reg6.x,vs_out_reg6.y,vs_out_reg6.z,vs_out_reg6.w);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg3.x,vs_out_reg3.y,1,1);
texcoord12 = vec4(vs_out_reg4.x,vs_out_reg4.y,vs_out_reg5.x,vs_out_reg5.y);
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
bool Vfn19();
bool Vfn21();
bool Vfn4();
bool Vfn2();
bool Vfn7();
bool Vfn10();
bool Vfn0();
bool Vfn15();
vec4 tmp_reg0;
vec4 tmp_reg1;
vec4 tmp_reg2;
vec4 tmp_reg3;
vec4 tmp_reg4;
vec4 tmp_reg5;
vec4 tmp_reg6;
vec4 tmp_reg7;
vec4 tmp_reg8;
vec4 tmp_reg10;
vec4 tmp_reg11;
vec4 tmp_reg12;
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
tmp_reg10 = vec4(0, 0, 0, 1);
tmp_reg11 = vec4(0, 0, 0, 1);
tmp_reg12 = vec4(0, 0, 0, 1);
tmp_reg14 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn19() {
bool_regs = equal(vs_pica.f[17].yz, tmp_reg0.xy);
if (all(not(bool_regs))) {
tmp_reg0.xy = (vs_in_reg5.xyyy).xy;
} else {
Vfn21();
}
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
return false;
}
bool Vfn21() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
tmp_reg0.xy = (vs_in_reg6.xyyy).xy;
} else {
tmp_reg0.xy = (vs_in_reg7.xyyy).xy;
}
return false;
}
bool Vfn4() {
addr_regs.x = (ivec2(tmp_reg14.xx)).x;
if (vs_pica.b[4]) {
tmp_reg0.x = dot_3(vs_pica.f[19 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg0.y = dot_3(vs_pica.f[20 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg0.z = dot_3(vs_pica.f[21 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg6.xyz = (fma_s(tmp_reg14.wwww, tmp_reg0.xyzz, tmp_reg6.xyzz)).xyz;
}
tmp_reg0.x = dot_s(vs_pica.f[19 + addr_regs.x], tmp_reg10);
tmp_reg0.y = dot_s(vs_pica.f[20 + addr_regs.x], tmp_reg10);
tmp_reg0.z = dot_s(vs_pica.f[21 + addr_regs.x], tmp_reg10);
tmp_reg7.xyz = (fma_s(tmp_reg14.wwww, tmp_reg0.xyzz, tmp_reg7.xyzz)).xyz;
return false;
}
bool Vfn2() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.xxxx)).x;
tmp_reg14.w = (vs_in_reg4.xxxx).w;
Vfn4();
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.yyyy)).x;
tmp_reg14.w = (vs_in_reg4.yyyy).w;
Vfn4();
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.zzzz)).x;
tmp_reg14.w = (vs_in_reg4.zzzz).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn7() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.xxxx)).x;
tmp_reg14.w = (vs_pica.f[17].yyyy).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn10() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (vs_pica.f[17].xxxx).x;
tmp_reg14.w = (vs_pica.f[17].yyyy).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn0() {
tmp_reg10 = vs_pica.f[17].xxxy;
tmp_reg10.xyz = (vs_in_reg0).xyz;
if (vs_pica.b[4]) {
tmp_reg5.xyz = (vs_in_reg1).xyz;
}
if (vs_pica.b[3]) {
Vfn2();
}
if (vs_pica.b[2]) {
Vfn7();
}
if (vs_pica.b[1]) {
Vfn10();
}
tmp_reg8.x = dot_s(vs_pica.f[8], tmp_reg10);
tmp_reg8.y = dot_s(vs_pica.f[9], tmp_reg10);
tmp_reg8.z = dot_s(vs_pica.f[10], tmp_reg10);
tmp_reg8.w = (vs_pica.f[17].yyyy).w;
if (vs_pica.b[4]) {
tmp_reg4.x = dot_3(vs_pica.f[8].xyz, tmp_reg5.xyz);
tmp_reg4.y = dot_3(vs_pica.f[9].xyz, tmp_reg5.xyz);
tmp_reg4.z = dot_3(vs_pica.f[10].xyz, tmp_reg5.xyz);
}
tmp_reg12.x = dot_s(vs_pica.f[4], tmp_reg8);
tmp_reg12.y = dot_s(vs_pica.f[5], tmp_reg8);
tmp_reg12.z = dot_s(vs_pica.f[6], tmp_reg8);
tmp_reg12.w = (vs_pica.f[17].yyyy).w;
if (vs_pica.b[4]) {
tmp_reg0.x = dot_3(vs_pica.f[4].xyz, tmp_reg4.xyz);
tmp_reg0.y = dot_3(vs_pica.f[5].xyz, tmp_reg4.xyz);
tmp_reg0.z = dot_3(vs_pica.f[6].xyz, tmp_reg4.xyz);
tmp_reg3.x = dot_s(tmp_reg0.xyzz, tmp_reg0.xyzz);
tmp_reg3.x = rsq_s(tmp_reg3.x);
tmp_reg3.xyz = (mul_s(tmp_reg0.xyzz, tmp_reg3.xxxx)).xyz;
}
tmp_reg10.x = dot_s(vs_pica.f[0], tmp_reg12);
tmp_reg10.y = dot_s(vs_pica.f[1], tmp_reg12);
tmp_reg10.w = dot_s(vs_pica.f[3], tmp_reg12);
tmp_reg10.z = dot_s(vs_pica.f[2], tmp_reg12);
vs_out_reg0 = tmp_reg10;
if (vs_pica.b[4]) {
Vfn15();
} else {
vs_out_reg1 = vs_pica.f[17].yxxx;
}
vs_out_reg2 = -tmp_reg12;
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
tmp_reg0.xy = (vs_pica.f[95].xxxx).xy;
Vfn19();
if (vs_pica.b[8]) {
tmp_reg2.x = dot_s(vs_pica.f[13], tmp_reg0);
tmp_reg2.y = dot_s(vs_pica.f[14], tmp_reg0);
tmp_reg0.xy = (tmp_reg2.xyyy).xy;
}
tmp_reg2.zw = (vs_pica.f[17].xxxx).zw;
tmp_reg2.y = (vs_pica.f[17].yyyy).y;
tmp_reg2.y = (tmp_reg2.yyyy + -tmp_reg0.yyyy).y;
tmp_reg2.x = (tmp_reg0.xxxx).x;
vs_out_reg3 = tmp_reg2;
vs_out_reg4 = vs_in_reg6;
vs_out_reg5 = vs_in_reg7;
tmp_reg11.xyz = (vs_pica.f[17].yyyy).xyz;
tmp_reg11.w = (vs_pica.f[17].xxxx).w;
vs_out_reg6 = tmp_reg11;
return true;
}
bool Vfn15() {
tmp_reg0 = vs_pica.f[17].yyyy + tmp_reg3.zzzz;
tmp_reg0 = mul_s(vs_pica.f[18].xxxx, tmp_reg0);
bool_regs = greaterThanEqual(vs_pica.f[17].xx, tmp_reg0.xx);
tmp_reg0 = vec4(rsq_s(tmp_reg0.x));
tmp_reg1 = mul_s(vs_pica.f[18].xxxx, tmp_reg3.xyzz);
if (!bool_regs.x) {
vs_out_reg1.z = rcp_s(tmp_reg0.x);
vs_out_reg1.xy = (mul_s(tmp_reg1, tmp_reg0)).xy;
} else {
vs_out_reg1.xyz = (vs_pica.f[17].yxxx).xyz;
}
vs_out_reg1.w = (vs_pica.f[17].xxxx).w;
return false;
}
// shader: 8B30, 172E7832C0B08E5D
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
clamp_highlights = sign(dot_product);
lut_offset = lighting_lut_offset[1][2];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
refl_value.r = lut_scale_rr * lut_value;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.a = lut_scale_fr * lut_value;
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += ((light_src[0].specular_0) + (refl_value * light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) + (const_color[0].rgb), vec3(0), vec3(1)));
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) + (const_color[1].rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(fma((primary_fragment_color.aaa), (vec3(1) - const_color[2].aaa), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) * (const_color[3].aaa), vec3(0), vec3(1)));
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
// shader: 8B30, 0E7A2E37D8979F58
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (const_color[1].aaa), vec3(0), vec3(1)));
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
// shader: 8B31, 8E1CCD22366E5576

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
vec4 vtx_color = vec4(vs_out_reg6.x,vs_out_reg6.y,vs_out_reg6.z,vs_out_reg6.w);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg3.x,vs_out_reg3.y,1,1);
texcoord12 = vec4(vs_out_reg4.x,vs_out_reg4.y,vs_out_reg5.x,vs_out_reg5.y);
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
bool Vfn19();
bool Vfn21();
bool Vfn4();
bool Vfn2();
bool Vfn7();
bool Vfn10();
bool Vfn0();
bool Vfn15();
vec4 tmp_reg0;
vec4 tmp_reg1;
vec4 tmp_reg2;
vec4 tmp_reg3;
vec4 tmp_reg4;
vec4 tmp_reg5;
vec4 tmp_reg6;
vec4 tmp_reg7;
vec4 tmp_reg8;
vec4 tmp_reg10;
vec4 tmp_reg12;
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
tmp_reg10 = vec4(0, 0, 0, 1);
tmp_reg12 = vec4(0, 0, 0, 1);
tmp_reg14 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn19() {
bool_regs = equal(vs_pica.f[17].yz, tmp_reg0.xy);
if (all(not(bool_regs))) {
tmp_reg0.xy = (vs_in_reg5.xyyy).xy;
} else {
Vfn21();
}
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
return false;
}
bool Vfn21() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
tmp_reg0.xy = (vs_in_reg6.xyyy).xy;
} else {
tmp_reg0.xy = (vs_in_reg7.xyyy).xy;
}
return false;
}
bool Vfn4() {
addr_regs.x = (ivec2(tmp_reg14.xx)).x;
if (vs_pica.b[4]) {
tmp_reg0.x = dot_3(vs_pica.f[19 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg0.y = dot_3(vs_pica.f[20 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg0.z = dot_3(vs_pica.f[21 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg6.xyz = (fma_s(tmp_reg14.wwww, tmp_reg0.xyzz, tmp_reg6.xyzz)).xyz;
}
tmp_reg0.x = dot_s(vs_pica.f[19 + addr_regs.x], tmp_reg10);
tmp_reg0.y = dot_s(vs_pica.f[20 + addr_regs.x], tmp_reg10);
tmp_reg0.z = dot_s(vs_pica.f[21 + addr_regs.x], tmp_reg10);
tmp_reg7.xyz = (fma_s(tmp_reg14.wwww, tmp_reg0.xyzz, tmp_reg7.xyzz)).xyz;
return false;
}
bool Vfn2() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.xxxx)).x;
tmp_reg14.w = (vs_in_reg4.xxxx).w;
Vfn4();
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.yyyy)).x;
tmp_reg14.w = (vs_in_reg4.yyyy).w;
Vfn4();
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.zzzz)).x;
tmp_reg14.w = (vs_in_reg4.zzzz).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn7() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.xxxx)).x;
tmp_reg14.w = (vs_pica.f[17].yyyy).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn10() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (vs_pica.f[17].xxxx).x;
tmp_reg14.w = (vs_pica.f[17].yyyy).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn0() {
tmp_reg10 = vs_pica.f[17].xxxy;
tmp_reg10.xyz = (vs_in_reg0).xyz;
if (vs_pica.b[4]) {
tmp_reg5.xyz = (vs_in_reg1).xyz;
}
if (vs_pica.b[3]) {
Vfn2();
}
if (vs_pica.b[2]) {
Vfn7();
}
if (vs_pica.b[1]) {
Vfn10();
}
tmp_reg8.x = dot_s(vs_pica.f[8], tmp_reg10);
tmp_reg8.y = dot_s(vs_pica.f[9], tmp_reg10);
tmp_reg8.z = dot_s(vs_pica.f[10], tmp_reg10);
tmp_reg8.w = (vs_pica.f[17].yyyy).w;
if (vs_pica.b[4]) {
tmp_reg4.x = dot_3(vs_pica.f[8].xyz, tmp_reg5.xyz);
tmp_reg4.y = dot_3(vs_pica.f[9].xyz, tmp_reg5.xyz);
tmp_reg4.z = dot_3(vs_pica.f[10].xyz, tmp_reg5.xyz);
}
tmp_reg12.x = dot_s(vs_pica.f[4], tmp_reg8);
tmp_reg12.y = dot_s(vs_pica.f[5], tmp_reg8);
tmp_reg12.z = dot_s(vs_pica.f[6], tmp_reg8);
tmp_reg12.w = (vs_pica.f[17].yyyy).w;
if (vs_pica.b[4]) {
tmp_reg0.x = dot_3(vs_pica.f[4].xyz, tmp_reg4.xyz);
tmp_reg0.y = dot_3(vs_pica.f[5].xyz, tmp_reg4.xyz);
tmp_reg0.z = dot_3(vs_pica.f[6].xyz, tmp_reg4.xyz);
tmp_reg3.x = dot_s(tmp_reg0.xyzz, tmp_reg0.xyzz);
tmp_reg3.x = rsq_s(tmp_reg3.x);
tmp_reg3.xyz = (mul_s(tmp_reg0.xyzz, tmp_reg3.xxxx)).xyz;
}
tmp_reg10.x = dot_s(vs_pica.f[0], tmp_reg12);
tmp_reg10.y = dot_s(vs_pica.f[1], tmp_reg12);
tmp_reg10.w = dot_s(vs_pica.f[3], tmp_reg12);
tmp_reg10.z = dot_s(vs_pica.f[2], tmp_reg12);
vs_out_reg0 = tmp_reg10;
if (vs_pica.b[4]) {
Vfn15();
} else {
vs_out_reg1 = vs_pica.f[17].yxxx;
}
vs_out_reg2 = -tmp_reg12;
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
tmp_reg0.xy = (vs_pica.f[95].xxxx).xy;
Vfn19();
if (vs_pica.b[8]) {
tmp_reg2.x = dot_s(vs_pica.f[13], tmp_reg0);
tmp_reg2.y = dot_s(vs_pica.f[14], tmp_reg0);
tmp_reg0.xy = (tmp_reg2.xyyy).xy;
}
tmp_reg2.zw = (vs_pica.f[17].xxxx).zw;
tmp_reg2.y = (vs_pica.f[17].yyyy).y;
tmp_reg2.y = (tmp_reg2.yyyy + -tmp_reg0.yyyy).y;
tmp_reg2.x = (tmp_reg0.xxxx).x;
vs_out_reg3 = tmp_reg2;
vs_out_reg4 = vs_in_reg6;
vs_out_reg5 = vs_in_reg7;
vs_out_reg6 = vs_in_reg8;
return true;
}
bool Vfn15() {
tmp_reg0 = vs_pica.f[17].yyyy + tmp_reg3.zzzz;
tmp_reg0 = mul_s(vs_pica.f[18].xxxx, tmp_reg0);
bool_regs = greaterThanEqual(vs_pica.f[17].xx, tmp_reg0.xx);
tmp_reg0 = vec4(rsq_s(tmp_reg0.x));
tmp_reg1 = mul_s(vs_pica.f[18].xxxx, tmp_reg3.xyzz);
if (!bool_regs.x) {
vs_out_reg1.z = rcp_s(tmp_reg0.x);
vs_out_reg1.xy = (mul_s(tmp_reg1, tmp_reg0)).xy;
} else {
vs_out_reg1.xyz = (vs_pica.f[17].yxxx).xyz;
}
vs_out_reg1.w = (vs_pica.f[17].xxxx).w;
return false;
}
// shader: 8B30, A6717E98DA4EA68F
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
clamp_highlights = sign(dot_product);
lut_offset = lighting_lut_offset[1][2];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
refl_value.r = lut_scale_rr * lut_value;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.a = lut_scale_fr * lut_value;
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += ((light_src[0].specular_0) + (refl_value * light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (texcolor0.rgb);
float alpha_output_0 = ByteRound(clamp((texcolor0.a) * (rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((vec3(1) - primary_fragment_color.aaa), (vec3(1) - const_color[1].aaa), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (const_color[2].aaa), vec3(0), vec3(1)));
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
// shader: 8B31, FF64A8F0F48D959F

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
vec4 vtx_color = vec4(vs_out_reg6.x,vs_out_reg6.y,vs_out_reg6.z,vs_out_reg6.w);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg3.x,vs_out_reg3.y,1,1);
texcoord12 = vec4(vs_out_reg4.x,vs_out_reg4.y,vs_out_reg5.x,vs_out_reg5.y);
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
bool Vfn20();
bool Vfn22();
bool Vfn4();
bool Vfn2();
bool Vfn7();
bool Vfn10();
bool Vfn0();
bool Vfn16();
vec4 tmp_reg0;
vec4 tmp_reg1;
vec4 tmp_reg2;
vec4 tmp_reg3;
vec4 tmp_reg4;
vec4 tmp_reg5;
vec4 tmp_reg6;
vec4 tmp_reg7;
vec4 tmp_reg8;
vec4 tmp_reg10;
vec4 tmp_reg12;
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
tmp_reg10 = vec4(0, 0, 0, 1);
tmp_reg12 = vec4(0, 0, 0, 1);
tmp_reg14 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn20() {
bool_regs = equal(vs_pica.f[17].yz, tmp_reg0.xy);
if (all(not(bool_regs))) {
tmp_reg0.xy = (vs_in_reg5.xyyy).xy;
} else {
Vfn22();
}
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
return false;
}
bool Vfn22() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
tmp_reg0.xy = (vs_in_reg6.xyyy).xy;
} else {
tmp_reg0.xy = (vs_in_reg7.xyyy).xy;
}
return false;
}
bool Vfn4() {
addr_regs.x = (ivec2(tmp_reg14.xx)).x;
if (vs_pica.b[4]) {
tmp_reg0.x = dot_3(vs_pica.f[19 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg0.y = dot_3(vs_pica.f[20 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg0.z = dot_3(vs_pica.f[21 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg6.xyz = (fma_s(tmp_reg14.wwww, tmp_reg0.xyzz, tmp_reg6.xyzz)).xyz;
}
tmp_reg0.x = dot_s(vs_pica.f[19 + addr_regs.x], tmp_reg10);
tmp_reg0.y = dot_s(vs_pica.f[20 + addr_regs.x], tmp_reg10);
tmp_reg0.z = dot_s(vs_pica.f[21 + addr_regs.x], tmp_reg10);
tmp_reg7.xyz = (fma_s(tmp_reg14.wwww, tmp_reg0.xyzz, tmp_reg7.xyzz)).xyz;
return false;
}
bool Vfn2() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.xxxx)).x;
tmp_reg14.w = (vs_in_reg4.xxxx).w;
Vfn4();
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.yyyy)).x;
tmp_reg14.w = (vs_in_reg4.yyyy).w;
Vfn4();
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.zzzz)).x;
tmp_reg14.w = (vs_in_reg4.zzzz).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn7() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.xxxx)).x;
tmp_reg14.w = (vs_pica.f[17].yyyy).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn10() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (vs_pica.f[17].xxxx).x;
tmp_reg14.w = (vs_pica.f[17].yyyy).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn0() {
tmp_reg10 = vs_pica.f[17].xxxy;
tmp_reg10.xyz = (vs_in_reg0).xyz;
if (vs_pica.b[4]) {
tmp_reg5.xyz = (vs_in_reg1).xyz;
}
if (vs_pica.b[3]) {
Vfn2();
}
if (vs_pica.b[2]) {
Vfn7();
}
if (vs_pica.b[1]) {
Vfn10();
}
tmp_reg8.x = dot_s(vs_pica.f[8], tmp_reg10);
tmp_reg8.y = dot_s(vs_pica.f[9], tmp_reg10);
tmp_reg8.z = dot_s(vs_pica.f[10], tmp_reg10);
tmp_reg8.w = (vs_pica.f[17].yyyy).w;
if (vs_pica.b[4]) {
tmp_reg4.x = dot_3(vs_pica.f[8].xyz, tmp_reg5.xyz);
tmp_reg4.y = dot_3(vs_pica.f[9].xyz, tmp_reg5.xyz);
tmp_reg4.z = dot_3(vs_pica.f[10].xyz, tmp_reg5.xyz);
}
tmp_reg12.x = dot_s(vs_pica.f[4], tmp_reg8);
tmp_reg12.y = dot_s(vs_pica.f[5], tmp_reg8);
tmp_reg12.z = dot_s(vs_pica.f[6], tmp_reg8);
tmp_reg12.w = (vs_pica.f[17].yyyy).w;
if (vs_pica.b[4]) {
tmp_reg0.x = dot_3(vs_pica.f[4].xyz, tmp_reg4.xyz);
tmp_reg0.y = dot_3(vs_pica.f[5].xyz, tmp_reg4.xyz);
tmp_reg0.z = dot_3(vs_pica.f[6].xyz, tmp_reg4.xyz);
tmp_reg3.x = dot_s(tmp_reg0.xyzz, tmp_reg0.xyzz);
tmp_reg3.x = rsq_s(tmp_reg3.x);
tmp_reg3.xyz = (mul_s(tmp_reg0.xyzz, tmp_reg3.xxxx)).xyz;
}
tmp_reg10.x = dot_s(vs_pica.f[0], tmp_reg12);
tmp_reg10.y = dot_s(vs_pica.f[1], tmp_reg12);
tmp_reg10.w = dot_s(vs_pica.f[3], tmp_reg12);
if (vs_pica.b[10]) {
tmp_reg12.z = (-vs_pica.f[80].wwww + tmp_reg12.zzzz).z;
}
tmp_reg10.z = dot_s(vs_pica.f[2], tmp_reg12);
vs_out_reg0 = tmp_reg10;
if (vs_pica.b[4]) {
Vfn16();
} else {
vs_out_reg1 = vs_pica.f[17].yxxx;
}
vs_out_reg2 = -tmp_reg12;
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
tmp_reg0.xy = (vs_pica.f[95].xxxx).xy;
Vfn20();
if (vs_pica.b[8]) {
tmp_reg2.x = dot_s(vs_pica.f[13], tmp_reg0);
tmp_reg2.y = dot_s(vs_pica.f[14], tmp_reg0);
tmp_reg0.xy = (tmp_reg2.xyyy).xy;
}
tmp_reg2.zw = (vs_pica.f[17].xxxx).zw;
tmp_reg2.y = (vs_pica.f[17].yyyy).y;
tmp_reg2.y = (tmp_reg2.yyyy + -tmp_reg0.yyyy).y;
tmp_reg2.x = (tmp_reg0.xxxx).x;
vs_out_reg3 = tmp_reg2;
vs_out_reg4 = vs_in_reg6;
vs_out_reg5 = vs_in_reg7;
vs_out_reg6 = vs_in_reg8;
return true;
}
bool Vfn16() {
tmp_reg0 = vs_pica.f[17].yyyy + tmp_reg3.zzzz;
tmp_reg0 = mul_s(vs_pica.f[18].xxxx, tmp_reg0);
bool_regs = greaterThanEqual(vs_pica.f[17].xx, tmp_reg0.xx);
tmp_reg0 = vec4(rsq_s(tmp_reg0.x));
tmp_reg1 = mul_s(vs_pica.f[18].xxxx, tmp_reg3.xyzz);
if (!bool_regs.x) {
vs_out_reg1.z = rcp_s(tmp_reg0.x);
vs_out_reg1.xy = (mul_s(tmp_reg1, tmp_reg0)).xy;
} else {
vs_out_reg1.xyz = (vs_pica.f[17].yxxx).xyz;
}
vs_out_reg1.w = (vs_pica.f[17].xxxx).w;
return false;
}
// shader: 8B30, F778FF933632034B
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = (const_color[0].rgb);
float alpha_output_0 = ByteRound(clamp(mix((texcolor0.a), (texcolor0.r), (const_color[0].a)), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.aaa) * (const_color[1].aaa), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) - (1.0 - const_color[1].a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp(mix((last_tev_out.rrr), (last_tev_out.aaa), (const_color[2].ggg)), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp(mix((last_tev_out.r), (last_tev_out.a), (const_color[2].g)), 0.0, 1.0));
last_tev_out = vec4(color_output_2 * 4.0, alpha_output_2 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = (const_color[3].aaa);
float alpha_output_3 = ByteRound(clamp(mix((last_tev_out.a), (last_tev_out.r), (combiner_buffer.b)), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_4 = ByteRound(clamp((texcolor0.rgb) * (const_color[4].rgb), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(min((rounded_primary_color.a) + (const_color[4].a), 1.0) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_5 = ByteRound(clamp(min((last_tev_out.rgb) + (const_color[5].rgb), vec3(1)) * (combiner_buffer.rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((last_tev_out.a) * (combiner_buffer.r), 0.0, 1.0));
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
// shader: 8B31, 1963ED80E2147851

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
vec4 vtx_color = vec4(vs_out_reg6.x,vs_out_reg6.y,vs_out_reg6.z,vs_out_reg6.w);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg3.x,vs_out_reg3.y,1,1);
texcoord12 = vec4(vs_out_reg4.x,vs_out_reg4.y,vs_out_reg5.x,vs_out_reg5.y);
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
bool Vfn4();
bool Vfn2();
bool Vfn7();
bool Vfn10();
bool Vfn0();
bool Vfn15();
vec4 tmp_reg0;
vec4 tmp_reg1;
vec4 tmp_reg3;
vec4 tmp_reg4;
vec4 tmp_reg5;
vec4 tmp_reg6;
vec4 tmp_reg7;
vec4 tmp_reg8;
vec4 tmp_reg10;
vec4 tmp_reg12;
vec4 tmp_reg14;
bool ExecVS() {
tmp_reg0 = vec4(0, 0, 0, 1);
tmp_reg1 = vec4(0, 0, 0, 1);
tmp_reg3 = vec4(0, 0, 0, 1);
tmp_reg4 = vec4(0, 0, 0, 1);
tmp_reg5 = vec4(0, 0, 0, 1);
tmp_reg6 = vec4(0, 0, 0, 1);
tmp_reg7 = vec4(0, 0, 0, 1);
tmp_reg8 = vec4(0, 0, 0, 1);
tmp_reg10 = vec4(0, 0, 0, 1);
tmp_reg12 = vec4(0, 0, 0, 1);
tmp_reg14 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn4() {
addr_regs.x = (ivec2(tmp_reg14.xx)).x;
if (vs_pica.b[4]) {
tmp_reg0.x = dot_3(vs_pica.f[19 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg0.y = dot_3(vs_pica.f[20 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg0.z = dot_3(vs_pica.f[21 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg6.xyz = (fma_s(tmp_reg14.wwww, tmp_reg0.xyzz, tmp_reg6.xyzz)).xyz;
}
tmp_reg0.x = dot_s(vs_pica.f[19 + addr_regs.x], tmp_reg10);
tmp_reg0.y = dot_s(vs_pica.f[20 + addr_regs.x], tmp_reg10);
tmp_reg0.z = dot_s(vs_pica.f[21 + addr_regs.x], tmp_reg10);
tmp_reg7.xyz = (fma_s(tmp_reg14.wwww, tmp_reg0.xyzz, tmp_reg7.xyzz)).xyz;
return false;
}
bool Vfn2() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.xxxx)).x;
tmp_reg14.w = (vs_in_reg4.xxxx).w;
Vfn4();
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.yyyy)).x;
tmp_reg14.w = (vs_in_reg4.yyyy).w;
Vfn4();
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.zzzz)).x;
tmp_reg14.w = (vs_in_reg4.zzzz).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn7() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.xxxx)).x;
tmp_reg14.w = (vs_pica.f[17].yyyy).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn10() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (vs_pica.f[17].xxxx).x;
tmp_reg14.w = (vs_pica.f[17].yyyy).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn0() {
tmp_reg10 = vs_pica.f[17].xxxy;
tmp_reg10.xyz = (vs_in_reg0).xyz;
if (vs_pica.b[4]) {
tmp_reg5.xyz = (vs_in_reg1).xyz;
}
if (vs_pica.b[3]) {
Vfn2();
}
if (vs_pica.b[2]) {
Vfn7();
}
if (vs_pica.b[1]) {
Vfn10();
}
tmp_reg8.x = dot_s(vs_pica.f[8], tmp_reg10);
tmp_reg8.y = dot_s(vs_pica.f[9], tmp_reg10);
tmp_reg8.z = dot_s(vs_pica.f[10], tmp_reg10);
tmp_reg8.w = (vs_pica.f[17].yyyy).w;
if (vs_pica.b[4]) {
tmp_reg4.x = dot_3(vs_pica.f[8].xyz, tmp_reg5.xyz);
tmp_reg4.y = dot_3(vs_pica.f[9].xyz, tmp_reg5.xyz);
tmp_reg4.z = dot_3(vs_pica.f[10].xyz, tmp_reg5.xyz);
}
tmp_reg12.x = dot_s(vs_pica.f[4], tmp_reg8);
tmp_reg12.y = dot_s(vs_pica.f[5], tmp_reg8);
tmp_reg12.z = dot_s(vs_pica.f[6], tmp_reg8);
tmp_reg12.w = (vs_pica.f[17].yyyy).w;
if (vs_pica.b[4]) {
tmp_reg0.x = dot_3(vs_pica.f[4].xyz, tmp_reg4.xyz);
tmp_reg0.y = dot_3(vs_pica.f[5].xyz, tmp_reg4.xyz);
tmp_reg0.z = dot_3(vs_pica.f[6].xyz, tmp_reg4.xyz);
tmp_reg3.x = dot_s(tmp_reg0.xyzz, tmp_reg0.xyzz);
tmp_reg3.x = rsq_s(tmp_reg3.x);
tmp_reg3.xyz = (mul_s(tmp_reg0.xyzz, tmp_reg3.xxxx)).xyz;
}
tmp_reg10.x = dot_s(vs_pica.f[0], tmp_reg12);
tmp_reg10.y = dot_s(vs_pica.f[1], tmp_reg12);
tmp_reg10.w = dot_s(vs_pica.f[3], tmp_reg12);
tmp_reg10.z = dot_s(vs_pica.f[2], tmp_reg12);
vs_out_reg0 = tmp_reg10;
if (vs_pica.b[4]) {
Vfn15();
} else {
vs_out_reg1 = vs_pica.f[17].yxxx;
}
vs_out_reg2 = -tmp_reg12;
vs_out_reg3 = vs_in_reg5;
vs_out_reg4 = vs_in_reg6;
vs_out_reg5 = vs_in_reg7;
vs_out_reg6 = vs_in_reg8;
return true;
}
bool Vfn15() {
tmp_reg0 = vs_pica.f[17].yyyy + tmp_reg3.zzzz;
tmp_reg0 = mul_s(vs_pica.f[18].xxxx, tmp_reg0);
bool_regs = greaterThanEqual(vs_pica.f[17].xx, tmp_reg0.xx);
tmp_reg0 = vec4(rsq_s(tmp_reg0.x));
tmp_reg1 = mul_s(vs_pica.f[18].xxxx, tmp_reg3.xyzz);
if (!bool_regs.x) {
vs_out_reg1.z = rcp_s(tmp_reg0.x);
vs_out_reg1.xy = (mul_s(tmp_reg1, tmp_reg0)).xy;
} else {
vs_out_reg1.xyz = (vs_pica.f[17].yxxx).xyz;
}
vs_out_reg1.w = (vs_pica.f[17].xxxx).w;
return false;
}
// shader: 8B30, 0FE372F5F1EA3129
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (const_color[0].rgb);
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
// shader: 8B31, E62C707F13B04DE6

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
vec4 vtx_color = vec4(vs_out_reg6.x,vs_out_reg6.y,vs_out_reg6.z,vs_out_reg6.w);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg3.x,vs_out_reg3.y,1,1);
texcoord12 = vec4(vs_out_reg4.x,vs_out_reg4.y,vs_out_reg5.x,vs_out_reg5.y);
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
bool Vfn20();
bool Vfn22();
bool Vfn4();
bool Vfn2();
bool Vfn7();
bool Vfn10();
bool Vfn0();
bool Vfn16();
vec4 tmp_reg0;
vec4 tmp_reg1;
vec4 tmp_reg2;
vec4 tmp_reg3;
vec4 tmp_reg4;
vec4 tmp_reg5;
vec4 tmp_reg6;
vec4 tmp_reg7;
vec4 tmp_reg8;
vec4 tmp_reg10;
vec4 tmp_reg12;
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
tmp_reg10 = vec4(0, 0, 0, 1);
tmp_reg12 = vec4(0, 0, 0, 1);
tmp_reg14 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn20() {
bool_regs = equal(vs_pica.f[17].yz, tmp_reg0.xy);
if (all(not(bool_regs))) {
tmp_reg0.xy = (vs_in_reg5.xyyy).xy;
} else {
Vfn22();
}
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
return false;
}
bool Vfn22() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
tmp_reg0.xy = (vs_in_reg6.xyyy).xy;
} else {
tmp_reg0.xy = (vs_in_reg7.xyyy).xy;
}
return false;
}
bool Vfn4() {
addr_regs.x = (ivec2(tmp_reg14.xx)).x;
if (vs_pica.b[4]) {
tmp_reg0.x = dot_3(vs_pica.f[19 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg0.y = dot_3(vs_pica.f[20 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg0.z = dot_3(vs_pica.f[21 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg6.xyz = (fma_s(tmp_reg14.wwww, tmp_reg0.xyzz, tmp_reg6.xyzz)).xyz;
}
tmp_reg0.x = dot_s(vs_pica.f[19 + addr_regs.x], tmp_reg10);
tmp_reg0.y = dot_s(vs_pica.f[20 + addr_regs.x], tmp_reg10);
tmp_reg0.z = dot_s(vs_pica.f[21 + addr_regs.x], tmp_reg10);
tmp_reg7.xyz = (fma_s(tmp_reg14.wwww, tmp_reg0.xyzz, tmp_reg7.xyzz)).xyz;
return false;
}
bool Vfn2() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.xxxx)).x;
tmp_reg14.w = (vs_in_reg4.xxxx).w;
Vfn4();
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.yyyy)).x;
tmp_reg14.w = (vs_in_reg4.yyyy).w;
Vfn4();
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.zzzz)).x;
tmp_reg14.w = (vs_in_reg4.zzzz).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn7() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.xxxx)).x;
tmp_reg14.w = (vs_pica.f[17].yyyy).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn10() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (vs_pica.f[17].xxxx).x;
tmp_reg14.w = (vs_pica.f[17].yyyy).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn0() {
tmp_reg10 = vs_pica.f[17].xxxy;
tmp_reg10.xyz = (vs_in_reg0).xyz;
if (vs_pica.b[4]) {
tmp_reg5.xyz = (vs_in_reg1).xyz;
}
if (vs_pica.b[3]) {
Vfn2();
}
if (vs_pica.b[2]) {
Vfn7();
}
if (vs_pica.b[1]) {
Vfn10();
}
tmp_reg8.x = dot_s(vs_pica.f[8], tmp_reg10);
tmp_reg8.y = dot_s(vs_pica.f[9], tmp_reg10);
tmp_reg8.z = dot_s(vs_pica.f[10], tmp_reg10);
tmp_reg8.w = (vs_pica.f[17].yyyy).w;
if (vs_pica.b[4]) {
tmp_reg4.x = dot_3(vs_pica.f[8].xyz, tmp_reg5.xyz);
tmp_reg4.y = dot_3(vs_pica.f[9].xyz, tmp_reg5.xyz);
tmp_reg4.z = dot_3(vs_pica.f[10].xyz, tmp_reg5.xyz);
}
tmp_reg12.x = dot_s(vs_pica.f[4], tmp_reg8);
tmp_reg12.y = dot_s(vs_pica.f[5], tmp_reg8);
tmp_reg12.z = dot_s(vs_pica.f[6], tmp_reg8);
tmp_reg12.w = (vs_pica.f[17].yyyy).w;
if (vs_pica.b[4]) {
tmp_reg0.x = dot_3(vs_pica.f[4].xyz, tmp_reg4.xyz);
tmp_reg0.y = dot_3(vs_pica.f[5].xyz, tmp_reg4.xyz);
tmp_reg0.z = dot_3(vs_pica.f[6].xyz, tmp_reg4.xyz);
tmp_reg3.x = dot_s(tmp_reg0.xyzz, tmp_reg0.xyzz);
tmp_reg3.x = rsq_s(tmp_reg3.x);
tmp_reg3.xyz = (mul_s(tmp_reg0.xyzz, tmp_reg3.xxxx)).xyz;
}
tmp_reg10.x = dot_s(vs_pica.f[0], tmp_reg12);
tmp_reg10.y = dot_s(vs_pica.f[1], tmp_reg12);
tmp_reg10.w = dot_s(vs_pica.f[3], tmp_reg12);
if (vs_pica.b[10]) {
tmp_reg12.z = (-vs_pica.f[80].wwww + tmp_reg12.zzzz).z;
}
tmp_reg10.z = dot_s(vs_pica.f[2], tmp_reg12);
vs_out_reg0 = tmp_reg10;
if (vs_pica.b[4]) {
Vfn16();
} else {
vs_out_reg1 = vs_pica.f[17].yxxx;
}
vs_out_reg2 = -tmp_reg12;
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
tmp_reg0.xy = (vs_pica.f[95].xxxx).xy;
Vfn20();
if (vs_pica.b[8]) {
tmp_reg2.x = dot_s(vs_pica.f[13], tmp_reg0);
tmp_reg2.y = dot_s(vs_pica.f[14], tmp_reg0);
tmp_reg0.xy = (tmp_reg2.xyyy).xy;
}
tmp_reg2.zw = (vs_pica.f[17].xxxx).zw;
tmp_reg2.y = (vs_pica.f[17].yyyy).y;
tmp_reg2.y = (tmp_reg2.yyyy + -tmp_reg0.yyyy).y;
tmp_reg2.x = (tmp_reg0.xxxx).x;
vs_out_reg3 = tmp_reg2;
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
tmp_reg0.xy = (vs_pica.f[95].yyyy).xy;
Vfn20();
if (vs_pica.b[9]) {
tmp_reg2.x = dot_s(vs_pica.f[15], tmp_reg0);
tmp_reg2.y = dot_s(vs_pica.f[16], tmp_reg0);
tmp_reg0.xy = (tmp_reg2.xyyy).xy;
}
tmp_reg2.zw = (vs_pica.f[17].xxxx).zw;
tmp_reg2.y = (vs_pica.f[17].yyyy).y;
tmp_reg2.y = (tmp_reg2.yyyy + -tmp_reg0.yyyy).y;
tmp_reg2.x = (tmp_reg0.xxxx).x;
vs_out_reg4 = tmp_reg2;
tmp_reg0.xy = (vs_pica.f[95].zzzz).xy;
Vfn20();
tmp_reg2.zw = (vs_pica.f[17].xxxx).zw;
tmp_reg2.y = (vs_pica.f[17].yyyy).y;
tmp_reg2.y = (tmp_reg2.yyyy + -tmp_reg0.yyyy).y;
tmp_reg2.x = (tmp_reg0.xxxx).x;
vs_out_reg5 = tmp_reg2;
vs_out_reg6 = vs_in_reg8;
return true;
}
bool Vfn16() {
tmp_reg0 = vs_pica.f[17].yyyy + tmp_reg3.zzzz;
tmp_reg0 = mul_s(vs_pica.f[18].xxxx, tmp_reg0);
bool_regs = greaterThanEqual(vs_pica.f[17].xx, tmp_reg0.xx);
tmp_reg0 = vec4(rsq_s(tmp_reg0.x));
tmp_reg1 = mul_s(vs_pica.f[18].xxxx, tmp_reg3.xyzz);
if (!bool_regs.x) {
vs_out_reg1.z = rcp_s(tmp_reg0.x);
vs_out_reg1.xy = (mul_s(tmp_reg1, tmp_reg0)).xy;
} else {
vs_out_reg1.xyz = (vs_pica.f[17].yxxx).xyz;
}
vs_out_reg1.w = (vs_pica.f[17].xxxx).w;
return false;
}
// shader: 8B30, 4B82343244FAB9C2
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (const_color[0].rrr), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp(mix((texcolor0.a), (texcolor0.r), (const_color[0].a)), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp(fma((const_color[1].rgb), (texcolor0.rgb), (rounded_primary_color.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) * (rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_2 = ByteRound(clamp(fma((rounded_primary_color.rgb), (texcolor0.rgb), (const_color[2].rgb)), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((combiner_buffer.a) - (1.0 - rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp(mix((combiner_buffer.rgb), (last_tev_out.rgb), (const_color[3].rrr)), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp(mix((combiner_buffer.a), (last_tev_out.a), (const_color[3].g)), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_4 = ByteRound(clamp((last_tev_out.rgb) * (const_color[4].aaa), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4 * 1.0, alpha_output_4 * 4.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_5 = (last_tev_out.rgb);
float alpha_output_5 = ByteRound(clamp(mix((combiner_buffer.a), (last_tev_out.a), (const_color[5].b)), 0.0, 1.0));
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
// shader: 8B31, F9ADB0C19269B3BD

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
vec4 tmp_reg0;
vec4 tmp_reg1;
vec4 tmp_reg2;
vec4 tmp_reg3;
bool ExecVS() {
tmp_reg0 = vec4(0, 0, 0, 1);
tmp_reg1 = vec4(0, 0, 0, 1);
tmp_reg2 = vec4(0, 0, 0, 1);
tmp_reg3 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn0() {
tmp_reg0 = vs_in_reg0;
tmp_reg0.zw = (vs_pica.f[93].xyyy).zw;
tmp_reg1.x = dot_s(vs_pica.f[25], tmp_reg0);
tmp_reg1.y = dot_s(vs_pica.f[26], tmp_reg0);
tmp_reg2.y = (vs_pica.f[93].yyyy + tmp_reg1.yyyy).y;
tmp_reg2.y = (mul_s(vs_pica.f[94].xxxx, tmp_reg2.yyyy)).y;
tmp_reg2.y = (vs_pica.f[93].yyyy + -tmp_reg2.yyyy).y;
tmp_reg2.y = (mul_s(vs_pica.f[93].zzzz, tmp_reg2.yyyy)).y;
tmp_reg1.y = (-vs_pica.f[93].yyyy + tmp_reg2.yyyy).y;
vs_out_reg0.xy = (tmp_reg1.yxxx).xy;
vs_out_reg0.z = (vs_pica.f[93].xxxx).z;
vs_out_reg0.w = (vs_pica.f[93].yyyy).w;
tmp_reg0 = vs_pica.f[93].xxyx;
tmp_reg0.xy = (-vs_pica.f[17].xyyy + vs_in_reg2.xyyy).xy;
tmp_reg3.x = dot_s(vs_pica.f[13], tmp_reg0);
tmp_reg3.y = dot_s(vs_pica.f[14], tmp_reg0);
tmp_reg0.xy = (vs_pica.f[17].xyyy + tmp_reg3.xyyy).xy;
tmp_reg0.y = (vs_pica.f[93].yyyy + -tmp_reg0.yyyy).y;
vs_out_reg2 = tmp_reg0;
tmp_reg0 = vs_pica.f[93].xxyx;
tmp_reg0.xy = (-vs_pica.f[18].xyyy + vs_in_reg2.xyyy).xy;
tmp_reg3.x = dot_s(vs_pica.f[15], tmp_reg0);
tmp_reg3.y = dot_s(vs_pica.f[16], tmp_reg0);
tmp_reg0.xy = (vs_pica.f[18].xyyy + tmp_reg3.xyyy).xy;
tmp_reg0.y = (vs_pica.f[93].yyyy + -tmp_reg0.yyyy).y;
vs_out_reg3 = tmp_reg0;
tmp_reg0 = vs_pica.f[93].xxxx;
tmp_reg0 = vs_in_reg2;
tmp_reg0.y = (vs_pica.f[93].yyyy + -tmp_reg0.yyyy).y;
vs_out_reg4 = tmp_reg0;
vs_out_reg1 = vs_in_reg1;
return true;
}
// shader: 8B30, 70AE4B7A3F1B9652
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (const_color[0].rgb), vec3(0), vec3(1)));
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((texcolor1.rgb) * (const_color[1].rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1 * 2.0, alpha_output_1 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp(min((last_tev_out.rgb) + (combiner_buffer.rgb), vec3(1)) * (const_color[2].rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp(mix((const_color[3].rgb), (last_tev_out.rgb), (const_color[3].aaa)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B31, 823D3653C2054195

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
vec4 tmp_reg2;
bool ExecVS() {
tmp_reg0 = vec4(0, 0, 0, 1);
tmp_reg1 = vec4(0, 0, 0, 1);
tmp_reg2 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn0() {
tmp_reg0.xy = (vs_in_reg0.xyyy).xy;
tmp_reg0.zw = (vs_pica.f[93].xyyy).zw;
tmp_reg1.x = dot_s(vs_pica.f[25], tmp_reg0);
tmp_reg1.y = dot_s(vs_pica.f[26], tmp_reg0);
tmp_reg2.y = (vs_pica.f[93].yyyy + tmp_reg1.yyyy).y;
tmp_reg2.y = (mul_s(vs_pica.f[94].xxxx, tmp_reg2.yyyy)).y;
tmp_reg2.y = (vs_pica.f[93].yyyy + -tmp_reg2.yyyy).y;
tmp_reg2.y = (mul_s(vs_pica.f[93].zzzz, tmp_reg2.yyyy)).y;
tmp_reg1.y = (-vs_pica.f[93].yyyy + tmp_reg2.yyyy).y;
tmp_reg2.x = (vs_pica.f[27].wwww).x;
tmp_reg2.x = (mul_s(vs_pica.f[29].xxxx, tmp_reg2.xxxx)).x;
tmp_reg1.y = (tmp_reg1.yyyy + tmp_reg2.xxxx).y;
vs_out_reg0.xy = (-tmp_reg1.yxxx).xy;
vs_out_reg0.z = (vs_pica.f[93].xxxx).z;
vs_out_reg0.w = (vs_pica.f[93].yyyy).w;
tmp_reg0 = vs_in_reg2;
tmp_reg0.y = (vs_pica.f[93].yyyy + -tmp_reg0.yyyy).y;
vs_out_reg2 = tmp_reg0;
vs_out_reg1 = vs_in_reg1;
return true;
}
// shader: 8B30, 0364793A00B22D93
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 4.0, alpha_output_0 * 4.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (const_color[1].rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) * (const_color[1].a), 0.0, 1.0));
last_tev_out = vec4(color_output_1 * 4.0, alpha_output_1 * 4.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_2 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((last_tev_out.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((last_tev_out.rgb), (combiner_buffer.rgb), (const_color[4].rrr)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(mix((last_tev_out.a), (combiner_buffer.a), (const_color[4].r)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 59689B012E1AC71F
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
last_tev_out = vec4(color_output_0 * 4.0, alpha_output_0 * 4.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (const_color[1].rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) * (const_color[1].a), 0.0, 1.0));
last_tev_out = vec4(color_output_1 * 4.0, alpha_output_1 * 4.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_2 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((last_tev_out.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((last_tev_out.rgb), (combiner_buffer.rgb), (const_color[4].rrr)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(mix((last_tev_out.a), (combiner_buffer.a), (const_color[4].r)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 402E3AE82D7FE444
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
clamp_highlights = sign(dot_product);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(min((primary_fragment_color.rgb) + (secondary_fragment_color.rgb), vec3(1)) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor0.r) + (const_color[0].a) - 0.5, 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((texcolor0.rgb), (rounded_primary_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1 * 4.0, alpha_output_1 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (const_color[2].rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp(mix((combiner_buffer.rgb), (last_tev_out.rgb), (rounded_primary_color.aaa)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp((last_tev_out.rgb) * (const_color[4].aaa), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp((last_tev_out.a) * (const_color[4].a), 0.0, 1.0));
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
// shader: 8B30, 95FCECB5AEB3905A
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
clamp_highlights = sign(dot_product);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(min((primary_fragment_color.rgb) + (secondary_fragment_color.rgb), vec3(1)) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((texcolor0.rgb), (rounded_primary_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1 * 4.0, alpha_output_1 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (const_color[2].aaa), vec3(0), vec3(1)));
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
// reference: 1E646B063C77C34D, 2EF16290DD3DB53B
// reference: 6B331844017B5076, F307BCFA7453E50A
// reference: BB892C57D7D14192, 693DABDA141DA5AC
// reference: 8BEF26775F8778F6, CB77F388701D396A
// reference: 9DB543486EE09131, BA60DB7E186A4670
// reference: 6233D1E48604608E, 172E7832C0B08E5D
// reference: F257804950C7EDE1, 0E7A2E37D8979F58
// reference: CCADC88197452F18, 8E1CCD22366E5576
// reference: 02BCAC14A2D0ED14, A6717E98DA4EA68F
// reference: AA987206E336CF90, FF64A8F0F48D959F
// reference: 665FB426A02FCD2D, F778FF933632034B
// reference: 90A7EDE743F778C0, 1963ED80E2147851
// reference: 00124F4E13CE251E, 0FE372F5F1EA3129
// reference: EA7A167F9D168E19, E62C707F13B04DE6
// reference: E915EE20B5822CFC, 4B82343244FAB9C2
// reference: D800F8027FF23EF3, F9ADB0C19269B3BD
// reference: 67BE75CEBD288D41, 70AE4B7A3F1B9652
// reference: 80B10664DD1504F3, 823D3653C2054195
// reference: 668C45B6F941FD8F, 0364793A00B22D93
// reference: 5F3015EAF941FD8F, 59689B012E1AC71F
// reference: 66CA444E017B5076, 402E3AE82D7FE444
// reference: 86167A7D5F8778F6, 95FCECB5AEB3905A
// program: 2EF16290DD3DB53B, 0000000000000000, F307BCFA7453E50A
// program: 693DABDA141DA5AC, 0000000000000000, CB77F388701D396A
// program: BA60DB7E186A4670, 0000000000000000, 172E7832C0B08E5D
// program: BA60DB7E186A4670, 0000000000000000, 0E7A2E37D8979F58
// program: 8E1CCD22366E5576, 0000000000000000, A6717E98DA4EA68F
// program: FF64A8F0F48D959F, 0000000000000000, F778FF933632034B
// program: 1963ED80E2147851, 0000000000000000, 0FE372F5F1EA3129
// program: E62C707F13B04DE6, 0000000000000000, 4B82343244FAB9C2
// program: F9ADB0C19269B3BD, 0000000000000000, 70AE4B7A3F1B9652
// program: 823D3653C2054195, 0000000000000000, 0364793A00B22D93
// program: 823D3653C2054195, 0000000000000000, 59689B012E1AC71F
// program: 2EF16290DD3DB53B, 0000000000000000, 402E3AE82D7FE444
// program: 693DABDA141DA5AC, 0000000000000000, 95FCECB5AEB3905A
// reference: 3FF28779165871B6, 59689B012E1AC71F
// shader: 8B31, 6AD8A4D61F7D7BDB

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
vec4 vtx_color = vec4(vs_out_reg6.x,vs_out_reg6.y,vs_out_reg6.z,vs_out_reg6.w);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg3.x,vs_out_reg3.y,1,1);
texcoord12 = vec4(vs_out_reg4.x,vs_out_reg4.y,vs_out_reg5.x,vs_out_reg5.y);
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
bool Vfn19();
bool Vfn21();
bool Vfn4();
bool Vfn2();
bool Vfn7();
bool Vfn10();
bool Vfn0();
bool Vfn15();
bool Vfn24();
bool Vfn26();
bool Vfn27();
vec4 tmp_reg0;
vec4 tmp_reg1;
vec4 tmp_reg2;
vec4 tmp_reg3;
vec4 tmp_reg4;
vec4 tmp_reg5;
vec4 tmp_reg6;
vec4 tmp_reg7;
vec4 tmp_reg8;
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
tmp_reg10 = vec4(0, 0, 0, 1);
tmp_reg11 = vec4(0, 0, 0, 1);
tmp_reg12 = vec4(0, 0, 0, 1);
tmp_reg13 = vec4(0, 0, 0, 1);
tmp_reg14 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn19() {
bool_regs = equal(vs_pica.f[17].yz, tmp_reg0.xy);
if (all(not(bool_regs))) {
tmp_reg0.xy = (vs_in_reg5.xyyy).xy;
} else {
Vfn21();
}
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
return false;
}
bool Vfn21() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
tmp_reg0.xy = (vs_in_reg6.xyyy).xy;
} else {
tmp_reg0.xy = (vs_in_reg7.xyyy).xy;
}
return false;
}
bool Vfn4() {
addr_regs.x = (ivec2(tmp_reg14.xx)).x;
if (vs_pica.b[4]) {
tmp_reg0.x = dot_3(vs_pica.f[19 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg0.y = dot_3(vs_pica.f[20 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg0.z = dot_3(vs_pica.f[21 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg6.xyz = (fma_s(tmp_reg14.wwww, tmp_reg0.xyzz, tmp_reg6.xyzz)).xyz;
}
tmp_reg0.x = dot_s(vs_pica.f[19 + addr_regs.x], tmp_reg10);
tmp_reg0.y = dot_s(vs_pica.f[20 + addr_regs.x], tmp_reg10);
tmp_reg0.z = dot_s(vs_pica.f[21 + addr_regs.x], tmp_reg10);
tmp_reg7.xyz = (fma_s(tmp_reg14.wwww, tmp_reg0.xyzz, tmp_reg7.xyzz)).xyz;
return false;
}
bool Vfn2() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.xxxx)).x;
tmp_reg14.w = (vs_in_reg4.xxxx).w;
Vfn4();
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.yyyy)).x;
tmp_reg14.w = (vs_in_reg4.yyyy).w;
Vfn4();
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.zzzz)).x;
tmp_reg14.w = (vs_in_reg4.zzzz).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn7() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.xxxx)).x;
tmp_reg14.w = (vs_pica.f[17].yyyy).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn10() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (vs_pica.f[17].xxxx).x;
tmp_reg14.w = (vs_pica.f[17].yyyy).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn0() {
tmp_reg10 = vs_pica.f[17].xxxy;
tmp_reg10.xyz = (vs_in_reg0).xyz;
if (vs_pica.b[4]) {
tmp_reg5.xyz = (vs_in_reg1).xyz;
}
if (vs_pica.b[3]) {
Vfn2();
}
if (vs_pica.b[2]) {
Vfn7();
}
if (vs_pica.b[1]) {
Vfn10();
}
tmp_reg8.x = dot_s(vs_pica.f[8], tmp_reg10);
tmp_reg8.y = dot_s(vs_pica.f[9], tmp_reg10);
tmp_reg8.z = dot_s(vs_pica.f[10], tmp_reg10);
tmp_reg8.w = (vs_pica.f[17].yyyy).w;
if (vs_pica.b[4]) {
tmp_reg4.x = dot_3(vs_pica.f[8].xyz, tmp_reg5.xyz);
tmp_reg4.y = dot_3(vs_pica.f[9].xyz, tmp_reg5.xyz);
tmp_reg4.z = dot_3(vs_pica.f[10].xyz, tmp_reg5.xyz);
}
tmp_reg12.x = dot_s(vs_pica.f[4], tmp_reg8);
tmp_reg12.y = dot_s(vs_pica.f[5], tmp_reg8);
tmp_reg12.z = dot_s(vs_pica.f[6], tmp_reg8);
tmp_reg12.w = (vs_pica.f[17].yyyy).w;
if (vs_pica.b[4]) {
tmp_reg0.x = dot_3(vs_pica.f[4].xyz, tmp_reg4.xyz);
tmp_reg0.y = dot_3(vs_pica.f[5].xyz, tmp_reg4.xyz);
tmp_reg0.z = dot_3(vs_pica.f[6].xyz, tmp_reg4.xyz);
tmp_reg3.x = dot_s(tmp_reg0.xyzz, tmp_reg0.xyzz);
tmp_reg3.x = rsq_s(tmp_reg3.x);
tmp_reg3.xyz = (mul_s(tmp_reg0.xyzz, tmp_reg3.xxxx)).xyz;
}
tmp_reg10.x = dot_s(vs_pica.f[0], tmp_reg12);
tmp_reg10.y = dot_s(vs_pica.f[1], tmp_reg12);
tmp_reg10.w = dot_s(vs_pica.f[3], tmp_reg12);
tmp_reg10.z = dot_s(vs_pica.f[2], tmp_reg12);
vs_out_reg0 = tmp_reg10;
if (vs_pica.b[4]) {
Vfn15();
} else {
vs_out_reg1 = vs_pica.f[17].yxxx;
}
vs_out_reg2 = -tmp_reg12;
tmp_reg0 = tmp_reg3.xyzz;
tmp_reg1.xy = (mul_s(vs_pica.f[18].xxxx, tmp_reg0.xyyy)).xy;
tmp_reg11.xy = (vs_pica.f[18].xxxx + tmp_reg1.xyyy).xy;
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
tmp_reg0.xy = (vs_pica.f[95].xxxx).xy;
Vfn19();
tmp_reg2.zw = (vs_pica.f[17].xxxx).zw;
tmp_reg2.y = (vs_pica.f[17].yyyy).y;
tmp_reg2.y = (tmp_reg2.yyyy + -tmp_reg0.yyyy).y;
tmp_reg2.x = (tmp_reg0.xxxx).x;
vs_out_reg3 = tmp_reg2;
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
tmp_reg0.xy = (vs_pica.f[95].yyyy).xy;
Vfn19();
tmp_reg2.zw = (vs_pica.f[17].xxxx).zw;
tmp_reg2.y = (vs_pica.f[17].yyyy).y;
tmp_reg2.y = (tmp_reg2.yyyy + -tmp_reg0.yyyy).y;
tmp_reg2.x = (tmp_reg0.xxxx).x;
vs_out_reg4 = tmp_reg2;
tmp_reg0.xy = (tmp_reg11.xyyy).xy;
tmp_reg2.zw = (vs_pica.f[17].xxxx).zw;
tmp_reg2.y = (vs_pica.f[17].yyyy).y;
tmp_reg2.y = (tmp_reg2.yyyy + -tmp_reg0.yyyy).y;
tmp_reg2.x = (tmp_reg0.xxxx).x;
vs_out_reg5 = tmp_reg2;
if (vs_pica.b[11]) {
Vfn24();
} else {
tmp_reg11.xyz = (vs_pica.f[17].yyyy).xyz;
}
tmp_reg11.w = (vs_pica.f[17].xxxx).w;
vs_out_reg6 = tmp_reg11;
return true;
}
bool Vfn15() {
tmp_reg0 = vs_pica.f[17].yyyy + tmp_reg3.zzzz;
tmp_reg0 = mul_s(vs_pica.f[18].xxxx, tmp_reg0);
bool_regs = greaterThanEqual(vs_pica.f[17].xx, tmp_reg0.xx);
tmp_reg0 = vec4(rsq_s(tmp_reg0.x));
tmp_reg1 = mul_s(vs_pica.f[18].xxxx, tmp_reg3.xyzz);
if (!bool_regs.x) {
vs_out_reg1.z = rcp_s(tmp_reg0.x);
vs_out_reg1.xy = (mul_s(tmp_reg1, tmp_reg0)).xy;
} else {
vs_out_reg1.xyz = (vs_pica.f[17].yxxx).xyz;
}
vs_out_reg1.w = (vs_pica.f[17].xxxx).w;
return false;
}
bool Vfn24() {
tmp_reg11.xyz = (vs_pica.f[17].xxxy).xyz;
if (vs_pica.b[6]) {
tmp_reg13.x = (max_s(vs_pica.f[17].xxxx, tmp_reg4.yyyy)).x;
tmp_reg0.xyz = (mul_s(vs_pica.f[93].xyzz, tmp_reg13.xxxx)).xyz;
tmp_reg11.xyz = (tmp_reg11.xyzz + tmp_reg0.xyzz).xyz;
tmp_reg13 = max_s(vs_pica.f[17].xxxy, tmp_reg11.xyzz);
tmp_reg11.xyz = (min_s(vs_pica.f[17].yyyy, tmp_reg13.xyzz)).xyz;
tmp_reg13.x = (max_s(vs_pica.f[17].xxxx, -tmp_reg4.yyyy)).x;
tmp_reg0.xyz = (mul_s(vs_pica.f[94].xyzz, tmp_reg13.xxxx)).xyz;
tmp_reg11.xyz = (tmp_reg11.xyzz + tmp_reg0.xyzz).xyz;
tmp_reg13 = max_s(vs_pica.f[17].xxxy, tmp_reg11.xyzz);
tmp_reg11.xyz = (min_s(vs_pica.f[17].yyyy, tmp_reg13.xyzz)).xyz;
}
if (vs_pica.b[5]) {
Vfn26();
}
return false;
}
bool Vfn26() {
addr_regs.z = int(vs_pica.i[0].y);
for (uint i = 0u; i <= vs_pica.i[0].x; addr_regs.z += int(vs_pica.i[0].z), ++i) {
Vfn27();
}
return false;
}
bool Vfn27() {
tmp_reg14.xyz = (vs_pica.f[81 + addr_regs.z].xyzz).xyz;
tmp_reg3.x = (vs_pica.f[81 + addr_regs.z].wwww).x;
tmp_reg2.xyz = (vs_pica.f[87 + addr_regs.z].xyzz).xyz;
tmp_reg3.y = (vs_pica.f[87 + addr_regs.z].wwww).y;
tmp_reg0.xyz = (tmp_reg2.xyzz + -tmp_reg8.xyzz).xyz;
tmp_reg0.w = dot_3(tmp_reg0.xyz, tmp_reg0.xyz);
tmp_reg6.xyz = vec3(rsq_s(tmp_reg0.w));
tmp_reg0.xyz = (mul_s(tmp_reg0.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg0.w = rcp_s(tmp_reg6.x);
tmp_reg1.x = dot_3(tmp_reg4.xyz, tmp_reg0.xyz);
tmp_reg6.x = (max_s(vs_pica.f[17].xxxy, tmp_reg1.xxxx)).x;
tmp_reg1.x = (min_s(vs_pica.f[17].yyyy, tmp_reg6.xxxx)).x;
tmp_reg6.x = (tmp_reg0.wwww + -tmp_reg3.xxxx).x;
tmp_reg6.z = (tmp_reg3.yyyy + -tmp_reg3.xxxx).z;
tmp_reg6.y = rcp_s(tmp_reg6.z);
tmp_reg6.z = (mul_s(tmp_reg6.xxxx, tmp_reg6.yyyy)).z;
tmp_reg6.x = (min_s(vs_pica.f[17].yyyy, tmp_reg6.zzzz)).x;
tmp_reg6.y = (max_s(vs_pica.f[17].xxxx, tmp_reg6.xxxx)).y;
tmp_reg6.x = (vs_pica.f[17].yyyy + -tmp_reg6.yyyy).x;
tmp_reg1.x = (mul_s(tmp_reg1.xxxx, tmp_reg6.xxxx)).x;
tmp_reg6.xyz = (mul_s(vs_pica.f[80].xyzz, tmp_reg14.xyzz)).xyz;
tmp_reg5.xyz = (mul_s(tmp_reg6.xyzz, tmp_reg1.xxxx)).xyz;
tmp_reg11.xyz = (tmp_reg11.xyzz + tmp_reg5.xyzz).xyz;
tmp_reg13 = max_s(vs_pica.f[17].xxxy, tmp_reg11.xyzz);
tmp_reg11.xyz = (min_s(vs_pica.f[17].yyyy, tmp_reg13.xyzz)).xyz;
return false;
}
// shader: 8B30, B18E832568C7DF52
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
clamp_highlights = sign(dot_product);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(min((primary_fragment_color.rgb) + (secondary_fragment_color.rgb), vec3(1)) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor1.r) * (texcolor2.r), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp(fma((texcolor0.rgb), (rounded_primary_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (primary_fragment_color.a);
last_tev_out = vec4(color_output_1 * 4.0, alpha_output_1 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_2 = ByteRound(clamp(min((last_tev_out.rgb) + (combiner_buffer.aaa), vec3(1)) * (texcolor1.rrr), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((primary_fragment_color.a) * (const_color[2].a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp(min((const_color[3].rgb) + (last_tev_out.aaa), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((combiner_buffer.a) + (const_color[3].a) - 0.5, 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_4 = ByteRound(clamp(fma((vec3(1) - last_tev_out.aaa), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_5 = ByteRound(clamp(mix((last_tev_out.rgb), (const_color[5].rgb), (texcolor1.ggg)), vec3(0), vec3(1)));
float alpha_output_5 = (last_tev_out.a);
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
// shader: 8B30, A3B43260A7A36093
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
light_vector = normalize(light_src[0].position + view.xyz);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
clamp_highlights = sign(dot_product);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[4][0];
dist_value = LightingLUTUnsigned(lut_offset, clamp(light_src[0].dist_atten_scale * length(-light_src[0].position - view.xyz) + light_src[0].dist_atten_bias, 0.0, 1.0));
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * dist_value * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * dist_value * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(min((primary_fragment_color.rgb) + (secondary_fragment_color.rgb), vec3(1)) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor1.r) * (texcolor2.r), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp(fma((texcolor0.rgb), (rounded_primary_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (primary_fragment_color.a);
last_tev_out = vec4(color_output_1 * 4.0, alpha_output_1 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_2 = ByteRound(clamp(min((last_tev_out.rgb) + (combiner_buffer.aaa), vec3(1)) * (texcolor1.rrr), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((primary_fragment_color.a) * (const_color[2].a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp(min((const_color[3].rgb) + (last_tev_out.aaa), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((combiner_buffer.a) + (const_color[3].a) - 0.5, 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_4 = ByteRound(clamp(fma((vec3(1) - last_tev_out.aaa), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_5 = ByteRound(clamp(mix((last_tev_out.rgb), (const_color[5].rgb), (texcolor1.ggg)), vec3(0), vec3(1)));
float alpha_output_5 = (last_tev_out.a);
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
// shader: 8B30, A36A6D329F9E3004
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
light_vector = normalize(light_src[0].position + view.xyz);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
clamp_highlights = sign(dot_product);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[4][0];
dist_value = LightingLUTUnsigned(lut_offset, clamp(light_src[0].dist_atten_scale * length(-light_src[0].position - view.xyz) + light_src[0].dist_atten_bias, 0.0, 1.0));
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * dist_value * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * dist_value * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(min((primary_fragment_color.rgb) + (secondary_fragment_color.rgb), vec3(1)) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor0.r) + (const_color[0].a) - 0.5, 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((texcolor0.rgb), (rounded_primary_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1 * 4.0, alpha_output_1 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (const_color[2].rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp(mix((combiner_buffer.rgb), (last_tev_out.rgb), (rounded_primary_color.aaa)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp((last_tev_out.rgb) * (const_color[4].aaa), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp((last_tev_out.a) * (const_color[4].a), 0.0, 1.0));
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
// shader: 8B30, 92DAF8D7B69669F9
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
light_vector = normalize(light_src[0].position + view.xyz);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
clamp_highlights = sign(dot_product);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[4][0];
dist_value = LightingLUTUnsigned(lut_offset, clamp(light_src[0].dist_atten_scale * length(-light_src[0].position - view.xyz) + light_src[0].dist_atten_bias, 0.0, 1.0));
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * dist_value * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * dist_value * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(min((primary_fragment_color.rgb) + (secondary_fragment_color.rgb), vec3(1)) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((texcolor0.rgb), (rounded_primary_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1 * 4.0, alpha_output_1 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (const_color[2].aaa), vec3(0), vec3(1)));
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
// shader: 8B30, 0E16A4D11DA80151
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
light_vector = normalize(light_src[0].position + view.xyz);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
clamp_highlights = sign(dot_product);
lut_offset = lighting_lut_offset[1][2];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
refl_value.r = lut_scale_rr * lut_value;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[4][0];
dist_value = LightingLUTUnsigned(lut_offset, clamp(light_src[0].dist_atten_scale * length(-light_src[0].position - view.xyz) + light_src[0].dist_atten_bias, 0.0, 1.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * dist_value * 1.0;
specular_sum.rgb += ((light_src[0].specular_0) + (refl_value * light_src[0].specular_1)) * clamp_highlights * dist_value * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) + (const_color[0].rgb), vec3(0), vec3(1)));
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) + (const_color[1].rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(fma((primary_fragment_color.aaa), (vec3(1) - const_color[2].aaa), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) * (const_color[3].aaa), vec3(0), vec3(1)));
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
// shader: 8B30, EB6C22BCB6A68234
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (const_color[0].rrr), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp(mix((texcolor0.a), (texcolor0.r), (const_color[0].a)), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp(fma((const_color[1].rgb), (texcolor0.rgb), (rounded_primary_color.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) * (rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_2 = ByteRound(clamp(fma((rounded_primary_color.rgb), (texcolor0.rgb), (const_color[2].rgb)), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((combiner_buffer.a) - (1.0 - rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp(mix((combiner_buffer.rgb), (last_tev_out.rgb), (const_color[3].rrr)), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp(mix((combiner_buffer.a), (last_tev_out.a), (const_color[3].g)), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_4 = ByteRound(clamp((last_tev_out.rgb) * (const_color[4].aaa), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4 * 1.0, alpha_output_4 * 4.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_5 = (last_tev_out.rgb);
float alpha_output_5 = ByteRound(clamp(mix((combiner_buffer.a), (last_tev_out.a), (const_color[5].b)), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 8CA19100EF3BF93A
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
light_vector = normalize(light_src[0].position + view.xyz);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
clamp_highlights = sign(dot_product);
lut_offset = lighting_lut_offset[1][2];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
refl_value.r = lut_scale_rr * lut_value;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[4][0];
dist_value = LightingLUTUnsigned(lut_offset, clamp(light_src[0].dist_atten_scale * length(-light_src[0].position - view.xyz) + light_src[0].dist_atten_bias, 0.0, 1.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * dist_value * 1.0;
specular_sum.rgb += ((light_src[0].specular_0) + (refl_value * light_src[0].specular_1)) * clamp_highlights * dist_value * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (texcolor0.rgb);
float alpha_output_0 = ByteRound(clamp((texcolor0.a) * (rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((vec3(1) - primary_fragment_color.aaa), (vec3(1) - const_color[1].aaa), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (const_color[2].aaa), vec3(0), vec3(1)));
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
// reference: C756C17DA556C87D, 6AD8A4D61F7D7BDB
// reference: 9ABC971F1CADED12, B18E832568C7DF52
// reference: 9ABC971F7E0C097A, A3B43260A7A36093
// reference: 66CA444E63DAB41E, A36A6D329F9E3004
// reference: 86167A7D3D269C9E, 92DAF8D7B69669F9
// reference: 6233D1E4E4A584E6, 0E16A4D11DA80151
// reference: F257804932660989, 0E7A2E37D8979F58
// reference: E915EE20F47B0B7B, EB6C22BCB6A68234
// reference: 02BCAC14C071097C, 8CA19100EF3BF93A
// reference: 665FB426C28E2945, F778FF933632034B
// reference: 67BE75CEDF896929, 70AE4B7A3F1B9652
// reference: 668C45B69BE019E7, 0364793A00B22D93
// reference: 5F3015EA9BE019E7, 59689B012E1AC71F
// program: 6AD8A4D61F7D7BDB, 0000000000000000, B18E832568C7DF52
// program: 6AD8A4D61F7D7BDB, 0000000000000000, A3B43260A7A36093
// program: 2EF16290DD3DB53B, 0000000000000000, A36A6D329F9E3004
// program: 693DABDA141DA5AC, 0000000000000000, 92DAF8D7B69669F9
// program: BA60DB7E186A4670, 0000000000000000, 0E16A4D11DA80151
// program: E62C707F13B04DE6, 0000000000000000, EB6C22BCB6A68234
// program: 8E1CCD22366E5576, 0000000000000000, 8CA19100EF3BF93A
// shader: 8B30, D075F4BE6F3C9D78
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
light_vector = normalize(light_src[0].position + view.xyz);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
clamp_highlights = sign(dot_product);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[4][0];
dist_value = LightingLUTUnsigned(lut_offset, clamp(light_src[0].dist_atten_scale * length(-light_src[0].position - view.xyz) + light_src[0].dist_atten_bias, 0.0, 1.0));
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * dist_value * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * dist_value * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(min((primary_fragment_color.rgb) + (secondary_fragment_color.rgb), vec3(1)) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor1.r) * (texcolor2.r), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((texcolor0.rgb), (rounded_primary_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp(min((const_color[1].a) + (1.0 - texcolor1.b), 1.0) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1 * 4.0, alpha_output_1 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_2 = ByteRound(clamp(min((primary_fragment_color.aaa) + (const_color[2].rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp(fma((const_color[2].a), (1.0 - texcolor1.g), (texcolor1.g)), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp(min((last_tev_out.rgb) + (combiner_buffer.aaa), vec3(1)) * (texcolor1.rrr), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((last_tev_out.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_4 = ByteRound(clamp(mix((last_tev_out.rgb), (const_color[4].rgb), (texcolor1.ggg)), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp(min((const_color[4].a) + (1.0 - texcolor1.b), 1.0) * (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_5 = ByteRound(clamp((last_tev_out.rgb) * (last_tev_out.aaa), vec3(0), vec3(1)));
float alpha_output_5 = (last_tev_out.a);
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
// reference: 50B5786410F82600, D075F4BE6F3C9D78
// program: 6AD8A4D61F7D7BDB, 0000000000000000, D075F4BE6F3C9D78
// shader: 8B30, 8345F78039F0CE08
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
light_vector = normalize(light_src[0].position + view.xyz);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
clamp_highlights = sign(dot_product);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[4][0];
dist_value = LightingLUTUnsigned(lut_offset, clamp(light_src[0].dist_atten_scale * length(-light_src[0].position - view.xyz) + light_src[0].dist_atten_bias, 0.0, 1.0));
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * dist_value * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * dist_value * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(min((primary_fragment_color.rgb) + (secondary_fragment_color.rgb), vec3(1)) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (1.0 - const_color[0].r);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((texcolor0.rgb), (rounded_primary_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp(min((const_color[1].a) + (const_color[1].r), 1.0) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1 * 4.0, alpha_output_1 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (const_color[2].rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp(mix((combiner_buffer.rgb), (last_tev_out.rgb), (rounded_primary_color.aaa)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((last_tev_out.rgb), (texcolor0.rgb), (combiner_buffer.aaa)), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4 * 2.0, alpha_output_4 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((last_tev_out.rgb) * (const_color[5].aaa), vec3(0), vec3(1)));
float alpha_output_5 = (last_tev_out.a);
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
// reference: BB1CAA1FAAAD41A7, 8345F78039F0CE08
// reference: 00124F4E716FC176, 0FE372F5F1EA3129
// program: 2EF16290DD3DB53B, 0000000000000000, 8345F78039F0CE08
// shader: 8B31, 61053E51918111B4

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
vec4 vtx_color = vec4(vs_out_reg6.x,vs_out_reg6.y,vs_out_reg6.z,vs_out_reg6.w);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg3.x,vs_out_reg3.y,1,1);
texcoord12 = vec4(vs_out_reg4.x,vs_out_reg4.y,vs_out_reg5.x,vs_out_reg5.y);
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
bool Vfn19();
bool Vfn21();
bool Vfn4();
bool Vfn2();
bool Vfn7();
bool Vfn10();
bool Vfn0();
bool Vfn15();
vec4 tmp_reg0;
vec4 tmp_reg1;
vec4 tmp_reg2;
vec4 tmp_reg3;
vec4 tmp_reg4;
vec4 tmp_reg5;
vec4 tmp_reg6;
vec4 tmp_reg7;
vec4 tmp_reg8;
vec4 tmp_reg10;
vec4 tmp_reg12;
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
tmp_reg10 = vec4(0, 0, 0, 1);
tmp_reg12 = vec4(0, 0, 0, 1);
tmp_reg14 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn19() {
bool_regs = equal(vs_pica.f[17].yz, tmp_reg0.xy);
if (all(not(bool_regs))) {
tmp_reg0.xy = (vs_in_reg5.xyyy).xy;
} else {
Vfn21();
}
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
return false;
}
bool Vfn21() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
tmp_reg0.xy = (vs_in_reg6.xyyy).xy;
} else {
tmp_reg0.xy = (vs_in_reg7.xyyy).xy;
}
return false;
}
bool Vfn4() {
addr_regs.x = (ivec2(tmp_reg14.xx)).x;
if (vs_pica.b[4]) {
tmp_reg0.x = dot_3(vs_pica.f[19 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg0.y = dot_3(vs_pica.f[20 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg0.z = dot_3(vs_pica.f[21 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg6.xyz = (fma_s(tmp_reg14.wwww, tmp_reg0.xyzz, tmp_reg6.xyzz)).xyz;
}
tmp_reg0.x = dot_s(vs_pica.f[19 + addr_regs.x], tmp_reg10);
tmp_reg0.y = dot_s(vs_pica.f[20 + addr_regs.x], tmp_reg10);
tmp_reg0.z = dot_s(vs_pica.f[21 + addr_regs.x], tmp_reg10);
tmp_reg7.xyz = (fma_s(tmp_reg14.wwww, tmp_reg0.xyzz, tmp_reg7.xyzz)).xyz;
return false;
}
bool Vfn2() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.xxxx)).x;
tmp_reg14.w = (vs_in_reg4.xxxx).w;
Vfn4();
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.yyyy)).x;
tmp_reg14.w = (vs_in_reg4.yyyy).w;
Vfn4();
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.zzzz)).x;
tmp_reg14.w = (vs_in_reg4.zzzz).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn7() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.xxxx)).x;
tmp_reg14.w = (vs_pica.f[17].yyyy).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn10() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (vs_pica.f[17].xxxx).x;
tmp_reg14.w = (vs_pica.f[17].yyyy).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn0() {
tmp_reg10 = vs_pica.f[17].xxxy;
tmp_reg10.xyz = (vs_in_reg0).xyz;
if (vs_pica.b[4]) {
tmp_reg5.xyz = (vs_in_reg1).xyz;
}
if (vs_pica.b[3]) {
Vfn2();
}
if (vs_pica.b[2]) {
Vfn7();
}
if (vs_pica.b[1]) {
Vfn10();
}
tmp_reg8.x = dot_s(vs_pica.f[8], tmp_reg10);
tmp_reg8.y = dot_s(vs_pica.f[9], tmp_reg10);
tmp_reg8.z = dot_s(vs_pica.f[10], tmp_reg10);
tmp_reg8.w = (vs_pica.f[17].yyyy).w;
if (vs_pica.b[4]) {
tmp_reg4.x = dot_3(vs_pica.f[8].xyz, tmp_reg5.xyz);
tmp_reg4.y = dot_3(vs_pica.f[9].xyz, tmp_reg5.xyz);
tmp_reg4.z = dot_3(vs_pica.f[10].xyz, tmp_reg5.xyz);
}
tmp_reg12.x = dot_s(vs_pica.f[4], tmp_reg8);
tmp_reg12.y = dot_s(vs_pica.f[5], tmp_reg8);
tmp_reg12.z = dot_s(vs_pica.f[6], tmp_reg8);
tmp_reg12.w = (vs_pica.f[17].yyyy).w;
if (vs_pica.b[4]) {
tmp_reg0.x = dot_3(vs_pica.f[4].xyz, tmp_reg4.xyz);
tmp_reg0.y = dot_3(vs_pica.f[5].xyz, tmp_reg4.xyz);
tmp_reg0.z = dot_3(vs_pica.f[6].xyz, tmp_reg4.xyz);
tmp_reg3.x = dot_s(tmp_reg0.xyzz, tmp_reg0.xyzz);
tmp_reg3.x = rsq_s(tmp_reg3.x);
tmp_reg3.xyz = (mul_s(tmp_reg0.xyzz, tmp_reg3.xxxx)).xyz;
}
tmp_reg10.x = dot_s(vs_pica.f[0], tmp_reg12);
tmp_reg10.y = dot_s(vs_pica.f[1], tmp_reg12);
tmp_reg10.w = dot_s(vs_pica.f[3], tmp_reg12);
tmp_reg10.z = dot_s(vs_pica.f[2], tmp_reg12);
vs_out_reg0 = tmp_reg10;
if (vs_pica.b[4]) {
Vfn15();
} else {
vs_out_reg1 = vs_pica.f[17].yxxx;
}
vs_out_reg2 = -tmp_reg12;
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
tmp_reg0.xy = (vs_pica.f[95].xxxx).xy;
Vfn19();
if (vs_pica.b[8]) {
tmp_reg2.x = dot_s(vs_pica.f[13], tmp_reg0);
tmp_reg2.y = dot_s(vs_pica.f[14], tmp_reg0);
tmp_reg0.xy = (tmp_reg2.xyyy).xy;
}
tmp_reg2.zw = (vs_pica.f[17].xxxx).zw;
tmp_reg2.y = (vs_pica.f[17].yyyy).y;
tmp_reg2.y = (tmp_reg2.yyyy + -tmp_reg0.yyyy).y;
tmp_reg2.x = (tmp_reg0.xxxx).x;
vs_out_reg3 = tmp_reg2;
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
tmp_reg0.xy = (vs_pica.f[95].yyyy).xy;
Vfn19();
if (vs_pica.b[9]) {
tmp_reg2.x = dot_s(vs_pica.f[15], tmp_reg0);
tmp_reg2.y = dot_s(vs_pica.f[16], tmp_reg0);
tmp_reg0.xy = (tmp_reg2.xyyy).xy;
}
tmp_reg2.zw = (vs_pica.f[17].xxxx).zw;
tmp_reg2.y = (vs_pica.f[17].yyyy).y;
tmp_reg2.y = (tmp_reg2.yyyy + -tmp_reg0.yyyy).y;
tmp_reg2.x = (tmp_reg0.xxxx).x;
vs_out_reg4 = tmp_reg2;
tmp_reg0.xy = (vs_pica.f[95].zzzz).xy;
Vfn19();
tmp_reg2.zw = (vs_pica.f[17].xxxx).zw;
tmp_reg2.y = (vs_pica.f[17].yyyy).y;
tmp_reg2.y = (tmp_reg2.yyyy + -tmp_reg0.yyyy).y;
tmp_reg2.x = (tmp_reg0.xxxx).x;
vs_out_reg5 = tmp_reg2;
vs_out_reg6 = vs_in_reg8;
return true;
}
bool Vfn15() {
tmp_reg0 = vs_pica.f[17].yyyy + tmp_reg3.zzzz;
tmp_reg0 = mul_s(vs_pica.f[18].xxxx, tmp_reg0);
bool_regs = greaterThanEqual(vs_pica.f[17].xx, tmp_reg0.xx);
tmp_reg0 = vec4(rsq_s(tmp_reg0.x));
tmp_reg1 = mul_s(vs_pica.f[18].xxxx, tmp_reg3.xyzz);
if (!bool_regs.x) {
vs_out_reg1.z = rcp_s(tmp_reg0.x);
vs_out_reg1.xy = (mul_s(tmp_reg1, tmp_reg0)).xy;
} else {
vs_out_reg1.xyz = (vs_pica.f[17].yxxx).xyz;
}
vs_out_reg1.w = (vs_pica.f[17].xxxx).w;
return false;
}
// shader: 8B30, B3C35AD3A91663CD
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec4 texcolor2 = textureLod(tex2, texcoord12.zw, GetLod(texcoord12.zw * vec2(textureSize(tex2, 0))) + tex_lod_bias[2]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (const_color[0].rgb);
float alpha_output_0 = ByteRound(clamp((texcolor0.r) * (rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = (last_tev_out.rgb);
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) + (1.0 - texcolor1.r) - 0.5, 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = (last_tev_out.rgb);
float alpha_output_2 = ByteRound(clamp((last_tev_out.a) * (const_color[2].a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_3 = (last_tev_out.rgb);
float alpha_output_3 = ByteRound(clamp((rounded_primary_color.a) * (rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_4 = (last_tev_out.rgb);
float alpha_output_4 = ByteRound(clamp((last_tev_out.a) * (combiner_buffer.a), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((last_tev_out.rgb) * (const_color[5].aaa), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((last_tev_out.a) * (1.0 - texcolor2.r), 0.0, 1.0));
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
// reference: ADAE97FD70E8F5B1, 61053E51918111B4
// reference: 5C04D7B64979D8A0, B3C35AD3A91663CD
// program: 61053E51918111B4, 0000000000000000, B3C35AD3A91663CD
// shader: 8B30, DAC5249EA7315837
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (const_color[0].rrr), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp(mix((texcolor0.a), (texcolor0.r), (const_color[0].a)), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp(fma((const_color[1].rgb), (texcolor0.rgb), (rounded_primary_color.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) * (rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_2 = ByteRound(clamp(fma((rounded_primary_color.rgb), (texcolor0.rgb), (const_color[2].rgb)), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((combiner_buffer.a) - (1.0 - rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp(mix((combiner_buffer.rgb), (last_tev_out.rgb), (const_color[3].rrr)), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp(mix((combiner_buffer.a), (last_tev_out.a), (const_color[3].g)), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_4 = ByteRound(clamp((last_tev_out.rgb) * (const_color[4].aaa), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4 * 1.0, alpha_output_4 * 4.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_5 = (last_tev_out.rgb);
float alpha_output_5 = ByteRound(clamp(mix((combiner_buffer.a), (last_tev_out.a), (const_color[5].b)), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: BC6348E6F47B0B7B, DAC5249EA7315837
// program: E62C707F13B04DE6, 0000000000000000, DAC5249EA7315837
// shader: 8B30, 03B9A09621A789AC
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = ByteRound(clamp((const_color[0].rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor0.r) * (rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) + (const_color[1].rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) * (const_color[1].a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (const_color[2].aaa), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((last_tev_out.a) * (const_color[2].a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B31, 357AA7DF05DA1996

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
vec4 vtx_color = vec4(vs_out_reg6.x,vs_out_reg6.y,vs_out_reg6.z,vs_out_reg6.w);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg3.x,vs_out_reg3.y,1,1);
texcoord12 = vec4(vs_out_reg4.x,vs_out_reg4.y,vs_out_reg5.x,vs_out_reg5.y);
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
bool Vfn19();
bool Vfn21();
bool Vfn4();
bool Vfn2();
bool Vfn7();
bool Vfn10();
bool Vfn0();
bool Vfn15();
vec4 tmp_reg0;
vec4 tmp_reg1;
vec4 tmp_reg2;
vec4 tmp_reg3;
vec4 tmp_reg4;
vec4 tmp_reg5;
vec4 tmp_reg6;
vec4 tmp_reg7;
vec4 tmp_reg8;
vec4 tmp_reg10;
vec4 tmp_reg12;
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
tmp_reg10 = vec4(0, 0, 0, 1);
tmp_reg12 = vec4(0, 0, 0, 1);
tmp_reg14 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn19() {
bool_regs = equal(vs_pica.f[17].yz, tmp_reg0.xy);
if (all(not(bool_regs))) {
tmp_reg0.xy = (vs_in_reg5.xyyy).xy;
} else {
Vfn21();
}
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
return false;
}
bool Vfn21() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
tmp_reg0.xy = (vs_in_reg6.xyyy).xy;
} else {
tmp_reg0.xy = (vs_in_reg7.xyyy).xy;
}
return false;
}
bool Vfn4() {
addr_regs.x = (ivec2(tmp_reg14.xx)).x;
if (vs_pica.b[4]) {
tmp_reg0.x = dot_3(vs_pica.f[19 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg0.y = dot_3(vs_pica.f[20 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg0.z = dot_3(vs_pica.f[21 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg6.xyz = (fma_s(tmp_reg14.wwww, tmp_reg0.xyzz, tmp_reg6.xyzz)).xyz;
}
tmp_reg0.x = dot_s(vs_pica.f[19 + addr_regs.x], tmp_reg10);
tmp_reg0.y = dot_s(vs_pica.f[20 + addr_regs.x], tmp_reg10);
tmp_reg0.z = dot_s(vs_pica.f[21 + addr_regs.x], tmp_reg10);
tmp_reg7.xyz = (fma_s(tmp_reg14.wwww, tmp_reg0.xyzz, tmp_reg7.xyzz)).xyz;
return false;
}
bool Vfn2() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.xxxx)).x;
tmp_reg14.w = (vs_in_reg4.xxxx).w;
Vfn4();
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.yyyy)).x;
tmp_reg14.w = (vs_in_reg4.yyyy).w;
Vfn4();
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.zzzz)).x;
tmp_reg14.w = (vs_in_reg4.zzzz).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn7() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.xxxx)).x;
tmp_reg14.w = (vs_pica.f[17].yyyy).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn10() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (vs_pica.f[17].xxxx).x;
tmp_reg14.w = (vs_pica.f[17].yyyy).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn0() {
tmp_reg10 = vs_pica.f[17].xxxy;
tmp_reg10.xyz = (vs_in_reg0).xyz;
if (vs_pica.b[4]) {
tmp_reg5.xyz = (vs_in_reg1).xyz;
}
if (vs_pica.b[3]) {
Vfn2();
}
if (vs_pica.b[2]) {
Vfn7();
}
if (vs_pica.b[1]) {
Vfn10();
}
tmp_reg8.x = dot_s(vs_pica.f[8], tmp_reg10);
tmp_reg8.y = dot_s(vs_pica.f[9], tmp_reg10);
tmp_reg8.z = dot_s(vs_pica.f[10], tmp_reg10);
tmp_reg8.w = (vs_pica.f[17].yyyy).w;
if (vs_pica.b[4]) {
tmp_reg4.x = dot_3(vs_pica.f[8].xyz, tmp_reg5.xyz);
tmp_reg4.y = dot_3(vs_pica.f[9].xyz, tmp_reg5.xyz);
tmp_reg4.z = dot_3(vs_pica.f[10].xyz, tmp_reg5.xyz);
}
tmp_reg12.x = dot_s(vs_pica.f[4], tmp_reg8);
tmp_reg12.y = dot_s(vs_pica.f[5], tmp_reg8);
tmp_reg12.z = dot_s(vs_pica.f[6], tmp_reg8);
tmp_reg12.w = (vs_pica.f[17].yyyy).w;
if (vs_pica.b[4]) {
tmp_reg0.x = dot_3(vs_pica.f[4].xyz, tmp_reg4.xyz);
tmp_reg0.y = dot_3(vs_pica.f[5].xyz, tmp_reg4.xyz);
tmp_reg0.z = dot_3(vs_pica.f[6].xyz, tmp_reg4.xyz);
tmp_reg3.x = dot_s(tmp_reg0.xyzz, tmp_reg0.xyzz);
tmp_reg3.x = rsq_s(tmp_reg3.x);
tmp_reg3.xyz = (mul_s(tmp_reg0.xyzz, tmp_reg3.xxxx)).xyz;
}
tmp_reg10.x = dot_s(vs_pica.f[0], tmp_reg12);
tmp_reg10.y = dot_s(vs_pica.f[1], tmp_reg12);
tmp_reg10.w = dot_s(vs_pica.f[3], tmp_reg12);
tmp_reg10.z = dot_s(vs_pica.f[2], tmp_reg12);
vs_out_reg0 = tmp_reg10;
if (vs_pica.b[4]) {
Vfn15();
} else {
vs_out_reg1 = vs_pica.f[17].yxxx;
}
vs_out_reg2 = -tmp_reg12;
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
tmp_reg0.xy = (vs_pica.f[95].xxxx).xy;
Vfn19();
tmp_reg2.zw = (vs_pica.f[17].xxxx).zw;
tmp_reg2.y = (vs_pica.f[17].yyyy).y;
tmp_reg2.y = (tmp_reg2.yyyy + -tmp_reg0.yyyy).y;
tmp_reg2.x = (tmp_reg0.xxxx).x;
vs_out_reg3 = tmp_reg2;
vs_out_reg4 = vs_in_reg6;
vs_out_reg5 = vs_in_reg7;
vs_out_reg6 = vs_in_reg8;
return true;
}
bool Vfn15() {
tmp_reg0 = vs_pica.f[17].yyyy + tmp_reg3.zzzz;
tmp_reg0 = mul_s(vs_pica.f[18].xxxx, tmp_reg0);
bool_regs = greaterThanEqual(vs_pica.f[17].xx, tmp_reg0.xx);
tmp_reg0 = vec4(rsq_s(tmp_reg0.x));
tmp_reg1 = mul_s(vs_pica.f[18].xxxx, tmp_reg3.xyzz);
if (!bool_regs.x) {
vs_out_reg1.z = rcp_s(tmp_reg0.x);
vs_out_reg1.xy = (mul_s(tmp_reg1, tmp_reg0)).xy;
} else {
vs_out_reg1.xyz = (vs_pica.f[17].yxxx).xyz;
}
vs_out_reg1.w = (vs_pica.f[17].xxxx).w;
return false;
}
// shader: 8B30, 1C8FDE7D9F5B3383
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
light_vector = normalize(light_src[0].position + view.xyz);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
clamp_highlights = sign(dot_product);
lut_offset = lighting_lut_offset[1][2];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
refl_value.r = lut_scale_rr * lut_value;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[4][0];
dist_value = LightingLUTUnsigned(lut_offset, clamp(light_src[0].dist_atten_scale * length(-light_src[0].position - view.xyz) + light_src[0].dist_atten_bias, 0.0, 1.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * dist_value * 1.0;
specular_sum.rgb += ((light_src[0].specular_0) + (refl_value * light_src[0].specular_1)) * clamp_highlights * dist_value * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(fma((texcolor0.rrr), (const_color[0].rgb), (rounded_primary_color.rgb)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor0.r) * (rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp(fma((texcolor0.rgb), (rounded_primary_color.rgb), (const_color[1].rgb)), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((texcolor0.a) * (rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp(mix((last_tev_out.rgb), (combiner_buffer.rgb), (const_color[2].aaa)), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp(mix((last_tev_out.a), (combiner_buffer.a), (const_color[2].a)), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((last_tev_out.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = (last_tev_out.rgb);
float alpha_output_4 = ByteRound(clamp((last_tev_out.a) * (const_color[4].a), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 775049046DCF20A0
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
light_vector = normalize(light_src[0].position + view.xyz);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
clamp_highlights = sign(dot_product);
lut_offset = lighting_lut_offset[1][2];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
refl_value.r = lut_scale_rr * lut_value;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[4][0];
dist_value = LightingLUTUnsigned(lut_offset, clamp(light_src[0].dist_atten_scale * length(-light_src[0].position - view.xyz) + light_src[0].dist_atten_bias, 0.0, 1.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * dist_value * 1.0;
specular_sum.rgb += ((light_src[0].specular_0) + (refl_value * light_src[0].specular_1)) * clamp_highlights * dist_value * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor0.a) - (rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 1.0, alpha_output_0 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = (last_tev_out.rgb);
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) * (texcolor0.r), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 5963610510B023C4, 03B9A09621A789AC
// reference: CCADC8819FF5F85B, 357AA7DF05DA1996
// reference: 0CDFD1EE1519FEE7, 1C8FDE7D9F5B3383
// reference: 182DC689BAA88DEE, 775049046DCF20A0
// program: 61053E51918111B4, 0000000000000000, 03B9A09621A789AC
// program: 357AA7DF05DA1996, 0000000000000000, 1C8FDE7D9F5B3383
// program: 61053E51918111B4, 0000000000000000, 775049046DCF20A0
// shader: 8B30, 30F62572CDC4C850
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
light_vector = normalize(light_src[0].position + view.xyz);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
clamp_highlights = sign(dot_product);
lut_offset = lighting_lut_offset[1][2];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
refl_value.r = lut_scale_rr * lut_value;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[4][0];
dist_value = LightingLUTUnsigned(lut_offset, clamp(light_src[0].dist_atten_scale * length(-light_src[0].position - view.xyz) + light_src[0].dist_atten_bias, 0.0, 1.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * dist_value * 1.0;
specular_sum.rgb += ((light_src[0].specular_0) + (refl_value * light_src[0].specular_1)) * clamp_highlights * dist_value * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (const_color[0].rgb);
float alpha_output_0 = ByteRound(clamp((texcolor0.r) + (const_color[0].a) - 0.5, 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (const_color[1].aaa), vec3(0), vec3(1)));
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
// reference: 30CD7F5C7380DA61, 30F62572CDC4C850
// program: 61053E51918111B4, 0000000000000000, 30F62572CDC4C850
// shader: 8B30, 98B8B493B0177051
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
light_vector = normalize(light_src[0].position + view.xyz);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
clamp_highlights = sign(dot_product);
lut_offset = lighting_lut_offset[1][2];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
refl_value.r = lut_scale_rr * lut_value;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[4][0];
dist_value = LightingLUTUnsigned(lut_offset, clamp(light_src[0].dist_atten_scale * length(-light_src[0].position - view.xyz) + light_src[0].dist_atten_bias, 0.0, 1.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * dist_value * 1.0;
specular_sum.rgb += ((light_src[0].specular_0) + (refl_value * light_src[0].specular_1)) * clamp_highlights * dist_value * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(fma((texcolor0.rrr), (const_color[0].rgb), (rounded_primary_color.rgb)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor0.r) * (rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp(fma((texcolor0.rgb), (rounded_primary_color.rgb), (const_color[1].rgb)), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((texcolor0.a) * (rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp(mix((last_tev_out.rgb), (combiner_buffer.rgb), (const_color[2].aaa)), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp(mix((last_tev_out.a), (combiner_buffer.a), (const_color[2].a)), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((last_tev_out.a) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = (last_tev_out.rgb);
float alpha_output_4 = ByteRound(clamp((last_tev_out.a) * (const_color[4].a), 0.0, 1.0));
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
// reference: 0CDFD1EE36413D08, 98B8B493B0177051
// program: 357AA7DF05DA1996, 0000000000000000, 98B8B493B0177051
// shader: 8B30, 79630D43289D4333
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
light_vector = normalize(light_src[0].position + view.xyz);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
clamp_highlights = sign(dot_product);
lut_offset = lighting_lut_offset[1][2];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
refl_value.r = lut_scale_rr * lut_value;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[4][0];
dist_value = LightingLUTUnsigned(lut_offset, clamp(light_src[0].dist_atten_scale * length(-light_src[0].position - view.xyz) + light_src[0].dist_atten_bias, 0.0, 1.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * dist_value * 1.0;
specular_sum.rgb += ((light_src[0].specular_0) + (refl_value * light_src[0].specular_1)) * clamp_highlights * dist_value * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (texcolor0.rgb);
float alpha_output_0 = ByteRound(clamp((texcolor0.a) * (rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((vec3(1) - primary_fragment_color.aaa), (vec3(1) - const_color[1].aaa), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (const_color[2].aaa), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
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
// reference: 57CA0AD2C071097C, 79630D43289D4333
// program: 8E1CCD22366E5576, 0000000000000000, 79630D43289D4333
// shader: 8B31, 22D10773177E605B

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
vec4 vtx_color = vec4(vs_out_reg6.x,vs_out_reg6.y,vs_out_reg6.z,vs_out_reg6.w);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg3.x,vs_out_reg3.y,1,1);
texcoord12 = vec4(vs_out_reg4.x,vs_out_reg4.y,vs_out_reg5.x,vs_out_reg5.y);
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
bool Vfn21();
bool Vfn23();
bool Vfn4();
bool Vfn2();
bool Vfn7();
bool Vfn10();
bool Vfn0();
bool Vfn15();
bool Vfn27();
bool Vfn29();
bool Vfn31();
bool Vfn35();
vec4 tmp_reg0;
vec4 tmp_reg1;
vec4 tmp_reg2;
vec4 tmp_reg3;
vec4 tmp_reg4;
vec4 tmp_reg5;
vec4 tmp_reg6;
vec4 tmp_reg7;
vec4 tmp_reg8;
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
tmp_reg10 = vec4(0, 0, 0, 1);
tmp_reg11 = vec4(0, 0, 0, 1);
tmp_reg12 = vec4(0, 0, 0, 1);
tmp_reg13 = vec4(0, 0, 0, 1);
tmp_reg14 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn21() {
bool_regs = equal(vs_pica.f[17].yz, tmp_reg0.xy);
if (all(not(bool_regs))) {
tmp_reg0.xy = (vs_in_reg5.xyyy).xy;
} else {
Vfn23();
}
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
return false;
}
bool Vfn23() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
tmp_reg0.xy = (vs_in_reg6.xyyy).xy;
} else {
tmp_reg0.xy = (vs_in_reg7.xyyy).xy;
}
return false;
}
bool Vfn4() {
addr_regs.x = (ivec2(tmp_reg14.xx)).x;
if (vs_pica.b[4]) {
tmp_reg0.x = dot_3(vs_pica.f[19 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg0.y = dot_3(vs_pica.f[20 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg0.z = dot_3(vs_pica.f[21 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg6.xyz = (fma_s(tmp_reg14.wwww, tmp_reg0.xyzz, tmp_reg6.xyzz)).xyz;
}
tmp_reg0.x = dot_s(vs_pica.f[19 + addr_regs.x], tmp_reg10);
tmp_reg0.y = dot_s(vs_pica.f[20 + addr_regs.x], tmp_reg10);
tmp_reg0.z = dot_s(vs_pica.f[21 + addr_regs.x], tmp_reg10);
tmp_reg7.xyz = (fma_s(tmp_reg14.wwww, tmp_reg0.xyzz, tmp_reg7.xyzz)).xyz;
return false;
}
bool Vfn2() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.xxxx)).x;
tmp_reg14.w = (vs_in_reg4.xxxx).w;
Vfn4();
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.yyyy)).x;
tmp_reg14.w = (vs_in_reg4.yyyy).w;
Vfn4();
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.zzzz)).x;
tmp_reg14.w = (vs_in_reg4.zzzz).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn7() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.xxxx)).x;
tmp_reg14.w = (vs_pica.f[17].yyyy).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn10() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (vs_pica.f[17].xxxx).x;
tmp_reg14.w = (vs_pica.f[17].yyyy).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn0() {
tmp_reg10 = vs_pica.f[17].xxxy;
tmp_reg10.xyz = (vs_in_reg0).xyz;
if (vs_pica.b[4]) {
tmp_reg5.xyz = (vs_in_reg1).xyz;
}
if (vs_pica.b[3]) {
Vfn2();
}
if (vs_pica.b[2]) {
Vfn7();
}
if (vs_pica.b[1]) {
Vfn10();
}
tmp_reg8.x = dot_s(vs_pica.f[8], tmp_reg10);
tmp_reg8.y = dot_s(vs_pica.f[9], tmp_reg10);
tmp_reg8.z = dot_s(vs_pica.f[10], tmp_reg10);
tmp_reg8.w = (vs_pica.f[17].yyyy).w;
if (vs_pica.b[4]) {
tmp_reg4.x = dot_3(vs_pica.f[8].xyz, tmp_reg5.xyz);
tmp_reg4.y = dot_3(vs_pica.f[9].xyz, tmp_reg5.xyz);
tmp_reg4.z = dot_3(vs_pica.f[10].xyz, tmp_reg5.xyz);
}
tmp_reg12.x = dot_s(vs_pica.f[4], tmp_reg8);
tmp_reg12.y = dot_s(vs_pica.f[5], tmp_reg8);
tmp_reg12.z = dot_s(vs_pica.f[6], tmp_reg8);
tmp_reg12.w = (vs_pica.f[17].yyyy).w;
if (vs_pica.b[4]) {
tmp_reg0.x = dot_3(vs_pica.f[4].xyz, tmp_reg4.xyz);
tmp_reg0.y = dot_3(vs_pica.f[5].xyz, tmp_reg4.xyz);
tmp_reg0.z = dot_3(vs_pica.f[6].xyz, tmp_reg4.xyz);
tmp_reg3.x = dot_s(tmp_reg0.xyzz, tmp_reg0.xyzz);
tmp_reg3.x = rsq_s(tmp_reg3.x);
tmp_reg3.xyz = (mul_s(tmp_reg0.xyzz, tmp_reg3.xxxx)).xyz;
}
tmp_reg10.x = dot_s(vs_pica.f[0], tmp_reg12);
tmp_reg10.y = dot_s(vs_pica.f[1], tmp_reg12);
tmp_reg10.w = dot_s(vs_pica.f[3], tmp_reg12);
tmp_reg10.z = dot_s(vs_pica.f[2], tmp_reg12);
vs_out_reg0 = tmp_reg10;
if (vs_pica.b[4]) {
Vfn15();
} else {
vs_out_reg1 = vs_pica.f[17].yxxx;
}
vs_out_reg2 = -tmp_reg12;
tmp_reg0 = tmp_reg3.xyzz;
tmp_reg1.xy = (mul_s(vs_pica.f[18].xxxx, tmp_reg0.xyyy)).xy;
tmp_reg11.xy = (vs_pica.f[18].xxxx + tmp_reg1.xyyy).xy;
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
tmp_reg0.xy = (tmp_reg11.xyyy).xy;
if (vs_pica.b[8]) {
tmp_reg2.x = dot_s(vs_pica.f[13], tmp_reg0);
tmp_reg2.y = dot_s(vs_pica.f[14], tmp_reg0);
tmp_reg0.xy = (tmp_reg2.xyyy).xy;
}
tmp_reg2.zw = (vs_pica.f[17].xxxx).zw;
tmp_reg2.y = (vs_pica.f[17].yyyy).y;
tmp_reg2.y = (tmp_reg2.yyyy + -tmp_reg0.yyyy).y;
tmp_reg2.x = (tmp_reg0.xxxx).x;
vs_out_reg3 = tmp_reg2;
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
tmp_reg0.xy = (tmp_reg11.xyyy).xy;
if (vs_pica.b[9]) {
tmp_reg2.x = dot_s(vs_pica.f[15], tmp_reg0);
tmp_reg2.y = dot_s(vs_pica.f[16], tmp_reg0);
tmp_reg0.xy = (tmp_reg2.xyyy).xy;
}
tmp_reg2.zw = (vs_pica.f[17].xxxx).zw;
tmp_reg2.y = (vs_pica.f[17].yyyy).y;
tmp_reg2.y = (tmp_reg2.yyyy + -tmp_reg0.yyyy).y;
tmp_reg2.x = (tmp_reg0.xxxx).x;
vs_out_reg4 = tmp_reg2;
tmp_reg0.xy = (vs_pica.f[95].zzzz).xy;
Vfn21();
tmp_reg2.zw = (vs_pica.f[17].xxxx).zw;
tmp_reg2.y = (vs_pica.f[17].yyyy).y;
tmp_reg2.y = (tmp_reg2.yyyy + -tmp_reg0.yyyy).y;
tmp_reg2.x = (tmp_reg0.xxxx).x;
vs_out_reg5 = tmp_reg2;
if (vs_pica.b[7]) {
tmp_reg10 = vs_pica.f[17].xxyx;
}
if (vs_pica.b[11]) {
Vfn27();
} else {
tmp_reg11.xyz = (vs_pica.f[17].yyyy).xyz;
}
if (vs_pica.b[7]) {
Vfn35();
} else {
tmp_reg11.w = (vs_pica.f[17].xxxx).w;
}
vs_out_reg6 = tmp_reg11;
return true;
}
bool Vfn15() {
tmp_reg0 = vs_pica.f[17].yyyy + tmp_reg3.zzzz;
tmp_reg0 = mul_s(vs_pica.f[18].xxxx, tmp_reg0);
bool_regs = greaterThanEqual(vs_pica.f[17].xx, tmp_reg0.xx);
tmp_reg0 = vec4(rsq_s(tmp_reg0.x));
tmp_reg1 = mul_s(vs_pica.f[18].xxxx, tmp_reg3.xyzz);
if (!bool_regs.x) {
vs_out_reg1.z = rcp_s(tmp_reg0.x);
vs_out_reg1.xy = (mul_s(tmp_reg1, tmp_reg0)).xy;
} else {
vs_out_reg1.xyz = (vs_pica.f[17].yxxx).xyz;
}
vs_out_reg1.w = (vs_pica.f[17].xxxx).w;
return false;
}
bool Vfn27() {
tmp_reg11.xyz = (vs_pica.f[17].xxxy).xyz;
if (vs_pica.b[6]) {
tmp_reg13.x = (max_s(vs_pica.f[17].xxxx, tmp_reg4.yyyy)).x;
tmp_reg0.xyz = (mul_s(vs_pica.f[93].xyzz, tmp_reg13.xxxx)).xyz;
tmp_reg11.xyz = (tmp_reg11.xyzz + tmp_reg0.xyzz).xyz;
tmp_reg13 = max_s(vs_pica.f[17].xxxy, tmp_reg11.xyzz);
tmp_reg11.xyz = (min_s(vs_pica.f[17].yyyy, tmp_reg13.xyzz)).xyz;
tmp_reg13.x = (max_s(vs_pica.f[17].xxxx, -tmp_reg4.yyyy)).x;
tmp_reg0.xyz = (mul_s(vs_pica.f[94].xyzz, tmp_reg13.xxxx)).xyz;
tmp_reg11.xyz = (tmp_reg11.xyzz + tmp_reg0.xyzz).xyz;
tmp_reg13 = max_s(vs_pica.f[17].xxxy, tmp_reg11.xyzz);
tmp_reg11.xyz = (min_s(vs_pica.f[17].yyyy, tmp_reg13.xyzz)).xyz;
}
if (vs_pica.b[5]) {
Vfn29();
}
return false;
}
bool Vfn29() {
if (vs_pica.b[7]) {
tmp_reg10.x = (max_s(tmp_reg11.xxxx, tmp_reg11.yyyy)).x;
tmp_reg10.x = (max_s(tmp_reg10.xxxx, tmp_reg11.zzzz)).x;
}
addr_regs.z = int(vs_pica.i[0].y);
for (uint i = 0u; i <= vs_pica.i[0].x; addr_regs.z += int(vs_pica.i[0].z), ++i) {
Vfn31();
}
if (vs_pica.b[7]) {
tmp_reg10.y = (max_s(tmp_reg11.xxxx, tmp_reg11.yyyy)).y;
tmp_reg10.y = (max_s(tmp_reg10.yyyy, tmp_reg11.zzzz)).y;
tmp_reg10.z = (tmp_reg10.yyyy + -tmp_reg10.xxxx).z;
tmp_reg10.z = (max_s(vs_pica.f[17].xxxx, tmp_reg10.zzzz)).z;
tmp_reg10.z = (min_s(vs_pica.f[17].yyyy, tmp_reg10.zzzz)).z;
tmp_reg10.z = (vs_pica.f[17].yyyy + -tmp_reg10.zzzz).z;
}
return false;
}
bool Vfn31() {
tmp_reg14.xyz = (vs_pica.f[81 + addr_regs.z].xyzz).xyz;
tmp_reg3.x = (vs_pica.f[81 + addr_regs.z].wwww).x;
tmp_reg2.xyz = (vs_pica.f[87 + addr_regs.z].xyzz).xyz;
tmp_reg3.y = (vs_pica.f[87 + addr_regs.z].wwww).y;
tmp_reg0.xyz = (tmp_reg2.xyzz + -tmp_reg8.xyzz).xyz;
tmp_reg0.w = dot_3(tmp_reg0.xyz, tmp_reg0.xyz);
tmp_reg6.xyz = vec3(rsq_s(tmp_reg0.w));
tmp_reg0.xyz = (mul_s(tmp_reg0.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg0.w = rcp_s(tmp_reg6.x);
tmp_reg1.x = dot_3(tmp_reg4.xyz, tmp_reg0.xyz);
tmp_reg6.x = (max_s(vs_pica.f[17].xxxy, tmp_reg1.xxxx)).x;
tmp_reg1.x = (min_s(vs_pica.f[17].yyyy, tmp_reg6.xxxx)).x;
tmp_reg6.x = (tmp_reg0.wwww + -tmp_reg3.xxxx).x;
tmp_reg6.z = (tmp_reg3.yyyy + -tmp_reg3.xxxx).z;
tmp_reg6.y = rcp_s(tmp_reg6.z);
tmp_reg6.z = (mul_s(tmp_reg6.xxxx, tmp_reg6.yyyy)).z;
tmp_reg6.x = (min_s(vs_pica.f[17].yyyy, tmp_reg6.zzzz)).x;
tmp_reg6.y = (max_s(vs_pica.f[17].xxxx, tmp_reg6.xxxx)).y;
tmp_reg6.x = (vs_pica.f[17].yyyy + -tmp_reg6.yyyy).x;
tmp_reg1.x = (mul_s(tmp_reg1.xxxx, tmp_reg6.xxxx)).x;
tmp_reg6.xyz = (mul_s(vs_pica.f[80].xyzz, tmp_reg14.xyzz)).xyz;
tmp_reg5.xyz = (mul_s(tmp_reg6.xyzz, tmp_reg1.xxxx)).xyz;
tmp_reg11.xyz = (tmp_reg11.xyzz + tmp_reg5.xyzz).xyz;
tmp_reg13 = max_s(vs_pica.f[17].xxxy, tmp_reg11.xyzz);
tmp_reg11.xyz = (min_s(vs_pica.f[17].yyyy, tmp_reg13.xyzz)).xyz;
return false;
}
bool Vfn35() {
tmp_reg13.w = (vs_pica.f[95].wwww).w;
bool_regs = lessThan(tmp_reg8.zz, tmp_reg13.ww);
if (bool_regs.x) {
tmp_reg11.w = (tmp_reg10.zzzz).w;
} else {
tmp_reg11.w = (vs_pica.f[17].xxxx).w;
}
return false;
}
// shader: 8B30, 4D9D93F8EE18918F
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
light_vector = normalize(light_src[0].position + view.xyz);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
clamp_highlights = sign(dot_product);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[4][0];
dist_value = LightingLUTUnsigned(lut_offset, clamp(light_src[0].dist_atten_scale * length(-light_src[0].position - view.xyz) + light_src[0].dist_atten_bias, 0.0, 1.0));
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * dist_value * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * dist_value * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(min((primary_fragment_color.rgb) + (secondary_fragment_color.rgb), vec3(1)) * (texcolor2.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp(min((texcolor0.r) + (texcolor1.r), 1.0) * (const_color[0].a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((rounded_primary_color.rgb), (texcolor2.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp(min((last_tev_out.a) + (primary_fragment_color.a), 1.0) * (texcolor2.b), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_2 = ByteRound(clamp(fma((const_color[2].rgb), (last_tev_out.aaa), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp(min((rounded_primary_color.aaa) + (const_color[3].rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((texcolor2.rgb), (last_tev_out.rgb), (vec3(1) - const_color[4].aaa)), vec3(0), vec3(1)));
float alpha_output_4 = (const_color[4].a);
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp(min((last_tev_out.rgb) + (combiner_buffer.aaa), vec3(1)) * (const_color[5].aaa), vec3(0), vec3(1)));
float alpha_output_5 = (last_tev_out.a);
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
// reference: 6249AFF381F22C57, 22D10773177E605B
// reference: ED4490F09E8595A0, 4D9D93F8EE18918F
// program: 22D10773177E605B, 0000000000000000, 4D9D93F8EE18918F
// shader: 8B31, 677836C0BE40B09C

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
vec4 vtx_color = vec4(vs_out_reg6.x,vs_out_reg6.y,vs_out_reg6.z,vs_out_reg6.w);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg3.x,vs_out_reg3.y,1,1);
texcoord12 = vec4(vs_out_reg4.x,vs_out_reg4.y,vs_out_reg5.x,vs_out_reg5.y);
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
bool Vfn19();
bool Vfn21();
bool Vfn4();
bool Vfn2();
bool Vfn7();
bool Vfn10();
bool Vfn0();
bool Vfn15();
vec4 tmp_reg0;
vec4 tmp_reg1;
vec4 tmp_reg2;
vec4 tmp_reg3;
vec4 tmp_reg4;
vec4 tmp_reg5;
vec4 tmp_reg6;
vec4 tmp_reg7;
vec4 tmp_reg8;
vec4 tmp_reg10;
vec4 tmp_reg12;
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
tmp_reg10 = vec4(0, 0, 0, 1);
tmp_reg12 = vec4(0, 0, 0, 1);
tmp_reg14 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn19() {
bool_regs = equal(vs_pica.f[17].yz, tmp_reg0.xy);
if (all(not(bool_regs))) {
tmp_reg0.xy = (vs_in_reg5.xyyy).xy;
} else {
Vfn21();
}
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
return false;
}
bool Vfn21() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
tmp_reg0.xy = (vs_in_reg6.xyyy).xy;
} else {
tmp_reg0.xy = (vs_in_reg7.xyyy).xy;
}
return false;
}
bool Vfn4() {
addr_regs.x = (ivec2(tmp_reg14.xx)).x;
if (vs_pica.b[4]) {
tmp_reg0.x = dot_3(vs_pica.f[19 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg0.y = dot_3(vs_pica.f[20 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg0.z = dot_3(vs_pica.f[21 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg6.xyz = (fma_s(tmp_reg14.wwww, tmp_reg0.xyzz, tmp_reg6.xyzz)).xyz;
}
tmp_reg0.x = dot_s(vs_pica.f[19 + addr_regs.x], tmp_reg10);
tmp_reg0.y = dot_s(vs_pica.f[20 + addr_regs.x], tmp_reg10);
tmp_reg0.z = dot_s(vs_pica.f[21 + addr_regs.x], tmp_reg10);
tmp_reg7.xyz = (fma_s(tmp_reg14.wwww, tmp_reg0.xyzz, tmp_reg7.xyzz)).xyz;
return false;
}
bool Vfn2() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.xxxx)).x;
tmp_reg14.w = (vs_in_reg4.xxxx).w;
Vfn4();
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.yyyy)).x;
tmp_reg14.w = (vs_in_reg4.yyyy).w;
Vfn4();
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.zzzz)).x;
tmp_reg14.w = (vs_in_reg4.zzzz).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn7() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.xxxx)).x;
tmp_reg14.w = (vs_pica.f[17].yyyy).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn10() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (vs_pica.f[17].xxxx).x;
tmp_reg14.w = (vs_pica.f[17].yyyy).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn0() {
tmp_reg10 = vs_pica.f[17].xxxy;
tmp_reg10.xyz = (vs_in_reg0).xyz;
if (vs_pica.b[4]) {
tmp_reg5.xyz = (vs_in_reg1).xyz;
}
if (vs_pica.b[3]) {
Vfn2();
}
if (vs_pica.b[2]) {
Vfn7();
}
if (vs_pica.b[1]) {
Vfn10();
}
tmp_reg8.x = dot_s(vs_pica.f[8], tmp_reg10);
tmp_reg8.y = dot_s(vs_pica.f[9], tmp_reg10);
tmp_reg8.z = dot_s(vs_pica.f[10], tmp_reg10);
tmp_reg8.w = (vs_pica.f[17].yyyy).w;
if (vs_pica.b[4]) {
tmp_reg4.x = dot_3(vs_pica.f[8].xyz, tmp_reg5.xyz);
tmp_reg4.y = dot_3(vs_pica.f[9].xyz, tmp_reg5.xyz);
tmp_reg4.z = dot_3(vs_pica.f[10].xyz, tmp_reg5.xyz);
}
tmp_reg12.x = dot_s(vs_pica.f[4], tmp_reg8);
tmp_reg12.y = dot_s(vs_pica.f[5], tmp_reg8);
tmp_reg12.z = dot_s(vs_pica.f[6], tmp_reg8);
tmp_reg12.w = (vs_pica.f[17].yyyy).w;
if (vs_pica.b[4]) {
tmp_reg0.x = dot_3(vs_pica.f[4].xyz, tmp_reg4.xyz);
tmp_reg0.y = dot_3(vs_pica.f[5].xyz, tmp_reg4.xyz);
tmp_reg0.z = dot_3(vs_pica.f[6].xyz, tmp_reg4.xyz);
tmp_reg3.x = dot_s(tmp_reg0.xyzz, tmp_reg0.xyzz);
tmp_reg3.x = rsq_s(tmp_reg3.x);
tmp_reg3.xyz = (mul_s(tmp_reg0.xyzz, tmp_reg3.xxxx)).xyz;
}
tmp_reg10.x = dot_s(vs_pica.f[0], tmp_reg12);
tmp_reg10.y = dot_s(vs_pica.f[1], tmp_reg12);
tmp_reg10.w = dot_s(vs_pica.f[3], tmp_reg12);
tmp_reg10.z = dot_s(vs_pica.f[2], tmp_reg12);
vs_out_reg0 = tmp_reg10;
if (vs_pica.b[4]) {
Vfn15();
} else {
vs_out_reg1 = vs_pica.f[17].yxxx;
}
vs_out_reg2 = -tmp_reg12;
tmp_reg0.w = rcp_s(tmp_reg10.w);
tmp_reg0.xy = (mul_s(tmp_reg10.xyyy, tmp_reg0.wwww)).xy;
tmp_reg1.xy = (mul_s(vs_pica.f[18].xxxx, tmp_reg0.xyyy)).xy;
tmp_reg1.xy = (vs_pica.f[18].xxxx + tmp_reg1.yxxx).xy;
tmp_reg0.xy = (vs_pica.f[17].yyyy).xy;
tmp_reg14.xy = (tmp_reg0.xxxx + -tmp_reg1.xyyy).xy;
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
tmp_reg0.xy = (vs_pica.f[95].xxxx).xy;
Vfn19();
if (vs_pica.b[8]) {
tmp_reg2.x = dot_s(vs_pica.f[13], tmp_reg0);
tmp_reg2.y = dot_s(vs_pica.f[14], tmp_reg0);
tmp_reg0.xy = (tmp_reg2.xyyy).xy;
}
tmp_reg2.zw = (vs_pica.f[17].xxxx).zw;
tmp_reg2.y = (vs_pica.f[17].yyyy).y;
tmp_reg2.y = (tmp_reg2.yyyy + -tmp_reg0.yyyy).y;
tmp_reg2.x = (tmp_reg0.xxxx).x;
vs_out_reg3 = tmp_reg2;
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
tmp_reg0.xy = (tmp_reg14.xyyy).xy;
if (vs_pica.b[9]) {
tmp_reg2.x = dot_s(vs_pica.f[15], tmp_reg0);
tmp_reg2.y = dot_s(vs_pica.f[16], tmp_reg0);
tmp_reg0.xy = (tmp_reg2.xyyy).xy;
}
tmp_reg2.zw = (vs_pica.f[17].xxxx).zw;
tmp_reg2.y = (vs_pica.f[17].yyyy).y;
tmp_reg2.y = (tmp_reg2.yyyy + -tmp_reg0.yyyy).y;
tmp_reg2.x = (tmp_reg0.xxxx).x;
vs_out_reg4 = tmp_reg2;
vs_out_reg5 = vs_in_reg7;
vs_out_reg6 = vs_in_reg8;
return true;
}
bool Vfn15() {
tmp_reg0 = vs_pica.f[17].yyyy + tmp_reg3.zzzz;
tmp_reg0 = mul_s(vs_pica.f[18].xxxx, tmp_reg0);
bool_regs = greaterThanEqual(vs_pica.f[17].xx, tmp_reg0.xx);
tmp_reg0 = vec4(rsq_s(tmp_reg0.x));
tmp_reg1 = mul_s(vs_pica.f[18].xxxx, tmp_reg3.xyzz);
if (!bool_regs.x) {
vs_out_reg1.z = rcp_s(tmp_reg0.x);
vs_out_reg1.xy = (mul_s(tmp_reg1, tmp_reg0)).xy;
} else {
vs_out_reg1.xyz = (vs_pica.f[17].yxxx).xyz;
}
vs_out_reg1.w = (vs_pica.f[17].xxxx).w;
return false;
}
// shader: 8B30, 74AC250CB7B429F4
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = ByteRound(clamp((const_color[0].rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor0.r) * (rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) + (const_color[1].rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) * (const_color[1].a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (texcolor1.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((last_tev_out.a) * (texcolor1.r), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_3 = (last_tev_out.rgb);
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3 * 1.0, alpha_output_3 * 4.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_4 = (last_tev_out.rgb);
float alpha_output_4 = ByteRound(clamp(mix((combiner_buffer.a), (last_tev_out.a), (const_color[4].a)), 0.0, 1.0));
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((last_tev_out.rgb) * (const_color[5].aaa), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((last_tev_out.a) * (const_color[5].a), 0.0, 1.0));
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
// reference: 743EAB8DBC5CE4DE, 677836C0BE40B09C
// reference: 486A5B2EC496FD1E, 74AC250CB7B429F4
// program: 677836C0BE40B09C, 0000000000000000, 74AC250CB7B429F4
// shader: 8B30, 0F29245F49A83608
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = ByteRound(clamp((const_color[0].rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (texcolor0.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) + (const_color[1].rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) * (const_color[1].a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (const_color[2].aaa), vec3(0), vec3(1)));
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
// shader: 8B30, B36AD2DC49A83608
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = ByteRound(clamp((const_color[0].rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (texcolor0.r);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) + (const_color[1].rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) * (const_color[1].a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (const_color[2].aaa), vec3(0), vec3(1)));
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
// reference: 431D857B42839D30, 0F29245F49A83608
// reference: 9D17AB8B42839D30, B36AD2DC49A83608
// program: 61053E51918111B4, 0000000000000000, 0F29245F49A83608
// program: 61053E51918111B4, 0000000000000000, B36AD2DC49A83608
// shader: 8B31, 8D38CDA8A4330CDD

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
vec4 vtx_color = vec4(vs_out_reg6.x,vs_out_reg6.y,vs_out_reg6.z,vs_out_reg6.w);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg3.x,vs_out_reg3.y,1,1);
texcoord12 = vec4(vs_out_reg4.x,vs_out_reg4.y,vs_out_reg5.x,vs_out_reg5.y);
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
bool Vfn19();
bool Vfn21();
bool Vfn4();
bool Vfn2();
bool Vfn7();
bool Vfn10();
bool Vfn0();
bool Vfn15();
vec4 tmp_reg0;
vec4 tmp_reg1;
vec4 tmp_reg2;
vec4 tmp_reg3;
vec4 tmp_reg4;
vec4 tmp_reg5;
vec4 tmp_reg6;
vec4 tmp_reg7;
vec4 tmp_reg8;
vec4 tmp_reg10;
vec4 tmp_reg12;
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
tmp_reg10 = vec4(0, 0, 0, 1);
tmp_reg12 = vec4(0, 0, 0, 1);
tmp_reg14 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn19() {
bool_regs = equal(vs_pica.f[17].yz, tmp_reg0.xy);
if (all(not(bool_regs))) {
tmp_reg0.xy = (vs_in_reg5.xyyy).xy;
} else {
Vfn21();
}
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
return false;
}
bool Vfn21() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
tmp_reg0.xy = (vs_in_reg6.xyyy).xy;
} else {
tmp_reg0.xy = (vs_in_reg7.xyyy).xy;
}
return false;
}
bool Vfn4() {
addr_regs.x = (ivec2(tmp_reg14.xx)).x;
if (vs_pica.b[4]) {
tmp_reg0.x = dot_3(vs_pica.f[19 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg0.y = dot_3(vs_pica.f[20 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg0.z = dot_3(vs_pica.f[21 + addr_regs.x].xyz, tmp_reg5.xyz);
tmp_reg6.xyz = (fma_s(tmp_reg14.wwww, tmp_reg0.xyzz, tmp_reg6.xyzz)).xyz;
}
tmp_reg0.x = dot_s(vs_pica.f[19 + addr_regs.x], tmp_reg10);
tmp_reg0.y = dot_s(vs_pica.f[20 + addr_regs.x], tmp_reg10);
tmp_reg0.z = dot_s(vs_pica.f[21 + addr_regs.x], tmp_reg10);
tmp_reg7.xyz = (fma_s(tmp_reg14.wwww, tmp_reg0.xyzz, tmp_reg7.xyzz)).xyz;
return false;
}
bool Vfn2() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.xxxx)).x;
tmp_reg14.w = (vs_in_reg4.xxxx).w;
Vfn4();
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.yyyy)).x;
tmp_reg14.w = (vs_in_reg4.yyyy).w;
Vfn4();
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.zzzz)).x;
tmp_reg14.w = (vs_in_reg4.zzzz).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn7() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (mul_s(vs_pica.f[17].wwww, vs_in_reg3.xxxx)).x;
tmp_reg14.w = (vs_pica.f[17].yyyy).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn10() {
tmp_reg7 = vs_pica.f[17].xxxy;
if (vs_pica.b[4]) {
tmp_reg6 = vs_pica.f[17].xxxy;
}
tmp_reg14.x = (vs_pica.f[17].xxxx).x;
tmp_reg14.w = (vs_pica.f[17].yyyy).w;
Vfn4();
if (vs_pica.b[4]) {
tmp_reg5 = tmp_reg6;
}
tmp_reg10 = tmp_reg7;
return false;
}
bool Vfn0() {
tmp_reg10 = vs_pica.f[17].xxxy;
tmp_reg10.xyz = (vs_in_reg0).xyz;
if (vs_pica.b[4]) {
tmp_reg5.xyz = (vs_in_reg1).xyz;
}
if (vs_pica.b[3]) {
Vfn2();
}
if (vs_pica.b[2]) {
Vfn7();
}
if (vs_pica.b[1]) {
Vfn10();
}
tmp_reg8.x = dot_s(vs_pica.f[8], tmp_reg10);
tmp_reg8.y = dot_s(vs_pica.f[9], tmp_reg10);
tmp_reg8.z = dot_s(vs_pica.f[10], tmp_reg10);
tmp_reg8.w = (vs_pica.f[17].yyyy).w;
if (vs_pica.b[4]) {
tmp_reg4.x = dot_3(vs_pica.f[8].xyz, tmp_reg5.xyz);
tmp_reg4.y = dot_3(vs_pica.f[9].xyz, tmp_reg5.xyz);
tmp_reg4.z = dot_3(vs_pica.f[10].xyz, tmp_reg5.xyz);
}
tmp_reg12.x = dot_s(vs_pica.f[4], tmp_reg8);
tmp_reg12.y = dot_s(vs_pica.f[5], tmp_reg8);
tmp_reg12.z = dot_s(vs_pica.f[6], tmp_reg8);
tmp_reg12.w = (vs_pica.f[17].yyyy).w;
if (vs_pica.b[4]) {
tmp_reg0.x = dot_3(vs_pica.f[4].xyz, tmp_reg4.xyz);
tmp_reg0.y = dot_3(vs_pica.f[5].xyz, tmp_reg4.xyz);
tmp_reg0.z = dot_3(vs_pica.f[6].xyz, tmp_reg4.xyz);
tmp_reg3.x = dot_s(tmp_reg0.xyzz, tmp_reg0.xyzz);
tmp_reg3.x = rsq_s(tmp_reg3.x);
tmp_reg3.xyz = (mul_s(tmp_reg0.xyzz, tmp_reg3.xxxx)).xyz;
}
tmp_reg10.x = dot_s(vs_pica.f[0], tmp_reg12);
tmp_reg10.y = dot_s(vs_pica.f[1], tmp_reg12);
tmp_reg10.w = dot_s(vs_pica.f[3], tmp_reg12);
tmp_reg10.z = dot_s(vs_pica.f[2], tmp_reg12);
vs_out_reg0 = tmp_reg10;
if (vs_pica.b[4]) {
Vfn15();
} else {
vs_out_reg1 = vs_pica.f[17].yxxx;
}
vs_out_reg2 = -tmp_reg12;
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
tmp_reg0.xy = (vs_pica.f[95].xxxx).xy;
Vfn19();
tmp_reg2.zw = (vs_pica.f[17].xxxx).zw;
tmp_reg2.y = (vs_pica.f[17].yyyy).y;
tmp_reg2.y = (tmp_reg2.yyyy + -tmp_reg0.yyyy).y;
tmp_reg2.x = (tmp_reg0.xxxx).x;
vs_out_reg3 = tmp_reg2;
tmp_reg0.zw = (vs_pica.f[17].yyyy).zw;
tmp_reg0.xy = (vs_pica.f[95].yyyy).xy;
Vfn19();
if (vs_pica.b[9]) {
tmp_reg2.x = dot_s(vs_pica.f[15], tmp_reg0);
tmp_reg2.y = dot_s(vs_pica.f[16], tmp_reg0);
tmp_reg0.xy = (tmp_reg2.xyyy).xy;
}
tmp_reg2.zw = (vs_pica.f[17].xxxx).zw;
tmp_reg2.y = (vs_pica.f[17].yyyy).y;
tmp_reg2.y = (tmp_reg2.yyyy + -tmp_reg0.yyyy).y;
tmp_reg2.x = (tmp_reg0.xxxx).x;
vs_out_reg4 = tmp_reg2;
tmp_reg0.xy = (vs_pica.f[95].zzzz).xy;
Vfn19();
tmp_reg2.zw = (vs_pica.f[17].xxxx).zw;
tmp_reg2.y = (vs_pica.f[17].yyyy).y;
tmp_reg2.y = (tmp_reg2.yyyy + -tmp_reg0.yyyy).y;
tmp_reg2.x = (tmp_reg0.xxxx).x;
vs_out_reg5 = tmp_reg2;
vs_out_reg6 = vs_in_reg8;
return true;
}
bool Vfn15() {
tmp_reg0 = vs_pica.f[17].yyyy + tmp_reg3.zzzz;
tmp_reg0 = mul_s(vs_pica.f[18].xxxx, tmp_reg0);
bool_regs = greaterThanEqual(vs_pica.f[17].xx, tmp_reg0.xx);
tmp_reg0 = vec4(rsq_s(tmp_reg0.x));
tmp_reg1 = mul_s(vs_pica.f[18].xxxx, tmp_reg3.xyzz);
if (!bool_regs.x) {
vs_out_reg1.z = rcp_s(tmp_reg0.x);
vs_out_reg1.xy = (mul_s(tmp_reg1, tmp_reg0)).xy;
} else {
vs_out_reg1.xyz = (vs_pica.f[17].yxxx).xyz;
}
vs_out_reg1.w = (vs_pica.f[17].xxxx).w;
return false;
}
// shader: 8B30, 5C8F03616652CE34
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
light_vector = normalize(light_src[0].position + view.xyz);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
clamp_highlights = sign(dot_product);
lut_offset = lighting_lut_offset[1][2];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
refl_value.r = lut_scale_rr * lut_value;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.a = lut_scale_fr * lut_value;
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[4][0];
dist_value = LightingLUTUnsigned(lut_offset, clamp(light_src[0].dist_atten_scale * length(-light_src[0].position - view.xyz) + light_src[0].dist_atten_bias, 0.0, 1.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * dist_value * 1.0;
specular_sum.rgb += ((light_src[0].specular_0) + (refl_value * light_src[0].specular_1)) * clamp_highlights * dist_value * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = (const_color[0].rgb);
float alpha_output_0 = ByteRound(clamp((texcolor0.r) + (const_color[0].a) - 0.5, 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp(mix((last_tev_out.rgb), (const_color[1].rgb), (secondary_fragment_color.aaa)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp((texcolor2.rgb) * (vec3(1) - secondary_fragment_color.aaa), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((texcolor1.r) * (const_color[2].a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = (last_tev_out.rgb);
float alpha_output_3 = ByteRound(clamp(fma((last_tev_out.a), (texcolor0.r), (last_tev_out.r)), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((combiner_buffer.rgb), (const_color[4].rgb), (last_tev_out.aaa)), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((last_tev_out.rgb) * (const_color[5].aaa), vec3(0), vec3(1)));
float alpha_output_5 = (combiner_buffer.a);
last_tev_out = vec4(color_output_5, alpha_output_5);
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
// shader: 8B30, 7F49A44D2A6EFBCD
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
light_vector = normalize(light_src[0].position + view.xyz);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
clamp_highlights = sign(dot_product);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.a = lut_scale_fr * lut_value;
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[4][0];
dist_value = LightingLUTUnsigned(lut_offset, clamp(light_src[0].dist_atten_scale * length(-light_src[0].position - view.xyz) + light_src[0].dist_atten_bias, 0.0, 1.0));
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * dist_value * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * dist_value * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(min((primary_fragment_color.rgb) + (secondary_fragment_color.rgb), vec3(1)) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor0.r) + (const_color[0].a) - 0.5, 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((texcolor0.rgb), (rounded_primary_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1 * 4.0, alpha_output_1 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (const_color[2].rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp(mix((combiner_buffer.rgb), (last_tev_out.rgb), (rounded_primary_color.aaa)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp((last_tev_out.rgb) * (const_color[4].aaa), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp((last_tev_out.a) * (const_color[4].a), 0.0, 1.0));
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
// shader: 8B30, 9DCCF489CB978282
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
light_vector = normalize(light_src[0].position + view.xyz);
spot_dir = light_src[0].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
clamp_highlights = sign(dot_product);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.a = lut_scale_fr * lut_value;
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[4][0];
dist_value = LightingLUTUnsigned(lut_offset, clamp(light_src[0].dist_atten_scale * length(-light_src[0].position - view.xyz) + light_src[0].dist_atten_bias, 0.0, 1.0));
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(light_vector, normal), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * dist_value * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * dist_value * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(min((primary_fragment_color.rgb) + (secondary_fragment_color.rgb), vec3(1)) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (1.0 - const_color[0].r);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((texcolor0.rgb), (rounded_primary_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp(min((const_color[1].a) + (const_color[1].r), 1.0) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1 * 4.0, alpha_output_1 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (const_color[2].rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp(mix((combiner_buffer.rgb), (last_tev_out.rgb), (rounded_primary_color.aaa)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((last_tev_out.rgb), (texcolor0.rgb), (combiner_buffer.aaa)), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4 * 2.0, alpha_output_4 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp((last_tev_out.rgb) * (const_color[5].aaa), vec3(0), vec3(1)));
float alpha_output_5 = (last_tev_out.a);
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
// reference: ADAE97FD749419EB, 8D38CDA8A4330CDD
// reference: FF9C71F52E91216C, 5C8F03616652CE34
// reference: DA2B91A6716FC176, 0FE372F5F1EA3129
// reference: BD87AB26DF896929, 70AE4B7A3F1B9652
// reference: BCB59B5E9BE019E7, 0364793A00B22D93
// reference: 8509CB029BE019E7, 59689B012E1AC71F
// reference: BCF39AA663DAB41E, 7F49A44D2A6EFBCD
// reference: 612574F7AAAD41A7, 9DCCF489CB978282
// reference: C2141861BAA88DEE, 775049046DCF20A0
// reference: 332C30C8F47B0B7B, EB6C22BCB6A68234
// reference: 835ABFED10B023C4, 03B9A09621A789AC
// reference: D6E60F0636413D08, 98B8B493B0177051
// reference: EAF4A1B47380DA61, 30F62572CDC4C850
// reference: D6E60F061519FEE7, 1C8FDE7D9F5B3383
// program: 8D38CDA8A4330CDD, 0000000000000000, 5C8F03616652CE34
// program: 2EF16290DD3DB53B, 0000000000000000, 7F49A44D2A6EFBCD
// program: 2EF16290DD3DB53B, 0000000000000000, 9DCCF489CB978282
