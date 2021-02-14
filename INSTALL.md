# arch-install
Installation of Archlinux.

## Base Install
```
// for wifi, wired should work out of the box
ip link set wlan0 up
systemctl start iwd.service
iwctl
  station wlan0 scan
  station wlan0 get-networks
  station wlan0 connect <SSID>
  exit
dhcpcd
ping archlinux.org

timedatectl set-ntp true

// setup partitions with fdisk
// format patitions (mkfs.ext4, mkfs.fat, mkswap+swapon)
// mount partitions (typically at /mnt and possibly /mnt/boot)

vim /etc/pacman.d/mirrorlist
  // move 4-5 geographically close mirrors to top of list
	
pacstrap /mnt base linux linux-firmware vi vim networkmanager intel-ucode man-db man-pages texinfo base-devel unzip
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Europe/Copenhagen /etc/localtime
hwclock --systohc

vim /etc/locale.gen
  // uncomment en_US.UTF-8 UTF-8
  // uncomment da_DK.UTF-8 UTF-8
  // uncomment en_DK.UTF-8 UTF-8
	
locale-gen

echo 'LANG=en_DK.UTF-8' >> /etc/locale.conf
echo 'LC_NUMERIC=en_US.UTF-8' >> /etc/locale.conf
echo '<hostname>' >> /etc/hostname
	
vim /etc/hosts
  127.0.0.1   localhost
  ::1         localhost
  127.0.1.1   <hostname>.localdomain  <hostname>
	
passwd

// MBR/BIOS bootloader
pacman -S grub
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

// UEFI/GPT bootloader
bootctl --path=/boot install

vim /boot/loader/loader.conf
  default arch
  
vim /boot/loader/entries/arch.conf
  // new file
  // <root uuid> can be pasted into vim with :r! blkid
  title   Arch Linux
  linux   /vmlinuz-linux
  initrd  /intel-ucode.img
  initrd  /initramfs-linux.img
  options root=UUID=<root uuid> rw
```

## Post Install

### Network
```
systemctl enable NetworkManager
systemctl start NetworkManager
nmtui
```

### Common Packages
```
pacman -S man-db man-pages texinfo base-devel unzip
```


### Users and groups
```
useradd -m tim
passwd tim
gpasswd -a tim wheel
visudo /etc/sudoers
  // uncomment %wheel ALL=(ALL) ALL
```
	
### X
Laptop:
```
pacman -S xorg mesa
```

Desktop
```
pacman -S xorg nvidia
```

### yay
Makes installing packages and dependencies from AUR super easy. Highly recommeneded.
```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
rm -rf yay
```

### Window Manager
* See [SOFTWARE.mc](./SOFTWARE.md) for instructions on QTile, AwesomeWM and i3wm.
* KDE/Gnome pretty much works out of the box, so no need for detailed instructions.

### Common packages (2)
```
brightnessctl
pulseaudio, pulseaudio-alsa, pulsemixer
alacritty
firefox
discord
noto-fonts, noto-fonts-emoji, noto-fonts-extra, adobe-source-code-pro-fonts, ttf-liberation
ttf-roboto, ttf-font-awesome
spotify-tui, spotifyd
emacs
htop
neofetch
zathura, zathura-pdf-poppler
xorg-xrdb
clang
fd
ripgrep
texlive-most
arandr
maim
dmenu-git (dev version fixes focussing issue)
pcmanfm (lightweight gui file manager if not running gnome/kde)
nnn
mpv
gvim
```

### Bluetooth (works with QC35 headset)
```
sudo pacman -Syu pulseaudio-bluetooth bluez bluez-libs bluez-utils

bluetoothctl
  power off
 
sudo btmgmt ssp of
gpasswd -a tim lp
pulseaudio -k

sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

bluetoothctl
  power on
  agent on
  default-agent
  scan on
  pair XX:XX:XX ...
  connect XX:XX:XX ...
```

### Mullvad

#### Using openvpn

```
sudo pacman -S openvpn openresolv
// download config from https://www.mullvad.net/download/config/
// unzip and copy to /etc/openvpn/client
sudo mv /etc/openvpn/client/update-resolv-conf /etc/openvpn/
sudo chgrp network /etc/openvpn/update-resolv-conf
cudo chmod 750 /etc/openvpn/update-resolv-conf
sudo cp /etc/openvpn/client/mullvad_xx /etc/openvpn/client/mullvad.conf
sudo systemctl start openvpn-client@mullvad.service
curl https://am.i.mullvad.net/connected
```

#### Using the client (AUR)

```
yay -S mullvad-vpn
yay -S systemd-resolvconf
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
```

### Sync time
```
sudo pacman -S ntp
sudo systemctl enable ntpd.service
```

### Fix two-finger scroll after suspend

Add `psmouse.synaptics_intertouch=0` to `GRUB_CMDLINE_LINUX_DEFAULT` in `/etc/default/grub`. For example, with default settings:

```
GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet psmouse.synaptics_intertouch=0"
```

Run `sudo grub-mkconfig -o /boot/grub/grub.cfg` and reboot.

### Fix Wi-Fi driver for ASUS PCE-AC68

replace `XX` with kernel version. I think you can skip the last two commands and just reboot, did not test yet.

```
sudo pacman -S linux-headers
sudo pacman -S broadcom-wl-dkms
reboot
```
