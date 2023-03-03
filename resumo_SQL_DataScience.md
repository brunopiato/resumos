<!-- TOC -->

- [Resumo SQL](#resumo-sql)
  - [Definição](#definição)
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

<!-- /TOC -->

# Resumo SQL
Bruno Piato - 22 de fevereito de 2023
## Definição

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
<br>

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

---

# Subqueries

Subqueries são consultas, transformações e filtragens realizadas nas tabelas anteriormente à consulta principal, permitindo que as junções de tabelas ocorram com os resultados destas transformações. Há três formas de realizar subqueries:
- Subqueries no **WHERE**: podemos usar o operador *IN* para filtrar uma tabela e, dentro do *IN* colocar uma query (subquery, neste caso) para selecionar as linhas a serem filtradas.
- Subqueries no **SELECT**: usamos este tipo quando queremos que o resultado da subquery figure como uma nova coluna na tabela principal. Podemos fazer a subquery retornar os próprios valores da variável como estão na tabela de origem (como se fosse um JOIN) ou podemos fazer a subquery retonar o resultado de funções de agregação.
- Subqueries no **FROM**: permitem processar toda uma tabela antes de usá-la e uni-la com outras tabelas, unindo somente seus resultados. É muito útil quando precisamos usar poucas variáveis de muitas tabelas diferentes, de modo que realizar o *JOIN* se tornaria muito dispendioso.


## Subquery no *WHERE*
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

## Subquery no *SELECT*
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

## Subquery no *FROM*
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

