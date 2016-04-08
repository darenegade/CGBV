//
// Fragment Shader für Laplace Operator
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


smooth in vec2 texCoords;			// pixelbezogene Texturkoordinate
out vec4 fragColor;					// Ausgabewert mit 4 Komponenten zwischen 0.0 und 1.0
uniform sampler2DRect textureMap;		// Sampler für die Texture Map
uniform vec4 param1;				// param1.x +=F5, -=F6, param1.y +=F7, -=F8, param1.z +=F9, -=F10, param1.w +=F11, -=F12

uniform vec2 offsets[9] = vec2[](	vec2(-1,  1),
									vec2(-1,  0),
									vec2(-1, -1),
									vec2( 0,  1),
									vec2( 0,  0),
									vec2( 0, -1),
									vec2( 1,  1),
									vec2( 1,  0),
									vec2( 1, -1)	);

const int weight[9] = int[](	-1,	-1,	-1,
								-1,	8,	-1,
								-1,	-1,	-1);
void main()
{

	float contrast = (param1.y + 100.0) / 100.0;

	vec4 sum = vec4(0.0, 0.0, 0.0, 0.5);

	for(int i = 0; i < 9; i++){
		sum += weight[i] * texture(textureMap, texCoords + offsets[i]);

	}

	sum += param1.x /100.0;
	sum = contrast * sum + 0.5 * (1.0 - contrast) * vec4(1);

    fragColor =	clamp(sum, 0.0, 1.0);

}