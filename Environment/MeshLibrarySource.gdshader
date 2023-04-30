shader_type spatial;

uniform float dtime;

float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

void vertex() {
  VERTEX.y *= 2.0;
  VERTEX.y -= floor(max(abs(NODE_POSITION_WORLD.x),abs(NODE_POSITION_WORLD.z))/20.0)*2.0;
  //have to be creative and use another channel, there is a bug and NODE_POSITION_WORLD is always 0 in fragment shader
  BINORMAL = NODE_POSITION_WORLD;
}

void fragment() {
  float normalized_time = dtime / 86400.0;
  float uv_x = fract(UV.x * 10.5);
  float uv_y = fract(UV.y * 6.5);
  float x = round(uv_x);
  float y = round(uv_y); 
  float color = x*y;
  //float em = 1.0-round(fract(normalized_time+0.16));
  float em = round(rand(vec2(BINORMAL.x*3.0+BINORMAL.y*7.0+BINORMAL.z*13.0+round(UV.x*10.5)*7919.0+round(UV.y*6.5)*211.0,0.0)))*(1.0-round(fract(normalized_time+0.20)-0.08));
  EMISSION = vec3(em*color,em*color,em/4.0*color);
  ALBEDO = vec3(color,color,color)*normalized_time;
  METALLIC = (1.0-em)*color;
  ROUGHNESS = 1.0-((1.0-em)*color)+0.1;
}
