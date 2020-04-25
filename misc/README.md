# Misc configuation files

This is for files that goes outside the home directory.

* `70-synaptics.conf` goes in `/etc/X11/xorg.conf.d/`. Configures the touchpad on my Thinkpad T440.
* `slock@.service` goes in `/etc/systemd/system/`. Enable with `systemctl enable slock@<username>.service`. This service locks the screen using `slock` on suspend.

