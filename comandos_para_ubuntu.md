# Comandos para Ubuntu 22.04

## 1. Sumário
<!-- TOC -->

- [Comandos para Ubuntu 22.04](#comandos-para-ubuntu-2204)
  - [1. Sumário](#1-sumário)
  - [2. O próprio sistema](#2-o-próprio-sistema)
    - [2.1. Comandos básicos úteis](#21-comandos-básicos-úteis)
    - [2.2. Mudando o nome do Prompt no terminal](#22-mudando-o-nome-do-prompt-no-terminal)
    - [2.3. Atualizações e instalações](#23-atualizações-e-instalações)
    - [2.4. Instalando utilidades para o Ubuntu](#24-instalando-utilidades-para-o-ubuntu)
    - [2.5. Desinstalando coisas](#25-desinstalando-coisas)
    - [2.6. Instalando um colorizador de folders](#26-instalando-um-colorizador-de-folders)
    - [2.7. Instalando e configurando o NordVPN](#27-instalando-e-configurando-o-nordvpn)
    - [2.8. Para o Pop!OS, que vem sem GRUB, precisamos ativar o *dual boot* (caso necessário) da seguinte maneira:](#28-para-o-popos-que-vem-sem-grub-precisamos-ativar-o-dual-boot-caso-necessário-da-seguinte-maneira)
  - [3. Python e DS](#3-python-e-ds)
    - [3.1. Instalando o gerenciador de versões do Python](#31-instalando-o-gerenciador-de-versões-do-python)
    - [3.2. Instalando o gerenciador de pacotes do Python](#32-instalando-o-gerenciador-de-pacotes-do-python)
    - [3.3. Criando e ativando um Ambiente Virtual para Python](#33-criando-e-ativando-um-ambiente-virtual-para-python)
    - [3.4. Instalando o Git](#34-instalando-o-git)
  - [4. R e RStudio](#4-r-e-rstudio)
    - [4.1. Instalando o R](#41-instalando-o-r)
  - [5. Calibre](#5-calibre)
    - [5.1. Dark mode](#51-dark-mode)
  - [6. Extensões](#6-extensões)
    - [6.1. Extensões:](#61-extensões)
    - [6.2. Para instalar:](#62-para-instalar)
      - [6.2.1. Unite](#621-unite)
      - [6.2.2. Aylur's Widgets](#622-aylurs-widgets)
      - [6.2.3. OpenWeather](#623-openweather)
      - [6.2.4. Show Desktop Button](#624-show-desktop-button)
      - [6.2.5. Just Perfection](#625-just-perfection)
      - [6.2.6. ArcMenu](#626-arcmenu)
      - [6.2.7. Time ++](#627-time-)
  - [7. Instalando e configurando a VPN USPNet](#7-instalando-e-configurando-a-vpn-uspnet)

<!-- /TOC -->

## 2. O próprio sistema

### 2.1. Comandos básicos úteis
```bash
pwd #Vê o caminho do diretório em que estamos atualmente 

ls #Lista o que há dentro do diretório atual

ls ~/diretorio #Lista o que há dentro do diretório especificado

cd ~/diretorio #Muda de diretório para o diretório informado

mkdir novodir #Cria um novo diretório dentro do local atual

cp ~/diretorio/arquivo #Copia o arquivo especificado para dentro do diretório atual

sudo #Dá permissão para realizar alterações, como instalação de programas

sudo apt install aplicativo #Instala um aplicativo

sudo dpkg -i arquivo.deb #Instala a partir de um arquivo .deb

shutdown +0 #Desliga o computador após 0 segundos

rm diretorio/arquivo #Deleta um arquivo no diretório

rm -rf diretorio #Deleta um diretório e tudo que estiver dentro dele

sudo service gdm restart #Reinicia o console sem reiniciar todo o computador

mv nomeantigo.file nomenovo.file #Renomeando um arquivo

mv ~/DiretorioOrigem/arquivoMovido.file ~/DiretorioDestino #O comando mv é usado para mover arquivos. Por isso podemos usá-lo para renomear, movendo um arquivo da pasta para ela mesma com outro nome. Podemos usar o parâmetro "." para o diretório de destino para que o arquivo seja transferido para a pasta atual.

touch afile.txt #Cria um arquivo vazio

gsettings set org.gnome.SessionManager logout-prompt false #Retira o tempo de espera do botão de desligamento

apt list --installed #Para ver todos os apps instalados

apt list -a jupyter-notebook #Para ver um app instalado

whereis firefox #Mostra onde está instalado um app
```

### 2.2. Mudando o nome do Prompt no terminal
```bash
sudo gedit ~/.bashrc 

# Na 60a linha trocar a parte escrito "\u@\h" 
# pelo nome que queremos dar ao terminal
```

### 2.3. Atualizações e instalações
```bash
# Para atualizar o sistema
sudo apt update && sudo apt upgrade

```

### 2.4. Instalando utilidades para o Ubuntu
```bash
sudo apt install tree 
#Este programa permite que vejamos com o comando "tree" a
#listagem de arquivos dentro de uma pasta em forma de árvore
```

### 2.5. Desinstalando coisas
Neste caso as desinstalação é do Jupyter Lab Desktop
```bash
sudo apt-get purge jupyterlab-desktop # remove application
rm /usr/bin/jlab # remove command symlink

# to remove application cache and bundled Python environment
rm -rf ~/.config/jupyterlab-desktop 
```

### 2.6. Instalando um colorizador de folders

```bash
sudo add-apt-repository ppa:costales/yaru-colors-folder-color #Adicionar o repositório PPA

sudo apt update #Atualizar o sistema

sudo apt install yaru-colors-folder-color folder-color  -y #Instalar o colorizador

nautilus -q  #Reiniciar o Nautilus para que as modificações tenham efeito
```

### 2.7. Instalando e configurando o NordVPN
```bash
sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh) #Baixar e instalar o NordVPN

sudo usermod -aG nordvpn $USER #Dar permissão ao NordVPN. Será necessário reiniciar o sistema

nordvpn login #Fazer o login com o browser

nordvpn set autoconnect on #Ajustar o NordVPN para que ele inicie junto com a máquina
```

### 2.8. Para o Pop!OS, que vem sem GRUB, precisamos ativar o *dual boot* (caso necessário) da seguinte maneira:
```bash
# Primeiro precisamos montar o inicializador do Windows no Pop!
# Estes links fornece instruções de como fazer isso
# https://github.com/spxak1/weywot/blob/main/Pop_OS_Dual_Boot.md
# https://www.youtube.com/watch?v=ySFV5igQv44&ab_channel=SandipShakya

sudo apt install os-prober #Para instalar o verificador de OSs
sudo os-prober #Aqui conseguimos o caminho exato do inicializar do Windows para fazer o dual boot
sudo mount /dev/nvme0n1p1 /mnt #Sendo o primeiro caminho o do inicializar do Windows conseguido no comando de cima

cd /mnt/EFI #Mudamos o direitório pra dentro do inicializador do Windows
sudo cp -ax Microsoft /boot/efi/EFI #Copiamos seu conteúdo para o inicializador do Pop!

sudo echo "timeout 5
console-mode max" >> /boot/efi/loader/loader.conf #Aqui adicionamos estes dois comandos ao arquivo loader.config
```
Agora é só fazer o reboot e testar se deu certo.

<br>

---

## 3. Python e DS

### 3.1. Instalando o gerenciador de versões do Python
```bash
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev git python3-dev

# OU
sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm gettext libncurses5-dev tk-dev tcl-dev blt-dev libgdbm-dev git python2-dev python3-dev aria2
```

```bash
curl https://pyenv.run | bash 

# OU
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
```
Talvez seja necessário seguir as instruções que a própria instalção do *pyenv* dê em relação a adicionar alguns comandos ao *~/.bashrc* :
```bash
export PYTHON_BUILD_ARIA2_OPTS="-x 10 -k 1M"

export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

### 3.2. Instalando o gerenciador de pacotes do Python
```bash
sudo apt install python3-pip

pip install cython #Uma biblioteca que garante algumas funcionalidades
```

### 3.3. Criando e ativando um Ambiente Virtual para Python
```bash
pyenv virtualenv <versao_python> <nome_ambiente>

pyenv activate <nome_ambiente>
```

### 3.4. Instalando o Git
```bash
sudo apt update

sudo apt install git
```

<br>

---

## 4. R e RStudio

### 4.1. Instalando o R
```bash
# Antes de iniciar a instalação devemos atualizar o sistema
sudo apt update

sudo apt upgrade

# Baixando e instalando as dependências do R
sudo apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common

# Autenticando os pacotes antes da instalação
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

# Importando a GNU Private Guard 
wget -O- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/cran.gpg

# Adicionando o CRAN ao repostitório do nosso sistema
echo deb [signed-by=/usr/share/keyrings/cran.gpg] https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/ | sudo tee /etc/apt/sources.list.d/cran.list
sudo apt update

# Instalar o R através do CRAN
sudo apt install r-base
R --version

sudo R
```

<br>

---

## 5. Calibre

### 5.1. Dark mode
```bash
# create a file under etc/profile.d
sudo nano /etc/profile.d/calibre.sh   

# and put the following in it:
export CALIBRE_USE_DARK_PALETTE=1

# Then save it with crtl+x
# Then logout and log in or restart the gdm service
sudo service gdm restart
```

<br>

--- 

## 6. Extensões

### 6.1. Extensões:
<https://extensions.gnome.org/>

### 6.2. Para instalar:
<https://linuxhint.com/installing_gnome_extensions_ubuntu/>

#### 6.2.1. Unite
A extensão Unite permite arrumar visualmente o ambiente Ubuntu, ajustando a aparência da interface.
Link para a extensão Unite:
<https://extensions.gnome.org/extension/1287/unite/>

#### 6.2.2. Aylur's Widgets
Esta extensão adiciona uma série de wigdets à área de trabalho e à barra de tarefas.
<https://extensions.gnome.org/extension/5338/aylurs-widgets/>

#### 6.2.3. OpenWeather
Extensão de previsão meteorológica
<https://extensions.gnome.org/extension/750/openweather/>

#### 6.2.4. Show Desktop Button
Adicionar botão de visualizar o desktop
https://extensions.gnome.org/extension/1194/show-desktop-button/

#### 6.2.5. Just Perfection
Adiciona diversos controles de ajustes da interface
https://extensions.gnome.org/extension/3843/just-perfection/

#### 6.2.6. ArcMenu
Adiciona um menu tipo Menu Iniciar do Windows e tem muitos icones legais
https://extensions.gnome.org/extension/3628/arcmenu/

#### 6.2.7. Time ++
Adiciona um timer com cronômetro e pomodoros
https://extensions.gnome.org/extension/1238/time/


---

## 7. Instalando e configurando a VPN USPNet
```bash
sudo apt-get install network-manager-openconnect
sudo apt-get install network-manager-openconnect-gnome 
```
- Selecione a opção VPN Compatível com Cisco Any Connect (openconnect)
- Nome da conexão: VPN USPNet
- Gateway: vpn.semfio.usp.br
- login (Numero USP - Renata): 11555410
- senha no WhatsApp