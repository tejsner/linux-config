# SOFTWARE.md

## Vim
* Install `vim` and `vim-plug` (AUR)
* Run `:PlugInstall` after startup (ignore the errors)

## Zsh
* Install `zsh`, `zsh-completions`, `zsh-autosuggestions`, `zsh-syntax-highlighting` from official Arch repositories
* Install `autojump` from AUR
* Install the [`pure`](https://github.com/sindresorhus/pure) prompt.

## Doom emacs
* Install `emacs`
* Check the [documentation](https://github.com/hlissner/doom-emacs) for installation instructions. Running `doom doctor` can help determine if you need certain packages.

## Qtile
* Install `qtile`, `xorg-init`
* Add `exec qtile` to `~/.xinitrc`

## AwesomeWM
* Install `awesome`, `lain-git` (AUR) and `xorg-init`
* Add `exec awesome` to `~/.xinitrc`
* Software used by the config: `dmenu`, `slock`
* Font used by the config `adobe-source-code-pro-fonts`
* Software run on startup: `dropbox`, `flameshot`, `unclutter`, `redshift`

## I3
* Install `i3-gaps` and `xorg-init`
* add `exec i3` to `~/.xinitrc`
* Software used by the config: `xss-lock`, `dmenu`, `i3lock`, `i3status`, `feh`, `maim`
* Fonts used: `adobe-source-code-pro-fonts`, `ttf-font-awesome`

## Theming (on non-KDE/non-Gnome desktops)
* Install `lxappearance` (for GTK apps)
* Install `qt5ct` and `kvantum-qt5`(for Qt5 apps)
* Set the environment variable `QT_QPA_PLATFORMTHEME="qt5ct"` in `.xinitrc`
* Install `ttf-roboto` and set the GUI font to roboto regular 10
* Install `nordic-theme-git` (GTK) and `kvantum-theme-nordic-git` (QT5) from AUR
* Set themes using `lxappearance` and `kvantummanager`+`qt5ct`
* Icon theme: Install `papirus-icon-theme` and enable Papirus-Dark
* Cursor theme: adwaita
