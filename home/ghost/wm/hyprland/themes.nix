{...}: {
  xdg.configFile."hypr/themes/shader_def.frag".text = ''
    precision mediump float;
    varying vec2 v_texcoord;
    uniform sampler2D tex;

    void main() {
      vec4 pixColor = texture2D(tex, v_texcoord);

        float var = 1.0;
          pixColor[3] *= var;
          pixColor[2] *= var;
          pixColor[1] *= var;
          pixColor[0] *= var;

      gl_FragColor = pixColor;
    }
  '';
  xdg.configFile."hypr/themes/shader_night.frag".text = ''
    precision mediump float;
    varying vec2 v_texcoord;
    uniform sampler2D tex;

    void main() {
      vec4 pixColor = texture2D(tex, v_texcoord);

        float var = 0.7;
          pixColor[3] *= var;
          pixColor[2] *= var - 0.4;
          pixColor[1] *= var;
          pixColor[0] *= var;

      gl_FragColor = pixColor;
    }
  '';
}
