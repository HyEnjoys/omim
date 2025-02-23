attribute vec3 a_position;
attribute vec2 a_normal;
attribute vec4 a_texCoords;
attribute vec4 a_colorAndAnimateOrZ;

uniform mat4 u_modelView;
uniform mat4 u_projection;
uniform mat4 u_pivotTransform;
uniform float u_interpolation;

varying vec4 v_texCoords;
varying vec3 v_maskColor;

void main()
{
  vec2 normal = a_normal;
  if (a_colorAndAnimateOrZ.w > 0.0)
    normal = u_interpolation * normal;

  vec4 pivot = vec4(a_position, 1.0) * u_modelView;
  vec4 offset = vec4(normal, 0.0, 0.0) * u_projection;
  vec4 projectedPivot = pivot * u_projection;
  gl_Position = applyBillboardPivotTransform(projectedPivot, u_pivotTransform, 0.0, offset.xy);
  float newZ = projectedPivot.y / projectedPivot.w * 0.5 + 0.5;
  gl_Position.z = abs(a_colorAndAnimateOrZ.w) * newZ  + (1.0 - abs(a_colorAndAnimateOrZ.w)) * gl_Position.z;
  v_texCoords = a_texCoords;
  v_maskColor = a_colorAndAnimateOrZ.rgb;
}
