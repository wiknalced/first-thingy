shader_type canvas_item;

// This adds a slider to your Inspector so you can change transparency easily
uniform float transparency : hint_range(0.0, 1.0) = 0.5; 

void fragment() {
    vec2 uv = UV - 0.5;
    float distance = length(uv);
    
    float outer_radius = 0.5;
    float inner_radius = 0.48; 
    
    float mask = smoothstep(outer_radius, outer_radius - 0.01, distance) * 
                 smoothstep(inner_radius, inner_radius + 0.01, distance);
                  
    // Multiplying by 'transparency' controls the overall opacity
    COLOR = vec4(COLOR.rgb, mask * transparency);
}
