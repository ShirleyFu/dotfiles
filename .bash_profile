#!/bin/bash

### variables & functions
# resolve currentDirectory even if symlink
source="${BASH_SOURCE[0]}"
while [ -h "$source" ]; do # resolve $source until the file is no longer a symlink
  currentDirectory="$( cd -P "$( dirname "$source" )" && pwd )"
  source="$(readlink "$source")"
  [[ $source != /* ]] && source="$currentDirectory/$source" # if $source was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
workingDir="$( cd -P "$( dirname "$source" )" && pwd )"

### imports
source $workingDir/scripts/common.sh
source $workingDir/scripts/os.sh

### main

#####################################################################
# Mac : Homebrew
source $workingDir/scripts/homebrewInstall.sh

# link additional own homebrew functions
source $workingDir/scripts/brewtools.sh

# install brew formulas
source $workingDir/scripts/homebrewFormulas.sh

# install brew casks
source $workingDir/scripts/homebrewCask.sh

#####################################################################
# Ubuntu : apt
source $workingDir/scripts/ubuntuAptInstall.sh

#####################################################################
# Git aware prompt
source $workingDir/scripts/gitAwarePromptInstall.sh

#####################################################################
# Java
source $workingDir/scripts/javaInstall.sh

#####################################################################
# Other development tools: node.js, ruby, sass, compass
source $workingDir/scripts/devToolsInstall.sh

#####################################################################
# Paths
export PATH=/usr/local/bin:$PATH

if isMacOs ; then
  export PATH=/Applications:$PATH

  ## SCM tool
  export PATH=/opt/jazz/scmtools/eclipse:$PATH

  # Android Home
  export ANDROID_HOME=`brew --prefix android-sdk`
  launchctl setenv ANDROID_HOME $ANDROID_HOME

  # MacPorts Installer addition on 2015-08-13_at_15:10:48: adding an appropriate PATH variable for use with MacPorts.
  export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
  # Finished adapting your PATH environment variable for use with MacPorts.


  #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
  export SDKMAN_DIR="/Users/tokra/.sdkman"
  [[ -s "/Users/tokra/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/tokra/.sdkman/bin/sdkman-init.sh"
fi

#####################################################################
# Aliases
source $workingDir/scripts/aliases.sh
