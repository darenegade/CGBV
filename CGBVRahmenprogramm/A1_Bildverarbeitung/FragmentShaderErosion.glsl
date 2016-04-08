//
// Fragment Shader für den morphologischen Operator 
// Erosion
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

uniform vec2 resolution;

void main()
{
	int dist = (int) param1.x;
	vec2 coords;
	
	vec4 MinValue = vec4( 1.0, 1.0, 1.0, 1.0 );

	for( int x = 0 - dist; x <= dist; x++ ){
		for( int y = 0 - dist; y <= dist; y++ ){

			coords = texCoords + vec2(x,y);

			if(coords.x < 0)
				coords.x = 0;
			if(coords.y < 0)
				coords.y = 0;
			if(coords.x > resolution.x)
				coords.x = resolution.x;
			if(coords.y > resolution.y)
				coords.y = resolution.y;

			MinValue = min( texture( textureMap, coords), MinValue );

		}
	}
	fragColor = MinValue;

}