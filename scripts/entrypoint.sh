#!/usr/bin/env bash

# exit on error
set -e

# invoke dbus session continuing with keyring script
exec dbus-run-session "/proton/scripts/keyring.sh" "$@"

