shader_type canvas_item;

#define iTime TIME
#define iResolution 1.0/SCREEN_PIXEL_SIZE

uniform vec3 b_color = vec3(0.9);
uniform vec3 color = vec3(1.,.6,.2);
uniform float prm1 : hint_range(-3.0, 2.3, 0.1) = 1.0;
uniform float prm2 = 1.0;

float hash(vec3 p3)
{
	p3  = fract(p3 * .1031);
    p3 += dot(p3, p3.zyx + 31.32);
    return (fract((p3.x + p3.y) * p3.z)-.5)*1.5;
}


#define iterations 1
#define flowintensity 1.25
#define numOctaves 5
#define flowoffset 0.25

vec4 noised( in vec3 x )
{
    vec3 i = vec3(floor(x));
    vec3 w = fract(x);
    
    // cubic interpolation
    vec3 u = w*w*(3.0-2.0*w);
    vec3 du = 6.0*w*(1.0-w); 
    
    float a = hash(i+vec3(0,0,0));
    float b = hash(i+vec3(1,0,0));
    float c = hash(i+vec3(0,1,0));
    float d = hash(i+vec3(1,1,0));
    float e = hash(i+vec3(0,0,1));
	float f = hash(i+vec3(1,0,1));
    float g = hash(i+vec3(0,1,1));
    float h = hash(i+vec3(1,1,1));
    
    float k0 =   a;
    float k1 =   b - a;
    float k2 =   c - a;
    float k3 =   e - a;
    float k4 =   a - b - c + d;
    float k5 =   a - c - e + g;
    float k6 =   a - b - e + f;
    float k7 = - a + b + c - d + e - f - g + h;

    return vec4( k0 + k1*u.x + k2*u.y + k3*u.z + k4*u.x*u.y + k5*u.y*u.z + k6*u.z*u.x + k7*u.x*u.y*u.z, 
                 du * vec3( k1 + k4*u.y + k6*u.z + k7*u.y*u.z,
                            k2 + k5*u.z + k4*u.x + k7*u.z*u.x,
                            k3 + k6*u.x + k5*u.y + k7*u.x*u.y ) );
}

vec4 fbm( vec3 x )
{    
    float G = exp2(-1.);
    float f = 1.0;
    float a = 1.0;
    vec4 t;
    for( int i=0; i<numOctaves; i++ )
    {
        t += a*noised(x * f);
        f *= 2.0;
        a *= G;
    }
    return t;
}


//@CollinInMySternum function to make swirly noise using fbm
float curl(vec3 p, vec3 n)
{
    for(int i=0; i<iterations; i++)
    {
        vec3 x = p + flowoffset;
        vec3 g = cross(fbm(x).yzw, n);
        p -= (flowintensity / float(iterations)) * g;
    }
    
    return (fbm(p).x + 1.0) / 2.0;
}


float sdSphere(in vec3 p, in float r)
{
    vec3 q = normalize(p);
    float k = curl(p+iTime*.15, q);
    return length(p)-r-k*.16;
}

void fragment()
{
    //vec2 uv = (FRAGCOORD.xy-.5*iResolution.xy)/iResolution.y * 0.000005;
	float ratio = SCREEN_PIXEL_SIZE.x / SCREEN_PIXEL_SIZE.y;
    vec2 uv = (SCREEN_UV-0.5) / vec2(ratio, 1.0);
  
    vec3 ro = vec3(.0, .0, 1.65);
    vec3 rd = normalize(vec3(uv.x, uv.y, -1.0));
  
    vec3 col = b_color;
    float td = prm1;
    for (int i = 0; i < 30; ++i)
    {
        vec3 p = ro + td*rd;
        float d = sdSphere(p, .5) * prm2;
        td += d;
        if (d < .01)
        {
            vec3 q = normalize(p);
            vec2 tuv = vec2(atan(q.z, q.x), acos(q.y));
            col.rgb = mix(color,vec3(1), curl(p+iTime*.15, q));
            break;
        }
        
        if (td > 10.0)
            break;
    }
    COLOR.rgb = col;
	COLOR.a = col.g;
	
	}