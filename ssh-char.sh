#!/bin/bash

#############################################################################
# Enable International Characters in Mac OS X SSH
#
# Author:  Riobard Zhan
# Email:   me@riobard.com
# Web:     http://riobard.com
# Version: 0.1
#
# This script will modify your system to enable international characters in 
# Mac OS X SSH. You should run this script on every Mac you want to access 
# via SSH by the following command:
#   sudo bash ssh-char.sh
#
# WARNING: I WILL NOT BE RESPONSABLE FOR ANY DATA LOSS OR DAMAGES CAUSED BY 
#          THIS SCRIPT. USE AT YOUR OWN RISK!
#############################################################################

printf "\n\n# Accept environment variables\nAcceptEnv LANG LC_*" >> /etc/sshd_config
printf "\n\n# Send language environment variables\nSendEnv LANG LC_*" >> /etc/ssh_config
