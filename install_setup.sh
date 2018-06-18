# Clone repo and make folders
git clone https://github.com/krishnakumar-kapil/vim.git ~/kapil_dotfiles/
mkdir ~/prog_settings

# create backups
mkdir old_setup
mv .vimrc old_setup/
mv .zshrc old_setup/
mv .tmux.conf old_setup/
mv .chunkwmrc old_setup/
mv prog_settings old_setup/

# Copy main dotfiles to ~
cp ~/kapil_dotifles/* .

# ---------------- Install Progs ------------------

# brew 
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install python

# Prezto
zsh
git clone --recursive git@github.com:krishnakumar-kapil/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
# TODO: Add `source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"` to .zshrc
chsh -s /bin/zsh

# tmux
brew install tmux
brew install the_silver_surfer

# rupa z
mkdir -p ~/packages
git clone git@github.com:rupa/z.git ~/packages/
# Append `. ~/packages/z/z.sh` to .zshrc though it should already be there in fork of prezto

# chunkwm
brew install chunkwm
brew install khd

# ----- Vim -------
# vimrc should already have everything
vim +PluginInstall +qall

# ----- Git -------
git config --global user.name "Kapil Krishnakumar"
git config --global user.email "krishnakumar.kapil@utexas.edu"
echo "[alias]" >> ~/.gitconfig
echo "    lg = log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit" >> ~/.gitconfig
# TODO: add ssh key to github
