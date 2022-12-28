#!/usr/bin/env bash

# exit on error
set -e

# capture DBUS_SESSION_BUS_ADDRESS for later use
echo $DBUS_SESSION_BUS_ADDRESS > /etc/DBUS_SESSION_BUS_ADDRESS

# pass "$" as the password to gnome-keyring
# initialize gnome-keyring
# export GNOME_KEYRING_CONTROL
# export SSH_AUTH_SOCK
eval $(echo -n "$" | gnome-keyring-daemon --unlock | sed -e 's/^/export /')

# send Ctrl+D to complete gnome-keyring setup
echo '' >&2

exec "/proton/scripts/main.sh"