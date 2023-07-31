#pragma header

uniform float red;
uniform float green;
uniform float blue;
uniform bool invert;
uniform bool enabled;
void main()
{
    vec2 uv = openfl_TextureCoordv;
    vec4 col = flixel_texture2D(bitmap, uv);

    if (!enabled)
    {
        gl_FragColor = col;
        return;
    }

    //kinda shitty outline but it works for the mod
    if (invert)
    {
        if (col.r > 0 && col.b > 0 && col.g > 0)
            col.rgb = vec3(red/255,green/255,blue/255)*col.a;
    }
    else 
    {
        if (col.r < 0.1 && col.b < 0.1 && col.g < 0.1)
            col.rgb = vec3(red/255,green/255,blue/255)*col.a;
        else
            col.rgb = vec3(0,0,0);
    }


    gl_FragColor = col;
}