# Disguise Safari on OS X as Mobile Safari on iPad. 
# YouTube, Vimeo, etc will then send you H.264/MP4 video by default. 
# Also most iPad-optimized interfaces will be served instead. 
# Kinda neat. 

defaults write com.apple.Safari CustomUserAgent '"Mozilla/5.0 (iPad; U; CPU OS 3_2_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B500 Safari/531.21.10"'
