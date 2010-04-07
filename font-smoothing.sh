#!/bin/bash

# This script can change the font smoothing level for Snow Leopard 
# since Snow Leopard relies on external displays to report if it is
# LCD or not. This assumption doesn't work as expected because many
# 3rd party displays do not report properly. Thus we need to manually
# enable font smoothing in those cases. 

# Possible values of font smoothing are: 
# 0: turn off font smoothing (best for CRT)
# 1: light smoothing
# 2: medium (best for LCD)
# 3: strong smoothing

defaults -currentHost write -globalDomain AppleFontSmoothing -int 2

# per-application control
# e.g. TextMate
#defaults write com.macromates.textmate AppleFontSmoothing -int 1
