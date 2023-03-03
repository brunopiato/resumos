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
  - [3. Python e DS](#3-python-e-ds)
    - [3.1. Instalando o gerenciador de versões do Python](#31-instalando-o-gerenciador-de-versões-do-python)
    - [3.2. Instalando o gerenciador de versões do Python](#32-instalando-o-gerenciador-de-versões-do-python)
    - [3.3. Criando e ativando um Ambiente Virtual para Python](#33-criando-e-ativando-um-ambiente-virtual-para-python)
    - [3.4. Instalando o Git](#34-instalando-o-git)
  - [R e RStudio](#r-e-rstudio)
    - [Instalando o R](#instalando-o-r)
  - [4. Calibre](#4-calibre)
    - [4.1. Dark mode](#41-dark-mode)
  - [5. Extensões](#5-extensões)
    - [5.1. Unite](#51-unite)

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
shutdown +0 #Desliga o computador após 0 segundos
rm diretorio/arquivo #Deleta um arquivo no diretório
rm -rf diretorio #Deleta um diretório e tudo que estiver dentro dele
sudo service gdm restart #Reinicia o console sem reiniciar todo o computador
mv nomeantigo.file nomenovo.file #Renomeando um arquivo
mv ~/DiretorioOrigem/arquivoMovido.file ~/DiretorioDestino #O comando mv é usado para mover arquivos. Por isso podemos usá-lo para renomear, movendo um arquivo da pasta para ela mesma com outro nome. Podemos usar o parâmetro "." para o diretório de destino para que o arquivo seja transferido para a pasta atual.
```

### 2.2. Mudando o nome do Prompt no terminal
```bash
sudo gedit ~/.bashrc 

# Na 60a linha trocar a parte escrito "\u@\h" pelo nome que queremos dar ao terminal
```



### 2.3. Atualizações e instalações
```bash
# Para atualizar o sistema
sudo apt update && sudo apt upgrade

```

### 2.4. Instalando utilidades para o Ubuntu
```bash
sudo apt install tree #Este programa permite que vejamos com o comando "tree" a
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

---

## 3. Python e DS

### 3.1. Instalando o gerenciador de versões do Python
```bash
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev 
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils 
tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev git python3-dev

curl https://pyenv.run | bash 
```
Talvez seja necessário seguir as instruções que a própria instalção do *pyenv* dê em relação a adicionar alguns comandos ao *~/.bashrc*

### 3.2. Instalando o gerenciador de versões do Python
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

---
## R e RStudio

### Instalando o R
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





---

## 4. Calibre

### 4.1. Dark mode
```bash
# create a file under etc/profile.d
sudo nano /etc/profile.d/calibre.sh   

# and put the following in it:
export CALIBRE_USE_DARK_PALETTE=1

# Then save it with crtl+x
# Then logout and log in or restart the gdm service
sudo service gdm restart
```

--- 

## 5. Extensões
Extensões:
<https://extensions.gnome.org/>

Para instalar:
<https://linuxhint.com/installing_gnome_extensions_ubuntu/>

### 5.1. Unite
A extensão unite permite arrumar visualmente o ambiente Ubuntu, ajustando a aparência da interface.
Link para a extensão Unite:
<https://extensions.gnome.org/extension/1287/unite/>
