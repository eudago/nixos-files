"
monitor=,preferred,auto,1
exec-once=waybar
exec=swaybg -i ${./wallpaper.jpg} --mode fill
exec-once=mako
exec-once=swayidle -w timeout 300 'swaylock -f -c 000000'

bind=SUPER,x,exec,wofi -S drun -x 10 -y 10 -W 25% -H 60%
bind=SUPER,d,exec,rofi -show drun
bind=SUPER,e,exec,rofi -show emoji
bind=SUPER,RETURN,exec,alacritty
bind=SUPERSHIFT,Q,exit
bind=SUPER,C,killactive
bind=SUPER, Space, togglefloating,


input {
  kb_layout=es
  touchpad {
    disable_while_typing=false
  }
}

general {
    layout=dwindle
    sensitivity=1.0 
    gaps_in=5
    gaps_out=20
    border_size=1.5
    col.active_border=0xff14747e
    col.inactive_border=0x517F8D
    apply_sens_to_raw=0 
}

decoration {
    active_opacity=0.88
    inactive_opacity=0.68
    fullscreen_opacity=1.0
    rounding=5
    blur=true
    blur_size=6
    blur_passes=3
    blur_new_optimizations=true
    blur_ignore_opacity=true
    drop_shadow=true
    shadow_range=12
    shadow_offset=3 3
    col.shadow=0x44000000
    col.shadow_inactive=0x66000000
}


blurls=waybar

animations {
    enabled=1z
    bezier=overshot,0.13,0.99,0.29,1.1
    animation=windows,1,4.3,overshot,popin
    animation=fade,1,10,default
    animation=workspaces,1,6,overshot,slide
    animation=border,1,10,default
}

dwindle {
    pseudotile=1 
    force_split=0
    no_gaps_when_only = true
}

master {
  new_on_top=true
  no_gaps_when_only = true
}

misc {
  disable_hyprland_logo=true
  disable_splash_rendering=true
  mouse_move_enables_dpms=true
  no_vfr=1
}


windowrule=float,Rofi
windowrule = float, title:wlogout

windowrule=opacity 0.88,alacritty

bind=SUPER,u,exec,hyprctl keyword input:kb_layout us
bind=SUPER,e,exec,hyprctl keyword input:kb_layout es

bind=SUPER,j,movefocus,d
bind=SUPER,k,movefocus,u

bind=SUPER,h,movefocus,l
bind=SUPER,l,movefocus,r

bind=SUPER,left,resizeactive,-40 0
bind=SUPER,right,resizeactive,40 0

bind=SUPER,up,resizeactive,0 -40
bind=SUPER,down,resizeactive,0 40

bind=SUPERSHIFT,h,movewindow,l
bind=SUPERSHIFT,l,movewindow,r
bind=SUPERSHIFT,k,movewindow,u
bind=SUPERSHIFT,j,movewindow,d

bindm=SUPER,mouse:272,movewindow
bindm=SUPER,mouse:273,resizewindow
bind=SUPERSHIFT,f,fullscreen

bind=SUPER,1,workspace,1
bind=SUPER,2,workspace,2
bind=SUPER,3,workspace,3
bind=SUPER,4,workspace,4
bind=SUPER,5,workspace,5
bind=SUPER,6,workspace,6
bind=SUPER,7,workspace,7
bind=SUPER,8,workspace,8
bind=SUPER,9,workspace,9
bind=SUPER,0,workspace,10

bind=SUPERSHIFT,1,movetoworkspacesilent,1
bind=SUPERSHIFT,2,movetoworkspacesilent,2
bind=SUPERSHIFT,3,movetoworkspacesilent,3
bind=SUPERSHIFT,4,movetoworkspacesilent,4
bind=SUPERSHIFT,5,movetoworkspacesilent,5
bind=SUPERSHIFT,6,movetoworkspacesilent,6
bind=SUPERSHIFT,7,movetoworkspacesilent,7
bind=SUPERSHIFT,8,movetoworkspacesilent,8
bind=SUPERSHIFT,9,movetoworkspacesilent,9
bind=SUPERSHIFT,0,movetoworkspacesilent,10

bind=,Print,exec,grimblast --notify copy output
bind=ALT_SHIFT,1,exec,grimblast --notify copysave active
bind=ALT_SHIFT,2,exec,grimblast --notify copysave screen
bind=ALT_SHIFT,3,exec,grimblast --notify copysave window
bind=ALT_SHIFT,4,exec,grimblast --notify copysave area

bind=ALT_SHIFT,l,exec,wlogout

bind=,XF86AudioRaiseVolume,exec,pactl set-sink-volume @DEFAULT_SINK@ +5%
bind=,XF86AudioLowerVolume,exec,pactl set-sink-volume @DEFAULT_SINK@ -5%
bind=,XF86AudioMute,exec,pactl set-sink-mute @DEFAULT_SINK@ toggle
"

