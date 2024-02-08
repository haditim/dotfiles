NOTE: this repo is now hosted mainly on [Codeberg](https://codeberg.org/haditim/dotfiles) and [GitHub](https://github.com/haditim/dotfiles) serves as its mirror.

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
I decided to go with [Intellimacs](https://github.com/MarcoIeni/intellimacs) keybindings. To enable it, install Intellimacs first with `git clone https://github.com/MarcoIeni/intellimacs ~/.config/intellimacs`. There is symlink that takes care of hard-coded paths in the intellimacs to `~/.intellimacs`.

## shell
In Arch Linux you can change the shell with `chsh -c /usr/bin/fish`.

### fish
I currently use fish as my main shell. It is set up to support vterm inside emacs with starship. My aliases and functions are also included in the config. If you need to move your zsh history to shell, you can use [zsh-history-to-fish](https://pypi.org/project/zsh-history-to-fish/).

### oh-my-zsh
A better-looking and acting terminal. The color scheme works on "dark" terminal themes. Install it using

``` shell
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
install required plugins by
``` shell
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions
```

### Starship
install Starship for a nice prompt while keeping zsh plugins/fish/vterm working
From [Starship website](https://starship.rs/) or just run `sudo pacman -Sy starship`.

## emacs
The emacs configuration encompasses files related to [Chemacs2](https://github.com/plexus/chemacs2). These are `.config/chemacs/profiles.el` and `.config/chemacs/profile` with two configs, one pointing to my [Doom emacs configuration](https://codeberg.org/haditim/.doom.d "doom configs") and one to my Spacemacs configuration which is included in the current repo under `.config/spacemacsconfig` directory.
Install Chemacs by
``` shell
git clone https://github.com/plexus/chemacs2.git ~/.config/emacs
```

### Spacemacs
Spacemacs config is a very simple one with font and theme change plus some layers like Python, Kotlin, etc.. I just use Spacemacs for trying another viable emacs option beside Doom emacs. For a complete working config of an emacs IDE setup, use my [Doom emacs configuration](https://codeberg.org/haditim/.doom.d "doom configs") repo.

## Stop GNOME annoyances

Delay the time for an app to actually not respond and Gnome showing `"Application" is not responding.`. This is very important if you run any X11 forwarding over SSH. Taken from [askubuntu](https://askubuntu.com/questions/1068921/how-to-disable-the-window-not-responding-dialog). Also don't forget to have `xorg-x11-xauth` installed.

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

dotfiles remote add origin https://codeberg.org/haditim/dotfiles
git push --set-upstream origin master
```

## to checkout from codeberg/github

``` sh
git clone --bare https://codeberg.org/haditim/dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout
```

## direnv
You need to install `direnv` from your distro package manager to be able to use it.
