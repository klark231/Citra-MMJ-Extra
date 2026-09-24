// shader: 8B31, 19B51132E4AE7A71

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
// shader: 8B30, 7AB896E680E98427
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 16BF27C8E0061402
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_3 = (texcolor0.rgb);
float alpha_output_3 = (texcolor0.r);
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
// shader: 8B30, 75FDCFF3DC589B4F
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_3 = (vec3(1) - texcolor0.rgb);
float alpha_output_3 = ByteRound(clamp((texcolor0.a) + (const_color[3].a) - 0.5, 0.0, 1.0));
last_tev_out = vec4(color_output_3 * 1.0, alpha_output_3 * 2.0);
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
// shader: 8B30, B547BE090ADBFC42
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_3 = ByteRound(clamp((texcolor0.aaa) + (const_color[3].aaa) - vec3(0.5), vec3(0), vec3(1)));
float alpha_output_3 = (texcolor0.a);
last_tev_out = vec4(color_output_3 * 2.0, alpha_output_3 * 2.0);
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
// reference: 009A891FA95A5D40, 19B51132E4AE7A71
// reference: C6898216B3A80015, 7AB896E680E98427
// reference: 4C49F050E085ACF4, 16BF27C8E0061402
// reference: E21FFF79EBE28570, 75FDCFF3DC589B4F
// reference: 203B8309F6BF4B34, B547BE090ADBFC42
// program: 19B51132E4AE7A71, 0000000000000000, 7AB896E680E98427
// program: 19B51132E4AE7A71, 0000000000000000, 16BF27C8E0061402
// program: 19B51132E4AE7A71, 0000000000000000, 75FDCFF3DC589B4F
// program: 19B51132E4AE7A71, 0000000000000000, B547BE090ADBFC42
// shader: 8B30, 95AF22F4FDF5E283
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
// shader: 8B30, 2AC4C6F48AC45996
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = (const_color[0].rgb);
float alpha_output_0 = (texcolor0.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, D613F82F9F9F3144
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = ByteRound(clamp((texcolor0.rrr) * (const_color[0].rgb), vec3(0), vec3(1)));
float alpha_output_0 = (texcolor0.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((texcolor0.ggg), (const_color[1].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(fma((texcolor0.bbb), (const_color[2].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, FB088A5C78FC3097
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = (const_color[0].rgb);
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 6873719989AF415C
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
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
// shader: 8B31, F08584908DF524CD

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
tmp_reg1.xy = (vs_pica.f[94].zzzz).xy;
tmp_reg1.zw = (vs_pica.f[93].xxxx).zw;
tmp_reg6 = fma_s(tmp_reg14, tmp_reg1, tmp_reg1);
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
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
bool Vfn0() {
Vfn1();
Vfn30();
Vfn45();
return true;
}
// shader: 8B30, CBE69E9A7BEB9F1B
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
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
vec3 color_output_0 = (texcolor0.rgb);
float alpha_output_0 = (texcolor0.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp(fma((last_tev_out.rgb), (primary_fragment_color.rgb), (secondary_fragment_color.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 9C1F176693BC04B9
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
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
vec3 color_output_0 = (const_color[0].rgb);
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp(fma((last_tev_out.rgb), (primary_fragment_color.rgb), (secondary_fragment_color.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B31, 9EA5E30DA7ECBE22

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
vec4 vs_out_reg4;
vec4 vs_out_reg5;
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
normquat = vec4(vs_out_reg4.x,vs_out_reg4.y,vs_out_reg4.z,vs_out_reg4.w);
vec4 vtx_color = vec4(vs_out_reg1.x,vs_out_reg1.y,vs_out_reg1.z,vs_out_reg1.w);
primary_color = clamp(vtx_color,vec4(0),vec4(1));
texcoord0 = vec4(vs_out_reg2.x,vs_out_reg2.y,1,1);
texcoord12 = vec4(vs_out_reg3.x,vs_out_reg3.y,1,1);
view = vec4(vs_out_reg5.x,vs_out_reg5.y,vs_out_reg5.z,1);
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
bool Vfn0();
vec4 tmp_reg0;
vec4 tmp_reg10;
vec4 tmp_reg11;
vec4 tmp_reg12;
vec4 tmp_reg13;
vec4 tmp_reg14;
vec4 tmp_reg15;
bool ExecVS() {
tmp_reg0 = vec4(0, 0, 0, 1);
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
tmp_reg14 = vs_pica.f[85].xxxz;
tmp_reg15 = vs_pica.f[85].xxxz;
tmp_reg14.xyz = (vs_in_reg0.xyzz).xyz;
tmp_reg15.x = dot_s(vs_pica.f[25], tmp_reg14);
tmp_reg15.y = dot_s(vs_pica.f[26], tmp_reg14);
tmp_reg15.z = dot_s(vs_pica.f[27], tmp_reg14);
tmp_reg14.x = dot_s(vs_pica.f[90], tmp_reg15);
tmp_reg14.y = dot_s(vs_pica.f[91], tmp_reg15);
tmp_reg14.z = dot_s(vs_pica.f[92], tmp_reg15);
vs_out_reg0.x = dot_s(vs_pica.f[86], tmp_reg14);
vs_out_reg0.y = dot_s(vs_pica.f[87], tmp_reg14);
vs_out_reg0.z = dot_s(vs_pica.f[88], tmp_reg14);
vs_out_reg0.w = dot_s(vs_pica.f[89], tmp_reg14);
vs_out_reg5 = -tmp_reg14;
tmp_reg15.x = dot_3(vs_pica.f[25].xyz, vs_in_reg3.xyz);
tmp_reg15.y = dot_3(vs_pica.f[26].xyz, vs_in_reg3.xyz);
tmp_reg15.z = dot_3(vs_pica.f[27].xyz, vs_in_reg3.xyz);
tmp_reg12.x = dot_3(vs_pica.f[90].xyz, tmp_reg15.xyz);
tmp_reg12.y = dot_3(vs_pica.f[91].xyz, tmp_reg15.xyz);
tmp_reg12.z = dot_3(vs_pica.f[92].xyz, tmp_reg15.xyz);
vs_out_reg1 = vs_in_reg2;
tmp_reg0.x = dot_3(tmp_reg12.xyz, tmp_reg12.xyz);
tmp_reg0.x = rsq_s(tmp_reg0.x);
tmp_reg12.xyz = (mul_s(tmp_reg12.xyzz, tmp_reg0.xxxx)).xyz;
vs_out_reg2 = vs_in_reg1.xyyy;
vs_out_reg3 = vs_in_reg1.xyyy;
tmp_reg13 = vs_pica.f[85].xxxx;
bool_regs = equal(-vs_pica.f[85].zz, tmp_reg12.zz);
if (!bool_regs.x) {
tmp_reg10 = vs_pica.f[85].zzzz + tmp_reg12.zzzz;
tmp_reg10 = mul_s(vs_pica.f[85].yyyy, tmp_reg10);
tmp_reg10 = vec4(rsq_s(tmp_reg10.z));
tmp_reg11.xy = (mul_s(vs_pica.f[85].yyyy, tmp_reg12)).xy;
tmp_reg13.z = rcp_s(tmp_reg10.z);
tmp_reg13.xy = (mul_s(tmp_reg11.xyyy, tmp_reg10.xxxx)).xy;
} else {
tmp_reg13.x = (vs_pica.f[85].zzzz).x;
}
vs_out_reg4 = tmp_reg13;
return true;
}
// shader: 8B30, 9D129D631C0CFA07
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
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
vec3 color_output_0 = ByteRound(clamp((texcolor0.aaa) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((const_color[0].a) * (const_color[0].a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp(mix((const_color[1].aaa), (const_color[1].rgb), (texcolor1.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp(fma((last_tev_out.rgb), (texcolor0.rgb), (combiner_buffer.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((last_tev_out.rgb), (rounded_primary_color.rgb), (const_color[4].rgb)), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp(mix((last_tev_out.rgb), (combiner_buffer.rgb), (const_color[5].aaa)), vec3(0), vec3(1)));
float alpha_output_5 = (last_tev_out.a);
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: CDAB367A1852D40B, 95AF22F4FDF5E283
// reference: 98DD90BC5B510E3A, 2AC4C6F48AC45996
// reference: 763D40C11BD21295, D613F82F9F9F3144
// reference: CDAB367A87E58F41, FB088A5C78FC3097
// reference: 98DD90BC0D25C105, 6873719989AF415C
// reference: CDAB367A0D25C105, 15C7483CDCAC839B
// reference: A03DA66341E55641, F08584908DF524CD
// reference: 01CA076E1E28854B, CBE69E9A7BEB9F1B
// reference: 01CA076E94E8CB0F, 9C1F176693BC04B9
// reference: 3B75F6290A013DDF, 9EA5E30DA7ECBE22
// reference: 002650E3DC43A022, 9D129D631C0CFA07
// program: 0000000000000000, 0000000000000000, 95AF22F4FDF5E283
// program: 0000000000000000, 0000000000000000, 2AC4C6F48AC45996
// program: 0000000000000000, 0000000000000000, D613F82F9F9F3144
// program: 0000000000000000, 0000000000000000, FB088A5C78FC3097
// program: 0000000000000000, 0000000000000000, 6873719989AF415C
// program: 0000000000000000, 0000000000000000, 15C7483CDCAC839B
// program: F08584908DF524CD, 0000000000000000, CBE69E9A7BEB9F1B
// program: F08584908DF524CD, 0000000000000000, 9C1F176693BC04B9
// program: 9EA5E30DA7ECBE22, 0000000000000000, 9D129D631C0CFA07
// shader: 8B31, FA8DE3C2094E8829

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
uint jmp_to = 74u;
while (true) {
switch (jmp_to) {
case 74u:
tmp_reg6.x = dot_3(tmp_reg14.xyz, tmp_reg14.xyz);
tmp_reg7.x = dot_3(tmp_reg12.xyz, tmp_reg12.xyz);
tmp_reg6.x = rsq_s(tmp_reg6.x);
tmp_reg7.x = rsq_s(tmp_reg7.x);
tmp_reg14.xyz = (mul_s(tmp_reg14.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg12.xyz = (mul_s(tmp_reg12.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg0 = vs_pica.f[93].yxxx;
if (!vs_pica.b[15]) {
jmp_to = 90u; break;
}
tmp_reg4 = vs_pica.f[93].yyyy + tmp_reg14.zzzz;
tmp_reg4 = mul_s(vs_pica.f[94].zzzz, tmp_reg4);
bool_regs = greaterThanEqual(vs_pica.f[93].xx, tmp_reg4.xx);
tmp_reg4 = vec4(rsq_s(tmp_reg4.x));
tmp_reg5 = mul_s(vs_pica.f[94].zzzz, tmp_reg14);
if (bool_regs.x) {
jmp_to = 90u; break;
}
tmp_reg0.z = rcp_s(tmp_reg4.x);
tmp_reg0.xy = (mul_s(tmp_reg5, tmp_reg4)).xy;
case 90u:
vs_out_reg1 = tmp_reg0;
default: return false;
}
}
return false;
}
bool Vfn8() {
uint jmp_to = 91u;
while (true) {
switch (jmp_to) {
case 91u:
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
jmp_to = 166u; break;
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
jmp_to = 128u; break;
}
tmp_reg7.xz = (tmp_reg13.wwyy + -tmp_reg14.yyww).xz;
tmp_reg7.y = (tmp_reg14.xxxx + -tmp_reg13.zzzz).y;
tmp_reg7.w = (tmp_reg6).w;
tmp_reg6 = vec4(dot_s(tmp_reg7, tmp_reg7));
tmp_reg6 = vec4(rsq_s(tmp_reg6.x));
tmp_reg0 = mul_s(tmp_reg7, tmp_reg6);
if (vs_pica.b[0]) {
jmp_to = 166u; break;
}
case 128u:
bool_regs = greaterThan(tmp_reg5.zy, tmp_reg5.yx);
if (bool_regs.x) {
Vfn9();
} else {
Vfn14();
}
tmp_reg6 = vec4(dot_s(tmp_reg8, tmp_reg8));
tmp_reg6 = vec4(rsq_s(tmp_reg6.x));
tmp_reg0 = mul_s(tmp_reg8, tmp_reg6);
case 166u:
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
tmp_reg9 = vs_pica.f[93].yyyy;
if (bool_regs.y) {
Vfn19();
}
vs_out_reg3 = max_s(vs_pica.f[93].xxxx, tmp_reg9);
return false;
}
bool Vfn19() {
tmp_reg0 = mul_s(vs_pica.f[7].wwww, vs_in_reg3);
if (vs_pica.b[7]) {
tmp_reg9.w = (tmp_reg0.wwww).w;
}
tmp_reg9.xyz = (tmp_reg0.xyzz).xyz;
return false;
}
bool Vfn0() {
Vfn1();
Vfn18();
return true;
}
// shader: 8B30, 787FEC0C2A445D9A
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = (primary_fragment_color.rgb);
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
// reference: CC0A6B03713E1873, FA8DE3C2094E8829
// reference: 596C8D815646C293, 787FEC0C2A445D9A
// reference: 596C8D815784A8A4, 787FEC0C2A445D9A
// program: FA8DE3C2094E8829, 0000000000000000, 787FEC0C2A445D9A
// shader: 8B30, A3D6CAAAF2971A7F
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (const_color[5].rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (const_color[5].a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 8881AC828DC4DA1E
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 1757303FCB97082D
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
// shader: 8B31, BF38A0361D0EE987

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
layout(location=6) in vec4 vs_in_reg6;
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
bool Vfn22();
bool Vfn28();
bool Vfn30();
bool Vfn23();
bool Vfn25();
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
uint jmp_to = 74u;
while (true) {
switch (jmp_to) {
case 74u:
tmp_reg6.x = dot_3(tmp_reg14.xyz, tmp_reg14.xyz);
tmp_reg7.x = dot_3(tmp_reg12.xyz, tmp_reg12.xyz);
tmp_reg6.x = rsq_s(tmp_reg6.x);
tmp_reg7.x = rsq_s(tmp_reg7.x);
tmp_reg14.xyz = (mul_s(tmp_reg14.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg12.xyz = (mul_s(tmp_reg12.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg0 = vs_pica.f[93].yxxx;
if (!vs_pica.b[15]) {
jmp_to = 90u; break;
}
tmp_reg4 = vs_pica.f[93].yyyy + tmp_reg14.zzzz;
tmp_reg4 = mul_s(vs_pica.f[94].zzzz, tmp_reg4);
bool_regs = greaterThanEqual(vs_pica.f[93].xx, tmp_reg4.xx);
tmp_reg4 = vec4(rsq_s(tmp_reg4.x));
tmp_reg5 = mul_s(vs_pica.f[94].zzzz, tmp_reg14);
if (bool_regs.x) {
jmp_to = 90u; break;
}
tmp_reg0.z = rcp_s(tmp_reg4.x);
tmp_reg0.xy = (mul_s(tmp_reg5, tmp_reg4)).xy;
case 90u:
vs_out_reg1 = tmp_reg0;
default: return false;
}
}
return false;
}
bool Vfn8() {
uint jmp_to = 91u;
while (true) {
switch (jmp_to) {
case 91u:
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
jmp_to = 166u; break;
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
jmp_to = 128u; break;
}
tmp_reg7.xz = (tmp_reg13.wwyy + -tmp_reg14.yyww).xz;
tmp_reg7.y = (tmp_reg14.xxxx + -tmp_reg13.zzzz).y;
tmp_reg7.w = (tmp_reg6).w;
tmp_reg6 = vec4(dot_s(tmp_reg7, tmp_reg7));
tmp_reg6 = vec4(rsq_s(tmp_reg6.x));
tmp_reg0 = mul_s(tmp_reg7, tmp_reg6);
if (vs_pica.b[0]) {
jmp_to = 166u; break;
}
case 128u:
bool_regs = greaterThan(tmp_reg5.zy, tmp_reg5.yx);
if (bool_regs.x) {
Vfn9();
} else {
Vfn14();
}
tmp_reg6 = vec4(dot_s(tmp_reg8, tmp_reg8));
tmp_reg6 = vec4(rsq_s(tmp_reg6.x));
tmp_reg0 = mul_s(tmp_reg8, tmp_reg6);
case 166u:
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
tmp_reg9 = vs_pica.f[93].yyyy;
if (bool_regs.y) {
Vfn19();
}
vs_out_reg3 = max_s(vs_pica.f[93].xxxx, tmp_reg9);
return false;
}
bool Vfn19() {
tmp_reg0 = mul_s(vs_pica.f[7].wwww, vs_in_reg3);
if (vs_pica.b[7]) {
tmp_reg9.w = (tmp_reg0.wwww).w;
}
tmp_reg9.xyz = (tmp_reg0.xyzz).xyz;
return false;
}
bool Vfn21() {
tmp_reg0.xy = (vs_pica.f[10].xxxx).xy;
if (vs_pica.b[9]) {
Vfn22();
} else {
Vfn28();
}
return false;
}
bool Vfn22() {
Vfn23();
tmp_reg3.x = dot_s(vs_pica.f[11].xywz, tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12].xywz, tmp_reg6);
tmp_reg3.zw = (vs_pica.f[93].xxxx).zw;
vs_out_reg4 = tmp_reg3;
return false;
}
bool Vfn28() {
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
Vfn30();
}
vs_out_reg4 = tmp_reg3;
return false;
}
bool Vfn30() {
tmp_reg1.xy = (vs_pica.f[94].zzzz).xy;
tmp_reg1.zw = (vs_pica.f[93].xxxx).zw;
tmp_reg6 = fma_s(tmp_reg14, tmp_reg1, tmp_reg1);
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
tmp_reg3.x = dot_s(vs_pica.f[11], tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12], tmp_reg6);
return false;
}
bool Vfn23() {
bool_regs = equal(vs_pica.f[93].yz, tmp_reg0.xy);
if (all(not(bool_regs))) {
tmp_reg6.xy = (mul_s(vs_pica.f[8].xxxx, vs_in_reg4.xyyy)).xy;
} else {
Vfn25();
}
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
return false;
}
bool Vfn25() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
tmp_reg6.xy = (mul_s(vs_pica.f[8].yyyy, vs_in_reg5.xyyy)).xy;
} else {
tmp_reg6.xy = (mul_s(vs_pica.f[8].zzzz, vs_in_reg6.xyyy)).xy;
}
return false;
}
bool Vfn0() {
Vfn1();
Vfn18();
Vfn21();
return true;
}
// shader: 8B30, 78B299F32B4C46BF
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
// shader: 8B30, DE35120CBE92434C
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
last_tev_out = vec4(color_output_1 * 4.0, alpha_output_1 * 1.0);
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
// shader: 8B31, 8A30878796E09312

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
bool Vfn22();
bool Vfn28();
bool Vfn30();
bool Vfn23();
bool Vfn25();
bool Vfn31();
bool Vfn32();
bool Vfn33();
bool Vfn34();
bool Vfn35();
bool Vfn37();
bool Vfn39();
bool Vfn40();
bool Vfn41();
bool Vfn42();
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
Vfn32();
Vfn39();
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
uint jmp_to = 74u;
while (true) {
switch (jmp_to) {
case 74u:
tmp_reg6.x = dot_3(tmp_reg14.xyz, tmp_reg14.xyz);
tmp_reg7.x = dot_3(tmp_reg12.xyz, tmp_reg12.xyz);
tmp_reg6.x = rsq_s(tmp_reg6.x);
tmp_reg7.x = rsq_s(tmp_reg7.x);
tmp_reg14.xyz = (mul_s(tmp_reg14.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg12.xyz = (mul_s(tmp_reg12.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg0 = vs_pica.f[93].yxxx;
if (!vs_pica.b[15]) {
jmp_to = 90u; break;
}
tmp_reg4 = vs_pica.f[93].yyyy + tmp_reg14.zzzz;
tmp_reg4 = mul_s(vs_pica.f[94].zzzz, tmp_reg4);
bool_regs = greaterThanEqual(vs_pica.f[93].xx, tmp_reg4.xx);
tmp_reg4 = vec4(rsq_s(tmp_reg4.x));
tmp_reg5 = mul_s(vs_pica.f[94].zzzz, tmp_reg14);
if (bool_regs.x) {
jmp_to = 90u; break;
}
tmp_reg0.z = rcp_s(tmp_reg4.x);
tmp_reg0.xy = (mul_s(tmp_reg5, tmp_reg4)).xy;
case 90u:
vs_out_reg1 = tmp_reg0;
default: return false;
}
}
return false;
}
bool Vfn8() {
uint jmp_to = 91u;
while (true) {
switch (jmp_to) {
case 91u:
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
jmp_to = 166u; break;
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
jmp_to = 128u; break;
}
tmp_reg7.xz = (tmp_reg13.wwyy + -tmp_reg14.yyww).xz;
tmp_reg7.y = (tmp_reg14.xxxx + -tmp_reg13.zzzz).y;
tmp_reg7.w = (tmp_reg6).w;
tmp_reg6 = vec4(dot_s(tmp_reg7, tmp_reg7));
tmp_reg6 = vec4(rsq_s(tmp_reg6.x));
tmp_reg0 = mul_s(tmp_reg7, tmp_reg6);
if (vs_pica.b[0]) {
jmp_to = 166u; break;
}
case 128u:
bool_regs = greaterThan(tmp_reg5.zy, tmp_reg5.yx);
if (bool_regs.x) {
Vfn9();
} else {
Vfn14();
}
tmp_reg6 = vec4(dot_s(tmp_reg8, tmp_reg8));
tmp_reg6 = vec4(rsq_s(tmp_reg6.x));
tmp_reg0 = mul_s(tmp_reg8, tmp_reg6);
case 166u:
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
tmp_reg9 = vs_pica.f[93].yyyy;
if (bool_regs.y) {
Vfn19();
}
vs_out_reg3 = max_s(vs_pica.f[93].xxxx, tmp_reg9);
return false;
}
bool Vfn19() {
tmp_reg0 = mul_s(vs_pica.f[7].wwww, vs_in_reg3);
if (vs_pica.b[7]) {
tmp_reg9.w = (tmp_reg0.wwww).w;
}
tmp_reg9.xyz = (tmp_reg0.xyzz).xyz;
return false;
}
bool Vfn21() {
tmp_reg0.xy = (vs_pica.f[10].xxxx).xy;
if (vs_pica.b[9]) {
Vfn22();
} else {
Vfn28();
}
return false;
}
bool Vfn22() {
Vfn23();
tmp_reg3.x = dot_s(vs_pica.f[11].xywz, tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12].xywz, tmp_reg6);
tmp_reg3.zw = (vs_pica.f[93].xxxx).zw;
vs_out_reg4 = tmp_reg3;
return false;
}
bool Vfn28() {
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
Vfn30();
}
vs_out_reg4 = tmp_reg3;
return false;
}
bool Vfn30() {
Vfn31();
tmp_reg3.x = dot_s(vs_pica.f[11], tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12], tmp_reg6);
return false;
}
bool Vfn23() {
bool_regs = equal(vs_pica.f[93].yz, tmp_reg0.xy);
if (all(not(bool_regs))) {
tmp_reg6.xy = (mul_s(vs_pica.f[8].xxxx, vs_in_reg4.xyyy)).xy;
} else {
Vfn25();
}
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
return false;
}
bool Vfn25() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
tmp_reg6.xy = (mul_s(vs_pica.f[8].yyyy, vs_in_reg5.xyyy)).xy;
} else {
tmp_reg6.xy = (mul_s(vs_pica.f[8].zzzz, vs_in_reg6.xyyy)).xy;
}
return false;
}
bool Vfn31() {
tmp_reg1.xy = (vs_pica.f[94].zzzz).xy;
tmp_reg1.zw = (vs_pica.f[93].xxxx).zw;
tmp_reg6 = fma_s(tmp_reg14, tmp_reg1, tmp_reg1);
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
return false;
}
bool Vfn32() {
tmp_reg0.xy = (vs_pica.f[10].yyyy).xy;
if (vs_pica.b[10]) {
Vfn33();
} else {
Vfn34();
}
return false;
}
bool Vfn33() {
Vfn23();
tmp_reg4.x = dot_s(vs_pica.f[14].xywz, tmp_reg6);
tmp_reg4.y = dot_s(vs_pica.f[15].xywz, tmp_reg6);
vs_out_reg5 = tmp_reg4;
return false;
}
bool Vfn34() {
if (vs_pica.b[13]) {
Vfn35();
} else {
vs_out_reg5 = vs_pica.f[93].xxxx;
}
return false;
}
bool Vfn35() {
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
Vfn37();
}
vs_out_reg5 = tmp_reg4;
return false;
}
bool Vfn37() {
Vfn31();
tmp_reg4.x = dot_s(vs_pica.f[14], tmp_reg6);
tmp_reg4.y = dot_s(vs_pica.f[15], tmp_reg6);
return false;
}
bool Vfn39() {
tmp_reg0.xy = (vs_pica.f[10].zzzz).xy;
if (vs_pica.b[11]) {
Vfn40();
} else {
Vfn41();
}
return false;
}
bool Vfn40() {
Vfn23();
tmp_reg5.x = dot_s(vs_pica.f[17].xywz, tmp_reg6);
tmp_reg5.y = dot_s(vs_pica.f[18].xywz, tmp_reg6);
vs_out_reg6 = tmp_reg5;
return false;
}
bool Vfn41() {
if (vs_pica.b[14]) {
Vfn42();
} else {
vs_out_reg6 = vs_pica.f[93].xxxx;
}
return false;
}
bool Vfn42() {
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
tmp_reg5.zw = (tmp_reg6.zwww).zw;
Vfn31();
tmp_reg5.x = dot_s(vs_pica.f[17], tmp_reg6);
tmp_reg5.y = dot_s(vs_pica.f[18], tmp_reg6);
vs_out_reg6 = tmp_reg5;
return false;
}
// shader: 8B30, 5B18F4306C380BD5
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(min((texcolor1.rgb) + (const_color[1].rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(min((texcolor1.aaa) + (const_color[2].rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(min((texcolor2.rgb) + (const_color[3].rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
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
// shader: 8B31, 63D49B7014AF4E02

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
bool Vfn22();
bool Vfn28();
bool Vfn30();
bool Vfn23();
bool Vfn25();
bool Vfn31();
bool Vfn32();
bool Vfn33();
bool Vfn34();
bool Vfn35();
bool Vfn37();
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
uint jmp_to = 74u;
while (true) {
switch (jmp_to) {
case 74u:
tmp_reg6.x = dot_3(tmp_reg14.xyz, tmp_reg14.xyz);
tmp_reg7.x = dot_3(tmp_reg12.xyz, tmp_reg12.xyz);
tmp_reg6.x = rsq_s(tmp_reg6.x);
tmp_reg7.x = rsq_s(tmp_reg7.x);
tmp_reg14.xyz = (mul_s(tmp_reg14.xyzz, tmp_reg6.xxxx)).xyz;
tmp_reg12.xyz = (mul_s(tmp_reg12.xyzz, tmp_reg7.xxxx)).xyz;
tmp_reg0 = vs_pica.f[93].yxxx;
if (!vs_pica.b[15]) {
jmp_to = 90u; break;
}
tmp_reg4 = vs_pica.f[93].yyyy + tmp_reg14.zzzz;
tmp_reg4 = mul_s(vs_pica.f[94].zzzz, tmp_reg4);
bool_regs = greaterThanEqual(vs_pica.f[93].xx, tmp_reg4.xx);
tmp_reg4 = vec4(rsq_s(tmp_reg4.x));
tmp_reg5 = mul_s(vs_pica.f[94].zzzz, tmp_reg14);
if (bool_regs.x) {
jmp_to = 90u; break;
}
tmp_reg0.z = rcp_s(tmp_reg4.x);
tmp_reg0.xy = (mul_s(tmp_reg5, tmp_reg4)).xy;
case 90u:
vs_out_reg1 = tmp_reg0;
default: return false;
}
}
return false;
}
bool Vfn8() {
uint jmp_to = 91u;
while (true) {
switch (jmp_to) {
case 91u:
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
jmp_to = 166u; break;
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
jmp_to = 128u; break;
}
tmp_reg7.xz = (tmp_reg13.wwyy + -tmp_reg14.yyww).xz;
tmp_reg7.y = (tmp_reg14.xxxx + -tmp_reg13.zzzz).y;
tmp_reg7.w = (tmp_reg6).w;
tmp_reg6 = vec4(dot_s(tmp_reg7, tmp_reg7));
tmp_reg6 = vec4(rsq_s(tmp_reg6.x));
tmp_reg0 = mul_s(tmp_reg7, tmp_reg6);
if (vs_pica.b[0]) {
jmp_to = 166u; break;
}
case 128u:
bool_regs = greaterThan(tmp_reg5.zy, tmp_reg5.yx);
if (bool_regs.x) {
Vfn9();
} else {
Vfn14();
}
tmp_reg6 = vec4(dot_s(tmp_reg8, tmp_reg8));
tmp_reg6 = vec4(rsq_s(tmp_reg6.x));
tmp_reg0 = mul_s(tmp_reg8, tmp_reg6);
case 166u:
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
tmp_reg9 = vs_pica.f[93].yyyy;
if (bool_regs.y) {
Vfn19();
}
vs_out_reg3 = max_s(vs_pica.f[93].xxxx, tmp_reg9);
return false;
}
bool Vfn19() {
tmp_reg0 = mul_s(vs_pica.f[7].wwww, vs_in_reg3);
if (vs_pica.b[7]) {
tmp_reg9.w = (tmp_reg0.wwww).w;
}
tmp_reg9.xyz = (tmp_reg0.xyzz).xyz;
return false;
}
bool Vfn21() {
tmp_reg0.xy = (vs_pica.f[10].xxxx).xy;
if (vs_pica.b[9]) {
Vfn22();
} else {
Vfn28();
}
return false;
}
bool Vfn22() {
Vfn23();
tmp_reg3.x = dot_s(vs_pica.f[11].xywz, tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12].xywz, tmp_reg6);
tmp_reg3.zw = (vs_pica.f[93].xxxx).zw;
vs_out_reg4 = tmp_reg3;
return false;
}
bool Vfn28() {
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
Vfn30();
}
vs_out_reg4 = tmp_reg3;
return false;
}
bool Vfn30() {
Vfn31();
tmp_reg3.x = dot_s(vs_pica.f[11], tmp_reg6);
tmp_reg3.y = dot_s(vs_pica.f[12], tmp_reg6);
return false;
}
bool Vfn23() {
bool_regs = equal(vs_pica.f[93].yz, tmp_reg0.xy);
if (all(not(bool_regs))) {
tmp_reg6.xy = (mul_s(vs_pica.f[8].xxxx, vs_in_reg4.xyyy)).xy;
} else {
Vfn25();
}
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
return false;
}
bool Vfn25() {
if (all(bvec2(bool_regs.x, !bool_regs.y))) {
tmp_reg6.xy = (mul_s(vs_pica.f[8].yyyy, vs_in_reg5.xyyy)).xy;
} else {
tmp_reg6.xy = (mul_s(vs_pica.f[8].zzzz, vs_in_reg6.xyyy)).xy;
}
return false;
}
bool Vfn31() {
tmp_reg1.xy = (vs_pica.f[94].zzzz).xy;
tmp_reg1.zw = (vs_pica.f[93].xxxx).zw;
tmp_reg6 = fma_s(tmp_reg14, tmp_reg1, tmp_reg1);
tmp_reg6.zw = (vs_pica.f[93].xxyy).zw;
return false;
}
bool Vfn32() {
tmp_reg0.xy = (vs_pica.f[10].yyyy).xy;
if (vs_pica.b[10]) {
Vfn33();
} else {
Vfn34();
}
return false;
}
bool Vfn33() {
Vfn23();
tmp_reg4.x = dot_s(vs_pica.f[14].xywz, tmp_reg6);
tmp_reg4.y = dot_s(vs_pica.f[15].xywz, tmp_reg6);
vs_out_reg5 = tmp_reg4;
return false;
}
bool Vfn34() {
if (vs_pica.b[13]) {
Vfn35();
} else {
vs_out_reg5 = vs_pica.f[93].xxxx;
}
return false;
}
bool Vfn35() {
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
Vfn37();
}
vs_out_reg5 = tmp_reg4;
return false;
}
bool Vfn37() {
Vfn31();
tmp_reg4.x = dot_s(vs_pica.f[14], tmp_reg6);
tmp_reg4.y = dot_s(vs_pica.f[15], tmp_reg6);
return false;
}
bool Vfn0() {
Vfn1();
Vfn18();
Vfn21();
Vfn32();
return true;
}
// shader: 8B30, 562DEA34F82A4C8A
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_1 = ByteRound(clamp(min((texcolor1.rgb) + (const_color[1].rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(min((texcolor1.aaa) + (const_color[2].rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
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
// shader: 8B30, 7AEB6FD8FDA9CF77
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = ByteRound(clamp(fma((texcolor0.rgb), (const_color[0].rgb), (rounded_primary_color.rgb)), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1 * 2.0, alpha_output_1 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(min((texcolor1.rgb) + (const_color[2].rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(min((texcolor1.aaa) + (const_color[3].rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
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
// shader: 8B30, E132C4933C4FE0A0
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
float alpha_output_0 = (texcolor0.r);
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
// shader: 8B30, 9E6056670B0860D8
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
float alpha_output_0 = ByteRound(clamp((texcolor0.r) * (rounded_primary_color.a), 0.0, 1.0));
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
// shader: 8B30, 421F4A649E20D8C3
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = ByteRound(clamp((texcolor1.rgb) + (texcolor2.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (texcolor0.r);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) + (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((last_tev_out.a) * (const_color[1].a), 0.0, 1.0));
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
// shader: 8B30, A6DD429C42F7513F
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
float alpha_output_0 = ByteRound(clamp((texcolor0.r) * (const_color[0].a), 0.0, 1.0));
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
// shader: 8B30, 4F7DEC2AD91679DE
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(min((texcolor0.rgb) + (const_color[1].rgb), vec3(1)) * (last_tev_out.rgb), vec3(0), vec3(1)));
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
// shader: 8B30, CFE0A56C23A293AF
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
// reference: 5AD3A4F5F8D07363, A3D6CAAAF2971A7F
// reference: CDAB367A8138E7CE, 8881AC828DC4DA1E
// reference: 596C8D81A2602421, 1757303FCB97082D
// reference: 2109E3F37595816C, BF38A0361D0EE987
// reference: 43A91D10F071B1DD, 78B299F32B4C46BF
// reference: B33349BC5BFCD5B2, DE35120CBE92434C
// reference: 6E7D59CD1845776B, 8A30878796E09312
// reference: 00676FB0C0C20E2F, 5B18F4306C380BD5
// reference: EBE8491B420BDBCC, 63D49B7014AF4E02
// reference: F7D4D3D463379C9D, 562DEA34F82A4C8A
// reference: D59DBD766D100566, 7AEB6FD8FDA9CF77
// reference: C4596CCC0E577D59, E132C4933C4FE0A0
// reference: 9DA333E03F8DA4A9, 9E6056670B0860D8
// reference: 90B86D693F16F9E9, 421F4A649E20D8C3
// reference: 9DA333E0AC100EA0, A6DD429C42F7513F
// reference: 66F44679D0620EDC, 4F7DEC2AD91679DE
// reference: 596C8D8126D040E4, CFE0A56C23A293AF
// program: 19B51132E4AE7A71, 0000000000000000, A3D6CAAAF2971A7F
// program: FA8DE3C2094E8829, 0000000000000000, 8881AC828DC4DA1E
// program: FA8DE3C2094E8829, 0000000000000000, 1757303FCB97082D
// program: BF38A0361D0EE987, 0000000000000000, 78B299F32B4C46BF
// program: BF38A0361D0EE987, 0000000000000000, DE35120CBE92434C
// program: 8A30878796E09312, 0000000000000000, 5B18F4306C380BD5
// program: 63D49B7014AF4E02, 0000000000000000, 562DEA34F82A4C8A
// program: 63D49B7014AF4E02, 0000000000000000, 7AEB6FD8FDA9CF77
// program: BF38A0361D0EE987, 0000000000000000, E132C4933C4FE0A0
// program: BF38A0361D0EE987, 0000000000000000, 9E6056670B0860D8
// program: 8A30878796E09312, 0000000000000000, 421F4A649E20D8C3
// program: BF38A0361D0EE987, 0000000000000000, A6DD429C42F7513F
// program: BF38A0361D0EE987, 0000000000000000, 4F7DEC2AD91679DE
// program: FA8DE3C2094E8829, 0000000000000000, CFE0A56C23A293AF
// shader: 8B30, 4E91FF5C71054CEC
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 surface_normal = 2.0 * (texcolor1).rgb - 1.0;
surface_normal.z = sqrt(max((1.0 - (surface_normal.x*surface_normal.x + surface_normal.y*surface_normal.y)), 0.0));
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
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[0].specular_0) * geo_factor) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
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
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[1].specular_0) * geo_factor) + ((lut_scale_d1 * d1_value) * light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.aaa) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp(min((last_tev_out.rgb) + (texcolor0.rgb), vec3(1)) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp(fma((last_tev_out.rgb), (rounded_primary_color.rgb), (const_color[2].rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(mix((last_tev_out.rgb), (combiner_buffer.rgb), (const_color[3].aaa)), vec3(0), vec3(1)));
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
// shader: 8B30, F904AA1D44E508E7
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = ByteRound(clamp(mix((texcolor1.rgb), (texcolor0.rgb), (texcolor0.aaa)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor0.a) + (texcolor1.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(mix((texcolor2.rgb), (last_tev_out.rgb), (last_tev_out.aaa)), vec3(0), vec3(1)));
float alpha_output_1 = (rounded_primary_color.a);
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
// shader: 8B30, 30EA701FB956C9F3
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
float alpha_output_0 = ByteRound(clamp((1.0 - texcolor0.r) * (const_color[0].a), 0.0, 1.0));
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
// shader: 8B30, 65F8E3F87902D2C0
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (((lut_scale_d1 * d1_value) * light_src[0].specular_1) * geo_factor)) * clamp_highlights * 1.0;
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
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (((lut_scale_d1 * d1_value) * light_src[1].specular_1) * geo_factor)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(mix((texcolor1.rgb), (texcolor0.rgb), (texcolor0.aaa)), vec3(0), vec3(1)));
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((texcolor1.aaa) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp(min((combiner_buffer.rgb) + (last_tev_out.rgb), vec3(1)) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp(fma((last_tev_out.rgb), (rounded_primary_color.rgb), (const_color[3].rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((last_tev_out.rgb), (combiner_buffer.rgb), (const_color[4].aaa)), vec3(0), vec3(1)));
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
// shader: 8B30, BC7B731C0D9E0BAF
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + ((lut_scale_d1 * d1_value) * light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.aaa) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((const_color[0].a) * (const_color[0].a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp(min((last_tev_out.rgb) + (texcolor0.rgb), vec3(1)) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp(fma((last_tev_out.rgb), (rounded_primary_color.rgb), (const_color[2].rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(mix((last_tev_out.rgb), (combiner_buffer.rgb), (const_color[3].aaa)), vec3(0), vec3(1)));
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
// shader: 8B30, 4CA2E2F2CA363D23
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (((lut_scale_d1 * d1_value) * light_src[0].specular_1) * geo_factor)) * clamp_highlights * 1.0;
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
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (((lut_scale_d1 * d1_value) * light_src[1].specular_1) * geo_factor)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.aaa) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp(min((texcolor0.rgb) + (last_tev_out.rgb), vec3(1)) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp(fma((last_tev_out.rgb), (rounded_primary_color.rgb), (const_color[2].rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(mix((last_tev_out.rgb), (combiner_buffer.rgb), (const_color[3].aaa)), vec3(0), vec3(1)));
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
// shader: 8B31, 3402E539B0C3CE88

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
// shader: 8B30, 6E4ADDF8C505E77F
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_3 = ByteRound(clamp((texcolor0.aaa) + (const_color[3].aaa) - vec3(0.5), vec3(0), vec3(1)));
float alpha_output_3 = (texcolor0.a);
last_tev_out = vec4(color_output_3 * 2.0, alpha_output_3 * 2.0);
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
// shader: 8B30, 03E44C532ED80971
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 78451313E25DF14D
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_3 = (texcolor0.rgb);
float alpha_output_3 = (texcolor0.r);
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
// reference: A0ED90D3E5CB40BC, 4E91FF5C71054CEC
// reference: 83660B030A0B4F30, F904AA1D44E508E7
// reference: 2C177E87FA64C19F, 30EA701FB956C9F3
// reference: B7D19065A92488C7, 65F8E3F87902D2C0
// reference: 75389A3FD15DEA1E, BC7B731C0D9E0BAF
// reference: 2F402753509A02AE, 4CA2E2F2CA363D23
// reference: E0B7D7F4CCEFED3E, 3402E539B0C3CE88
// reference: CAE2AA5E337114AE, 7C5A33F69907445E
// reference: 68C1297A60FE79DC, 6E4ADDF8C505E77F
// reference: 8E73286525E932FD, 03E44C532ED80971
// reference: 04B35A2376C49E1C, 78451313E25DF14D
// program: 63D49B7014AF4E02, 0000000000000000, 4E91FF5C71054CEC
// program: 8A30878796E09312, 0000000000000000, F904AA1D44E508E7
// program: BF38A0361D0EE987, 0000000000000000, 30EA701FB956C9F3
// program: 63D49B7014AF4E02, 0000000000000000, 65F8E3F87902D2C0
// program: BF38A0361D0EE987, 0000000000000000, BC7B731C0D9E0BAF
// program: BF38A0361D0EE987, 0000000000000000, 4CA2E2F2CA363D23
// program: 3402E539B0C3CE88, 0000000000000000, 7C5A33F69907445E
// program: 19B51132E4AE7A71, 0000000000000000, 6E4ADDF8C505E77F
// program: 19B51132E4AE7A71, 0000000000000000, 03E44C532ED80971
// program: 19B51132E4AE7A71, 0000000000000000, 78451313E25DF14D
// shader: 8B30, 7B4A6AD307242E17
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (((lut_scale_d1 * d1_value) * light_src[0].specular_1) * geo_factor)) * clamp_highlights * 1.0;
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
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (((lut_scale_d1 * d1_value) * light_src[1].specular_1) * geo_factor)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.aaa) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((const_color[0].a) * (const_color[0].a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp(mix((texcolor0.rgb), (const_color[1].rgb), (texcolor1.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp(min((last_tev_out.rgb) + (combiner_buffer.rgb), vec3(1)) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(fma((last_tev_out.rgb), (rounded_primary_color.rgb), (const_color[3].rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(mix((last_tev_out.rgb), (combiner_buffer.rgb), (const_color[4].aaa)), vec3(0), vec3(1)));
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
// shader: 8B30, 1B464475272BAE78
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(view.xyz)));
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
lut_value = LightingLUTSigned(lut_offset, dot(normal, normalize(view.xyz)));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(view.xyz)));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(mix((const_color[0].rgb), (texcolor0.rgb), (texcolor0.aaa)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp(fma((texcolor0.a), (secondary_fragment_color.a), (secondary_fragment_color.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (vec3(1) - const_color[1].aaa), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp(min((secondary_fragment_color.rgb) + (last_tev_out.rgb), vec3(1)) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(fma((last_tev_out.rgb), (rounded_primary_color.rgb), (const_color[3].rgb)), vec3(0), vec3(1)));
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
// reference: 4FF05E212A16AEAE, 7B4A6AD307242E17
// reference: 42CC414D03B7AAF9, 1B464475272BAE78
// program: 63D49B7014AF4E02, 0000000000000000, 7B4A6AD307242E17
// program: BF38A0361D0EE987, 0000000000000000, 1B464475272BAE78
// shader: 8B30, E09149227532B120
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((const_color[3].rgb) * (vec3(1) - texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((const_color[3].a) * (1.0 - texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = (rounded_primary_color.rgb);
float alpha_output_4 = (texcolor1.r);
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp(mix((const_color[5].rgb), (combiner_buffer.rgb), (texcolor0.rgb)), vec3(0), vec3(1)));
float alpha_output_5 = (last_tev_out.a);
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 471219C536931BDB
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_5 = ByteRound(clamp((rounded_primary_color.rgb) * (const_color[5].rgb), vec3(0), vec3(1)));
float alpha_output_5 = ByteRound(clamp((rounded_primary_color.a) * (const_color[5].a), 0.0, 1.0));
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 8DC220892A8F5FC2
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_4 = (rounded_primary_color.rgb);
float alpha_output_4 = (texcolor1.r);
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp(mix((const_color[5].rgb), (combiner_buffer.rgb), (texcolor0.rgb)), vec3(0), vec3(1)));
float alpha_output_5 = (last_tev_out.a);
last_tev_out = vec4(color_output_5, alpha_output_5);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: FEDBF715FAF63FD8, E09149227532B120
// reference: 12290E866E91418B, 471219C536931BDB
// reference: B6215D666CB70D30, 8DC220892A8F5FC2
// program: 19B51132E4AE7A71, 0000000000000000, E09149227532B120
// program: 19B51132E4AE7A71, 0000000000000000, 471219C536931BDB
// program: 19B51132E4AE7A71, 0000000000000000, 8DC220892A8F5FC2
// shader: 8B30, 785BDCC129033139
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 1FBF1A5ABD9A9CFE
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
// shader: 8B30, 611B29B8912DFEB0
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
// shader: 8B30, 348FB01FAAA91B33
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(half_vector)));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((rounded_primary_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp(mix((const_color[1].aaa), (primary_fragment_color.rgb), (texcolor0.aaa)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (combiner_buffer.rgb), vec3(0), vec3(1)));
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
// shader: 8B30, D71CA287DE75BC67
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(half_vector)));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (light_src[0].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(min((const_color[0].rgb) + (texcolor1.rgb), vec3(1)) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1 * 2.0, alpha_output_1 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp(mix((const_color[2].aaa), (primary_fragment_color.rgb), (texcolor0.aaa)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) * (combiner_buffer.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((secondary_fragment_color.rgb), (texcolor0.aaa), (last_tev_out.rgb)), vec3(0), vec3(1)));
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
// shader: 8B30, C09041CE9D3E3B76
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = ByteRound(clamp(min((const_color[0].rgb) + (texcolor1.rgb), vec3(1)) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
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
// shader: 8B30, 3620146008F98049
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = ByteRound(clamp(fma((texcolor1.aaa), (const_color[0].aaa), (texcolor0.rgb)), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (texcolor1.rgb), vec3(0), vec3(1)));
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
// shader: 8B30, 199E0CC9F3570474
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = (const_color[0].rgb);
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, DCC35CD4B0D9386A
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = (const_color[0].rgb);
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
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, DDB72FB6B1083E94
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = (const_color[0].rgb);
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((texcolor0.aaa) + (const_color[3].aaa) - vec3(0.5), vec3(0), vec3(1)));
float alpha_output_3 = (texcolor0.a);
last_tev_out = vec4(color_output_3 * 2.0, alpha_output_3 * 2.0);
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
// reference: D76EA6EB9F721EEB, 785BDCC129033139
// reference: 43A91D10BC2ADD04, 1FBF1A5ABD9A9CFE
// reference: 16DFBBD6BC2ADD04, 611B29B8912DFEB0
// reference: 1BAD920BCEAC1BF5, 348FB01FAAA91B33
// reference: CB35459EDCAD74CE, D71CA287DE75BC67
// reference: F00C860157FFEDE2, C09041CE9D3E3B76
// reference: 6712F1E918AE55AB, 3620146008F98049
// reference: B7D19065A8E6E2F0, 65F8E3F87902D2C0
// reference: A0ED90D3E4092A8B, 4E91FF5C71054CEC
// reference: 2F40275351586899, 4CA2E2F2CA363D23
// reference: 75389A3FD09F8029, BC7B731C0D9E0BAF
// reference: 43A91D10629B871B, ADB5521579DAF431
// reference: CAE2AA5E32B37E99, 7C5A33F69907445E
// reference: 5CA95A320E700CAE, 199E0CC9F3570474
// reference: 1838D809192A40CA, DCC35CD4B0D9386A
// reference: D76EA6EB9EB074DC, 785BDCC129033139
// reference: 43A91D10BDE8B733, 1FBF1A5ABD9A9CFE
// reference: 16DFBBD6BDE8B733, 611B29B8912DFEB0
// reference: 1BAD920BCF6E71C2, 348FB01FAAA91B33
// reference: CB35459EDD6F1EF9, D71CA287DE75BC67
// reference: F00C8601563D87D5, C09041CE9D3E3B76
// reference: 6712F1E9196C3F9C, 3620146008F98049
// reference: 43A91D106359ED2C, ADB5521579DAF431
// reference: 5CA95A320FB26699, 199E0CC9F3570474
// reference: FE8AD9165C3D0BEB, DDB72FB6B1083E94
// program: BF38A0361D0EE987, 0000000000000000, 785BDCC129033139
// program: BF38A0361D0EE987, 0000000000000000, 1FBF1A5ABD9A9CFE
// program: BF38A0361D0EE987, 0000000000000000, 611B29B8912DFEB0
// program: BF38A0361D0EE987, 0000000000000000, 348FB01FAAA91B33
// program: 63D49B7014AF4E02, 0000000000000000, D71CA287DE75BC67
// program: 63D49B7014AF4E02, 0000000000000000, C09041CE9D3E3B76
// program: 63D49B7014AF4E02, 0000000000000000, 3620146008F98049
// program: BF38A0361D0EE987, 0000000000000000, ADB5521579DAF431
// program: 3402E539B0C3CE88, 0000000000000000, 199E0CC9F3570474
// program: 19B51132E4AE7A71, 0000000000000000, DCC35CD4B0D9386A
// program: 19B51132E4AE7A71, 0000000000000000, DDB72FB6B1083E94
// shader: 8B30, 04792CB3AB20C07A
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
float alpha_output_0 = ByteRound(clamp((const_color[0].a) * (texcolor0.a), 0.0, 1.0));
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
// shader: 8B30, 4196280C5544BEAA
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (texcolor0.a);
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
vec3 color_output_2 = ByteRound(clamp(fma((rounded_primary_color.aaa), (secondary_fragment_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
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
// shader: 8B30, 8B3D7DA0253A581B
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = ByteRound(clamp(fma((texcolor0.rgb), (const_color[0].aaa), (const_color[0].rgb)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (secondary_fragment_color.r), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.aaa) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp(fma((combiner_buffer.rgb), (primary_fragment_color.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) * (texcolor0.aaa), vec3(0), vec3(1)));
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
// shader: 8B30, 0688E321F2655302
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 surface_normal = 2.0 * (texcolor1).rgb - 1.0;
surface_normal.z = sqrt(max((1.0 - (surface_normal.x*surface_normal.x + surface_normal.y*surface_normal.y)), 0.0));
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
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
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
// shader: 8B31, A44053E7E7279BF8

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
vec4 tmp_reg14;
vec4 tmp_reg15;
bool ExecVS() {
tmp_reg14 = vec4(0, 0, 0, 1);
tmp_reg15 = vec4(0, 0, 0, 1);
Vfn0();
return true;
}

bool Vfn0() {
tmp_reg14 = vs_pica.f[85].xxxz;
tmp_reg15 = vs_pica.f[85].xxxz;
tmp_reg14.xyz = (vs_in_reg0.xyzz).xyz;
tmp_reg15.x = dot_s(vs_pica.f[25], tmp_reg14);
tmp_reg15.y = dot_s(vs_pica.f[26], tmp_reg14);
tmp_reg15.z = dot_s(vs_pica.f[27], tmp_reg14);
tmp_reg14.x = dot_s(vs_pica.f[90], tmp_reg15);
tmp_reg14.y = dot_s(vs_pica.f[91], tmp_reg15);
tmp_reg14.z = dot_s(vs_pica.f[92], tmp_reg15);
vs_out_reg0.x = dot_s(vs_pica.f[86], tmp_reg14);
vs_out_reg0.y = dot_s(vs_pica.f[87], tmp_reg14);
vs_out_reg0.z = dot_s(vs_pica.f[88], tmp_reg14);
vs_out_reg0.w = dot_s(vs_pica.f[89], tmp_reg14);
vs_out_reg4 = -tmp_reg14;
vs_out_reg1 = vs_in_reg2;
vs_out_reg2 = vs_in_reg1.xyyy;
vs_out_reg3 = vs_pica.f[85].zzzz;
return true;
}
// shader: 8B30, A3E92CB2D541ED0E
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
// shader: 8B30, ADB5521500143290
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
// shader: 8B30, E76AD4C9A0C2BF96
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) - (const_color[0].aaa), vec3(0), vec3(1)));
float alpha_output_0 = (texcolor0.r);
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(mix((const_color[1].rgb), (combiner_buffer.rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 2DD312B897DE6C4E
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = ByteRound(clamp((texcolor1.rgb) * (const_color[0].rrr), vec3(0), vec3(1)));
float alpha_output_0 = (1.0 - rounded_primary_color.r);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp(fma((vec3(1) - texcolor1.rgb), (const_color[1].ggg), (texcolor2.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((texcolor0.r) * (const_color[1].a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rrr), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp(fma((const_color[2].b), (texcolor2.r), (last_tev_out.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) + (combiner_buffer.rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((last_tev_out.a) + (combiner_buffer.a), 0.0, 1.0));
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 43A91D10C86FFE77, 04792CB3AB20C07A
// reference: 95B8FC5C58FCA6D4, 4196280C5544BEAA
// reference: C54F64AA7D4F8199, 8B3D7DA0253A581B
// reference: A595C75EC58BB423, 0688E321F2655302
// reference: E9F604E3C067C36C, A44053E7E7279BF8
// reference: CDAB367A6859CA24, 15C7483CDCAC839B
// reference: 9D18470F79CBA7E2, A3E92CB2D541ED0E
// reference: FB0BF5706359ED2C, ADB5521500143290
// reference: 9DA926ADE384B602, E76AD4C9A0C2BF96
// reference: A785E202AFF7EA89, 2DD312B897DE6C4E
// program: BF38A0361D0EE987, 0000000000000000, 04792CB3AB20C07A
// program: BF38A0361D0EE987, 0000000000000000, 4196280C5544BEAA
// program: BF38A0361D0EE987, 0000000000000000, 8B3D7DA0253A581B
// program: 63D49B7014AF4E02, 0000000000000000, 0688E321F2655302
// program: A44053E7E7279BF8, 0000000000000000, 15C7483CDCAC839B
// program: A44053E7E7279BF8, 0000000000000000, A3E92CB2D541ED0E
// program: BF38A0361D0EE987, 0000000000000000, ADB5521500143290
// program: BF38A0361D0EE987, 0000000000000000, E76AD4C9A0C2BF96
// program: 8A30878796E09312, 0000000000000000, 2DD312B897DE6C4E
// shader: 8B30, A3BB6C81F469110B
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = ByteRound(clamp((primary_fragment_color.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp(mix((const_color[1].rgb), (combiner_buffer.aaa), (texcolor0.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp((combiner_buffer.rgb) * (last_tev_out.rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(fma((secondary_fragment_color.rgb), (rounded_primary_color.aaa), (last_tev_out.rgb)), vec3(0), vec3(1)));
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
// reference: CEF608499E97D7B1, A3BB6C81F469110B
// program: BF38A0361D0EE987, 0000000000000000, A3BB6C81F469110B
// shader: 8B30, 72F0E134908882E5
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (((lut_scale_d1 * d1_value) * light_src[0].specular_1) * geo_factor)) * clamp_highlights * 1.0;
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
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (((lut_scale_d1 * d1_value) * light_src[1].specular_1) * geo_factor)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(mix((texcolor1.rgb), (texcolor0.rgb), (texcolor0.aaa)), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor1.a) - (const_color[0].a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 1.0, alpha_output_0 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.aaa) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp(min((combiner_buffer.rgb) + (last_tev_out.rgb), vec3(1)) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_2 = (texcolor1.a);
last_tev_out = vec4(color_output_2 * 1.0, alpha_output_2 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp(mix((texcolor1.rgb), (last_tev_out.rgb), (last_tev_out.aaa)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((last_tev_out.rgb), (rounded_primary_color.rgb), (const_color[4].rgb)), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp(mix((last_tev_out.rgb), (combiner_buffer.rgb), (const_color[5].aaa)), vec3(0), vec3(1)));
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
// shader: 8B30, 47B86D46650D39E7
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(half_vector)));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[0].specular_0) * geo_factor) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
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
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTSigned(lut_offset, dot(light_vector, normal));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[1].specular_0) * geo_factor) + ((lut_scale_d1 * d1_value) * light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.aaa) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp(min((last_tev_out.rgb) + (texcolor0.rgb), vec3(1)) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp(fma((last_tev_out.rgb), (rounded_primary_color.rgb), (const_color[2].rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(mix((last_tev_out.rgb), (combiner_buffer.rgb), (const_color[3].aaa)), vec3(0), vec3(1)));
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
// shader: 8B30, B22AD8C937B3963B
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + ((lut_scale_d1 * d1_value) * light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.aaa) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((const_color[0].a) * (const_color[0].a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp(min((last_tev_out.rgb) + (texcolor0.rgb), vec3(1)) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp(min((last_tev_out.rgb) + (const_color[2].rgb), vec3(1)) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(mix((last_tev_out.rgb), (combiner_buffer.rgb), (const_color[3].aaa)), vec3(0), vec3(1)));
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
// reference: 2F48BE9FE3D6886C, 72F0E134908882E5
// reference: 3288B9F86B89F182, 47B86D46650D39E7
// reference: D73E42E00D71E52A, B22AD8C937B3963B
// program: 63D49B7014AF4E02, 0000000000000000, 72F0E134908882E5
// program: BF38A0361D0EE987, 0000000000000000, 47B86D46650D39E7
// program: BF38A0361D0EE987, 0000000000000000, B22AD8C937B3963B
// shader: 8B30, 18E255B396ABA298
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = (const_color[0].rgb);
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = (texcolor0.rgb);
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
// shader: 8B30, 0D66D6771F4D81BE
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + ((lut_scale_d1 * d1_value) * light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.aaa) - (const_color[0].aaa), vec3(0), vec3(1)));
float alpha_output_0 = (texcolor0.a);
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(min((last_tev_out.rgb) + (texcolor0.rgb), vec3(1)) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
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
// shader: 8B30, 08CC7E16173A84D1
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + ((lut_scale_d1 * d1_value) * light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.aaa) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (texcolor0.a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(min((last_tev_out.rgb) + (texcolor0.rgb), vec3(1)) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (const_color[1].r);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(fma((texcolor1.rrr), (const_color[3].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(fma((texcolor1.ggg), (const_color[4].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp(fma((texcolor1.bbb), (const_color[5].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
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
// shader: 8B30, 46BDD13CE6B061E4
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = ByteRound(clamp((texcolor0.rrr) * (const_color[0].rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor0.r) * (const_color[0].a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 4.0, alpha_output_0 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp((texcolor0.ggg) * (const_color[1].rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((texcolor0.g) * (const_color[1].a), 0.0, 1.0));
last_tev_out = vec4(color_output_1 * 4.0, alpha_output_1 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) + (combiner_buffer.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((last_tev_out.a) + (combiner_buffer.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_3 = ByteRound(clamp((texcolor0.bbb) * (const_color[3].rgb), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((texcolor0.b) * (const_color[3].a), 0.0, 1.0));
last_tev_out = vec4(color_output_3 * 4.0, alpha_output_3 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_4 = ByteRound(clamp((last_tev_out.rgb) + (combiner_buffer.rgb), vec3(0), vec3(1)));
float alpha_output_4 = ByteRound(clamp((last_tev_out.a) + (combiner_buffer.a), 0.0, 1.0));
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
// shader: 8B30, 533AD301ADCEF63B
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (texcolor2.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((texcolor1.aaa), (const_color[1].aaa), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (texcolor1.rgb), vec3(0), vec3(1)));
float alpha_output_2 = (const_color[2].a);
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
// shader: 8B30, 8190052D2AFA9944
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = ByteRound(clamp((texcolor0.rgb) * (texcolor2.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.a);
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(fma((texcolor1.aaa), (const_color[1].aaa), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) * (texcolor1.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((const_color[2].a) * (rounded_primary_color.a), 0.0, 1.0));
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
// reference: C253E40A4A07EC2B, 18E255B396ABA298
// reference: 1ED3DE5067A0E22C, 0D66D6771F4D81BE
// reference: C18CB322A50691F3, 08CC7E16173A84D1
// reference: EAC70ACDCD48DCA3, 46BDD13CE6B061E4
// reference: 5620E31B903DED82, 533AD301ADCEF63B
// reference: B9551A870A48A6D1, 8190052D2AFA9944
// program: 19B51132E4AE7A71, 0000000000000000, 18E255B396ABA298
// program: BF38A0361D0EE987, 0000000000000000, 0D66D6771F4D81BE
// program: 63D49B7014AF4E02, 0000000000000000, 08CC7E16173A84D1
// program: BF38A0361D0EE987, 0000000000000000, 46BDD13CE6B061E4
// program: 8A30878796E09312, 0000000000000000, 533AD301ADCEF63B
// program: 8A30878796E09312, 0000000000000000, 8190052D2AFA9944
// shader: 8B30, 7562C00B08273444
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = ByteRound(clamp((const_color[0].rgb) + (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (rounded_primary_color.r);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) + (texcolor1.aaa), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) - (combiner_buffer.rgb), vec3(0), vec3(1)));
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
// shader: 8B30, F999B1909EC7A2DB
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
// reference: BC7104AAECBC6DC9, 7562C00B08273444
// reference: 16DFBBD68668E5A9, F999B1909EC7A2DB
// program: 63D49B7014AF4E02, 0000000000000000, 7562C00B08273444
// program: 0000000000000000, 0000000000000000, F999B1909EC7A2DB
// shader: 8B30, 09F796640697C58E
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((light_src[0].specular_1) * geo_factor)) * clamp_highlights * 1.0;
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
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + ((light_src[1].specular_1) * geo_factor)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(min((secondary_fragment_color.rgb) + (texcolor0.rgb), vec3(1)) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (texcolor0.a);
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
// reference: EBF3C83F56645518, 09F796640697C58E
// program: BF38A0361D0EE987, 0000000000000000, 09F796640697C58E
// shader: 8B30, 577D2F83ACFF87FE
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
float alpha_output_0 = ByteRound(clamp((texcolor0.a) - (1.0 - rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 1.0, alpha_output_0 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, CFB32915327398FD
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + (((lut_scale_d1 * d1_value) * light_src[0].specular_1) * geo_factor)) * clamp_highlights * 1.0;
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
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (((lut_scale_d1 * d1_value) * light_src[1].specular_1) * geo_factor)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.aaa) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp(min((last_tev_out.rgb) + (texcolor0.rgb), vec3(1)) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
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
// reference: FE43DBF0F77B1B97, 577D2F83ACFF87FE
// reference: 381F84DB70A53925, CFB32915327398FD
// program: 3402E539B0C3CE88, 0000000000000000, 577D2F83ACFF87FE
// program: BF38A0361D0EE987, 0000000000000000, CFB32915327398FD
// shader: 8B31, C2A07D015EDEA037

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
vec4 tmp_reg2;
vec4 tmp_reg3;
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
tmp_reg10.x = (vs_pica.f[30].xxxx + -vs_in_reg0.wwww).x;
tmp_reg10.x = (max_s(vs_pica.f[70].xxxx, tmp_reg10.xxxx)).x;
tmp_reg10.y = (mul_s(vs_pica.f[28].yyyy, tmp_reg10.xxxx)).y;
tmp_reg1 = mul_s(tmp_reg10.yyyy, vs_in_reg1.xyzz);
tmp_reg14.xyz = (vs_in_reg0.xyzz + tmp_reg1).xyz;
tmp_reg0.x = (tmp_reg10.xxxx).x;
tmp_reg0.x = (mul_s(tmp_reg0.xxxx, tmp_reg0.xxxx)).x;
tmp_reg0.x = (mul_s(vs_pica.f[28].xxxx, tmp_reg0.xxxx)).x;
tmp_reg14.y = (tmp_reg14.yyyy + tmp_reg0.xxxx).y;
tmp_reg1.x = (vs_pica.f[31].zzzz).x;
bool_regs.x = tmp_reg10.x < tmp_reg1.x;
bool_regs.y = tmp_reg10.y == tmp_reg1.y;
if (bool_regs.x) {
tmp_reg1.y = (mul_s(vs_pica.f[32].wwww, tmp_reg10.xxxx)).y;
tmp_reg0.z = (vs_pica.f[32].yyyy).z;
tmp_reg1.w = (vs_pica.f[32].xxxx).w;
tmp_reg12.x = (tmp_reg0.zzzz + -tmp_reg1.wwww).x;
tmp_reg12.x = (fma_s(tmp_reg12, tmp_reg1.yyyy, tmp_reg1.wwww)).x;
tmp_reg12.x = (max_s(vs_pica.f[70].xxxx, tmp_reg12.xxxx)).x;
} else {
tmp_reg2.y = (-vs_pica.f[31].zzzz + tmp_reg10.xxxx).y;
tmp_reg1.y = (mul_s(vs_pica.f[31].wwww, tmp_reg2.yyyy)).y;
tmp_reg0.z = (vs_pica.f[32].zzzz).z;
tmp_reg1.w = (vs_pica.f[32].yyyy).w;
tmp_reg12.x = (tmp_reg0.zzzz + -tmp_reg1.wwww).x;
tmp_reg12.x = (fma_s(tmp_reg12, tmp_reg1.yyyy, tmp_reg1.wwww)).x;
tmp_reg12.x = (max_s(vs_pica.f[70].xxxx, tmp_reg12.xxxx)).x;
}
tmp_reg0.xyz = (-vs_pica.f[33].xyzz + tmp_reg14.xyzz).xyz;
tmp_reg3.x = dot_s(tmp_reg0.xyzz, tmp_reg0.xyzz);
tmp_reg3.x = rsq_s(tmp_reg3.x);
tmp_reg3.xyz = (mul_s(tmp_reg0.xyzz, tmp_reg3.xxxx)).xyz;
tmp_reg1.x = dot_s(vs_in_reg1.xyzz, vs_in_reg1.xyzz);
tmp_reg1.x = rsq_s(tmp_reg1.x);
tmp_reg1.xyz = (mul_s(vs_in_reg1.xyzz, tmp_reg1.xxxx)).xyz;
tmp_reg0.xyz = (mul_s(tmp_reg1.yzxx, tmp_reg3.zxyy)).xyz;
tmp_reg0.xyz = (fma_s(-tmp_reg3.yzxx, tmp_reg1.zxyy, tmp_reg0)).xyz;
tmp_reg1.x = dot_s(tmp_reg0.xyzz, tmp_reg0.xyzz);
tmp_reg1.x = rsq_s(tmp_reg1.x);
tmp_reg1.xyz = (mul_s(tmp_reg0.xyzz, tmp_reg1.xxxx)).xyz;
tmp_reg0.xyz = (mul_s(tmp_reg1.xyzz, vs_in_reg1.wwww)).xyz;
tmp_reg0.xyz = (mul_s(vs_pica.f[28].wwww, tmp_reg0.xyzz)).xyz;
tmp_reg0.xyz = (mul_s(tmp_reg0.xyzz, tmp_reg12.xxxx)).xyz;
tmp_reg14.xyz = (tmp_reg14.xyzz + tmp_reg0.xyzz).xyz;
tmp_reg14.w = (vs_pica.f[70].zzzz).w;
tmp_reg15.w = (vs_pica.f[70].zzzz).w;
tmp_reg15.x = dot_s(vs_pica.f[25], tmp_reg14);
tmp_reg15.y = dot_s(vs_pica.f[26], tmp_reg14);
tmp_reg15.z = dot_s(vs_pica.f[27], tmp_reg14);
tmp_reg14.x = dot_s(vs_pica.f[90], tmp_reg15);
tmp_reg14.y = dot_s(vs_pica.f[91], tmp_reg15);
tmp_reg14.z = dot_s(vs_pica.f[92], tmp_reg15);
tmp_reg13 = vs_pica.f[29];
tmp_reg0.x = (-vs_pica.f[31].xxxx + tmp_reg10.xxxx).x;
tmp_reg0.x = (max_s(vs_pica.f[70].xxxx, tmp_reg0.xxxx)).x;
tmp_reg0.x = (mul_s(vs_pica.f[31].yyyy, tmp_reg0.xxxx)).x;
tmp_reg0.x = (vs_pica.f[70].zzzz + -tmp_reg0.xxxx).x;
tmp_reg0.x = (max_s(vs_pica.f[70].xxxx, tmp_reg0.xxxx)).x;
tmp_reg13.w = (mul_s(tmp_reg13.wwww, tmp_reg0.xxxx)).w;
tmp_reg0.x = (-vs_pica.f[30].yyyy + -tmp_reg14.zzzz).x;
tmp_reg0.x = (mul_s(vs_pica.f[30].zzzz, tmp_reg0.xxxx)).x;
tmp_reg1.x = (vs_pica.f[70].zzzz).x;
tmp_reg1.y = (-vs_pica.f[70].xxxx + tmp_reg1.xxxx).y;
tmp_reg1.y = (fma_s(tmp_reg1, tmp_reg0.xxxx, vs_pica.f[70].xxxx)).y;
tmp_reg1.y = (max_s(vs_pica.f[70].xxxx, tmp_reg1.yyyy)).y;
tmp_reg1.y = (min_s(vs_pica.f[70].zzzz, tmp_reg1.yyyy)).y;
tmp_reg13.w = (mul_s(tmp_reg13.wwww, tmp_reg1.yyyy)).w;
tmp_reg11.x = (vs_in_reg1.wwww).x;
tmp_reg11.x = (max_s(vs_pica.f[70].xxxx, tmp_reg11.xxxx)).x;
tmp_reg11.y = (mul_s(vs_pica.f[33].wwww, tmp_reg10.xxxx)).y;
vs_out_reg0.x = dot_s(vs_pica.f[86], tmp_reg14);
vs_out_reg0.y = dot_s(vs_pica.f[87], tmp_reg14);
vs_out_reg0.z = dot_s(vs_pica.f[88], tmp_reg14);
vs_out_reg0.w = dot_s(vs_pica.f[89], tmp_reg14);
vs_out_reg1 = tmp_reg11.xyyy;
vs_out_reg2 = tmp_reg13;
return true;
}
// shader: 8B30, 0628CA05D636B709
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
// reference: 4DC36607063A7C24, C2A07D015EDEA037
// reference: 0C1A2B476FE8F21E, 0628CA05D636B709
// program: C2A07D015EDEA037, 0000000000000000, 0628CA05D636B709
// shader: 8B30, C0344B5176870A5D
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + ((lut_scale_d1 * d1_value) * light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.aaa) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((const_color[0].a) * (const_color[0].a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp(mix((const_color[1].aaa), (const_color[1].rgb), (texcolor1.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp(fma((last_tev_out.rgb), (texcolor0.rgb), (combiner_buffer.rgb)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp(mix((last_tev_out.rgb), (combiner_buffer.rgb), (texcolor1.rgb)), vec3(0), vec3(1)));
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
// reference: 62D491710E45ACE6, C0344B5176870A5D
// program: 63D49B7014AF4E02, 0000000000000000, C0344B5176870A5D
// shader: 8B30, CC663C31604A12AA
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + ((lut_scale_d1 * d1_value) * light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.aaa) - (const_color[0].aaa), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((const_color[0].a) * (const_color[0].a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(min((last_tev_out.rgb) + (texcolor0.rgb), vec3(1)) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_2 = (texcolor0.a);
last_tev_out = vec4(color_output_2 * 1.0, alpha_output_2 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_3 = ByteRound(clamp((vec3(1) - last_tev_out.aaa) * (texcolor0.rgb), vec3(0), vec3(1)));
float alpha_output_3 = (last_tev_out.a);
last_tev_out = vec4(color_output_3 * 2.0, alpha_output_3 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_4 = ByteRound(clamp(min((last_tev_out.rgb) + (combiner_buffer.rgb), vec3(1)) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
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
// reference: 0D1B5AB0DD62113C, CC663C31604A12AA
// program: BF38A0361D0EE987, 0000000000000000, CC663C31604A12AA
// shader: 8B30, 199E0CC9BFEA3A30
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = (const_color[0].rgb);
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.g), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 9C49FF670FB26699, 199E0CC9BFEA3A30
// program: 3402E539B0C3CE88, 0000000000000000, 199E0CC9BFEA3A30
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
// shader: 8B30, 604AF07EAD6F2616
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
float alpha_output_0 = ByteRound(clamp((texcolor0.g) - (1.0 - rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 1.0, alpha_output_0 * 2.0);
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
// reference: 8218002DA5302646, E9645DA51C12D048
// reference: 0A020F0B337114AE, 3D3906209907445E
// reference: 4C52BF8038F9CB54, 604AF07EAD6F2616
// reference: 1F96958FFCF3C46D, 6126C978B2081524
// program: 3402E539B0C3CE88, 0000000000000000, E9645DA51C12D048
// program: 3402E539B0C3CE88, 0000000000000000, 3D3906209907445E
// program: 3402E539B0C3CE88, 0000000000000000, 604AF07EAD6F2616
// program: 3402E539B0C3CE88, 0000000000000000, 6126C978B2081524
// shader: 8B30, 0F494A2B54D26658
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
float alpha_output_0 = ByteRound(clamp((texcolor0.a) - (1.0 - rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 1.0, alpha_output_0 * 2.0);
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
// reference: D46A0E2F38F9CB54, 0F494A2B54D26658
// reference: 35BF4050337114AE, BED3A4D0733B62E4
// program: 3402E539B0C3CE88, 0000000000000000, 0F494A2B54D26658
// program: 3402E539B0C3CE88, 0000000000000000, BED3A4D0733B62E4
// shader: 8B30, BED3A4D0959D5EBC
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.g), 0.0, 1.0));
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
// shader: 8B30, 10DBF1CFB2081524
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.g), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, 75A7E301AD6F2616
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
float alpha_output_0 = ByteRound(clamp((texcolor0.a) - (1.0 - rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 1.0, alpha_output_0 * 2.0);
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
// reference: F55FE505337114AE, BED3A4D0959D5EBC
// reference: DF7630DAFCF3C46D, 10DBF1CFB2081524
// reference: 2B37E42138F9CB54, 75A7E301AD6F2616
// program: 0000000000000000, 0000000000000000, BED3A4D0959D5EBC
// program: 3402E539B0C3CE88, 0000000000000000, 10DBF1CFB2081524
// program: 3402E539B0C3CE88, 0000000000000000, 75A7E301AD6F2616
// program: 0000000000000000, 0000000000000000, 7C5A33F69907445E
// shader: 8B31, D7B3906330D68927

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
vec4 tmp_reg3;
vec4 tmp_reg4;
vec4 tmp_reg5;
vec4 tmp_reg6;
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
tmp_reg0.x = (mul_s(vs_pica.f[31].wwww, vs_in_reg0.wwww)).x;
tmp_reg10.x = (vs_pica.f[30].xxxx + tmp_reg0.xxxx).x;
tmp_reg1 = mul_s(vs_pica.f[31], tmp_reg10.xxxx);
tmp_reg1 = mul_s(vs_pica.f[66], tmp_reg1);
tmp_reg1 = vs_pica.f[68] + tmp_reg1;
tmp_reg0 = floor(tmp_reg1);
tmp_reg0 = tmp_reg1 + -tmp_reg0;
tmp_reg0 = -vs_pica.f[68] + tmp_reg0;
tmp_reg1 = mul_s(vs_pica.f[67], tmp_reg0);
tmp_reg2 = vs_pica.f[95];
tmp_reg3 = vs_pica.f[94];
tmp_reg4.z = (mul_s(tmp_reg1.xxxx, tmp_reg1.xxxx)).z;
tmp_reg4.xy = (fma_s(tmp_reg4.zzzz, tmp_reg2.xyyy, tmp_reg2.zwww)).xy;
tmp_reg4.xy = (fma_s(tmp_reg4.zzzz, tmp_reg4.xyyy, tmp_reg3.xyyy)).xy;
tmp_reg4.xy = (fma_s(tmp_reg4.zzzz, tmp_reg4.xyyy, tmp_reg3.zwww)).xy;
tmp_reg2 = vs_pica.f[93];
tmp_reg4.xy = (fma_s(tmp_reg4.zzzz, tmp_reg4.xyyy, tmp_reg2.xyyy)).xy;
tmp_reg4.xy = (fma_s(tmp_reg4.zzzz, tmp_reg4.xyyy, tmp_reg2.zwww)).xy;
tmp_reg4.y = (mul_s(tmp_reg4.yyyy, tmp_reg1.xxxx)).y;
tmp_reg2 = vs_pica.f[95];
tmp_reg3 = vs_pica.f[94];
tmp_reg5.z = (mul_s(tmp_reg1.yyyy, tmp_reg1.yyyy)).z;
tmp_reg5.xy = (fma_s(tmp_reg5.zzzz, tmp_reg2.xyyy, tmp_reg2.zwww)).xy;
tmp_reg5.xy = (fma_s(tmp_reg5.zzzz, tmp_reg5.xyyy, tmp_reg3.xyyy)).xy;
tmp_reg5.xy = (fma_s(tmp_reg5.zzzz, tmp_reg5.xyyy, tmp_reg3.zwww)).xy;
tmp_reg2 = vs_pica.f[93];
tmp_reg5.xy = (fma_s(tmp_reg5.zzzz, tmp_reg5.xyyy, tmp_reg2.xyyy)).xy;
tmp_reg5.xy = (fma_s(tmp_reg5.zzzz, tmp_reg5.xyyy, tmp_reg2.zwww)).xy;
tmp_reg5.y = (mul_s(tmp_reg5.yyyy, tmp_reg1.yyyy)).y;
tmp_reg2 = vs_pica.f[95];
tmp_reg3 = vs_pica.f[94];
tmp_reg6.z = (mul_s(tmp_reg1.zzzz, tmp_reg1.zzzz)).z;
tmp_reg6.xy = (fma_s(tmp_reg6.zzzz, tmp_reg2.xyyy, tmp_reg2.zwww)).xy;
tmp_reg6.xy = (fma_s(tmp_reg6.zzzz, tmp_reg6.xyyy, tmp_reg3.xyyy)).xy;
tmp_reg6.xy = (fma_s(tmp_reg6.zzzz, tmp_reg6.xyyy, tmp_reg3.zwww)).xy;
tmp_reg2 = vs_pica.f[93];
tmp_reg6.xy = (fma_s(tmp_reg6.zzzz, tmp_reg6.xyyy, tmp_reg2.xyyy)).xy;
tmp_reg6.xy = (fma_s(tmp_reg6.zzzz, tmp_reg6.xyyy, tmp_reg2.zwww)).xy;
tmp_reg6.y = (mul_s(tmp_reg6.yyyy, tmp_reg1.zzzz)).y;
tmp_reg4.y = (tmp_reg5.xxxx).y;
tmp_reg4.z = (tmp_reg6.xxxx).z;
tmp_reg8 = mul_s(vs_pica.f[32], tmp_reg4);
tmp_reg9 = vs_in_reg0;
tmp_reg9.y = (mul_s(vs_pica.f[33].xxxx, vs_in_reg0.yyyy)).y;
tmp_reg14.xyz = (tmp_reg9.xyzz + tmp_reg8.xyzz).xyz;
tmp_reg1 = vs_pica.f[28].xyzz + tmp_reg14.xyzz;
tmp_reg9 = tmp_reg1;
tmp_reg0 = floor(tmp_reg1);
tmp_reg0 = tmp_reg1 + -tmp_reg0;
tmp_reg0 = mul_s(vs_pica.f[69].wwww, tmp_reg0);
tmp_reg14 = -vs_pica.f[69].zzzz + tmp_reg0;
tmp_reg9.y = (mul_s(vs_pica.f[33].yyyy, tmp_reg9.yyyy)).y;
tmp_reg0 = floor(tmp_reg9);
tmp_reg0 = tmp_reg9 + -tmp_reg0;
tmp_reg9.y = (mul_s(vs_pica.f[33].xxxx, tmp_reg0.yyyy)).y;
tmp_reg9.y = (mul_s(vs_pica.f[69].wwww, tmp_reg9.yyyy)).y;
tmp_reg9.y = (-vs_pica.f[33].xxxx + tmp_reg9.yyyy).y;
tmp_reg14.y = (tmp_reg9.yyyy).y;
tmp_reg14.w = (vs_pica.f[66].wwww).w;
tmp_reg15.w = (vs_pica.f[66].wwww).w;
tmp_reg15.x = dot_s(vs_pica.f[25], tmp_reg14);
tmp_reg15.y = dot_s(vs_pica.f[26], tmp_reg14);
tmp_reg15.z = dot_s(vs_pica.f[27], tmp_reg14);
tmp_reg14.x = dot_s(vs_pica.f[90], tmp_reg15);
tmp_reg14.y = dot_s(vs_pica.f[91], tmp_reg15);
tmp_reg14.z = dot_s(vs_pica.f[92], tmp_reg15);
tmp_reg0.xy = (-vs_pica.f[69].yyyy + vs_in_reg1.xyyy).xy;
tmp_reg0.xy = (mul_s(vs_pica.f[28].wwww, tmp_reg0.xyyy)).xy;
tmp_reg0.z = (vs_pica.f[69].xxxx).z;
tmp_reg10.x = (vs_pica.f[69].zzzz).x;
tmp_reg10.y = (vs_pica.f[69].xxxx).y;
tmp_reg10.z = (vs_pica.f[69].xxxx).z;
tmp_reg11.x = (vs_pica.f[69].xxxx).x;
tmp_reg11.y = (tmp_reg6.xxxx).y;
tmp_reg11.z = (tmp_reg6.yyyy).z;
tmp_reg12.x = (vs_pica.f[69].xxxx).x;
tmp_reg12.y = (-tmp_reg6.yyyy).y;
tmp_reg12.z = (tmp_reg6.xxxx).z;
tmp_reg1.x = dot_3(tmp_reg0.xyz, tmp_reg10.xyz);
tmp_reg1.y = dot_3(tmp_reg0.xyz, tmp_reg11.xyz);
tmp_reg1.z = dot_3(tmp_reg0.xyz, tmp_reg12.xyz);
tmp_reg10.x = (tmp_reg4.xxxx).x;
tmp_reg10.y = (tmp_reg4.yyyy).y;
tmp_reg10.z = (vs_pica.f[69].xxxx).z;
tmp_reg11.x = (-tmp_reg4.yyyy).x;
tmp_reg11.y = (tmp_reg4.xxxx).y;
tmp_reg11.z = (vs_pica.f[69].xxxx).z;
tmp_reg12.x = (vs_pica.f[69].xxxx).x;
tmp_reg12.y = (vs_pica.f[69].xxxx).y;
tmp_reg12.z = (vs_pica.f[69].zzzz).z;
tmp_reg0.x = dot_3(tmp_reg1.xyz, tmp_reg10.xyz);
tmp_reg0.y = dot_3(tmp_reg1.xyz, tmp_reg11.xyz);
tmp_reg0.z = dot_3(tmp_reg1.xyz, tmp_reg12.xyz);
tmp_reg14.xy = (tmp_reg14.xyyy + tmp_reg0.xyzz).xy;
tmp_reg0.x = (vs_pica.f[33].zzzz + -tmp_reg14.zzzz).x;
tmp_reg0.y = (vec4(lessThan(tmp_reg0.xxxx, vs_pica.f[69].xxxx))).y;
tmp_reg1.x = (mul_s(vs_pica.f[33].wwww, tmp_reg0.xxxx)).x;
tmp_reg1.y = (vs_pica.f[32].wwww + -tmp_reg1.xxxx).y;
tmp_reg1.z = (tmp_reg14.zzzz + -tmp_reg1.yyyy).z;
tmp_reg0.z = (mul_s(tmp_reg1.zzzz, tmp_reg0.yyyy)).z;
tmp_reg14.z = (tmp_reg14.zzzz + -tmp_reg0.zzzz).z;
tmp_reg13 = vs_pica.f[29];
tmp_reg0.x = (-vs_pica.f[30].yyyy + -tmp_reg14.zzzz).x;
tmp_reg0.x = (mul_s(vs_pica.f[30].zzzz, tmp_reg0.xxxx)).x;
tmp_reg1.x = (vs_pica.f[69].zzzz).x;
tmp_reg1.y = (-vs_pica.f[69].xxxx + tmp_reg1.xxxx).y;
tmp_reg1.y = (fma_s(tmp_reg1, tmp_reg0.xxxx, vs_pica.f[69].xxxx)).y;
tmp_reg1.y = (max_s(vs_pica.f[69].xxxx, tmp_reg1.yyyy)).y;
tmp_reg1.y = (min_s(vs_pica.f[69].zzzz, tmp_reg1.yyyy)).y;
tmp_reg13.w = (mul_s(tmp_reg13.wwww, tmp_reg1.yyyy)).w;
tmp_reg0 = vs_in_reg1;
tmp_reg1.x = (vs_pica.f[30].wwww).x;
tmp_reg2.x = (vs_pica.f[69].zzzz).x;
bool_regs = equal(tmp_reg1.xy, tmp_reg2.xy);
if (!bool_regs.x) {
tmp_reg0.w = (vs_pica.f[69].wwww).w;
tmp_reg0.w = (mul_s(vs_pica.f[69].wwww, tmp_reg0.wwww)).w;
tmp_reg0.w = (mul_s(vs_in_reg0.wwww, tmp_reg0.wwww)).w;
tmp_reg0.w = (floor(tmp_reg0.wwww)).w;
tmp_reg0.z = (mul_s(vs_pica.f[30].wwww, tmp_reg0.wwww)).z;
tmp_reg0.x = (mul_s(vs_pica.f[30].wwww, tmp_reg0.xxxx)).x;
tmp_reg0.x = (tmp_reg0.xxxx + tmp_reg0.zzzz).x;
}
vs_out_reg0.x = dot_s(vs_pica.f[86], tmp_reg14);
vs_out_reg0.y = dot_s(vs_pica.f[87], tmp_reg14);
vs_out_reg0.z = dot_s(vs_pica.f[88], tmp_reg14);
vs_out_reg0.w = dot_s(vs_pica.f[89], tmp_reg14);
vs_out_reg1 = tmp_reg13;
vs_out_reg2 = tmp_reg0.xyyy;
return true;
}
// reference: 678017E416040E84, D7B3906330D68927
// program: D7B3906330D68927, 0000000000000000, F999B1909EC7A2DB
// shader: 8B30, 04085CCE3E3F06BC
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + ((lut_scale_d1 * d1_value) * light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.aaa) - (const_color[0].aaa), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((const_color[0].a) * (const_color[0].a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 2.0, alpha_output_0 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_2 = ByteRound(clamp(min((last_tev_out.rgb) + (texcolor0.rgb), vec3(1)) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_2 = (texcolor0.a);
last_tev_out = vec4(color_output_2 * 1.0, alpha_output_2 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(mix((texcolor0.rgb), (last_tev_out.rgb), (last_tev_out.aaa)), vec3(0), vec3(1)));
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
// reference: FB48C4C60197105F, 04085CCE3E3F06BC
// program: BF38A0361D0EE987, 0000000000000000, 04085CCE3E3F06BC
// shader: 8B30, 3756A28B320055F2
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec4 texcolor2 = textureLod(tex2, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex2, 0))) + tex_lod_bias[2]);
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
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][3];
lut_value = LightingLUTSigned(lut_offset, dot(normal, normalize(view.xyz)));
specular_sum.a = lut_scale_fr * lut_value;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTSigned(lut_offset, dot(normal, normalize(view.xyz)));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + (light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor1.aaa) * (const_color[0].rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp(fma((texcolor0.a), (secondary_fragment_color.a), (secondary_fragment_color.a)), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.a = last_tev_out.a;
vec3 color_output_1 = ByteRound(clamp(fma((texcolor2.rgb), (const_color[1].rgb), (last_tev_out.rgb)), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((texcolor1.b) * (texcolor2.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp(mix((last_tev_out.rgb), (texcolor0.rgb), (texcolor0.aaa)), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_3 = ByteRound(clamp(min((last_tev_out.rgb) + (last_tev_out.aaa), vec3(1)) * (vec3(1) - const_color[3].aaa), vec3(0), vec3(1)));
float alpha_output_3 = (combiner_buffer.a);
last_tev_out = vec4(color_output_3, alpha_output_3);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_4 = ByteRound(clamp(min((secondary_fragment_color.rgb) + (last_tev_out.rgb), vec3(1)) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_4 = (last_tev_out.a);
last_tev_out = vec4(color_output_4, alpha_output_4);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
vec3 color_output_5 = ByteRound(clamp(fma((last_tev_out.rgb), (rounded_primary_color.rgb), (const_color[5].rgb)), vec3(0), vec3(1)));
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
// reference: 691B3911700C3AB4, 3756A28B320055F2
// program: 63D49B7014AF4E02, 0000000000000000, 3756A28B320055F2
// shader: 8B30, 41D3702B008E2C28
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec4 texcolor2 = textureLod(tex2, texcoord12.xy, GetLod(texcoord12.xy * vec2(textureSize(tex2, 0))) + tex_lod_bias[2]);
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(min((texcolor0.rgb) + (texcolor1.rgb), vec3(1)) * (const_color[0].rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor1.a) - (const_color[0].a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 1.0, alpha_output_0 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = (const_color[1].rgb);
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) + (combiner_buffer.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((last_tev_out.a) + (texcolor2.a), 0.0, 1.0));
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) + (texcolor2.aaa), vec3(0), vec3(1)));
float alpha_output_3 = ByteRound(clamp((last_tev_out.a) - (const_color[3].a), 0.0, 1.0));
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
// shader: 8B30, B1A5C2BE7D3C4D00
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = ByteRound(clamp((const_color[0].rgb) * (texcolor0.aaa), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((texcolor1.a) - (const_color[0].a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_1 = ByteRound(clamp(min((texcolor0.rgb) + (const_color[1].rgb), vec3(1)) * (const_color[1].rgb), vec3(0), vec3(1)));
float alpha_output_1 = ByteRound(clamp((texcolor0.a) - (last_tev_out.a), 0.0, 1.0));
last_tev_out = vec4(color_output_1 * 4.0, alpha_output_1 * 1.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_2 = ByteRound(clamp((last_tev_out.rgb) - (combiner_buffer.rgb), vec3(0), vec3(1)));
float alpha_output_2 = ByteRound(clamp((last_tev_out.a) - (const_color[2].a), 0.0, 1.0));
last_tev_out = vec4(color_output_2 * 1.0, alpha_output_2 * 2.0);
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
// reference: 3B8C44EC51BF59D9, 41D3702B008E2C28
// reference: EA295CDF8A88B73D, B1A5C2BE7D3C4D00
// program: 63D49B7014AF4E02, 0000000000000000, 41D3702B008E2C28
// program: 63D49B7014AF4E02, 0000000000000000, B1A5C2BE7D3C4D00
// program: 19B51132E4AE7A71, 0000000000000000, 7AB896E680E98427
// program: 19B51132E4AE7A71, 0000000000000000, 16BF27C8E0061402
// program: 19B51132E4AE7A71, 0000000000000000, 75FDCFF3DC589B4F
// program: 19B51132E4AE7A71, 0000000000000000, B547BE090ADBFC42
// program: 0000000000000000, 0000000000000000, 95AF22F4FDF5E283
// program: 0000000000000000, 0000000000000000, 2AC4C6F48AC45996
// program: 0000000000000000, 0000000000000000, D613F82F9F9F3144
// program: 0000000000000000, 0000000000000000, FB088A5C78FC3097
// program: 0000000000000000, 0000000000000000, 6873719989AF415C
// program: 0000000000000000, 0000000000000000, 15C7483CDCAC839B
// program: F08584908DF524CD, 0000000000000000, CBE69E9A7BEB9F1B
// program: F08584908DF524CD, 0000000000000000, 9C1F176693BC04B9
// program: 9EA5E30DA7ECBE22, 0000000000000000, 9D129D631C0CFA07
// program: FA8DE3C2094E8829, 0000000000000000, 787FEC0C2A445D9A
// program: 19B51132E4AE7A71, 0000000000000000, A3D6CAAAF2971A7F
// program: FA8DE3C2094E8829, 0000000000000000, 8881AC828DC4DA1E
// program: FA8DE3C2094E8829, 0000000000000000, 1757303FCB97082D
// program: BF38A0361D0EE987, 0000000000000000, 78B299F32B4C46BF
// program: BF38A0361D0EE987, 0000000000000000, DE35120CBE92434C
// program: 8A30878796E09312, 0000000000000000, 5B18F4306C380BD5
// program: 63D49B7014AF4E02, 0000000000000000, 562DEA34F82A4C8A
// program: 63D49B7014AF4E02, 0000000000000000, 7AEB6FD8FDA9CF77
// program: BF38A0361D0EE987, 0000000000000000, E132C4933C4FE0A0
// program: BF38A0361D0EE987, 0000000000000000, 9E6056670B0860D8
// program: 8A30878796E09312, 0000000000000000, 421F4A649E20D8C3
// program: BF38A0361D0EE987, 0000000000000000, A6DD429C42F7513F
// program: BF38A0361D0EE987, 0000000000000000, 4F7DEC2AD91679DE
// program: FA8DE3C2094E8829, 0000000000000000, CFE0A56C23A293AF
// program: 63D49B7014AF4E02, 0000000000000000, 4E91FF5C71054CEC
// program: 8A30878796E09312, 0000000000000000, F904AA1D44E508E7
// program: BF38A0361D0EE987, 0000000000000000, 30EA701FB956C9F3
// program: 63D49B7014AF4E02, 0000000000000000, 65F8E3F87902D2C0
// program: BF38A0361D0EE987, 0000000000000000, BC7B731C0D9E0BAF
// program: BF38A0361D0EE987, 0000000000000000, 4CA2E2F2CA363D23
// program: 3402E539B0C3CE88, 0000000000000000, 7C5A33F69907445E
// program: 19B51132E4AE7A71, 0000000000000000, 6E4ADDF8C505E77F
// program: 19B51132E4AE7A71, 0000000000000000, 03E44C532ED80971
// program: 19B51132E4AE7A71, 0000000000000000, 78451313E25DF14D
// program: 63D49B7014AF4E02, 0000000000000000, 7B4A6AD307242E17
// program: BF38A0361D0EE987, 0000000000000000, 1B464475272BAE78
// program: 19B51132E4AE7A71, 0000000000000000, E09149227532B120
// program: 19B51132E4AE7A71, 0000000000000000, 471219C536931BDB
// program: 19B51132E4AE7A71, 0000000000000000, 8DC220892A8F5FC2
// program: BF38A0361D0EE987, 0000000000000000, 785BDCC129033139
// program: BF38A0361D0EE987, 0000000000000000, 1FBF1A5ABD9A9CFE
// program: BF38A0361D0EE987, 0000000000000000, 611B29B8912DFEB0
// program: BF38A0361D0EE987, 0000000000000000, 348FB01FAAA91B33
// program: 63D49B7014AF4E02, 0000000000000000, D71CA287DE75BC67
// program: 63D49B7014AF4E02, 0000000000000000, C09041CE9D3E3B76
// program: 63D49B7014AF4E02, 0000000000000000, 3620146008F98049
// program: BF38A0361D0EE987, 0000000000000000, ADB5521579DAF431
// program: 3402E539B0C3CE88, 0000000000000000, 199E0CC9F3570474
// program: 19B51132E4AE7A71, 0000000000000000, DCC35CD4B0D9386A
// program: 19B51132E4AE7A71, 0000000000000000, DDB72FB6B1083E94
// program: BF38A0361D0EE987, 0000000000000000, 04792CB3AB20C07A
// program: BF38A0361D0EE987, 0000000000000000, 4196280C5544BEAA
// program: BF38A0361D0EE987, 0000000000000000, 8B3D7DA0253A581B
// program: 63D49B7014AF4E02, 0000000000000000, 0688E321F2655302
// program: A44053E7E7279BF8, 0000000000000000, 15C7483CDCAC839B
// program: A44053E7E7279BF8, 0000000000000000, A3E92CB2D541ED0E
// program: BF38A0361D0EE987, 0000000000000000, ADB5521500143290
// program: BF38A0361D0EE987, 0000000000000000, E76AD4C9A0C2BF96
// program: 8A30878796E09312, 0000000000000000, 2DD312B897DE6C4E
// program: BF38A0361D0EE987, 0000000000000000, A3BB6C81F469110B
// program: 63D49B7014AF4E02, 0000000000000000, 72F0E134908882E5
// program: BF38A0361D0EE987, 0000000000000000, 47B86D46650D39E7
// program: BF38A0361D0EE987, 0000000000000000, B22AD8C937B3963B
// program: 19B51132E4AE7A71, 0000000000000000, 18E255B396ABA298
// program: BF38A0361D0EE987, 0000000000000000, 0D66D6771F4D81BE
// program: 63D49B7014AF4E02, 0000000000000000, 08CC7E16173A84D1
// program: BF38A0361D0EE987, 0000000000000000, 46BDD13CE6B061E4
// program: 8A30878796E09312, 0000000000000000, 533AD301ADCEF63B
// program: 8A30878796E09312, 0000000000000000, 8190052D2AFA9944
// program: 63D49B7014AF4E02, 0000000000000000, 7562C00B08273444
// program: 0000000000000000, 0000000000000000, F999B1909EC7A2DB
// program: BF38A0361D0EE987, 0000000000000000, 09F796640697C58E
// program: 3402E539B0C3CE88, 0000000000000000, 577D2F83ACFF87FE
// program: BF38A0361D0EE987, 0000000000000000, CFB32915327398FD
// program: C2A07D015EDEA037, 0000000000000000, 0628CA05D636B709
// program: 63D49B7014AF4E02, 0000000000000000, C0344B5176870A5D
// program: BF38A0361D0EE987, 0000000000000000, CC663C31604A12AA
// program: 3402E539B0C3CE88, 0000000000000000, 199E0CC9BFEA3A30
// program: 3402E539B0C3CE88, 0000000000000000, E9645DA51C12D048
// program: 3402E539B0C3CE88, 0000000000000000, 3D3906209907445E
// program: 3402E539B0C3CE88, 0000000000000000, 604AF07EAD6F2616
// program: 3402E539B0C3CE88, 0000000000000000, 6126C978B2081524
// program: 3402E539B0C3CE88, 0000000000000000, 0F494A2B54D26658
// program: 3402E539B0C3CE88, 0000000000000000, BED3A4D0733B62E4
// program: 0000000000000000, 0000000000000000, BED3A4D0959D5EBC
// program: 3402E539B0C3CE88, 0000000000000000, 10DBF1CFB2081524
// program: 3402E539B0C3CE88, 0000000000000000, 75A7E301AD6F2616
// program: 0000000000000000, 0000000000000000, 7C5A33F69907445E
// program: D7B3906330D68927, 0000000000000000, F999B1909EC7A2DB
// program: BF38A0361D0EE987, 0000000000000000, 04085CCE3E3F06BC
// program: 63D49B7014AF4E02, 0000000000000000, 3756A28B320055F2
// program: 63D49B7014AF4E02, 0000000000000000, 41D3702B008E2C28
// program: 63D49B7014AF4E02, 0000000000000000, B1A5C2BE7D3C4D00
// shader: 8B30, 685790D335EFE28B
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(min((secondary_fragment_color.rgb) + (texcolor0.rgb), vec3(1)) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = (const_color[0].a);
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp((last_tev_out.rgb) * (rounded_primary_color.rgb), vec3(0), vec3(1)));
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
// shader: 8B30, 035D693129F8FBE1
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[0].specular_0) * geo_factor) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
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
specular_sum.rgb += ((((lut_scale_d0 * d0_value) * light_src[1].specular_0) * geo_factor) + ((lut_scale_d1 * d1_value) * light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp(min((texcolor0.rgb) + (secondary_fragment_color.rgb), vec3(1)) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
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
// reference: 7D387E03015BF476, 685790D335EFE28B
// reference: 768EA356436A3C43, 035D693129F8FBE1
// program: BF38A0361D0EE987, 0000000000000000, 685790D335EFE28B
// program: BF38A0361D0EE987, 0000000000000000, 035D693129F8FBE1
// reference: 0C1A2B4709D13852, 0628CA05D636B709
// reference: 90332CBDCCEFED3E, 3402E539B0C3CE88
// shader: 8B30, 4D238489E2F751D5
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + ((lut_scale_d1 * d1_value) * light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((texcolor0.aaa) * (secondary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(min((last_tev_out.rgb) + (texcolor0.rgb), vec3(1)) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
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
// reference: A491FBA3E54B653A, 4D238489E2F751D5
// program: BF38A0361D0EE987, 0000000000000000, 4D238489E2F751D5
// shader: 8B30, 8A660947FF49C389
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = (const_color[0].rgb);
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = (vec3(1) - texcolor0.rgb);
float alpha_output_3 = ByteRound(clamp((texcolor0.a) + (const_color[3].a) - 0.5, 0.0, 1.0));
last_tev_out = vec4(color_output_3 * 1.0, alpha_output_3 * 2.0);
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
// reference: 3CAEA5664160C5AF, 8A660947FF49C389
// program: 19B51132E4AE7A71, 0000000000000000, 8A660947FF49C389
// shader: 8B30, 5A1FE151F15D21D6
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_3 = (vec3(1) - texcolor0.rgb);
float alpha_output_3 = ByteRound(clamp((texcolor0.a) + (const_color[3].a) - 0.5, 0.0, 1.0));
last_tev_out = vec4(color_output_3 * 1.0, alpha_output_3 * 2.0);
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
// reference: AAE5550A7DA3B798, 5A1FE151F15D21D6
// program: 19B51132E4AE7A71, 0000000000000000, 5A1FE151F15D21D6
// shader: 8B30, 6DB5AC99E38BC373
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// shader: 8B30, B4834F8D8456460E
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_3 = ByteRound(clamp((texcolor0.aaa) + (const_color[3].aaa) - vec3(0.5), vec3(0), vec3(1)));
float alpha_output_3 = (texcolor0.a);
last_tev_out = vec4(color_output_3 * 2.0, alpha_output_3 * 2.0);
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
// shader: 8B30, 4F0A85BE27A4C6FB
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_3 = (vec3(1) - texcolor0.rgb);
float alpha_output_3 = ByteRound(clamp((texcolor0.a) + (const_color[3].a) - 0.5, 0.0, 1.0));
last_tev_out = vec4(color_output_3 * 1.0, alpha_output_3 * 2.0);
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
// shader: 8B30, 47A4C9ED5F95BB55
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_3 = (texcolor0.rgb);
float alpha_output_3 = (texcolor0.r);
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
// reference: 5B0717B4EA6BE23E, 6DB5AC99E38BC373
// reference: BDB516ABAF7CA91F, B4834F8D8456460E
// reference: 7F916ADBB221675B, 4F0A85BE27A4C6FB
// reference: D1C765F2B9464EDF, 47A4C9ED5F95BB55
// program: 19B51132E4AE7A71, 0000000000000000, 6DB5AC99E38BC373
// program: 19B51132E4AE7A71, 0000000000000000, B4834F8D8456460E
// program: 19B51132E4AE7A71, 0000000000000000, 4F0A85BE27A4C6FB
// program: 19B51132E4AE7A71, 0000000000000000, 47A4C9ED5F95BB55
// shader: 8B30, 18E255B3CC1FCB23
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
vec3 color_output_0 = (const_color[0].rgb);
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = (texcolor0.rgb);
float alpha_output_3 = (texcolor0.r);
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
// reference: 92F8AA4F4A07EC2B, 18E255B3CC1FCB23
// program: 19B51132E4AE7A71, 0000000000000000, 18E255B3CC1FCB23
// program: 19B51132E4AE7A71, 0000000000000000, 7AB896E680E98427
// program: 19B51132E4AE7A71, 0000000000000000, 16BF27C8E0061402
// program: 19B51132E4AE7A71, 0000000000000000, 75FDCFF3DC589B4F
// program: 19B51132E4AE7A71, 0000000000000000, B547BE090ADBFC42
// program: 0000000000000000, 0000000000000000, 95AF22F4FDF5E283
// program: 0000000000000000, 0000000000000000, 2AC4C6F48AC45996
// program: 0000000000000000, 0000000000000000, D613F82F9F9F3144
// program: 0000000000000000, 0000000000000000, FB088A5C78FC3097
// program: 0000000000000000, 0000000000000000, 6873719989AF415C
// program: 0000000000000000, 0000000000000000, 15C7483CDCAC839B
// program: F08584908DF524CD, 0000000000000000, CBE69E9A7BEB9F1B
// program: F08584908DF524CD, 0000000000000000, 9C1F176693BC04B9
// program: 9EA5E30DA7ECBE22, 0000000000000000, 9D129D631C0CFA07
// program: FA8DE3C2094E8829, 0000000000000000, 787FEC0C2A445D9A
// program: 19B51132E4AE7A71, 0000000000000000, A3D6CAAAF2971A7F
// program: FA8DE3C2094E8829, 0000000000000000, 8881AC828DC4DA1E
// program: FA8DE3C2094E8829, 0000000000000000, 1757303FCB97082D
// program: BF38A0361D0EE987, 0000000000000000, 78B299F32B4C46BF
// program: BF38A0361D0EE987, 0000000000000000, DE35120CBE92434C
// program: 8A30878796E09312, 0000000000000000, 5B18F4306C380BD5
// program: 63D49B7014AF4E02, 0000000000000000, 562DEA34F82A4C8A
// program: 63D49B7014AF4E02, 0000000000000000, 7AEB6FD8FDA9CF77
// program: BF38A0361D0EE987, 0000000000000000, E132C4933C4FE0A0
// program: BF38A0361D0EE987, 0000000000000000, 9E6056670B0860D8
// program: 8A30878796E09312, 0000000000000000, 421F4A649E20D8C3
// program: BF38A0361D0EE987, 0000000000000000, A6DD429C42F7513F
// program: BF38A0361D0EE987, 0000000000000000, 4F7DEC2AD91679DE
// program: FA8DE3C2094E8829, 0000000000000000, CFE0A56C23A293AF
// program: 63D49B7014AF4E02, 0000000000000000, 4E91FF5C71054CEC
// program: 8A30878796E09312, 0000000000000000, F904AA1D44E508E7
// program: BF38A0361D0EE987, 0000000000000000, 30EA701FB956C9F3
// program: 63D49B7014AF4E02, 0000000000000000, 65F8E3F87902D2C0
// program: BF38A0361D0EE987, 0000000000000000, BC7B731C0D9E0BAF
// program: BF38A0361D0EE987, 0000000000000000, 4CA2E2F2CA363D23
// program: 3402E539B0C3CE88, 0000000000000000, 7C5A33F69907445E
// program: 19B51132E4AE7A71, 0000000000000000, 6E4ADDF8C505E77F
// program: 19B51132E4AE7A71, 0000000000000000, 03E44C532ED80971
// program: 19B51132E4AE7A71, 0000000000000000, 78451313E25DF14D
// program: 63D49B7014AF4E02, 0000000000000000, 7B4A6AD307242E17
// program: BF38A0361D0EE987, 0000000000000000, 1B464475272BAE78
// program: 19B51132E4AE7A71, 0000000000000000, E09149227532B120
// program: 19B51132E4AE7A71, 0000000000000000, 471219C536931BDB
// program: 19B51132E4AE7A71, 0000000000000000, 8DC220892A8F5FC2
// program: BF38A0361D0EE987, 0000000000000000, 785BDCC129033139
// program: BF38A0361D0EE987, 0000000000000000, 1FBF1A5ABD9A9CFE
// program: BF38A0361D0EE987, 0000000000000000, 611B29B8912DFEB0
// program: BF38A0361D0EE987, 0000000000000000, 348FB01FAAA91B33
// program: 63D49B7014AF4E02, 0000000000000000, D71CA287DE75BC67
// program: 63D49B7014AF4E02, 0000000000000000, C09041CE9D3E3B76
// program: 63D49B7014AF4E02, 0000000000000000, 3620146008F98049
// program: BF38A0361D0EE987, 0000000000000000, ADB5521579DAF431
// program: 3402E539B0C3CE88, 0000000000000000, 199E0CC9F3570474
// program: 19B51132E4AE7A71, 0000000000000000, DCC35CD4B0D9386A
// program: 19B51132E4AE7A71, 0000000000000000, DDB72FB6B1083E94
// program: BF38A0361D0EE987, 0000000000000000, 04792CB3AB20C07A
// program: BF38A0361D0EE987, 0000000000000000, 4196280C5544BEAA
// program: BF38A0361D0EE987, 0000000000000000, 8B3D7DA0253A581B
// program: 63D49B7014AF4E02, 0000000000000000, 0688E321F2655302
// program: A44053E7E7279BF8, 0000000000000000, 15C7483CDCAC839B
// program: A44053E7E7279BF8, 0000000000000000, A3E92CB2D541ED0E
// program: BF38A0361D0EE987, 0000000000000000, ADB5521500143290
// program: BF38A0361D0EE987, 0000000000000000, E76AD4C9A0C2BF96
// program: 8A30878796E09312, 0000000000000000, 2DD312B897DE6C4E
// program: BF38A0361D0EE987, 0000000000000000, A3BB6C81F469110B
// program: 63D49B7014AF4E02, 0000000000000000, 72F0E134908882E5
// program: BF38A0361D0EE987, 0000000000000000, 47B86D46650D39E7
// program: BF38A0361D0EE987, 0000000000000000, B22AD8C937B3963B
// program: 19B51132E4AE7A71, 0000000000000000, 18E255B396ABA298
// program: BF38A0361D0EE987, 0000000000000000, 0D66D6771F4D81BE
// program: 63D49B7014AF4E02, 0000000000000000, 08CC7E16173A84D1
// program: BF38A0361D0EE987, 0000000000000000, 46BDD13CE6B061E4
// program: 8A30878796E09312, 0000000000000000, 533AD301ADCEF63B
// program: 8A30878796E09312, 0000000000000000, 8190052D2AFA9944
// program: 63D49B7014AF4E02, 0000000000000000, 7562C00B08273444
// program: 0000000000000000, 0000000000000000, F999B1909EC7A2DB
// program: BF38A0361D0EE987, 0000000000000000, 09F796640697C58E
// program: 3402E539B0C3CE88, 0000000000000000, 577D2F83ACFF87FE
// program: BF38A0361D0EE987, 0000000000000000, CFB32915327398FD
// program: C2A07D015EDEA037, 0000000000000000, 0628CA05D636B709
// program: 63D49B7014AF4E02, 0000000000000000, C0344B5176870A5D
// program: BF38A0361D0EE987, 0000000000000000, CC663C31604A12AA
// program: 3402E539B0C3CE88, 0000000000000000, 199E0CC9BFEA3A30
// program: 3402E539B0C3CE88, 0000000000000000, E9645DA51C12D048
// program: 3402E539B0C3CE88, 0000000000000000, 3D3906209907445E
// program: 3402E539B0C3CE88, 0000000000000000, 604AF07EAD6F2616
// program: 3402E539B0C3CE88, 0000000000000000, 6126C978B2081524
// program: 3402E539B0C3CE88, 0000000000000000, 0F494A2B54D26658
// program: 3402E539B0C3CE88, 0000000000000000, BED3A4D0733B62E4
// program: 0000000000000000, 0000000000000000, BED3A4D0959D5EBC
// program: 3402E539B0C3CE88, 0000000000000000, 10DBF1CFB2081524
// program: 3402E539B0C3CE88, 0000000000000000, 75A7E301AD6F2616
// program: 0000000000000000, 0000000000000000, 7C5A33F69907445E
// program: D7B3906330D68927, 0000000000000000, F999B1909EC7A2DB
// program: BF38A0361D0EE987, 0000000000000000, 04085CCE3E3F06BC
// program: 63D49B7014AF4E02, 0000000000000000, 3756A28B320055F2
// program: 63D49B7014AF4E02, 0000000000000000, 41D3702B008E2C28
// program: 63D49B7014AF4E02, 0000000000000000, B1A5C2BE7D3C4D00
// program: BF38A0361D0EE987, 0000000000000000, 685790D335EFE28B
// program: BF38A0361D0EE987, 0000000000000000, 035D693129F8FBE1
// program: BF38A0361D0EE987, 0000000000000000, 4D238489E2F751D5
// program: 19B51132E4AE7A71, 0000000000000000, 8A660947FF49C389
// program: 19B51132E4AE7A71, 0000000000000000, 5A1FE151F15D21D6
// program: 19B51132E4AE7A71, 0000000000000000, 6DB5AC99E38BC373
// program: 19B51132E4AE7A71, 0000000000000000, B4834F8D8456460E
// program: 19B51132E4AE7A71, 0000000000000000, 4F0A85BE27A4C6FB
// program: 19B51132E4AE7A71, 0000000000000000, 47A4C9ED5F95BB55
// program: 19B51132E4AE7A71, 0000000000000000, 18E255B3CC1FCB23
// shader: 8B30, 577D2F838A94157D
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
float alpha_output_0 = ByteRound(clamp((texcolor0.g) - (1.0 - rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 1.0, alpha_output_0 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
if (last_tev_out.a <= alphatest_ref) discard;
gl_FragDepth = depth;
color = ByteRound(last_tev_out);
}
// reference: 99268051F77B1B97, 577D2F838A94157D
// reference: A1FF2E7ECCEFED3E, 3402E539B0C3CE88
// program: 0000000000000000, 0000000000000000, 577D2F838A94157D
// program: 0000000000000000, 0000000000000000, 577D2F838A94157D
// program: 19B51132E4AE7A71, 0000000000000000, 7AB896E680E98427
// program: 19B51132E4AE7A71, 0000000000000000, 16BF27C8E0061402
// program: 19B51132E4AE7A71, 0000000000000000, 75FDCFF3DC589B4F
// program: 19B51132E4AE7A71, 0000000000000000, B547BE090ADBFC42
// program: 0000000000000000, 0000000000000000, 95AF22F4FDF5E283
// program: 0000000000000000, 0000000000000000, 2AC4C6F48AC45996
// program: 0000000000000000, 0000000000000000, D613F82F9F9F3144
// program: 0000000000000000, 0000000000000000, FB088A5C78FC3097
// program: 0000000000000000, 0000000000000000, 6873719989AF415C
// program: 0000000000000000, 0000000000000000, 15C7483CDCAC839B
// program: F08584908DF524CD, 0000000000000000, CBE69E9A7BEB9F1B
// program: F08584908DF524CD, 0000000000000000, 9C1F176693BC04B9
// program: 9EA5E30DA7ECBE22, 0000000000000000, 9D129D631C0CFA07
// program: FA8DE3C2094E8829, 0000000000000000, 787FEC0C2A445D9A
// program: 19B51132E4AE7A71, 0000000000000000, A3D6CAAAF2971A7F
// program: FA8DE3C2094E8829, 0000000000000000, 8881AC828DC4DA1E
// program: FA8DE3C2094E8829, 0000000000000000, 1757303FCB97082D
// program: BF38A0361D0EE987, 0000000000000000, 78B299F32B4C46BF
// program: BF38A0361D0EE987, 0000000000000000, DE35120CBE92434C
// program: 8A30878796E09312, 0000000000000000, 5B18F4306C380BD5
// program: 63D49B7014AF4E02, 0000000000000000, 562DEA34F82A4C8A
// program: 63D49B7014AF4E02, 0000000000000000, 7AEB6FD8FDA9CF77
// program: BF38A0361D0EE987, 0000000000000000, E132C4933C4FE0A0
// program: BF38A0361D0EE987, 0000000000000000, 9E6056670B0860D8
// program: 8A30878796E09312, 0000000000000000, 421F4A649E20D8C3
// program: BF38A0361D0EE987, 0000000000000000, A6DD429C42F7513F
// program: BF38A0361D0EE987, 0000000000000000, 4F7DEC2AD91679DE
// program: FA8DE3C2094E8829, 0000000000000000, CFE0A56C23A293AF
// program: 63D49B7014AF4E02, 0000000000000000, 4E91FF5C71054CEC
// program: 8A30878796E09312, 0000000000000000, F904AA1D44E508E7
// program: BF38A0361D0EE987, 0000000000000000, 30EA701FB956C9F3
// program: 63D49B7014AF4E02, 0000000000000000, 65F8E3F87902D2C0
// program: BF38A0361D0EE987, 0000000000000000, BC7B731C0D9E0BAF
// program: BF38A0361D0EE987, 0000000000000000, 4CA2E2F2CA363D23
// program: 3402E539B0C3CE88, 0000000000000000, 7C5A33F69907445E
// program: 19B51132E4AE7A71, 0000000000000000, 6E4ADDF8C505E77F
// program: 19B51132E4AE7A71, 0000000000000000, 03E44C532ED80971
// program: 19B51132E4AE7A71, 0000000000000000, 78451313E25DF14D
// program: 63D49B7014AF4E02, 0000000000000000, 7B4A6AD307242E17
// program: BF38A0361D0EE987, 0000000000000000, 1B464475272BAE78
// program: 19B51132E4AE7A71, 0000000000000000, E09149227532B120
// program: 19B51132E4AE7A71, 0000000000000000, 471219C536931BDB
// program: 19B51132E4AE7A71, 0000000000000000, 8DC220892A8F5FC2
// program: BF38A0361D0EE987, 0000000000000000, 785BDCC129033139
// program: BF38A0361D0EE987, 0000000000000000, 1FBF1A5ABD9A9CFE
// program: BF38A0361D0EE987, 0000000000000000, 611B29B8912DFEB0
// program: BF38A0361D0EE987, 0000000000000000, 348FB01FAAA91B33
// program: 63D49B7014AF4E02, 0000000000000000, D71CA287DE75BC67
// program: 63D49B7014AF4E02, 0000000000000000, C09041CE9D3E3B76
// program: 63D49B7014AF4E02, 0000000000000000, 3620146008F98049
// program: BF38A0361D0EE987, 0000000000000000, ADB5521579DAF431
// program: 3402E539B0C3CE88, 0000000000000000, 199E0CC9F3570474
// program: 19B51132E4AE7A71, 0000000000000000, DCC35CD4B0D9386A
// program: 19B51132E4AE7A71, 0000000000000000, DDB72FB6B1083E94
// program: BF38A0361D0EE987, 0000000000000000, 04792CB3AB20C07A
// program: BF38A0361D0EE987, 0000000000000000, 4196280C5544BEAA
// program: BF38A0361D0EE987, 0000000000000000, 8B3D7DA0253A581B
// program: 63D49B7014AF4E02, 0000000000000000, 0688E321F2655302
// program: A44053E7E7279BF8, 0000000000000000, 15C7483CDCAC839B
// program: A44053E7E7279BF8, 0000000000000000, A3E92CB2D541ED0E
// program: BF38A0361D0EE987, 0000000000000000, ADB5521500143290
// program: BF38A0361D0EE987, 0000000000000000, E76AD4C9A0C2BF96
// program: 8A30878796E09312, 0000000000000000, 2DD312B897DE6C4E
// program: BF38A0361D0EE987, 0000000000000000, A3BB6C81F469110B
// program: 63D49B7014AF4E02, 0000000000000000, 72F0E134908882E5
// program: BF38A0361D0EE987, 0000000000000000, 47B86D46650D39E7
// program: BF38A0361D0EE987, 0000000000000000, B22AD8C937B3963B
// program: 19B51132E4AE7A71, 0000000000000000, 18E255B396ABA298
// program: BF38A0361D0EE987, 0000000000000000, 0D66D6771F4D81BE
// program: 63D49B7014AF4E02, 0000000000000000, 08CC7E16173A84D1
// program: BF38A0361D0EE987, 0000000000000000, 46BDD13CE6B061E4
// program: 8A30878796E09312, 0000000000000000, 533AD301ADCEF63B
// program: 8A30878796E09312, 0000000000000000, 8190052D2AFA9944
// program: 63D49B7014AF4E02, 0000000000000000, 7562C00B08273444
// program: 0000000000000000, 0000000000000000, F999B1909EC7A2DB
// program: BF38A0361D0EE987, 0000000000000000, 09F796640697C58E
// program: 3402E539B0C3CE88, 0000000000000000, 577D2F83ACFF87FE
// program: BF38A0361D0EE987, 0000000000000000, CFB32915327398FD
// program: C2A07D015EDEA037, 0000000000000000, 0628CA05D636B709
// program: 63D49B7014AF4E02, 0000000000000000, C0344B5176870A5D
// program: BF38A0361D0EE987, 0000000000000000, CC663C31604A12AA
// program: 3402E539B0C3CE88, 0000000000000000, 199E0CC9BFEA3A30
// program: 3402E539B0C3CE88, 0000000000000000, E9645DA51C12D048
// program: 3402E539B0C3CE88, 0000000000000000, 3D3906209907445E
// program: 3402E539B0C3CE88, 0000000000000000, 604AF07EAD6F2616
// program: 3402E539B0C3CE88, 0000000000000000, 6126C978B2081524
// program: 3402E539B0C3CE88, 0000000000000000, 0F494A2B54D26658
// program: 3402E539B0C3CE88, 0000000000000000, BED3A4D0733B62E4
// program: 0000000000000000, 0000000000000000, BED3A4D0959D5EBC
// program: 3402E539B0C3CE88, 0000000000000000, 10DBF1CFB2081524
// program: 3402E539B0C3CE88, 0000000000000000, 75A7E301AD6F2616
// program: 0000000000000000, 0000000000000000, 7C5A33F69907445E
// program: D7B3906330D68927, 0000000000000000, F999B1909EC7A2DB
// program: BF38A0361D0EE987, 0000000000000000, 04085CCE3E3F06BC
// program: 63D49B7014AF4E02, 0000000000000000, 3756A28B320055F2
// program: 63D49B7014AF4E02, 0000000000000000, 41D3702B008E2C28
// program: 63D49B7014AF4E02, 0000000000000000, B1A5C2BE7D3C4D00
// program: BF38A0361D0EE987, 0000000000000000, 685790D335EFE28B
// program: BF38A0361D0EE987, 0000000000000000, 035D693129F8FBE1
// program: BF38A0361D0EE987, 0000000000000000, 4D238489E2F751D5
// program: 19B51132E4AE7A71, 0000000000000000, 8A660947FF49C389
// program: 19B51132E4AE7A71, 0000000000000000, 5A1FE151F15D21D6
// program: 19B51132E4AE7A71, 0000000000000000, 6DB5AC99E38BC373
// program: 19B51132E4AE7A71, 0000000000000000, B4834F8D8456460E
// program: 19B51132E4AE7A71, 0000000000000000, 4F0A85BE27A4C6FB
// program: 19B51132E4AE7A71, 0000000000000000, 47A4C9ED5F95BB55
// program: 19B51132E4AE7A71, 0000000000000000, 18E255B3CC1FCB23
// program: 0000000000000000, 0000000000000000, 577D2F838A94157D
// shader: 8B30, 595512872416D736
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[0].diffuse * dot_product) + light_src[0].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[0].specular_0) + ((lut_scale_d1 * d1_value) * light_src[0].specular_1)) * clamp_highlights * 1.0;
light_vector = normalize(light_src[1].position);
spot_dir = light_src[1].spot_direction;
half_vector = normalize(view.xyz) + light_vector;
dot_product = max(dot(light_vector, normal), 0.0);
refl_value.r = 1.0;
refl_value.g = refl_value.r;
refl_value.b = refl_value.r;
lut_offset = lighting_lut_offset[0][0];
d0_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(half_vector)), 0.0));
lut_offset = lighting_lut_offset[0][1];
d1_value = LightingLUTUnsigned(lut_offset, max(dot(normal, normalize(view.xyz)), 0.0));
diffuse_sum.rgb += ((light_src[1].diffuse * dot_product) + light_src[1].ambient) * 1.0;
specular_sum.rgb += (((lut_scale_d0 * d0_value) * light_src[1].specular_0) + ((lut_scale_d1 * d1_value) * light_src[1].specular_1)) * clamp_highlights * 1.0;
diffuse_sum.rgb += lighting_global_ambient;
primary_fragment_color = clamp(diffuse_sum, vec4(0), vec4(1));
secondary_fragment_color = clamp(specular_sum, vec4(0), vec4(1));
vec4 combiner_buffer = vec4(0);
vec4 next_combiner_buffer = tev_combiner_color;
vec4 last_tev_out = vec4(0);
vec3 color_output_0 = ByteRound(clamp((secondary_fragment_color.rgb) * (texcolor0.aaa), vec3(0), vec3(1)));
float alpha_output_0 = ByteRound(clamp((rounded_primary_color.a) * (texcolor0.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0, alpha_output_0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_1 = ByteRound(clamp(min((last_tev_out.rgb) + (texcolor0.rgb), vec3(1)) * (primary_fragment_color.rgb), vec3(0), vec3(1)));
float alpha_output_1 = (last_tev_out.a);
last_tev_out = vec4(color_output_1, alpha_output_1);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
next_combiner_buffer.rgb = last_tev_out.rgb;
vec3 color_output_2 = ByteRound(clamp((rounded_primary_color.rgb) + (const_color[2].aaa), vec3(0), vec3(1)));
float alpha_output_2 = (last_tev_out.a);
last_tev_out = vec4(color_output_2, alpha_output_2);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
vec3 color_output_3 = ByteRound(clamp((last_tev_out.rgb) * (combiner_buffer.rgb), vec3(0), vec3(1)));
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
// reference: 67B63FA8825B507D, 595512872416D736
// program: BF38A0361D0EE987, 0000000000000000, 595512872416D736
// shader: 8B30, B9F8D70BBAA702AC
layout(location=0) in vec4 primary_color;
layout(location=1) in vec4 texcoord0;
layout(location=2) in vec4 texcoord12;
layout(location=3) in vec4 normquat;
layout(location=4) in vec4 view;
out vec4 color;
layout(binding=0) uniform sampler2D tex0;
layout(binding=1) uniform sampler2D tex1;
layout(binding=2) uniform sampler2D tex2;
layout(binding=3) uniform samplerBuffer tex_lut_l;
layout(binding=4) uniform samplerBuffer tex_lut_f;
layout(binding=5) uniform samplerBuffer tex_lut_rg;
layout(binding=6) uniform samplerBuffer tex_lut_rgba;

layout(binding=0, std140) uniform common_data {
vec3 fog_color;
vec3 tex_lod_bias;
vec4 clip_coef;
vec4 blend_color;
vec4 tev_combiner_color;
vec4 const_color[6];
float scissor_x1;
float scissor_y1;
float scissor_x2;
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
float alpha_output_0 = ByteRound(clamp((texcolor0.a) - (1.0 - rounded_primary_color.a), 0.0, 1.0));
last_tev_out = vec4(color_output_0 * 1.0, alpha_output_0 * 2.0);
last_tev_out = clamp(last_tev_out, vec4(0), vec4(1));
combiner_buffer = next_combiner_buffer;
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
// reference: F70AF5A91EC866A2, B9F8D70BBAA702AC
// program: 3402E539B0C3CE88, 0000000000000000, B9F8D70BBAA702AC
