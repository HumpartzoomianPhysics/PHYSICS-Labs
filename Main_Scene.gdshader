shader_type canvas_item;

uniform vec4 bg_color;

// Exposed parameters
uniform float star_size : hint_range(1.0, 200.0) = 100.0;
uniform float star_density : hint_range(0.1, 1.0) = 0.9;
uniform float closeness_factor : hint_range(1.0, 100.0) = 45.0;

float rand(vec2 st) {
    return fract(sin(dot(st.xy, vec2(12.9898, 78.233))) * 43758.5453123);
}

void fragment() {
    float prob = star_density;
    vec2 pos = floor(1.0 / star_size * FRAGCOORD.xy);
    float color = 0.0;
    float starValue = rand(pos);

    if (starValue > prob) {
        vec2 center = star_size * (pos + vec2(0.5, 0.5));
        float t = 0.9 + 0.2 * sin(TIME * 8.0 + (starValue - prob) / (1.0 - prob) * closeness_factor);
        color = 1.0 - distance(FRAGCOORD.xy, center) / (0.5 * star_size);
        color = color * t / abs(FRAGCOORD.y - center.y) * t / abs(FRAGCOORD.x - center.x);
    } else if (rand(SCREEN_UV.xy / 20.0) > 0.996) {
        float r = rand(SCREEN_UV.xy);
        color = r * (0.85 * sin(TIME * (r * 5.0) + 720.0 * r) + 0.95);
    }

    COLOR = vec4(vec3(color), 1.0) + bg_color;
}