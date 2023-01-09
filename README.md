## Cold Boot Attack Defense

Wiping RAM at shutdown to defeat cold boot attacks.

Implemented as `dracut` module `cold-boot-attack-defense`.

Requires `dracut`. In other words, RAM wipe is incompatible with systems
using `initramfs-tools`. To switch to, install dracut:

    sudo apt update
    sudo apt install --no-install-recommends dracut

Linux distribution such as Kicksecure are advised to
(and Kicksecure is planning to) install `dracut` instead of
`initramfs-tools` by default.

Only tested on `systemd` enabled systems.

User documentation:
https://www.kicksecure.com/wiki/Cold_Boot_Attack_Defense

Design documentation:
https://www.kicksecure.com/wiki/Dev/RAM_Wipe

Source code:

* `/usr/lib/dracut/modules.d/40cold-boot-attack-defense`
* `/etc/default/grub.d/40_cold_boot_attack_defense.cfg`

## miscellaneous

* hardened malloc compatibility for haveged workaround
`/lib/systemd/system/haveged.service.d/30_security-misc.conf`

* set `dracut` `reproducible=yes` setting

## Related

* security-misc
* Linux Kernel Runtime Guard (LKRG)
* tirdad - TCP ISN CPU Information Leak Protection.
* Kicksecure (TM) - a security-hardened Linux Distribution
* And more.
* https://github.com/Kicksecure/security-misc
* https://www.kicksecure.com/wiki/Linux_Kernel_Runtime_Guard_LKRG
* https://github.com/Kicksecure/tirdad
* https://www.kicksecure.com
* https://github.com/Kicksecure

## Discussion

Happening primarily in forums.

https://forums.whonix.org/t/kernel-hardening/7296

## How to install `ram-wipe`

See https://www.kicksecure.com/wiki/Cold_Boot_Attack_Defense#install

## How to Build deb Package from Source Code

Can be build using standard Debian package build tools such as:

```
dpkg-buildpackage -b
```

See instructions. (Replace `generic-package` with the actual name of this package `security-misc`.)

* **A)** [easy](https://www.kicksecure.com/wiki/Dev/Build_Documentation/generic-package/easy), _OR_
* **B)** [including verifying software signatures](https://www.kicksecure.com/wiki/Dev/Build_Documentation/generic-package)

## Contact

* [Free Forum Support](https://forums.kicksecure.com)
* [Professional Support](https://www.kicksecure.com/wiki/Professional_Support)

## Donate

`security-misc` requires [donations](https://www.kicksecure.com/wiki/Donate) to stay alive!
