#!/bin/sh

## Copyright (C) 2023 - 2025 ENCRYPTED SUPPORT LLC <adrelanos@whonix.org>
## Copyright (C) 2023 - 2023 Friedrich Doku <friedrichdoku@gmail.com>
## See the file COPYING for copying conditions.

. /lib/ram-wipe-lib.sh

ram_wipe_action() {
   local kernel_wiperam_exit
   kernel_wiperam_exit=$(getarg wiperamexit)

   if [ "$kernel_wiperam_exit" = "no" ]; then
      force_echo "wipe-ram-exit.sh: Skip, because wiperamexit=no kernel parameter detected, OK."
      return 0
   fi

   if [ "$kernel_wiperam_exit" != "yes" ]; then
      force_echo "wipe-ram-exit.sh: Skip, because wiperamexit kernel parameter is unset, OK."
      return 0
   fi

   force_echo "wipe-ram-exit.sh: wiperamexit=yes kernel parameter detected, OK."
   force_echo "wipe-ram-exit.sh: Cold boot attack defense... Starting second RAM wipe pass on shutdown... (2/2)"

   wipe-ram-shutdown-helper

   force_echo "wipe-ram-exit.sh: Second RAM wipe pass completed. (2/2)"
}

ram_wipe_action
