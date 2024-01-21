---
---

[Repo](https://github.com/ohmyzsh/ohmyzsh/tree/master)

# requried fonts for some themes
[Powerline](https://github.com/powerline/fonts)

[Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)

# install zsh first
[Ref](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)


# customize a theme in on-my-zsh
[Link](https://stackoverflow.com/questions/27885057/zsh-theme-for-full-path-display-git-changes)
```bash
cp $ZSH/themes/$ZSH_THEME.zsh-theme $ZSH_CUSTOM/themes/

# change the %c to %~ to have the full path (%~ or %d) instead of only the current dir
nano $ZSH_CUSTOM/themes/$ZSH_THEME.zsh-theme

# replace current shell with new zsh shell
exec zsh
```

## prompt example (custom robbyrussell theme)
```zsh
PROMPT="%{$fg_bold[magenta]%}[%*] %(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$fg[cyan]%}%~%{$reset_color%}"
PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
```