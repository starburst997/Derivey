#!/bin/zsh

# Mac OS X is a bit annoying and will not kill previous instances of flash player

# cd to the script's directory so we can run it from anywhere
cd "$(dirname "$0")"

# Get to the root folder
cd ../haxe

# Kill previous version
killall "Flash Player Debugger"

# Compile
haxe project.hxml -v "$@" --times -debug

# Run
/Applications/Flash\ Player.app/Contents/MacOS/Flash\ Player\ Debugger Drivey.swf