#!/bin/sh

## Copyright (C) 2023 - 2023 ENCRYPTED SUPPORT LP <adrelanos@whonix.org>
## Copyright (C) 2023 - 2023 Friedrich Doku <friedrichdoku@gmail.com>
## See the file COPYING for copying conditions.

## Credits:
## First version by @friedy10.
## https://github.com/friedy10/dracut/blob/master/modules.d/40sdmem/wipe.sh

. /lib/ram-wipe-lib.sh

ram_wipe() {
   local kernel_wiperam_setting
   ## getarg returns the last parameter only.
   ## if /proc/cmdline contains 'wiperam=skip wiperam=force' the last one wins.
   kernel_wiperam_setting=$(getarg wiperam)

   if [ "$kernel_wiperam_setting" = "skip" ]; then
      force_echo "wipe-ram.sh: Skip, because wiperam=skip kernel parameter detected, OK."
      return 0
   fi

   if [ "$kernel_wiperam_setting" = "force" ]; then
      force_echo "wipe-ram.sh: wiperam=force detected, OK."
   else
      if systemd-detect-virt &>/dev/null ; then
         force_echo "wipe-ram.sh: Skip, because VM detected and not using wiperam=force kernel parameter, OK."
         return 0
      fi
   fi

   kernel_wiperamexit_setting=$(getarg wiperamexit)
   if [ "$kernel_wiperamexit_setting" = "yes" ]; then
      force_echo "wipe-ram.sh: Skip, because wiperamexit=yes kernel parameter detected to avoid RAM wipe reboot loop, OK."
      return 0
   fi

   force_echo "wipe-ram.sh: Cold boot attack defense... Starting first RAM wipe on shutdown... (1/2)"

   wipe-ram-shutdown-helper

   force_echo "wipe-ram.sh: First RAM wipe completed, OK. (1/2)"

   ## In theory might be better to check this beforehand, but the test is
   ## really fast. The user has no chance of reading the console output
   ## without introducing an artificial delay because the sdmem which runs
   ## after this, results in much more console output.
   force_echo "wipe-ram.sh: Checking if there are still mounted encrypted disks..."

   local dmsetup_actual_output dmsetup_expected_output
   dmsetup_actual_output="$(dmsetup ls --target crypt)"
   dmsetup_expected_output="No devices found"

   if [ "$dmsetup_actual_output" = "$dmsetup_expected_output" ]; then
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

   force_echo "wipe-ram.sh: Now running 'kexec --exec'..."
   if kexec --exec ; then
      force_echo "wipe-ram.sh: 'kexec --exec' succeeded."
      return 0
   fi

   force_echo "wipe-ram.sh: 'kexec --exec' failed!"
   sleep 5
}

ram_wipe
