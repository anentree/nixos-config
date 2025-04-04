#!/usr/bin/env bash

resize-sws() {
    # Wait for the window to appear or disappear (adjust the sleep time if needed)
    sleep 0.1
    
    if hyprctl activewindow | grep -q -E "class: (Spotify|teams-for-linux|kitty|net.cozic.joplin_desktop|discord)"; then
       hyprctl dispatch resizeactive exact 90% 85%
       hyprctl dispatch float
       hyprctl dispatch centerwindow
    fi
}

resize-sws

