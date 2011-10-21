#!/bin/sh

# Before Lion it was possible to run an external display off a laptop and have
# the internal display disabled, even if you opened the lid. This can be useful
# for a myriad of reason including energy saving and better wifi reception. With
# Lion the internal display will always turn on when the lid is opened, even if
# there is already an external display connected. A solution was posted on the 
# Apple support forums [1] by user chenga.8. 

# Source: http://hints.macworld.com/article.php?story=20110901113922148
# [1]: https://discussions.apple.com/message/16059565#16059565

switch=$1

case $switch in
    'OFF'|'Off'|'off')
        # To go back to pre-Lion behaviour enter the following command in Terminal:
        sudo nvram boot-args="iog=0x0"
        ;;
    'ON'|'On'|'on')
        # To undo this change type type the following command or zap the PRAM (press Cmd+Opt+p+r at power up): 
        sudo nvram -d boot-args
        ;;
    *)
        echo 'Usage: toggle-internal-display [on|off]'
esac
