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

### keymaps
I like to use the IntelliJ Idea with IdeaVim enabled. However, what is very annoying, is that one cannot easily fix all the keybinding conflicts between IdeaVim and the IDE itself. There are several ways to avoid keystroke conflicts: modify ideavimrc to reflect key shortcut which do not overlap with IDE's and modifying keybindings of the IDE. The former is difficults since all of the actions are not known (e.g. I could not find Git Commit action to bind to any key) and the latter is very time consuming, one should also be able to know a minimum of default keybindings for the IDE in case one sits at a computer with no IdeaVim and settings available to them. To work around this issue, I wrote a small python code which goes through the default keybindings settings and adds a `first-keystroke` of your liking to it. Then for example if you want to use open recent files popup, you need to press ctrl-z + ctrl-e if you set the `FIRST_STROKE = 'ctrl z'` instead of default `ctrl-e` which conflicts with Vim's page down. To use the script, download the default keystrokes from [IntelliJ Community Edition source code](https://github.com/JetBrains/intellij-community/tree/282253b8ee888b51c0e8f63f44d9d4ecae9c19d2/platform/platform-resources/src/keymaps "keybindings from IntelliJ source code") (use `$default.xml`) and runt the following with variables changed:

``` python
#!/usr/bin/env python3
""" This module adds a first keystroke in front of all keybindings with ctrl
to prevent the IDE keybinding conflicts with IdeaVim"""
FIRST_LINE = '<keymap version="1" name="Keybindings with ctrl-z">\n'
DEFAULT_FILE_ADDRESS = '$default.xml'
TARGET_FILE_ADDRESS = 'modified.xml'
FIRST_STROKE = 'ctrl z'  # This is the first keystroke added to keybinding

# I exclude lines which have shift or alt in keybindings
COND_TO_INCLUDE_A_LINE = lambda x: ('ctrl' in x and 'second-keystroke' not in
                                    x and 'shift' not in x and 'alt' not in x)

with open(DEFAULT_FILE_ADDRESS, 'r') as f:
    content = f.read()

final_lines =[FIRST_LINE]
lines = content.splitlines()
for line in lines[1:]:
    final_lines.append(line)
    if COND_TO_INCLUDE_A_LINE(line):
        new_line = line.replace('first', 'second')
        insertion_index = new_line.find('second')
        new_line = f'{new_line[:insertion_index]}first-keystroke=' \
                   f'"{FIRST_STROKE}" {new_line[insertion_index:]}'
        final_lines.append(new_line)

with open(TARGET_FILE_ADDRESS, 'w') as f:
    f.write('\n'.join(final_lines))

print(f'Successfully created file {TARGET_FILE_ADDRESS} created with'
      f' {len(final_lines)} lines)')
print('Put this file into "/home/<your_user>/.config/JetBrains/<product'
      '>/keymaps" folder and restart your IDE to see it in settings')
```
Also, make sure that you clone this repo to have some more settings for IdeaVim, including keybindings:

| keystroke         | action                        |
| ----------------- | ----------------------------  |
| S-r (normal mode) | Replace                       |
| S-e (normal mode) | Recent files                  |
| <leader>z         | Toggle Distraction Free Mode  |
| <leader>cr        | Rename Element                |
| <leader>fs        | Save Document                 |
| <leader>f         | Find                          |
| <leader>p         | Parameter Info                |
| <leader>q         | Quick Doc                     |
| <leader>rr        | RefactoringMenu               |
| <leader>t         | Vcs.UpdateProject             |
| <leader>si        | FileStructurePopup            |
| <leader>wl        | change windows using Vim keys |
| <leader>wj        |                               |
| <leader>wh        |                               |
| <leader>wk        |                               |
| <leader>wv        | split to right                |
| <leader>wv        | split to right                |
| <c-j>             | gT                            |
| <c-l>             | gt                            |
| <m-x>             | go to action (c-s-a)          |
| <c-o>             | action back (c-m-left)        |
| <c-i>             | action forward (c-m-right)    |

which are mostly similar to those of Doom Emacs'

## oh-my-zsh
A better-looking and acting terminal. The color scheme works on "dark" terminal themes.

### install required plugins by

``` shell
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions
```

`

# how to use
I user something like the following to track my changes on dot files (mostly taken from [this](https://medium.com/toutsbrasil/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b) page).

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

