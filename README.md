
wdiff's hyprland setup and scripts.

![Screenshot_2023-12-05-07-04-36_25269](https://github.com/weeabootarsh/dotfiles/assets/16247239/ee29c3a2-7aa0-4349-ae34-2fba6c7f7ce4)

from an archinstall minimal~

setup ame

`sudo pacman -S --needed base-devel pacman-contrib cargo`

`git clone https://git.getcryst.al/crystal/pkgbuilds/ame`

`cd ame && makepkg -si`

essential 

`ame -S wayland libdrm pixman libxkbcommon python libxml2 llvm libpng gegl mtdev xorg-xwayland qt5-wayland qt6-wayland hyprland swww waybar xdg-desktop-portal-wlr wlroots xdg-desktop-portal`

source your own gpu drivers

`ame -S vulkan-radeon` 

set up utils

`ame -S polkit-kde-agent kitty pcmanfm-qt neovim neovide wget swaylock-effects brightnessctl pavucontrol alsa-utils grim slurp wl-clipboard mpv python-pip rofi blueberry bluez bluez-utils ranger ts-node zsh ttf-jetbrains-mono ttf-jetbrains-mono-nerd awesome-terminal-fonts powerline inotify-tools greetd greetd-tuigreet thunar thunar-archive-plugin gvfs ark playerctl pamixer whitesur-icon-theme-git whitesur-cursor-theme-git whitesur-gtk-theme-git xdg-user-dirs nwg-look-bin python-pillow pywal-discord-git mako-git loupe gnome-keyring neofetch imagemagick wtype ttf-3270-nerd inter-font-beta noto-fonts-emoji ttf-droid otf-font-awesome ttf-font-awesome alsa-firmware tumbler python-pip`

all other aps
`ame -S vivaldi vivaldi-ffmpeg-codecs discord betterdiscordctl betterdiscord-git liquidctl coolercontrol neovim eza nvtop cava tty-clock`

  
setup the absolute essential....oh-my-zsh 
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

`git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`

`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`

`git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`

copy .zshrc and p10k.zsh from repo to your home dir

pywal16 setup

`git clone https://github.com/eylles/pywal16`

`cd pywal16`

`pip3 install --user . --break-system-packages`

Edit /etc/greetd/config.toml

```
[terminal]
vt = 1

[default_session]
command = "tuigreet --power-shutdown 'sudo systemctl poweroff'"
command = "tuigreet --cmd Hyprland"
user = "greeter"
```
add this to the toml file to autolog if you want

```
[initial_session]
command = "Hyprland"
user = "myusername"
```

give greetd perms

`sudo chmod -R go+r /etc/greetd`

start greetd

`systemctl enable greetd`

copy all the directories to your .config dir using. MAKE SURE YOU ARE CURRENTLY CD TO THE CLONED GIT REPO 

`cp -r ~/[insert repo dir]/*/ ~/.config/`

now reboot and enjoy

I like nvchad so get it if you want
`git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim`

If you get an error on line 60 of hyprland.conf after rebooting saying that colors couldn't be found, be sure to check line 24. Replace "v" with your Linux username. After that, run hyprctl reload in your terminal. Once this is resolved, it shouldn't happen anymore for future reboots.

Commands
like i3

`Super + Return(enter)` 
kitty terminal 

`Super + D`
rofi drun

`Super + q` 
closes focused window

`Super + Shift + Arrow Keys` 
moves focused window

`ALT + r`
resize windows with arrow keys REMEMBER TO 'ESC' WHEN DONE

`Super + Shift + Space` 
toggle float

`Super + W` 
wallpaper picker, by defualt looks for folder in ~/Wallpapers/

Optional: 
add this to your .zshrc (hint, you can call it with zrc)

`chpwd() ls`

this makes file navigation a breeze.





