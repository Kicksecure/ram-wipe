#!/bin/bash
# -*- mode: shell-script; indent-tabs-mode: nil; sh-basic-offset: 4; -*-
# ex: ts=8 sw=4 sts=4 et filetype=sh

## Copyright (C) 2023 - 2025 ENCRYPTED SUPPORT LLC <adrelanos@whonix.org>
## Copyright (C) 2023 - 2023 Friedrich Doku <friedrichdoku@gmail.com>
## See the file COPYING for copying conditions.

# called by dracut
check() {
    require_binaries sync || return 1
    require_binaries sleep || return 1
    require_binaries ls || return 1
    require_binaries halt || return 1
    require_binaries poweroff || return 1
    require_binaries reboot || return 1
    require_binaries cat || return 1
    require_binaries sdmem || return 1
    require_binaries pgrep || return 1
    require_binaries dmsetup || return 1
    require_binaries wipe-ram-shutdown-helper || return 1
    return 0
}

# called by dracut
depends() {
    return 0
}

# called by dracut
install() {
    inst_simple "/usr/libexec/ram-wipe/ram-wipe-lib.sh" "/lib/ram-wipe-lib.sh"
    inst_multiple sync
    inst_multiple sleep
    inst_multiple ls
    inst_multiple halt
    inst_multiple poweroff
    inst_multiple reboot
    inst_multiple cat
    inst_multiple sdmem
    inst_multiple pgrep
    inst_multiple dmsetup
    inst_multiple wipe-ram-shutdown-helper
    inst_hook pre-udev 40 "$moddir/wipe-ram-exit.sh"
    inst_hook pre-trigger 40 "$moddir/wipe-ram-exit-needshutdown.sh"
}

# called by dracut
installkernel() {
    return 0
}
