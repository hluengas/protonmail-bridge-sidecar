#!/usr/bin/env bash

# exit on error
set -e

# get pwd
WORKING_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# capture DBUS_SESSION_BUS_ADDRESS for later use
echo $DBUS_SESSION_BUS_ADDRESS > /etc/DBUS_SESSION_BUS_ADDRESS

# kill any previously running gnome-keyring
killall -q -9 "$(whoami)" gnome-keyring-daemon || echo ''


eval $(echo -n "$" \
        # pass "$" as the password to gnome-keyring
           | gnome-keyring-daemon --unlock \
        # initialize gnome-keyring
           | sed -e 's/^/export /')
        # export GNOME_KEYRING_CONTROL
        # export SSH_AUTH_SOCK

# send Ctrl+D to complete gnome-keyring setup
echo '' >&2

bash "$WORKING_DIR/main.sh"