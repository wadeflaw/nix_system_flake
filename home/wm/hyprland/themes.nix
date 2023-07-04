_: {
  xdg.configFile."hypr/themes/screenShader.frag".text = ''
    precision mediump float;
    varying vec2 v_texcoord;
    uniform sampler2D tex;

    void main() {
      vec4 pixColor = texture2D(tex, v_texcoord);

      float var = 0.9;
      pixColor[3] *= var;
      pixColor[2] *= var;
      pixColor[1] *= var;
      pixColor[0] *= var;

      gl_FragColor = pixColor;
    }
  '';
  xdg.configFile."hypr/themes/mocha.conf".text = ''
    $rosewater = 0xfff5e0dc
    $flamingo  = 0xfff2cdcd
    $pink      = 0xfff5c2e7
    $mauve     = 0xffcba6f7
    $red       = 0xfff38ba8
    $maroon    = 0xffeba0ac
    $peach     = 0xfffab387
    $yellow    = 0xfff9e2af
    $green     = 0xffa6e3a1
    $teal      = 0xff94e2d5
    $sky       = 0xff89dceb
    $sapphire  = 0xff74c7ec
    $blue      = 0xff89b4fa
    $lavender  = 0xffb4befe

    $text      = 0xffcdd6f4
    $subtext1  = 0xffbac2de
    $subtext0  = 0xffa6adc8

    $overlay2  = 0xff9399b2
    $overlay1  = 0xff7f849c
    $overlay0  = 0xff6c7086

    $surface2  = 0xff585b70
    $surface1  = 0xff45475a
    $surface0  = 0xff313244

    $base      = 0xff1e1e2e
    $mantle    = 0xff181825
    $crust     = 0xff11111b
  '';
}
