#!/bin/bash

# parts of code taken from here: https://github.com/swarminglogic/mpris-ctrl

player="DeaDBeeF"
mp_object="/org/mpris/MediaPlayer2"

# $1:interface_path
# $2:property_name
# $3..#:parameters
function dbus-set-any-property {
    local interface_path=$1
    local property_name=$2
    shift 2
    local parameters="$@"
    dbus-send --print-reply --session \
        --dest=org.mpris.MediaPlayer2.${player} \
        $mp_object org.freedesktop.DBus.Properties.Set \
        string:"$interface_path" string:"$property_name" "$parameters"
}

# $1:interface_path
# $2:property_name
function dbus-get-any-property {
    dbus-send --print-reply --session \
        --dest=org.mpris.MediaPlayer2.${player} \
        $mp_object org.freedesktop.DBus.Properties.Get \
        string:"$1" string:"$2"
}

function dbus-set-player-property {
    dbus-set-any-property "org.mpris.MediaPlayer2.Player" "${1}" "${@:2}"
}

function get-volume {
    dbus-get-any-property "org.mpris.MediaPlayer2.Player" "Volume"
}

function get-online {
    dbus-send --session \
              --dest=org.freedesktop.DBus \
              --type=method_call          \
              --print-reply               \
              /org/freedesktop/DBus       \
              org.freedesktop.DBus.ListNames | grep org.mpris.MediaPlayer2.${player}
}

if [ "$#" -eq 1 ]; then
    param=$1

    if [[ $(get-online) != "" ]]; then
        if [ $param == "full" ]; then
	    dbus-set-player-property Volume variant:double:1.0 >/dev/null
        elif [ $param == "low" ]; then
	    dbus-set-player-property Volume variant:double:0.6 >/dev/null
        fi
    fi
fi
