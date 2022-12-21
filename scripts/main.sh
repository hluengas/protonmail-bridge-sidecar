#!/usr/bin/env bash

# exit on error
set -e

# Check For First Time Setup
# If setup file exists, run normally
if [ $LOGIN == "false" ]; then

    if [ $INTERACTIVE == "false" ]; then
        
        /proton/proton-bridge --noninteractive
    
    else

        /proton/proton-bridge --cli
        
    fi

else 
    expect /proton/scripts/login.sh
fi