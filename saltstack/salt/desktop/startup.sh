xbindkeys # Xonfigure keys
xrdb -merge ~/.Xresources # Ensure the .Xresources file parameters are used
light-locker & # Needs to be running to enable locking the screen
picom & # Compositor needs to be started on startup, restart doesn't result in multiple processes
wal -Rq # Ensure pywall theming
