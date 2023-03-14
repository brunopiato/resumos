
# Resumo de Python

## 1. Sumário

<!-- TOC -->

- [Resumo de Python](#resumo-de-python)
  - [1. Sumário](#1-sumário)
  - [2. Comandos em geral](#2-comandos-em-geral)
    - [Para instalar o gerenciador de ambiente virtuais pyenv](#para-instalar-o-gerenciador-de-ambiente-virtuais-pyenv)
    - [Trabalhando com ambientes virtuais](#trabalhando-com-ambientes-virtuais)
  - [3. Funções nativas](#3-funções-nativas)
    - [3.1. Expressões *lambda*](#31-expressões-lambda)
    - [3.2. Função *map()*](#32-função-map)
  - [4. Bibliotecas estrangeiras](#4-bibliotecas-estrangeiras)
    - [4.1. Biblioteca: Pandas](#41-biblioteca-pandas)
      - [4.1.1. Método *apply()*](#411-método-apply)
      - [4.1.2. Método *agg()*](#412-método-agg)
      - [4.1.3. Método *groupby()*](#413-método-groupby)
    - [4.2. Biblioteca: MatPlotLib](#42-biblioteca-matplotlib)
    - [4.3. Biblioteca: Seaborn](#43-biblioteca-seaborn)
    - [4.4. Biblioteca: plotly](#44-biblioteca-plotly)
    - [4.5. Biblioteca: Streamlit](#45-biblioteca-streamlit)

<!-- /TOC -->

## 2. Comandos em geral

Alguns pacotes importantes a serem instalados para o funcionamento adequado 

```bash
python3.11 -m pip install --upgrade pip #Para fazer o upgrade do pip

python -m pip freeze #Para visualizar os pacotes que estão instalados em um 
#                     determiando ambiente virtual
```



### Para instalar o gerenciador de ambiente virtuais pyenv

```bash
#Primeiro as dependências
sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm gettext libncurses5-dev tk-dev tcl-dev blt-dev libgdbm-dev git python2-dev python3-dev aria2

#Então o prórpio pyenv
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash

#Por fim editar o ~/.bashrc para que possamos usar o pyenv de dentro do bash 
echo 'export PYTHON_BUILD_ARIA2_OPTS="-x 10 -k 1M"

export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
```


### Trabalhando com ambientes virtuais

Sempre que formos trabalhar em um projeto devemos criar um ambiente virtual dedicado ao projeto e instalar nele tudo que usaremos no trabalho, como:
- Compilador Python
- Jupyter Notebook
- IPyKernel
- Pacotes a serem utilizados

Então para começar um novo projeto com o gerenciador de ambiente pyenv já instalado:
```bash
pyenv intall 3.11 #Em que 3.11 é a versão do Python a ser instalada

pyenv virtualenv 3.11 env_proj #Em que 3.11 é a versão do Python instalada
#                          a ser usada no ambiente chamado "env_proj"

pyenv activate env_proj #Para ativar o ambiente "env_proj"
```

Uma vez criado e ativado o ambiente virtual, podemos instalar as ferramentas que usaremos no projeto dentro dele:

```python
#Primeiro instalar o Jupyter Notebook
pip3 install notebook

#Depois instalar o ipykernel para usar o notebook de dentro do vscode
python3 -m pip install ipykernel
python3 -m ipykernel install --user

#Por fim instalar e ativar as extenções do notebook
pip3 install jupyter_contrib_nbextensions
jupyter contrib nbextension install --user

```

Agora estamos prontos para instalar os pacotes a serem utilizados no projeto

```python
pip3 install pandas
pip3 install -U scikit-learn #O parâmetro -U serve para 
#                             fazer o upgrade de todas as versões
pip3 install streamlit
```



## 3. Funções nativas

### 3.1. Expressões *lambda*
As expressões lambda (funções anônimas) são usadas para que possamos nos beneficiar da estrutura de funções sem ter que definir e, posteriormente, chamar uma função. Normalmente são usadas como input de outras funções. A estrutura de uma função lambda é:

```python
lambda saida: operacao_entrada

func_lambda = lambda x: 3*x + 1 
func_lambda(x) #Esta sintaxe é sinônima à seguinte:
def func(x):
    return 3*x+1
func(x)
```

A forma acima não é a maneira mais digna de usar as funções lambda. A forma abaixo é muito mais comum e correta, uma vez que se fôssemos definir uma função, não precisaríamos da expressão lambda.

```python
# Neste caso a expressão lambda está sendo utilziada para transformar a variável 
# competition_open_since_month usando o método .apply() do objeto DataFram chamdo df1

df1['competition_open_since_month'] = (df1.apply( lambda x: x['date'].month 
                                        if math.isnan( x['competition_open_since_month'] ) 
                                        else x['competition_open_since_month'], axis=1 ))
```



### 3.2. Função *map()*

A função *map()* aplica uma determinada função sobre um objeto iterável, como listas, tuplas e conjuntos, por exemplo. Ela recebe, portanto, dois argumentos, a função a ser aplicada e o iterável. A ideia central desta função é poder substituir os laços *for* em que aplicaríamos uma função aos elementos de um objeto iterável e obteríamos como resultado um objeto iterável modificado. 

```python
map(function, iteravel)

lista = [1, 2, 3]
map(print, lista)
map(lambda x: 3*x+1, lista)
```

<br>



## 4. Bibliotecas estrangeiras

### 4.1. Biblioteca: Pandas
O Pandas é uma biblioteca utilizada principalmente para carregar, transformar e manipular dados em forma de tabelas (dataframes). Alguns dos métodos dos objetos de classe DataFrame foram descritos anteriormente e serão retomados aqui.

#### 4.1.1. Método *apply()*
O método *apply()* funciona de forma semelhante à função *map()*, sendo um método dos objetos de classe DataFrame pertencentes à biblioteca Pandas que itera uma função especificada sobre as linhas ou colunas de um dataframe. Desta forma devemos explicitar qual função iremos iterar sobre o dataframe e a orientação da iteração (horizontal, ou seja, nas linhas, ou verrtical, nas colunas) com o argumento *axis=* (0 para colunas e 1 para linhas).

```python
import pandas as pd
dataframe.apply(mean, axis=0)
```


#### 4.1.2. Método *agg()*

O método *agg()* vem da palavra aggregate e ele permite que façamos o mesmo que o método apply, mas utilizando múltiplas funções ao mesmo tempo, devolvendo um dataframe com os resultados da aplicação de cada função.

```python
import pandas as pd

(num_attributes.agg(["mean","median","std","min","max","skew","kurtosis"]).T
        .reset_index()
        .rename(columns={'index': 'attributes'}))
```


#### 4.1.3. Método *groupby()*
O método *groupby()* pertecten ao Pandas permite que agrupemos um dataframe de acordo com as categorias de uma variável ou condição e aplicar uma operação de agrupamento (contagem, soma, média, etc). 
```python
import pandas as pd

df1[['var1', 'var2', 'var3']].groupby('var1').operacao() #Vamos agrupar pela variável var1 
#                                                        e aplicar a operacao às outras duas
df1[['var1', 'var2', 'var3']].groupby(['var1', 'var2']).operacao() #Vamos agrupar pela variável var1 
#                                                        e em seguida pela var2 e aplicar a operação 
#                                                        à var3
df1[['var1', 'var2', 'var3']].groupby(['var1', 'var2']).agg(['oper1', 'oper2']) #Vamos agrupar pela 
#                                                       variável var1 e em seguida pela var2 e aplicar a 
#                                                       operação à var3
```


<br>

### 4.2. Biblioteca: MatPlotLib
É uma biblioteca dedicada à plotagem de gráficos.

```python
from matplotlib import <módulo>
```


<br>

### 4.3. Biblioteca: Seaborn
É uma biblioteca dedicada à plotagem de gráficos.

```python
import seaborn as sns
```


<br>

### 4.4. Biblioteca: plotly
É uma biblioteca dedicada à plotagem de gráficos.

```python
import plotly.express as px
```


<br>

### 4.5. Biblioteca: Streamlit 
O pacote Streamlit é um pacote para a criação de aplicações web de análise e visualização de dados. É ótima para o desenvolvimento de dashboars e painéis de dados, tendo diversos widgets, botões, afinidade com pacotes de plotagem gráfica (i.e. plotly) e outras funcionalidades.


```python
import streamlit as st
```