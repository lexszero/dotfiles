setxkbmap us,ru -option grp:caps_toggle,grp:switch,grp_led:caps,compose:menu

xset -b

xautolock -time 5 -locker lock_screen -nowlocker lock_screen -detectsleep -corners +000 -cornerdelay 2 &

export AWT_TOOLKIT=MToolkit

urxvtd -q -o -f
eval $(gpg-agent --daemon)
xbindkeys
i3 
#while :; do
#	i3 &
#	I3_PID=$!
#	feed_bar.sh | i3-wsbar -c "dzen2 -e '' -x %x -dock -ta l -fn 'Monospace:size=10'" &
#	wait $I3_PID
#done
