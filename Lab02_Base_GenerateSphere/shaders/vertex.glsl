#version 330

uniform mat4 u_MVPMatrix;
uniform mat4 u_MVMatrix;
uniform vec4 u_DiffuseColour;

layout(location = 0) in vec4 position;
layout(location = 1) in vec3 normal;

out vec3 v_Position;
out vec3 v_Normal;

void main() {
    // interpolate the eye space position and normal
    v_Position = vec3(u_MVMatrix * position);
    v_Normal = vec3(u_MVMatrix * vec4(normal, 0.0));

    // perform the usual model-view-projection transformation for the vertex position
    gl_Position = u_MVPMatrix * position;
}
