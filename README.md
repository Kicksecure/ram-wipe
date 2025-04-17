## Cold Boot Attack Defense

Wiping RAM at shutdown to defeat cold boot attacks.

Implemented as `dracut` module `cold-boot-attack-defense`.

Requires `dracut`. In other words, RAM wipe is incompatible with systems
using `initramfs-tools`. To switch, install dracut. See:

https://www.kicksecure.com/wiki/dracut

Only tested on `systemd`-enabled systems.

User documentation:
https://www.kicksecure.com/wiki/ram-wipe

Design documentation:
https://www.kicksecure.com/wiki/Dev/RAM_Wipe

## Related

* security-misc
* Linux Kernel Runtime Guard (LKRG)
* tirdad - TCP ISN CPU Information Leak Protection.
* Kicksecure (TM) - a security-hardened Linux distribution
* And more.
* https://github.com/Kicksecure/security-misc
* https://www.kicksecure.com/wiki/Linux_Kernel_Runtime_Guard_LKRG
* https://github.com/Kicksecure/tirdad
* https://www.kicksecure.com
* https://github.com/Kicksecure

## Discussion

Happening primarily in forums.

https://forums.whonix.org/t/is-ram-wipe-possible-inside-whonix-cold-boot-attack-defense/5596

## How to install `ram-wipe`

See https://www.kicksecure.com/wiki/ram-wipe

## How to Build deb Package from Source Code

Can be built using standard Debian package build tools such as:

```
dpkg-buildpackage -b
```

See instructions. (Replace `generic-package` with the actual name of this package: `security-misc`.)

* **A)** [easy](https://www.kicksecure.com/wiki/Dev/Build_Documentation/generic-package/easy), _OR_
* **B)** [including verifying software signatures](https://www.kicksecure.com/wiki/Dev/Build_Documentation/generic-package)

## Contact

* [Free Forum Support](https://forums.kicksecure.com)
* [Professional Support](https://www.kicksecure.com/wiki/Professional_Support)

## Donate

`ram-wipe` requires [donations](https://www.kicksecure.com/wiki/Donate) to stay alive!
