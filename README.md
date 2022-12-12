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
I decided to go with [Intellimacs](https://github.com/MarcoIeni/intellimacs) keybindings. To enable it, install Intellimacs first with `git clone https://github.com/MarcoIeni/intellimacs ~/.intellimacs`.

## oh-my-zsh
A better-looking and acting terminal. The color scheme works on "dark" terminal themes. Install it using

``` shell
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
install required plugins by
``` shell
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions
```
install Starship for a nice prompt while keeping zsh plugins working
From [Starship website](https://starship.rs/) or just run `sudo pacman -Sy starship`.

## qutebrowser
I have a minimal settings which essentially sets good viewing sizes for my 4K monitor, allows opening videos using mpv and enables universal dark mode.

## emacs
The emacs configuration encompasses files related to [Chemacs2](https://github.com/plexus/chemacs2). These are `.emacs-profiles.el` and `.emacs-profile` with two configs, one pointing to my [Doom emacs configuration](https://github.com/haditim/.doom.d "doom configs") and one to my Spacemacs configuration which is included in the current repo under `.spacemacsconfig.d` directory.
Install Chemacs by
``` shell
git clone https://github.com/plexus/chemacs2.git ~/.emacs.d
```

### Spacemacs
Spacemacs config is a very simple one with font and theme change plus some layers like Python, Kotlin, etc.. I just use Spacemacs for trying another viable emacs option beside Doom emacs. For a complete working config of an emacs IDE setup, use my [Doom emacs configuration](https://codeberg.org/haditim/.doom.d "doom configs") repo.

### Configurations

#### Save

``` shell
dconf dump / > .config/dconf-root.ini
```

#### Load

``` shell
dconf load / < .config/dconf-root.ini
```

### Stop annoyances

Delay the time for an app to actually not respond and Gnome showing `"Application" is not responding.`. This is very important if you run any X11 forwarding over SSH. Taken from [askubuntu](https://askubuntu.com/questions/1068921/how-to-disable-the-window-not-responding-dialog). Also don't forget to have `xorg-x11-xauth` installed.

``` shell
# for a 60s delay
gsettings set org.gnome.mutter check-alive-timeout 60000
```

## Misc

### disable and enable keyboard and touchpad for tablet mode

My HP X360 does not disable tablet mode using the hardware switch. For this reason, I added some files in the `.scripts` directory to manually disable and enable keyboard and touch pad. There are also two corresponding `.desktop` files to allow usage as a normal app. Make sure you have `evtest` installed and remember to adjust your keyboard and touch pad ids in the `.sh` files in `.scripts` folder. You can see a list of devices using `ls /dev/input/by-path`. 

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

## to checkout from github

``` sh
git clone --bare https://codeberg.org/haditim/dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout
```
