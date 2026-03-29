# Wipe RAM on shutdown and reboot #

Helps protect sensitive data by wiping RAM during shutdown and reboot,
which can help defend against cold boot attacks.

This package requires dracut. It is incompatible with systems using
initramfs-tools unless they are switched to dracut.

Implemented as the dracut module ram-wipe.

Only tested on systemd-enabled systems.

User documentation:
https://www.kicksecure.com/wiki/ram-wipe

Design documentation:
https://www.kicksecure.com/wiki/Dev/RAM_Wipe

Discussion:
https://forums.whonix.org/t/is-ram-wipe-possible-inside-whonix-cold-boot-attack-defense/5596

Related links:
https://www.kicksecure.com
https://www.kicksecure.com/wiki/ram-wipe
https://www.kicksecure.com/wiki/Dev/RAM_Wipe
https://www.kicksecure.com/wiki/dracut
https://www.kicksecure.com/wiki/systemd

## How to install `ram-wipe` using apt-get ##

1\. Download the APT Signing Key.

```
wget https://www.kicksecure.com/keys/derivative.asc
```

Users can [check the Signing Key](https://www.kicksecure.com/wiki/Signing_Key) for better security.

2\. Add the APT Signing Key.

```
sudo cp ~/derivative.asc /usr/share/keyrings/derivative.asc
```

3\. Add the derivative repository.

```
echo "deb [signed-by=/usr/share/keyrings/derivative.asc] https://deb.kicksecure.com trixie main contrib non-free" | sudo tee /etc/apt/sources.list.d/derivative.list
```

4\. Update your package lists.

```
sudo apt-get update
```

5\. Install `ram-wipe`.

```
sudo apt-get install ram-wipe
```

## How to Build deb Package from Source Code ##

Can be build using standard Debian package build tools such as:

```
dpkg-buildpackage -b
```

See instructions.

NOTE: Replace `generic-package` with the actual name of this package `ram-wipe`.

* **A)** [easy](https://www.kicksecure.com/wiki/Dev/Build_Documentation/generic-package/easy), _OR_
* **B)** [including verifying software signatures](https://www.kicksecure.com/wiki/Dev/Build_Documentation/generic-package)

## Contact ##

* [Free Forum Support](https://forums.kicksecure.com)
* [Premium Support](https://www.kicksecure.com/wiki/Premium_Support)

## Donate ##

`ram-wipe` requires [donations](https://www.kicksecure.com/wiki/Donate) to stay alive!
