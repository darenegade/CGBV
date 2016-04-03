//
// Fragment Shader für 3x3 Gauss Tiefpass-Filter
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
//Varianz Funktion siehe: https://de.wikipedia.org/wiki/Gau%C3%9F-Filter
float varianz(vec2 cords){

	float a = 1/(2.0 * 3.145 * pow(param1.x,2));
	float ba = pow(cords.x,2)+pow(cords.y,2);
	float bb = 2*pow(param1.x,2);

	return  a * exp((ba/bb)*(-1.0)); 

}

void main()
{

	vec4 sum = vec4(0.0, 0.0, 0.0, 1.0);
	float summ = 0.0;


	for(int i = 0; i < 9; i++){
		float varianz = varianz(offsets[i]);
		sum += varianz * texture(textureMap, texCoords + offsets[i]);
		summ += varianz;
	}

	fragColor = sum / summ;


}