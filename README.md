# Dotfiles

Config files for various applications I use across mac and linux

Has configurations for

* [Alacritty](https://github.com/jwilm/alacritty): Terminal emulator written in rust. Mac and Linux have separate configurations.
* [Fusuma](https://github.com/iberianpig/fusuma): Multitouch gestures with libinput driver on X11, Linux.
* [Regolith Linux](https://regolith-linux.org): GNOME system management with power of i3
* [Tmux](https://github.com/tmux/tmux): terminal multiplexer. Probably the best thing in the world
* [Vim](https://github.com/vim): Text editor. This is not complete as I have not moved to vim completely
* [Yabai](https://github.com/koekeishiya/yabai): i3 replacement for macOS
* [ohmyzsh](https://ohmyz.sh/): framework for managing your Zsh configuration
* Brefile for [Homebrew](https://brew.sh) to install packages in batch


## First time setup

For a fresh mac/linux OS install on a machine, the aim was to run a script which installs everything related to terminal and base packages. The `first_run_*.sh` files aim to do that. The scripts also creates a symlink for all configs rather than copying the files in the root folder. So any changes made to the configuration files should immediately start reflecting in the programs.

## License

This project is no license. Do whatever the f**k you want to do with it.
