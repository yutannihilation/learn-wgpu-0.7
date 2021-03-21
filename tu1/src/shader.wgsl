var positions : array<vec2<f32>, 3> = array<vec2<f32>, 3> (
    vec2<f32>( 0.0,  0.5),
    vec2<f32>(-0.5, -0.5),
    vec2<f32>( 0.5, -0.5)
);

[[stage(vertex)]]
fn vs_main(
    [[builtin(vertex_index)]] in_vertex_index: u32
) -> [[builtin(position)]] vec4<f32> {
    return vec4<f32>(positions[in_vertex_index], 0.0, 1.0);
}

[[stage(fragment)]]
fn fs_main() -> [[location(0)]] vec4<f32> {
    return vec4<f32>(0.3, 0.2, 0.1, 1.0);
}
