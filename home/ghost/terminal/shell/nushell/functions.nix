{pkgs, lib, ...}:''
        def , [...packages] {
            nix shell ($packages | each {|s| $"nixpkgs#($s)"})
        }  

        # def dr [dir] {
        #     mkdir $dir and cd $dir
        # }

        def myip [] {                   
                $env.ip = (curl -s ifconfig.me)     
                echo $"Your public Ip is: ($env.ip)"
                echo $env.ip | wl-copy              
        }                                   

        def lyall [] {
                hyprctl keyword input:kb_layout us,ru,ua
        }

        def weather [] {
                curl $"wttr.in/(curl -s ifconfig.me)"
        }       

        def cheat [query: string] {            
                curl $"cheat.sh/(echo $query | tr ' ' '+')"
        }                                          
''
