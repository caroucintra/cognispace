shader_type spatial;

uniform vec3 base_color;
uniform vec3 fresnel_color;
uniform float exponent = 4;
uniform float intensity = 4.5;

vec3 fresnel_glow(float expo, float inten, vec3 color, vec3 normal, vec3 view)
{
	return pow((1.0 - dot(normalize(normal), normalize(view))), exponent) * color * intensity;
}

void fragment()
{
	vec3 fresnel = fresnel_glow(exponent, intensity, fresnel_color, NORMAL, VIEW);
	ALBEDO = base_color + fresnel;
	EMISSION = fresnel;
}