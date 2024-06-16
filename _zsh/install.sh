# install zsh
sudo apt update
sudo apt install -y zsh

# install oh-my-zsh
sudo apt install -y git
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install autosugession plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions)/' ~/.zshrc

# go for the time-based prompt
cp $ZSH/themes/$ZSH_THEME.zsh-theme $ZSH_CUSTOM/themes/
sed -i.bak 's/^PROMPT=.*/PROMPT="%{$fg_bold[magenta]%}[%*] %(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$fg[cyan]%}%~%{$reset_color%}"/' $ZSH_CUSTOM/themes/$ZSH_THEME.zsh-theme

# replace current shell with new zsh shell
exec zsh
