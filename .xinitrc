export PATH=~/bin:$PATH
setxkbmap us,ru -option grp:caps_toggle,grp:switch,grp_led:caps,compose:menu

xset -b

locker="i3lock -T -d -c 000000 -F 00ff00 -f"
xautolock -time 5 -locker "${locker}" -nowlocker "${locker}" -detectsleep &

export AWT_TOOLKIT=MToolkit

urxvtd -q -o -f
eval $(gpg-agent --daemon)
i3
