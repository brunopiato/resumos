#!/bin/bash

# Arquivo de configuração do sistema após formatação
: << 'COMMENT'
Este arquivo serve como 
automatizacao do processo 
pos-instalacao e formatacao
do OS com Ubuntu.
COMMENT

# Atualizando o sistema
sudo apt update && sudo apt upgrade
sudo apt install curl
sudo apt install snapd
sudo snap install snap-store

# Instalando o Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

# Instalando as extensões do Linux
sudo apt install gnome-tweaks
sudo apt install gnome-shell-extensions
sudo apt install chrome-gnome-shell

# Instalando o VSCode
sudo snap install code

# Instalando aplicativos do Snap
sudo snap install drawio #Drawio
sudo snap install spotify #Spotify
sudo snap install dbeaver-ce #DBeaver
sudo snap install discord #Discord
sudo snap install inkscape #Inkscape
sudo snap install notion-snap #Notion
sudo snap install notion-snap #Notion
sudo snap install diodon #Diodon
sudo snap install pycharm-community --classic #PyCharm Community

# Instalando Dropbox
curl https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2020.03.04_amd64.deb
sudo apt install ./dropbox_2020.03.04_amd64.deb

# Instalando um colorizador de folders para o Nautilus
sudo add-apt-repository ppa:costales/yaru-colors-folder-color #Adicionar o repositório PPA
sudo apt update #Atualizar o sistema
sudo apt install yaru-colors-folder-color folder-color  -y #Instalar o colorizador
nautilus -q  #Reiniciar o Nautilus para que as modificações tenham efeito

# Instalando e configurando o Calibre
sudo apt-get install -y calibre

sudo echo "export CALIBRE_USE_DARK_PALETTE=1" >> /etc/profile.d/calibre.sh

#-----------------------------------------------------------------------------------------
# Instalando Git
sudo apt update
sudo apt install git


#-----------------------------------------------------------------------------------------
# Instalando o pyenv e o Python
## Instalando o pyenv
sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm gettext libncurses5-dev tk-dev tcl-dev blt-dev libgdbm-dev git python2-dev python3-dev aria2
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash

sudo echo 'export PYTHON_BUILD_ARIA2_OPTS="-x 10 -k 1M"

export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

## Instalando o gerenciador de pacotes do Python
sudo apt install python3-pip
pip install cython


#-----------------------------------------------------------------------------------------
# Instalando o R 
sudo apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
wget -O- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/cran.gpg
echo deb [signed-by=/usr/share/keyrings/cran.gpg] https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/ | sudo tee /etc/apt/sources.list.d/cran.list
sudo apt update
sudo apt install r-base
R --version

## Instalando o RStudio
wget https://download1.rstudio.org/electron/jammy/amd64/rstudio-2022.12.0-353-amd64.deb
sudo apt install -f ./rstudio-2022.12.0-353-amd64.deb


#-----------------------------------------------------------------------------------------
# Instalando Julia
sudo apt install julia
