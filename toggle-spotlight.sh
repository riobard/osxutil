#!/bin/sh

status=$1

case $status in

    'ON'|'On'|'on')
        echo '>>> Enable Spotlight on all volumes'
        sudo mdutil -a -i on
        ;;


    'OFF'|'Off'|'off')
        echo '>>> Disable Spotlight and delete indices on all volumes'
        sudo mdutil -a -i off -E
        ;;

    *)
        echo 'Usage: toggle-spotlight [on|off]'
esac
