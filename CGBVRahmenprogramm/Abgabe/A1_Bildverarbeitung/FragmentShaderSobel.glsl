//
// Fragment Shader für Sobel Operator
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

void main()
{
	vec4 Sample[9];
	float schwell = param1.x / 100;

	for(int i = 0; i < 9; i++){
	 Sample[i] = texture(textureMap, texCoords + offsets[i]);
	 Sample[i].x = (Sample[i].x +Sample[i].y + Sample[i].z)/3;
	 Sample[i].y = Sample[i].x;
	 Sample[i].z = Sample[i].x;
	}

	vec4 HorizEdge = Sample[2] + 2*Sample[5] + Sample[8]
						- (Sample[0] + 2*Sample[3] + Sample[6]);

	vec4 VertEdge = Sample[0] + 2*Sample[1] + Sample[2]
						- (Sample[6] + 2*Sample[7] + Sample[8]);



	fragColor.x = sqrt( pow(HorizEdge.x,2) + pow(VertEdge.x,2));


	if(fragColor.x > schwell){
		fragColor.y = fragColor.x;
		fragColor.z = fragColor.x;
	}
	else{
		fragColor.x = 0;
		fragColor.y = 0;
		fragColor.z = 0;
		}

}