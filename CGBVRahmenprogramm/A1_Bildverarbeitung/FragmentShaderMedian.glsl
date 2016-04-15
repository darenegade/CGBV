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

uniform vec2 offsets3[9] = vec2[](	vec2(-1,  1),
									vec2(-1,  0),
									vec2(-1, -1),
									vec2( 0,  1),
									vec2( 0,  0),
									vec2( 0, -1),
									vec2( 1,  1),
									vec2( 1,  0),
									vec2( 1, -1)	);

uniform vec2 offsets5[25] = vec2[](  vec2(-2,  2), vec2(-1,  2), vec2(0,  2), vec2(1,  2), vec2(2,  2),
                                    vec2(-2,  1), vec2(-1,  1), vec2(0,  1), vec2(1,  1), vec2(2,  1),
                                    vec2(-2,  0), vec2(-1,  0), vec2(0,  0), vec2(1,  0), vec2(2,  0),
                                    vec2(-2, -1), vec2(-1, -1), vec2(0, -1), vec2(1, -1), vec2(2, -1),
                                    vec2(-2, -2), vec2(-1, -2), vec2(0, -2), vec2(1, -2), vec2(2, -2)   );

uniform vec2 offsets7[49] = vec2[](      vec2(-3,  3), vec2(-2,  3), vec2(-1,  3), vec2(0,  3), vec2(1,  3), vec2(2,  3), vec2(3,  3),
                                        vec2(-3,  2), vec2(-2,  2), vec2(-1,  2), vec2(0,  2), vec2(1,  2), vec2(2,  2), vec2(3,  2),
                                        vec2(-3,  1), vec2(-2,  1), vec2(-1,  1), vec2(0,  1), vec2(1,  1), vec2(2,  1), vec2(3,  1),
                                        vec2(-3,  0), vec2(-2,  0), vec2(-1,  0), vec2(0,  0), vec2(1,  0), vec2(2,  0), vec2(3,  0),
                                        vec2(-3, -1), vec2(-2, -1), vec2(-1, -1), vec2(0, -1), vec2(1, -1), vec2(2, -1), vec2(3, -1),
                                        vec2(-3, -2), vec2(-2, -2), vec2(-1, -2), vec2(0, -2), vec2(1, -2), vec2(2, -2), vec2(3, -2),
                                        vec2(-3, -3), vec2(-2, -3), vec2(-1, -3), vec2(0, -3), vec2(1, -3), vec2(2, -3), vec2(3, -3)    );


void main()
{

  float choice = param1.x;

  if(choice == 0.0){
  	vec4 A[9];
		
	for(int i = 0; i < 9; i++){
		A[i] = texture( textureMap, texCoords + offsets3[i]);
	}

		for(int n = 8; n >= 0; n--){
		int i = 0;
		while(i < n){

			vec4 tmp = min(A[i],A[i+1]);
			A[i+1] = A[i] + A[i+1] - tmp;
			A[i] = tmp;
			i++;
		}
	}

	fragColor = A[4];
  
  } else if(choice == 1.0){
  
  	vec4 A[25];
		
	for(int i = 0; i < 25; i++){
		A[i] = texture( textureMap, texCoords + offsets5[i]);
	}

		for(int n = 24; n >= 0; n--){
		int i = 0;
		while(i < n){

			vec4 tmp = min(A[i],A[i+1]);
			A[i+1] = A[i] + A[i+1] - tmp;
			A[i] = tmp;
			i++;
		}
	}

	fragColor = A[12];
  
  } else{

	vec4 A[49];
		
	for(int i = 0; i < 49; i++){
		A[i] = texture( textureMap, texCoords + offsets7[i]);
	}

		for(int n = 48; n >= 0; n--){
		int i = 0;
		while(i < n){

			vec4 tmp = min(A[i],A[i+1]);
			A[i+1] = A[i] + A[i+1] - tmp;
			A[i] = tmp;
			i++;
		}
	}

	fragColor = A[24];

	}
}
