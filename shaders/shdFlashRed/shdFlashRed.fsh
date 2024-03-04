varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main(){
	vec4 baseColor = texture2D(gm_BaseTexture, v_vTexcoord);
    gl_FragColor = v_vColour * baseColor;
    
    gl_FragColor.r = 1.0;
}