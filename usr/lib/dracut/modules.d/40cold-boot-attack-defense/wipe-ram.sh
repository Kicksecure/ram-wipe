#!/bin/sh

## Copyright (C) 2023 - 2025 ENCRYPTED SUPPORT LLC <adrelanos@whonix.org>
## Copyright (C) 2023 - 2023 Friedrich Doku <friedrichdoku@gmail.com>
## See the file COPYING for copying conditions.

## Credits:
## First version by @friedy10.
## https://github.com/friedy10/dracut/blob/master/modules.d/40sdmem/wipe.sh

## Use '.' and not 'source' in 'sh'.
. /lib/ram-wipe-lib.sh

ram_wipe() {
   ## 'local' is unavailable in 'sh'.
   #local kernel_wiperam_setting dmsetup_actual_output dmsetup_expected_output

   ## getarg returns the last parameter only.
   kernel_wiperam_setting="$(getarg wiperam)"

   if [ "$kernel_wiperam_setting" = "skip" ]; then
      force_echo "wipe-ram.sh: Skip, because wiperam=skip kernel parameter detected, OK."
      return 0
   fi

   force_echo "wipe-ram.sh: RAM extraction attack defense... Starting RAM wipe pass during shutdown..."

   wipe-ram-shutdown-helper

   force_echo "wipe-ram.sh: RAM wipe pass completed, OK."

   ## In theory might be better to check this beforehand, but the test is
   ## really fast.
   force_echo "wipe-ram.sh: Checking if there are still mounted encrypted disks..."

   dmsetup_actual_output="$(dmsetup ls --target crypt 2>&1)"
   dmsetup_expected_output="No devices found"

   if [ "$dmsetup_actual_output" = "$dmsetup_expected_output" ]; then
      force_echo "wipe-ram.sh: Success, there are no more mounted encrypted disks, OK."
   elif [ "$dmsetup_actual_output" = "" ]; then
      force_echo "wipe-ram.sh: Success, there are no more mounted encrypted disks, OK."
   else
      ## dracut should unmount the root encrypted disk cryptsetup luksClose during shutdown
      ## https://github.com/dracutdevs/dracut/issues/1888
      force_echo "\
wipe-ram.sh: There are still mounted encrypted disks! RAM wipe incomplete!

debugging information:
dmsetup_expected_output: '$dmsetup_expected_output'
dmsetup_actual_output: '$dmsetup_actual_output'"
      ## How else could the user be informed that something is wrong?
      sleep 5
   fi
}

ram_wipe
