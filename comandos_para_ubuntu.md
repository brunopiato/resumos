# Comandos para Ubuntu 22.04

## Sumário
<!-- TOC -->

- [Comandos para Ubuntu 22.04](#comandos-para-ubuntu-2204)
  - [Sumário](#sumário)
  - [O próprio sistema](#o-próprio-sistema)
    - [Comandos básicos úteis](#comandos-básicos-úteis)
    - [Mudando o nome do Prompt no terminal](#mudando-o-nome-do-prompt-no-terminal)
    - [Atualizações e instalações](#atualizações-e-instalações)
    - [Instalando utilidades para o Ubuntu](#instalando-utilidades-para-o-ubuntu)
    - [Desinstalando coisas](#desinstalando-coisas)
    - [Instalando um colorizador de folders](#instalando-um-colorizador-de-folders)
  - [Python e DS](#python-e-ds)
    - [Instalando o gerenciador de versões do Python](#instalando-o-gerenciador-de-versões-do-python)
    - [Instalando o gerenciador de pacotes do Python](#instalando-o-gerenciador-de-pacotes-do-python)
    - [Criando e ativando um Ambiente Virtual para Python](#criando-e-ativando-um-ambiente-virtual-para-python)
    - [Instalando o Git](#instalando-o-git)
  - [R e RStudio](#r-e-rstudio)
    - [Instalando o R](#instalando-o-r)
  - [Calibre](#calibre)
    - [Dark mode](#dark-mode)
  - [Extensões](#extensões)
    - [Unite](#unite)

<!-- /TOC -->

## O próprio sistema

### Comandos básicos úteis
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
```

### Mudando o nome do Prompt no terminal
```bash
sudo gedit ~/.bashrc 

# Na 60a linha trocar a parte escrito "\u@\h" pelo nome que queremos dar ao terminal
```



### Atualizações e instalações
```bash
# Para atualizar o sistema
sudo apt update && sudo apt upgrade

```

### Instalando utilidades para o Ubuntu
```bash
sudo apt install tree #Este programa permite que vejamos com o comando "tree" a
                    #listagem de arquivos dentro de uma pasta em forma de árvore
```

### Desinstalando coisas
Neste caso as desinstalação é do Jupyter Lab Desktop
```bash
sudo apt-get purge jupyterlab-desktop # remove application
rm /usr/bin/jlab # remove command symlink

# to remove application cache and bundled Python environment
rm -rf ~/.config/jupyterlab-desktop 
```


### Instalando um colorizador de folders

```bash
sudo add-apt-repository ppa:costales/yaru-colors-folder-color #Adicionar o repositório PPA
sudo apt update #Atualizar o sistema
sudo apt install yaru-colors-folder-color folder-color  -y #Instalar o colorizador
nautilus -q  #Reiniciar o Nautilus para que as modificações tenham efeito
```
---

## Python e DS

### Instalando o gerenciador de versões do Python
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

### Instalando o gerenciador de pacotes do Python
```bash
sudo apt install python3-pip
pip install cython #Uma biblioteca que garante algumas funcionalidades
```

### Criando e ativando um Ambiente Virtual para Python
```bash
pyenv virtualenv <versao_python> <nome_ambiente>
pyenv activate <nome_ambiente>
```

### Instalando o Git
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

## Calibre

### Dark mode
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

## Extensões
Extensões:
<https://extensions.gnome.org/>

Para instalar:
<https://linuxhint.com/installing_gnome_extensions_ubuntu/>

### Unite
A extensão unite permite arrumar visualmente o ambiente Ubuntu, ajustando a aparência da interface.
Link para a extensão Unite:
<https://extensions.gnome.org/extension/1287/unite/>
