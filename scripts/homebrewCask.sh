#!/bin/bash

# resolve currentDirectory even if symlink
source="${BASH_SOURCE[0]}"
while [ -h "$source" ]; do # resolve $source until the file is no longer a symlink
  currentDirectory="$( cd -P "$( dirname "$source" )" && pwd )"
  source="$(readlink "$source")"
  [[ $source != /* ]] && source="$currentDirectory/$source" # if $source was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
my_dir="$( cd -P "$( dirname "$source" )" && pwd )"

### imports
source $my_dir/os.sh
source $my_dir/brewtools.sh

### main
# Mac homebrew cask : Applications
if isMacOs ; then
  ########################## Development tools
  # Docker toolbox
  brewCaskInstall 'docker-toolbox'
  # Java 7
  brewCaskInstall 'java7'
  # Java 8
  brewCaskInstall 'java'
  # iTerm2
  brewCaskInstall 'iterm2'
  # Sublime
  brewCaskInstall 'sublime-text'
  # Visual Studio code
  brewCaskInstall 'visual-studio-code'
   # Android Studio
  brewCaskInstall 'android-studio'
  # Source Tree
  brewCaskInstall 'sourcetree'
  # Virtual Box
  brewCaskInstall 'virtualbox'

  ########################## System utils
  # App Zapper
  brewCaskInstall 'appzapper'
  # better touch tool
  brewCaskInstall 'bettertouchtool'
  # gfx card status
  brewCaskInstall 'gfxcardstatus'
  # Mac ports
  brewCaskInstall 'macports'
  # smc fan control
  brewCaskInstall 'smcfancontrol'
  # XtraFinder
  brewCaskInstall 'xtrafinder'
  # Tuxera NTFS
  brewCaskInstall 'tuxera-ntfs'

  ########################## Tools for daily use
  # Google Chrome
  brewCaskInstall 'google-chrome'
  # Google Drive
  brewCaskInstall 'google-drive'
  # Mozilla Firefox
  brewCaskInstall 'firefox'
  # Filezilla
  brewCaskInstall 'filezilla'
  # Adobe Creative Cloud
  brewCaskInstall 'adobe-creative-cloud'
  # Slack
  brewCaskInstall 'slack'
  # Skitch
  brewCaskInstall 'skitch'
  # Team Viewer
  brewCaskInstall 'teamviewer'
  # XN View MP
  brewCaskInstall 'xnviewmp'
  # Zoom.us 
  brewCaskInstall 'zoomus'
  # Real VNC
  brewCaskInstall 'real-vnc'
  # Skype
  brewCaskInstall 'skype'

  ########################## Tools for fun & pleasure
  # Spotify
  brewCaskInstall 'spotify'
  # Djay pro 
  brewCaskInstall 'djay-pro'
  # Kid3
  brewCaskInstall 'kid3'
  # Messenger
  brewCaskInstall 'messenger'
  # Steam
  brewCaskInstall 'steam'
  # Viber
  brewCaskInstall 'viber'
  # Whats app
  brewCaskInstall 'whatsapp'
  # VLC Media Player
  brewCaskInstall 'vlc'
  # Gopro Studio
  brewCaskInstall 'gopro-studio'
  # HandBrake
  brewCaskInstall 'handbrake'
  # cakebrew
  brewCaskInstall 'cakebrew'

  ########################## Tools for use with NAS
  # Trasmission Remote Gui
  brewCaskInstall 'transmission-remote-gui'
  # Plex Home Theater
  brewCaskInstall 'plex-home-theater'
  # Deluge (fails to open)
  # brewCaskInstall 'deluge'
fi
