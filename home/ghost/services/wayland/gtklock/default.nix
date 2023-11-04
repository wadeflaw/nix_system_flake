{pkgs, ...}: {
  home.packages = [
    pkgs.gtklock
  ];

  # xdg.configFile = {
  #   "gtklock/background".source = ./background;
  #   "gtklock/config.ini".text = ''
  #     [main]
  #     modules=${pkgs.gtklock-powerbar-module}/lib/gtklock/powerbar-module.so
  #   '';
  #   "gtklock/style.css".text = ''
  #         * {
  #         all: unset;
  #         border: 0px;
  #         }
  #
  #         window {
  #             background: rgba(0, 0, 0, 0.4);
  #             /* background-color: #1A1B26; */
  #             /* background-image: url("background"); */
  #             background-size: cover;
  #             background-repeat: no-repeat;
  #             background-position: center;
  #         }
  #
  #     #window-box {
  #             /* background-color: #1A1B26; */
  #             border-radius: 1.5rem;
  #             padding: 1.5rem;
  #             /* border: 4px solid #7E64C5; */
  #             border: 0px solid black;
  #         }
  #
  #     #input-label {
  #             font-size: 1.5rem;
  #             color: transparent;
  #             background-color: transparent;
  #             margin: -20rem;
  #             border: 0px solid black;
  #         }
  #
  #     #input-field {
  #             background-color: rgba(26, 27, 38, 0.7);
  #             border-radius: 8px;
  #             font-size: 14pt;
  #             padding: 5px 15px;
  #             margin: 7px;
  #             box-shadow: 2px 2px 4px #16161E;
  #             min-height: 40px;
  #         }
  #
  #     #input-field:focus {
  #             background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0) 96%, #FFD9DE 96%);
  #         }
  #
  #     #unlock-button {
  #             margin: -20rem;
  #             color: transparent;
  #             background-color: transparent;
  #         }
  #
  #     #error-label {
  #             color: #F38BA8;
  #         }
  #
  #         /* #clock-label {
  #             font-family: Lexend;
  #             font-size: 3.5rem;
  #             color: transparent;
  #             border-radius: 9999px;
  #             min-height: 150px;
  #             min-width: 150px;
  #             background-image: url('/var/lib/AccountsService/icons/end');
  #             background-size: 100% auto;
  #             box-shadow: 2px 2px 4px #16161E;
  #         } */
  #
  #     #clock-label {
  #             font-family: 'Lexend';
  #             font-size: 6rem;
  #             font-weight: 500;
  #             /* background-color: rgba(26, 27, 38, 1); */
  #             border-radius: 1.2rem;
  #             padding: 0.5rem;
  #             padding-left: 0.7rem;
  #             margin: 0.6rem;
  #             margin-top: -35rem;
  #             /* border: 0.2rem solid #7E64C5; */
  #             color: #FFD9DE;
  #             text-shadow: 2px 2px 4px #16161E;
  #         }
  #
  #     #user-image {
  #             /* min-width: 200px;
  #             min-height: 200px; */
  #         }
  #
  #     #powerbar-box {
  #
  #         }
  #     #poweroff-button {
  #             background: rgba(200, 200, 200, 0.1);
  #             min-width: 2rem;
  #             min-height: 2rem;
  #             color: #FFD9DE;
  #             font-weight: 500;
  #             border-radius: 99px;
  #             margin: 10px;
  #         }
  #
  #     #suspend-button {
  #             background: rgba(200, 200, 200, 0.1);
  #             min-width: 2rem;
  #             min-height: 2rem;
  #             color: #FFD9DE;
  #             font-weight: 500;
  #             border-radius: 99px;
  #             margin: 10px;
  #         }
  #
  #     #reboot-button {
  #             background: rgba(200, 200, 200, 0.1);
  #             min-width: 2rem;
  #             min-height: 2rem;
  #             color: #FFD9DE;
  #             font-weight: 500;
  #             border-radius: 99px;
  #             margin: 10px;
  #         }
  #
  #     #poweroff-button:hover, #reboot-button:hover, #suspend-button:hover {
  #             background: rgba(200, 200, 200, 0.3);
  #         }
  #
  #     #poweroff-button:active, #reboot-button:active, #suspend-button:active {
  #             background: rgba(200, 200, 200, 0.5);
  #         }
  #   '';
  # };
}
