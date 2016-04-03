//
// Fragment Shader ohne Operator
// Angepasst für Core Profile
// ---------------------------------
//
// @author: Prof. Dr. Alfred Nischwitz
// @lecturer: Prof. Dr. Alfred Nischwitz
//
// (c)2011 Hochschule München, HM
//
// ---------------------------------
#version 330


smooth in vec2 texCoords;
out vec4 fragColor;
//Sampler für die Texture Map
uniform sampler2DRect textureMap;

void main()
{

    fragColor =	texture(textureMap, texCoords);

}