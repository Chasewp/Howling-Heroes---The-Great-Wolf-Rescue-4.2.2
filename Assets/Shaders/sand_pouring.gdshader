shader_type canvas_item;

uniform float duration : hint_range(0.0, 10.0, 0.1) = 10.0;
uniform float sand_state:hint_range(0.0, 1.0, 0.1) = 0.0;
void fragment(){
	vec2 uv =UV;
	float t = 1.0 - sand_state;
	if (uv.y<t){
		uv.y =t;
	}	
	COLOR = texture(TEXTURE, uv);
}