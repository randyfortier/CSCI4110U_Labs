#version 330

uniform vec3 u_LightPos;
uniform vec4 u_DiffuseColour;

in vec3 v_Position;
in vec3 v_Normal;

void main() {
    vec4 ambientColour = vec4(0.25, 0.25, 0.25, 1.0);

    // Get a lighting direction vector from the light to the vertex.
    vec3 lightVector = normalize(u_LightPos - v_Position);

    // Calculate the dot product of the light vector and vertex normal. If the normal and light vector are
    // pointing in the same direction then it will get max illumination.
    float diffuse = clamp(dot(normalize(v_Normal), lightVector), 0.0, 1.0);

    // Multiply the color by the diffuse illumination level to get final output color.
    gl_FragColor = u_DiffuseColour * diffuse + ambientColour;
}
