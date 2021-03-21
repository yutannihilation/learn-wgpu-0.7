struct VertexOutput {
    [[builtin(position)]] proj_position: vec4<f32>;
    [[location(0)]] color: vec3<f32>;
};

[[stage(vertex)]]
fn vs_main(
    [[location(0)]] pos: vec3<f32>,
    [[location(1)]] color: vec3<f32>,
) -> VertexOutput {
    var out: VertexOutput;

    out.proj_position = vec4<f32>(pos, 1.0);
    out.color = color;

    return out;
}

[[stage(fragment)]]
fn fs_main(in: VertexOutput) -> [[location(0)]] vec4<f32> {
    return vec4<f32>(in.color, 1.0);
}
