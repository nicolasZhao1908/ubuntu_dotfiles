killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

desktop=$(echo $DESKTOP_SESSION)

case $desktop in
    i3)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		MONITOR=$m polybar --reload mainbar-i3 -c ~/.config/polybar/config.ini &	
      done
    else
    polybar --reload mainbar-i3 -c ~/.config/polybar/config.ini &
    fi
    ;;
    openbox)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload mainbar-openbox -c ~/.config/polybar/config.ini &
      done
    else
    polybar --reload mainbar-openbox -c ~/.config/polybar/config.ini &
    fi
#    if type "xrandr" > /dev/null; then
#      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#        MONITOR=$m polybar --reload mainbar-openbox-extra -c ~/.config/polybar/config.ini &
#      done
#    else
#    polybar --reload mainbar-openbox-extra -c ~/.config/polybar/config.ini &
#    fi

    ;;
    bspwm)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload mainbar-bspwm -c ~/.config/polybar/config.ini &
      done
    else
    polybar --reload mainbar-bspwm -c ~/.config/polybar/config.ini &
    fi
    ;;
esac
