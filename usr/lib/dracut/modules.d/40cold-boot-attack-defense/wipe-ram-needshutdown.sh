#!/bin/sh

## Copyright (C) 2023 - 2025 ENCRYPTED SUPPORT LLC <adrelanos@whonix.org>
## Copyright (C) 2023 - 2023 Friedrich Doku <friedrichdoku@gmail.com>
## See the file COPYING for copying conditions.

type getarg >/dev/null 2>&1 || . /lib/dracut-lib.sh

. /lib/ram-wipe-lib.sh

ram_wipe_check_needshutdown() {
   local kernel_wiperam_setting
   kernel_wiperam_setting=$(getarg wiperam)

   if [ "$kernel_wiperam_setting" = "skip" ]; then
      force_echo "wipe-ram-needshutdown.sh: Skip, because wiperam=skip kernel parameter detected, OK."
      return 0
   fi

   force_echo "wipe-ram-needshutdown.sh: Calling dracut function need_shutdown to drop back into initramfs at shutdown, OK."
   need_shutdown

   return 0
}

ram_wipe_check_needshutdown
