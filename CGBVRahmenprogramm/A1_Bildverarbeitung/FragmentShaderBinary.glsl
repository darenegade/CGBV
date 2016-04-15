//
// Fragment Shader f�r den morphologischen Operator 
// Erosion
// Angepasst f�r Core Profile
// ---------------------------------
//
// @author: Prof. Dr. Alfred Nischwitz
// @lecturer: Prof. Dr. Alfred Nischwitz
//
// (c)2011 Hochschule M�nchen, HM
//
// ---------------------------------
#version 330


smooth in vec2 texCoords;			// pixelbezogene Texturkoordinate
out vec4 fragColor;					// Ausgabewert mit 4 Komponenten zwischen 0.0 und 1.0
uniform sampler2DRect textureMap;		// Sampler f�r die Texture Map
uniform vec4 param1;				// param1.x +=F5, -=F6, param1.y +=F7, -=F8, param1.z +=F9, -=F10, param1.w +=F11, -=F12


void main()
{

	float schwell = param1.z/255;
	
	vec4 point = texture(textureMap, texCoords);

	point.x = (point.x + point.y + point.z)/3;


	if (point.x > schwell){
		point.x = 1.0;
	} else {
		point.x = 0.0;
	}

  	point.y = point.x;
	point.z = point.x;
	point.w = point.x;

	fragColor = point;
	
}
