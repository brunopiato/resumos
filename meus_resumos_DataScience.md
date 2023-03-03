<h1> Tabela de conteúdos </h1>

<!-- TOC -->

- [Resumo SQL](#resumo-sql)
  - [Definição - SQL](#definição---sql)
  - [O Modelo Entidade Relacional (MER)](#o-modelo-entidade-relacional-mer)
  - [A estrutura de uma consulta](#a-estrutura-de-uma-consulta)
  - [A junção de tabelas](#a-junção-de-tabelas)
    - [INNER JOIN (1 : 1)](#inner-join-1--1)
    - [FULL OUTER JOIN (M : N)](#full-outer-join-m--n)
    - [RIGHT JOIN (N : 1)](#right-join-n--1)
    - [LEFT JOIN (1 : N)](#left-join-1--n)
  - [Subqueries](#subqueries)
    - [Subquery no *WHERE*](#subquery-no-where)
    - [Subquery no *SELECT*](#subquery-no-select)
    - [Subquery no *FROM*](#subquery-no-from)
- [Resumo Git](#resumo-git)
  - [Definição - Git](#definição---git)
  - [As áreas do Git](#as-áreas-do-git)
  - [O ciclo de vida dos arquivos no Git](#o-ciclo-de-vida-dos-arquivos-no-git)
  - [Iniciando um repositório Git](#iniciando-um-repositório-git)
  - [Mais comandos de controle do repositório](#mais-comandos-de-controle-do-repositório)
  - [Comandos de repositório remoto](#comandos-de-repositório-remoto)
  - [Trabalhando com ramos (*branches*)](#trabalhando-com-ramos-branches)

<!-- /TOC -->



# <u>Resumo SQL</u>
Bruno Piato - 22 de fevereito de 2023

## Definição - SQL
O SQL, ou , *Structured Query Language* é uma linguagem de acesso e consulta a bancos de dados relacionais, isto é, que seja composto por tabelas que se conectam através de chaves mapeadas no Modelo Entidade-Relacional (MER).
<br></br>

## O Modelo Entidade Relacional (MER)
O MER é um diagrama que mapeia as relaçoes entre as entidades (tabelas) de um banco de dados relacional através das chaves estrangeiras que as ligam.
<br></br>

<p><img src="https://i.imgur.com/HRhd2Y0.png" alt="Modelo Entidade-Relacional (MER)">
<figcaption align = "center"><b>Fig.1 - Modelo Entidade-Relacional (MER)</b></figcaption></p>
<br>

## A estrutura de uma consulta
As consultas SQL possuem a anatomia: CLÁUSULA > OPERADORES. 

As principais cláusulas são:
- **SELECT**: seleciona as colunas de uma tabela. Para selecionar todas as linhas, usamos o _SELECT *_.
- **FROM**: seleciona a tabela de um banco de dados.
- **WHERE**: seleciona as linhas de uma tabela.
- **GROUP BY**: agrupa as linhas de acordo com as categorias de uma variável.
- **ORDER BY**: ordena as linhas de acordo com as categorias de uma variável.

Os principais operadores são:
- Operadores de agregação (usados na clásula **SELECT**):
  - **SUM**: soma as colunas.
  - **MIN**: encontra o valor mínimo de uma coluna.
  - **MAX**: encontra o valor máximo de uma coluna.
  - **AVG**: encontra o valor médio de uma coluna.
  - **COUNT**: conta as entradas de uma coluna.
  - **DISTINCT**: encontra os valor distintos de uma coluna.

<br>

- Operadores de intervalo (usados na cláusula **WHERE**):
  - **BETWEEN** e **NOT BETWEEN**: seleciona as linhas cujo valor para uma variável esteja (ou não) em um intervalo determinado.
  - **IN** e **NOT IN**: seleciona as linhas cujo valor para uma variável esteja (ou não) em uma lista de valores determinada.
  - **LIKE** e **NOT LIKE**: seleciona as linhas cujo valor para uma variável apresente (ou não) um determinado padrão estipulado
  - **HAVING**: seleciona as linhas cujo valor para uma variável agregada apresente (ou não) um valor determinado.

<br>

```SQL
SELECT
    SUM(col)
    MIN(col)
    MAX(col)
    AVG(col)
    COUNT(col)
    COUNT(DISTINCT col)
FROM tabela
GROUP BY var
ORDER BY var ASC/DESC
WHERE
    var BETWEEN X AND Y
    var NOT BETWEEN X AND Y
    var IN (A, B, C)
    var NOT IN (A, B, C)
    var LIKE '%@gmail.com'
    var NOT LIKE 'auto%'
    var HAVING COUNT(col) >= x
    var IS NULL
    var IS NOT NULL
    LIMIT n
```
<br></br>

## A junção de tabelas
As tabelas podem ser unidas de acordo com sua cardinalidade, isto é, de acordo com a arquitetura de união pré-estipulada para elas. Há três formas de cardinalidade:
- **Um para um (1:1)**: cada linha de uma tabela tem uma e somente uma linha correspondente na outra tabela.
- **Um para vários (1:N)**: cada linha de uma tabela pode ter várias linhas correspondentes na outra tabela.
- **Vários para vários (M:N)**: várias linhas de uma tabela podem ter várias linhas correspondentes da outra tabela.

<br>


### INNER JOIN (1 : 1)
Realiza uma junção de um para um em que são retornada apenas as linhas que tiverem  uma, e apenas uma,  conexão entre as tabelas.
```SQL
SELECT linhas
FROM tabela1 t1 INNER JOIN tabela2 t2 ON (t1.chave = t2.chave)
               INNER JOIN tabela3 t2 ON (t1.chave2 = t3.chave2)
```


### FULL OUTER JOIN (M : N)
Realiza uma junção de vários para vários em que são retornadas todas as linhas de ambas as tabelas. Caso não haja conexão entre algumas linhas das tabelas, é imputado valor nulo para a conexão.
```SQL
SELECT linhas
FROM tabela1 t1 FULL OUTER JOIN tabela2 t2 ON (t1.chave = t2.chave)
```


### RIGHT JOIN (N : 1)
Realiza uma junção de vários para um em que será usada como base a tabela da direita, retornando todas as conexões da tabela da esquerda que tenham base na direita. Caso não haja conexão entre algumas linhas das tabelas, é imputado valor nulo para a conexão.
```SQL
SELECT linhas
FROM tabela1 t1 RIGHT JOIN tabela2 t2 ON (t1.chave = t2.chave)
```


### LEFT JOIN (1 : N)
Realiza uma junção de vários para um em que será usada como base a tabela da esquerda, retornando todas as conexões da tabela da direita que tenham base na esquerda. Caso não haja conexão entre algumas linhas das tabelas, é imputado valor nulo para a conexão.
```SQL
SELECT linhas
FROM tabela1 t1 LEFT JOIN tabela2 t2 ON (t1.chave = t2.chave)
```

<br></br>

## Subqueries

Subqueries são consultas, transformações e filtragens realizadas nas tabelas anteriormente à consulta principal, permitindo que as junções de tabelas ocorram com os resultados destas transformações. Há três formas de realizar subqueries:
- Subqueries no **WHERE**: podemos usar o operador *IN* para filtrar uma tabela e, dentro do *IN* colocar uma query (subquery, neste caso) para selecionar as linhas a serem filtradas.
- Subqueries no **SELECT**: usamos este tipo quando queremos que o resultado da subquery figure como uma nova coluna na tabela principal. Podemos fazer a subquery retornar os próprios valores da variável como estão na tabela de origem (como se fosse um JOIN) ou podemos fazer a subquery retonar o resultado de funções de agregação.
- Subqueries no **FROM**: permitem processar toda uma tabela antes de usá-la e uni-la com outras tabelas, unindo somente seus resultados. É muito útil quando precisamos usar poucas variáveis de muitas tabelas diferentes, de modo que realizar o *JOIN* se tornaria muito dispendioso.


### Subquery no *WHERE*
```SQL
SELECT
    oi.product_id,
    AVG(oi.price)
FROM 
    order_items oi
WHERE
    oi.product_id IN (SELECT 
                          p.product_id
                      FROM 
                          products p
                      WHERE 
                        p.product_category_name IN ('arte', 'perfumaria'))
```

### Subquery no *SELECT*
```SQL
SELECT
    p.product_id,
    p.product_name,
    (SELECT
        AVG(r.reviews)
    FROM
        reviews r
    WHERE 
        p.product_id = r.product_id) AS avg_review
FROM
  products p
```

### Subquery no *FROM*
```SQL
SELECT
    order_status,
    num_pedidos,
    sum_prices,
    avg_prices
FROM ( SELECT
          o.order_status,
          COUNT( oi.order_id ) AS num_pedidos,
          SUM( oi.price ) AS sum_prices,
          AVG( oi.price ) AS avg_prices
      FROM 
          orders o LEFT JOIN order_items oi ON ( oi.order_id = o.order_id )
      GROUP BY 
          o.order_status )
```

---

# <u>Resumo Git</u>
Bruno Piato - 24 de fevereiro de 2023

## Definição - Git
O Git é uma <u>ferramenta e linguagem de versionamento de arquivos, pastas e projetos</u>. Os projetos versionados e mantidos em Git são chamados de <u>repositórios</u>, podendo ser <u>local</u> (apenas no computador do usuário) ou <u>remoto</u> (armazenado em um servidor ou em nuvem). Todo repositório tem seu <u>ramo principal chamado *main*</u> e pode ter outras ramificações para que novos códigos, funcionalidades, arquivos sejam adicionados sem que alteremos a versão atual e funcional do código enquanto testamos e modificamos suas características. A forma de criar novos ramos (*branches*) e quando fundi-las ao ramo principal é chamado de <u>fluxo de trabalho em Git (*Git workflow*)</u>. 
Na Fig.1 podemos observar o ramo *master* (nome usado antigamente no lugar de *main*) se ramificando em *hotfix* para realizar ajustes imediatos e logo incorporada de volta na versão v0.2; e em *develop* para desenvolver novas funcionalidades, como as *features* logo abaixo. Conforme estas funcionalidades são desenvlvidas e testadas, elas são finalmente incorporadas à *branch master* (ou *main*), constituindo a versão v1.0. Este é um fluxo de trabalho possível (chamado *GitFlow*), embora não seja o único.

<p><img src="https://lh3.googleusercontent.com/70jaEZnESXQ6SssU5uI4yO62JBz6xq2sNrrz8bW_ap2CuWUaQlbKs3j6NyRJnvcvYwAugkW8WzNJX21dZ2SMd9O_1TTpKZT-FsBkYSPy4rUSpJSo2C-WPTaLc2jQ8ancyj1TetXQ" alt="Git workflow">
<figcaption align = "center"><b>Fig.1 - Fluxo de trabalho em Git</b></figcaption></p>

<br>

## As áreas do Git
O ambiente do Git tem quatro áreas, a <u>área de trabalho (*working directory*)</u>, a <u>área de estágio (*staging area*)</u> e os <u>repositórios local e remoto</u>. As mudanças realizadas em cada arquivo e pasta obedecem essa ordem/hierarquia de áreas. A primeira modificação que realizamos em um arquivo desde sua criação fica na área de trabalho. Enquanto não salvarmos e adicionarmos estas modificações à área de estágio, ele é um arquivo comum <u>sem rastreamento</u>. Após adicionarmos as moodificações realizadas à área de estágio, podemos submetê-las ao repositório local. Uma vez no repositório local, as modificações estão prontas para serem impulsionadas para o repositório remoto. Cada um desses passos tem suas características e comandos específicos.


<p><img src="https://miro.medium.com/max/1204/1*zpvd5fjZAFGsVAEsvMGKxA.png" alt="Git workflow">
<figcaption align = "center"><b>Fig.2 - Áreas do ambiente Git</b></figcaption></p>

<br>

## O ciclo de vida dos arquivos no Git
Os arquivos no Git, desde sua criação seguem um ciclo de vida específico. Assim que são criados, os arquivos ainda não estão sendo rastreados e são arquivos comuns e estão presentes apenas em nossa área de trabalho. A partir do momento que o adicionamos à área de estágio eles assumem a condição de "em estágio" (*staged*) e, podemos posteriormente submetê-los à área de repositório de modo que eles passem a estar em condição de "não modificados" (*unmodified*). Assim que realizamos alguma modificação em um arquivo em nossa área de trabalho, ele assume a condição de "modificado" (*modified*) e, para que chegue novamente à condição de não modificados, precisamos estagiá-lo e submetê-lo ao repositório. Qualquer alteração em um arquivo Git, até mesmo sua deleção, deve obedecer este ciclo de vida. Uma vez removido do ambiente Git o arquivo volta à condição de não rastreado.

<p><img src="https://camo.githubusercontent.com/91a1cfdd509774a88a51fa71ac9ac21dd40bb7f1f529a9cc88c227c4ba3feb67/68747470733a2f2f662e636c6f75642e6769746875622e636f6d2f6173736574732f3134343739382f3834303334342f65333562303938652d663336662d313165322d383462322d6536653463393131336165612e706e67" alt="Git life cycle">
<figcaption align = "center"><b>Fig.3 - Ciclo de vida dos arquivos no Git</b></figcaption></p>

<br>

## Iniciando um repositório Git
Os comandos serão dados a partir do *bash*, isto é, do terminal de comando Linux.
Assim que instalamos o Git, devemos configurá-lo e atribuir um nome de usuário e um e-mail da seguinte forma:
```bash
git config --global user.name "usuario"
git config --global user.email endereco@email.com.br
```
Para iniciar um repositório antes de mais nada precisamos ir até o diretório do projeto e, a partir dele, usar o comando *git init*. Isto criará dentro do diretório em que está o projeto uma pasta oculta chamada *.git* onde serão armazenadas todas as informações sobre o projeto.
```bash
git init
```

Uma vez iniciado o rastreamento do projeto, podemos começar a modificar nossos arquivos e, quando for o momento de mudar sua condição de *untracked* para *staged* usamos o comando *git add < arquivo >* ou *git add .* para adicionar para a área de estágio todos os arquivos *untracked* e *modified*.
```bash
git add <arquivo> #Adiciona o arquivo especificado a area de estagio
git add . #Adiciona todas as modificacoes da area de trabalho a area de estagio
```

Para que possamos verificar as condições em que estão os arquivos do projeto usamos o comando *git status*.
```bash
git status
```

Após ter adicionado os arquivos à área de estágio podemos submetê-los ao repositório local com o comando *git commit -m "Mesagem"*. É interessante que esta mensagem não contenha caracteres especiais e seja, preferencialmente, em inglês, e seja informativa sobre as alterações que foram realizadas no projeto.
```bash
git commit -m "Mensagem sobre as alteracoes realizadas desde a submissao anterior" 
```

O parâmetro *--amend* pode ser usado no comando *git commit* para ajustar uma mensagem mal formulada ou uma alteração tão pequena que não mereça umas submissão separada.
```bash
git commit -m "Nova mensagem" --amend
```

Podemos estar interessados em olhar o <u>histórico de submissões</u> realizadas no projeto desde seu início. Para isso podemos usar o comando *git log* com alguns parâmetros para ampliar seu escopo, como *--oneline* para que as modificações sejam apresentadas em apenas uma linha por submissão, *--all* para mostrar todas as submissões desde o início (ou *-< n>* para mostrar as n últimas alterações) do projeto e *graph* caso desejemos ver o histórico de ramificações de forma grtáfica também.
```bash
git log --online --al graph 
git log -p -<n>
```

Enfim, para inspecionar as <u>modificações realizadas entre duas submissões específicas</u> podemos usar o comando *git diff <commit_antigo> <commit_recente>* da seguinte maneira:
```bash
git diff <commit_antigo> <commit_recente> 
```

## Mais comandos de controle do repositório
Sendo o Git uma ferramenta de versionamento de código, é possível <u>restaurarmos e reavermos códigos de versões anteriores</u>. Para isso podemos usar o comando *git restore < arquivo >*, caso ele ainda esteja apenas na área de trabalho; e *git restore --staged < arquivo >*, caso ele já tenha sido adicionado à área de estágio.
```bash
git restore <arquivo> #Caso ainda esteja apenas na area de trabalho
git restore --staged <arquivo> #Caso já esteja em estagio
```

No caso de o arquivo já ter sido submetido ao repositório, podemos usar o comando *git reset --mixed < commit_alvo >* ou o comando *git reset --hard < commit_alvo >*. A diferença entre as duas formas de restituição de submissões anteriores é que o parâmetro <u>*--hard* elimina todas as modificações realizadas no projeto</u>, enquanto o parâmetro <u>*--mixed* coloca as modificações realizadas na área de trabalho para que possamos re-editá-las</u> e escolher o que deve ou não permanecer no código.
```bash
git reset --hard <commit_alvo> #Perde todas as modificacoes do commit_alvo
git reset --mixed <commit_alvo> #Retem as moficacoes do commit_alvo na area de trabalho
```

Caso queiramos apenas <u>alterar mensagens</u> e <u>agrupar submissões</u> que deveriam ter sido uma única, usamos o comando *git rebase -i HEAD~< n>*. A instância *HEAD* é a condição atual (cabeceira) do nosso ramo. O parâmetro < n> indica quantas submissões anteriores queremos averiguar. Este comando abre o modo interativo do Git no editor de textos Vim, onde podemos reescrever mensagens com o comando *reword* ou agrupar e combinar submissões anteriores em apenas uma submissão com o comando *squash*.
```bash
git rebase -i HEAD~<n> 
```

## Comandos de repositório remoto
<u>Repositórios remotos</u> são fundamentais para podermos ter uma backup confiável do projeto bem como para podermos compartilhar e trabalhar em equipes sobre eles. Para tanto usamos, por exemplo, uma URL da Web (i.e. HTTPS), embora outras formas de repositórios remotos possam ser utilizados. Usualmente usamos o serviço do <u>GitHub</u> ou <u>GitLab</u> para armazenar repositórios remotos devido a suas confiabilidade e facilidade de uso e compartilhamento. Para isso basta criar uma conta e um novo repositório nos sites desses serviços e vinculá-los com o repositório local em que estamos desenvolvendo nosso código.
```bash
git remote add <nome_repos> <url_repos> #Geralmente o repositorio principal e chamado de "origin"
```

Para submetermos todo um ramo para o repositório remoto, usamos o comando *git push -U < nome_repos > < nome_branch > da seguinte forma:
```bash
git push -u <nome_repos> <nome_branch>
```

Caso formos trabalhar constantemente em um mesmo ramo e queiramos facilitar nosso trabalho de escrita podemos utilizar o parâmetro *git push --set-upstream* para vincular permanentemente o ramo em que estamos trabalhando localmente com o que estamos trabalhando remotamente.
```bash
git push --set-upstream <nome_repos> <nome_branch> #O nome dos ramos deve ser o mesmo local e remotamente
git push #Este comando já irá submeter o ramo local vinculado com o ramo remoto
```

Muitas vezes precisaremos trazer de volta para o repositório local modificações que estão no repositório remoto. Há duas formas de fazer isso. A primeira é trazer todo o repositório remoto de uma vez para o local através da clonagem do repositório remoto. Geralmente isto é feito quando começamos a trabalhar em um projeto que já está em andamento. A segunda forma e trazendo apenas as submissões faltantes no repositório local.
```bash
git clone <url_repos> #Clona todo o repositorio de origem de uma so vez
git pull #Traz para o repositorio local as modificacoes no repos remoto
```

Se quisermos verificar o histórico de submissões em um determinado ramo antes de trazê-lo para dentro de nosso repositório local podemos usar o comando *git fetch*.
```bash
git fetch <nome_repos> <nome_branch> #Caso queiramos investigar apenas um ramo
git fetch --all #Caso queiramos investigar todo o repositório 
```

## Trabalhando com ramos (*branches*)
Ramos são linhas de desenvolvimento de código independentes que podem, ou não, ser unidas parcial ou completamente. Elas permitem que várias pessoas trabalhem simultaneamente no mesmo projeto sem que haja conflitos de versões, além de permitir que versões paralelas sejam desenvolvidas sem que interfiram no funcionamento da versão corrente.
Para criar um novo ramo em nosso repositório, usamos o comando *git branch <nome_branch>*. Contudo este comando apenas cria um novo ramo sem que movamos nossa área de trabalho para dentro dele. Para trabalharmos dentro de um ramo, usamos o comando *git checkout <nome_branch>*. Caso queiramos fazer as duas coisas ao mesmo tempo, isto é, criar um novo ramo e mover o *HEAD* para dentro dele, usamos o parâmetro *git branch -b <nome_branch>*, como a seguir:
```bash
git branch <nome_branch> #Cria um novo ramo
git checkout <nome_branch> #Move a cabeceira para um ramo
git checkout -b <nome_branch> #Cria um novo ramo e move a cabeceira para dentro dele
```

Podemos checar os ramos existentes no repositório local usando simplesmente *git branch* e podemos adicionar o parâmetro *git branch -a* para checar todos os ramos, incluindo os do repositório remoto:
```bash
git branch 
git branch -a
```

Quando temos a intenção de mover a cabeceira pelas submissões que realizamos para que possamos, por exmplo, criar uma nova ramificação a partir deste submissão, usamos o comando *git checkout < SHA-1 >*, onde SHA-1 é o código da submissão alvo. 
```bash
git checkout <SHA-1> 
```
<p><img src="https://images.velog.io/images/gil0127/post/64ea623f-201e-4d19-aedf-2385777c05d4/aaaaaaaaa.png" alt="Git branches">
<figcaption align = "center"><b>Fig.4 - A representação de diferentes ramos de trabalho</b></figcaption></p>

Quando precisamos fundir dois ramos de trabalho (por exemplo o ramo azul ao ramo verde na Fig.4), podemos usar o comando *git merge <branch_trazido>*. Lembrando que este comando sempre fundi o ramo trazido ao ramo em que a cabeceira *HEAD* está situada no momento, por isso é necessário atentar para o posicionamento da cabeceira.
```bash
git merge <branch_trazido> 
```

Como já visto anteriormente, caso queiramos submeter um ramo ao nosso repositório remoto devemos usar o comando *git push -u <repo_remoto> <nome_branch>*, mas há ainda a possibilidade de querermos submeter todos os ramos de uma vez só e, para isso, usamos o parâmetro *git push --all*
```bash
git push -u <repo_remoto> <nome_branch> #submete o ramo especificado ao repositorio remoto
git push --all #Submete todos os ramos ao repositorio remoto 
```

Para removermos ramos completos de um repositório usamos o comando *git branch -d <nome_branch>* e para aplicar resta remoção ao repositório remoto usamos o comando *git push --delete <repo_remoto> <nome_branch>*.
```bash
git branch -d <nome_branch>
git push --delete <repo_remoto> <nome_branch> 
```

Eventualmente pode ser necessário cancelar a mesclagem, principalmente pq arquivos de notebook como *.ipynb* são mesclados de forma diferente (já que eles são, na verdade, arquivo *.json* repaginados). Para tanto usamos o comando *git merge --abort*.
```bash
git merge --abort 
```

Há um pacote para Python que pode ser utilizado para resolver conflitos de fusão em arquivos *.ipynb*: **nbdime**
```python
pip install nbdime

git-nbdiffdriver config --enable
git-nbmergedriver config --enable
``` 
