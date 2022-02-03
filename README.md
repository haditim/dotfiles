# dot files
These are my public dot files including following:

## ideavimrc
For the times that something happens to my Doom Emacs and an alternative is needed, I made an `Intellij Idea` config as close as possible to my Doom Emacs in terms of keybindings etc.

### required plugins
These are personal preferences and don't necessarily need to be installed
- IdeaVim-EasyMotion and AceJump
- GruvBox Theme
- Python Community Edition
- Cursive
- Rainbow Brackets
- CodeGlance
- IDEA Which-key (necessary for showing possible VIM keybindings)


### keymaps
I decided to go with [Intellimacs](https://github.com/MarcoIeni/intellimacs) keybindings. To enable it, install Intellimacs first with `git clone https://github.com/MarcoIeni/intellimacs ~/.intellimacs`.

## oh-my-zsh
A better-looking and acting terminal. The color scheme works on "dark" terminal themes.

### install required plugins by

``` shell
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions
```

### install Starship for a nice prompt while keeping zsh plugins working
From [Starship website](https://starship.rs/) or just run `sudo pacman -Sy starship`.

## qutebrowser
I have a minimal settings which essentially sets good viewing sizes for my 4K monitor, allows opening videos using mpv and enables universal dark mode.

## emacs
The emacs configuration encompasses files related to Chemacs2. These are `.emacs-profiles.el` and `.emacs-profile` with two configs, one pointing to my [Doom emacs configuration](https://github.com/haditim/.doom.d "doom configs") and one to my Spacemacs configuration which is included in the current repo under `.spacemacsconfig.d` directory.

### Spacemacs
Spacemacs config is a very simple one with font and theme change plus some layers like Python, Kotlin, etc.. I just use Spacemacs for trying another viable emacs option beside Doom emacs. For a complete working config of an emacs IDE setup, use my [Doom emacs configuration](https://github.com/haditim/.doom.d "doom configs") repo.

## GNOME 3
I liked the following extensions:
 - [Sound Input & Output Device Chooser](https://extensions.gnome.org/extension/90ice-chooser/)
 - [Iranian Persian Calendar](https://extensions.gnome.org/extension/3618/shamsi-calendar/)
 - [Clipboard Indicator](https://extensions.gnome.org/extension/779/clipboard-indicator/)
 - [Tiling Assistant](https://extensions.gnome.org/extension/3733/tiling-assistant/) ([guide](https://github.com/Leleat/Tiling-Assistant/blob/master/Guide.md))
 - [Dash to Panel](https://extensions.gnome.org/extension/1160/dash-to-panel/)
 - [Vitals](https://extensions.gnome.org/extension/1460/vitals/)
 - [SerMon: Service Monitor](https://extensions.gnome.org/extension/1804/sermon/)
 - [BackSlide](https://extensions.gnome.org/extension/543/backslide/)
 - [Color Picker](https://extensions.gnome.org/extension/3396/color-picker/)
 - [GNOME Fuzzy App Search ](https://extensions.gnome.org/extension/3956/gnome-fuzzy-app-search/)

### Configurations

#### Save

``` shell
dconf dump /org/gnome/shell/ > .config/dconf-gnome-shell.ini
dconf dump /org/gnome/desktop/ > .config/dconf-gnome.ini
dconf dump /org/gnome/settings-daemon/ > .config/dconf-gnome-settings.ini
```

#### Load

``` shell
dconf load /org/gnome/shell/ < .config/dconf-gnome-shell.ini
dconf load /org/gnome/desktop/ < .config/dconf-gnome.ini
dconf load /org/gnome/settings-daemon/ < .config/dconf-gnome-settings.ini
```

### Stop annoyances

Delay the time for an app to actually not respond and Gnome showing `"Application" is not responding.`. This is very important if you run any X11 forwarding over SSH. Taken from [askubuntu](https://askubuntu.com/questions/1068921/how-to-disable-the-window-not-responding-dialog).

``` shell
# for a 60s delay
gsettings set org.gnome.mutter check-alive-timeout 60000
```

# how to use
I use something like the following to track my changes on dot files (mostly taken from [this](https://medium.com/toutsbrasil/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b) page).

## new setup 

``` sh
git init --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc

dotfiles remote add origin https://github.com/haditim/dotfiles
git push --set-upstream origin master
```

## to checkout from github

``` sh
git clone --bare https://github.com/haditim/dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
dotfiles checkout
```
