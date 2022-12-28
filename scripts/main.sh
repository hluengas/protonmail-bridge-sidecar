#!/usr/bin/env bash

# exit on error
set -e

# Check For First Time Setup
# If setup file exists, run normally
if [ $LOGIN == "false" ]; then

    if [ $INTERACTIVE == "false" ]; then
        
        exec /proton/proton-bridge --noninteractive
    
    else

        exec /proton/proton-bridge --cli
        
    fi

else 
    exec /proton/scripts/login.sh
fi