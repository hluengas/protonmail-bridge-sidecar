#!/usr/bin/env bash

# exit on error
set -e

# get pwd
WORKING_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# invoke dbus session continuing with keyring script
dbus-run-session $WORKING_DIR/keyring.sh "$@"
