#!/bin/sh

case "$(echo "Shutdown\nRestart\nLogout\nSuspend\nLock" | dmenu -p "Power:")" in
        Shutdown) exec systemctl poweroff;;
        Restart) exec systemctl reboot;;
        Suspend) exec swaylock -f -c 000000 & systemctl suspend;;
        Lock) exec systemctl --user start lock.target;;
esac
