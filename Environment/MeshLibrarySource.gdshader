shader_type spatial;

uniform float dtime;

void fragment() {
  float normalized_time = dtime / 86400.0;
  float x = round(fract(UV.x * 6.5));
  float y = round(fract(UV.y * 6.5)); 
  float color = x*y;
  float em = 1.0-round(fract(normalized_time+0.18));
  EMISSION = vec3(em*2.0*color,em*2.0*color,em/2.0*color);
  ALBEDO = vec3(color,color,color)*normalized_time;
}
