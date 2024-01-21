---
---

# all about prompt
[Ref](https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html)

# color names
Named colors: `black`, `red`, `green`, `yellow`, `blue`, `magenta`, `cyan`, `white`, and `default`.

# installation commends
[Link](https://github.com/reconfigurable-ml-pipeline/infrastructure/blob/master/hack/zsh.sh)
```bash
sudo apt update
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions)/' ~/.zshrc
```