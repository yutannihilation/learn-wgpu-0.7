struct VertexOutput {
    [[builtin(position)]] proj_position: vec4<f32>;
    [[location(0)]] tex_coords: vec2<f32>;
};

[[stage(vertex)]]
fn vs_main(
    [[location(0)]] pos: vec3<f32>,
    [[location(1)]] tex_coords: vec2<f32>,
) -> VertexOutput {
    var out: VertexOutput;

    out.proj_position = vec4<f32>(pos, 1.0);
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
