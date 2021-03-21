struct VertexOutput {
    [[builtin(position)]] proj_position: vec4<f32>;
    [[location(0)]]       tex_coords:    vec2<f32>;
};

[[block]]
struct Uniforms {
    view_proj: mat4x4<f32>;
};

[[group(1), binding(0)]]
var<uniform> uni: Uniforms;

[[stage(vertex)]]
fn vs_main(
    [[location(0)]] pos:        vec3<f32>,
    [[location(1)]] tex_coords: vec2<f32>,
    // matrix
    [[location(5)]] model_mat0: vec4<f32>,
    [[location(6)]] model_mat1: vec4<f32>,
    [[location(7)]] model_mat2: vec4<f32>,
    [[location(8)]] model_mat3: vec4<f32>,
) -> VertexOutput {
    var out: VertexOutput;
    var model_mat: mat4x4<f32>;
    
    model_mat = mat4x4<f32>(
        model_mat0,
        model_mat1,
        model_mat2,
        model_mat3
    );

    out.proj_position = uni.view_proj * model_mat * vec4<f32>(pos, 1.0);
    out.tex_coords = tex_coords;

    return out;
}

[[group(0), binding(0)]]
var t_diffuse: texture_2d<f32>;
[[group(0), binding(1)]]
var s_diffuse: sampler;

[[stage(fragment)]]
fn fs_main(in: VertexOutput) -> [[location(0)]] vec4<f32> {
    return textureSample(t_diffuse, s_diffuse, in.tex_coords);
}
