shader_type spatial;

uniform float dtime;
const float scale = 1.0/52.5;
const vec3 window_color = vec3(0.87450981140137, 0.94901961088181, 1);
const vec3 wall_color = vec3(0.65490198135376, 0.66666668653488, 0.69803923368454);//vec3(0.88627451658249, 0.88627451658249, 0.88627451658249);

float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

void vertex() {
//  VERTEX.y *= 2.0;
//  VERTEX.y -= floor(max(abs(NODE_POSITION_WORLD.x),abs(NODE_POSITION_WORLD.z))/20.0)*2.0;
  //have to be creative and use another channel, there is a bug and NODE_POSITION_WORLD is always 0 in fragment shader
  BINORMAL = NODE_POSITION_WORLD;
}

void fragment() {
  float normalized_time = dtime / 86400.0;
  float uv_x = fract(UV.x * 10.5 * scale);
  float uv_y = fract(UV.y * 6.5 * scale);
  float x = round(uv_x);
  float y = round(uv_y); 
  float color = x*y;
  //float em = 1.0-round(fract(normalized_time+0.16));
  float em = round(rand(vec2(BINORMAL.x*3.0+BINORMAL.y*7.0+BINORMAL.z*13.0+round(UV.x*10.5*scale)*7919.0+round(UV.y*6.5*scale)*211.0,0.0)))*(1.0-round(fract(normalized_time+0.20)-0.08));
  EMISSION = window_color * vec3(em*color,em*color,em/4.0*color);
  ALBEDO = wall_color * (1.0-color) + window_color * color;//vec3(color,color,color)*normalized_time;
  METALLIC = (1.0-em)*color;
  ROUGHNESS = 1.0-((1.0-em)*color)+0.1;
}
