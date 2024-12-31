#!/bin/sh

## Copyright (C) 2023 - 2025 ENCRYPTED SUPPORT LLC <adrelanos@whonix.org>
## See the file COPYING for copying conditions.

## Based on:
## /usr/lib/dracut/modules.d/99base/dracut-lib.sh
if [ -z "$DRACUT_SYSTEMD" ]; then
    force_echo() {
        echo "<28>dracut INFO: $*" > /dev/kmsg
        echo "dracut INFO: $*" >&2
    }
else
    force_echo() {
        echo "INFO: $*" >&2
    }
fi
