#!/bin/sh

## Copyright (C) 2023 - 2025 ENCRYPTED SUPPORT LLC <adrelanos@whonix.org>
## Copyright (C) 2023 - 2023 Friedrich Doku <friedrichdoku@gmail.com>
## See the file COPYING for copying conditions.

. /lib/ram-wipe-lib.sh

ram_wipe__exit_check_needshutdown() {
   local wipe_action
   wipe_action=$(getarg wiperamaction)

   if [ "$wipe_action" = "reboot" ]; then
      force_echo "wipe-ram-exit-needshutdown.sh: reboot..."
      ## Why reboot? Why not just continue to boot?
      ## 1. To get rid of kernel command line options 'wiperamexit=yes wiperamaction=reboot'?
      ## 2. Also RAM wipe using sdmem leads to an OOM and the following error as seen in serial console:
      ##    [FAILED] Failed to start dracut pre-udev hook.
      ## In other words, otherwise the system might not boot up cleanly.
      reboot --force
      force_echo "wipe-ram-exit-needshutdown.sh: After reboot."
   elif [ "$wipe_action" = "poweroff" ]; then
      force_echo "wipe-ram-exit-needshutdown.sh: poweroff..."
      poweroff --force
      force_echo "wipe-ram-exit-needshutdown.sh: After poweroff."
   elif [ "$wipe_action" = "halt" ]; then
      force_echo "wipe-ram-exit-needshutdown.sh: halt..."
      halt --force
      force_echo "wipe-ram-exit-needshutdown.sh: After halt."
   else
      force_echo "wipe-ram-exit-needshutdown.sh: normal boot..."
   fi
}

ram_wipe__exit_check_needshutdown
