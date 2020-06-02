Shader "Unlit/GLSLShader1"
{
    Properties
    {
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            Tags { "LightMode" = "ForwardBase"}

            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag

            #include "UnityCG.cginc"

            fixed4 frag(v2f_img i) : SV_Target
            {
                fixed2 resolution = _ScreenParams;
                fixed2 position = (i.uv * resolution / resolution.xy) - .75;
                float time = _Time * 30;

                float y = 1.2 * position.y * sin(27.0 * position.y - 20.0 * time * 0.1);

                y = 1.5 / (200. * abs(position.x - y));
                y += 1. / (165. * length(position - fixed2(0.0, position.y)));
                return fixed4(position.y * 0.5 - y, y, y * 5.3, 2.0);
            }
            ENDCG
        }
    }
}
