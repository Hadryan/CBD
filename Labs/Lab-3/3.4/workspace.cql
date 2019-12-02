CREATE KEYSPACE biblioteca WITH replication = {'class':'SimpleStrategy', 'replication_factor':3};

use biblioteca;

CREATE TABLE livros
(
    titulo     text,
    isbn       text,
    autor      text,
    editora    text,
    ano        timestamp,
    quantidade int,
    PRIMARY KEY (isbn)
);

CREATE TABLE utilizadores
(
    nome   text,
    userId uuid,
    PRIMARY KEY (userId)
);

CREATE TABLE requitadosByUser
(
    requerente uuid,
    livros     list<text>,

    PRIMARY KEY (requerente)
);

CREATE TABLE funcionarios
(
    nome    text,
    funcID  uuid,
    funcoes set<text>,

    PRIMARY KEY (funcID)
);

CREATE TABLE categorias
(
    categoria text,
    livros    map<int, text>, // Livro <-> Categoria

    PRIMARY KEY (categoria)
);

BEGIN
    BATCH
    INSERT INTO livros (titulo, isbn, autor, editora, ano, quantidade)
    VALUES ('Para lá do oceano', '9789898868480', 'Taro Gomi', 'Orfeu Negro', '2019-06-01 12:52:49.000', 4);
    INSERT INTO livros(titulo, isbn, autor, editora, ano, quantidade)
    VALUES ('Para lá da areia', '9789898868481', 'Taro Gomi', 'Orfeu Negro', '2019-06-02 12:52:49.000', 3);
    INSERT INTO livros(titulo, isbn, autor, editora, ano, quantidade)
    VALUES ('Para lá da terra', '9789898868482', 'Taro Gomi', 'Orfeu Negro', '2019-06-03 12:52:49.000', 5);
    INSERT INTO livros(titulo, isbn, autor, editora, ano, quantidade)
    VALUES ('Para lá do céu', '9789898868483', 'Taro Gomi', 'Orfeu Negro', '2019-06-04 12:52:49.000', 1);
    INSERT INTO livros(titulo, isbn, autor, editora, ano, quantidade)
    VALUES ('Para lá do inferno', '9789898868484', 'Taro Gomi', 'Orfeu Negro', '2019-06-05 12:52:49.000', 6);
    INSERT INTO livros(titulo, isbn, autor, editora, ano, quantidade)
    VALUES ('Para lá dos gigantes', '9789898868485', 'Taro Gomi', 'Orfeu Negro', '2019-06-05 12:52:49.000', 6);
    INSERT INTO livros(titulo, isbn, autor, editora, ano, quantidade)
    VALUES ('Para lá do mato', '9789898868486', 'Taro Gomi', 'Orfeu Negro', '2019-06-05 12:52:49.000', 6);
    INSERT INTO livros(titulo, isbn, autor, editora, ano, quantidade)
    VALUES ('Para lá do matagal', '9789898868487', 'Taro Gomi', 'Orfeu Negro', '2019-06-05 12:52:49.000', 6);
    INSERT INTO livros(titulo, isbn, autor, editora, ano, quantidade)
    VALUES ('Para lá dos cavalos azuis', '9789898868488', 'Taro Gomi', 'Orfeu Negro', '2019-06-05 12:52:49.000', 6);
    INSERT INTO livros(titulo, isbn, autor, editora, ano, quantidade)
    VALUES ('Para lá do Ipiranga', '9789898868489', 'Taro Gomi', 'Orfeu Negro', '2019-06-05 12:52:49.000', 6);
    INSERT INTO livros(titulo, isbn, autor, editora, ano, quantidade)
    VALUES ('Para lá do António', '9789898868494', 'Taro Gomi', 'Orfeu Negro', '2019-06-05 12:52:49.000', 6);
    INSERT INTO livros(titulo, isbn, autor, editora, ano, quantidade)
    VALUES ('Lágrima derramada', '9789898868474', 'Taro Gomi', 'Orfeu Negro', '2019-06-05 12:52:49.000', 6);
    APPLY BATCH;

BEGIN
    BATCH
    INSERT INTO utilizadores (nome, userId) VALUES ('Miguel', now());
    INSERT INTO utilizadores (nome, userId) VALUES ('Ema', now());
    INSERT INTO utilizadores (nome, userId) VALUES ('Daniel', now());
    INSERT INTO utilizadores (nome, userId) VALUES ('Francisco', now());
    INSERT INTO utilizadores (nome, userId) VALUES ('João', now());
    INSERT INTO utilizadores (nome, userId) VALUES ('Ricardo', now());
    INSERT INTO utilizadores (nome, userId) VALUES ('Abélio', now());
    INSERT INTO utilizadores (nome, userId) VALUES ('José', now());
    INSERT INTO utilizadores (nome, userId) VALUES ('Filipe', now());
    INSERT INTO utilizadores (nome, userId) VALUES ('Joaquim', now());
    INSERT INTO utilizadores (nome, userId) VALUES ('Ilídio', now());
    INSERT INTO utilizadores (nome, userId) VALUES ('Afonso', now());
    APPLY BATCH;

BEGIN
    BATCH
    INSERT INTO funcionarios(nome, funcID, funcoes) VALUES ('Miguel', now(), {'Receção'});
    INSERT INTO funcionarios(nome, funcID, funcoes) VALUES ('Ema', now(), {'Limpeza'});
    INSERT INTO funcionarios(nome, funcID, funcoes) VALUES ('Daniel', now(), {'Reposição'});
    INSERT INTO funcionarios(nome, funcID, funcoes) VALUES ('Francisco', now(), {'Restauro'});
    INSERT INTO funcionarios(nome, funcID, funcoes) VALUES ('João', now(), {'Receção'});
    INSERT INTO funcionarios(nome, funcID, funcoes) VALUES ('Ricardo', now(), {'Restauro'});
    INSERT INTO funcionarios(nome, funcID, funcoes) VALUES ('Abélio', now(), {'Reposição'});
    INSERT INTO funcionarios(nome, funcID, funcoes) VALUES ('José', now(), {'Receção'});
    INSERT INTO funcionarios(nome, funcID, funcoes) VALUES ('Filipe', now(), {'Contador de Histórias'});
    INSERT INTO funcionarios(nome, funcID, funcoes) VALUES ('Joaquim', now(), {'Limpeza'});
    INSERT INTO funcionarios(nome, funcID, funcoes) VALUES ('Ilídio', now(), {'Estagiário'});
    INSERT INTO funcionarios(nome, funcID, funcoes) VALUES ('Afonso', now(), {'Limpeza'});
    APPLY BATCH;

BEGIN
    BATCH
    INSERT INTO funcionarios(nome, funcID, funcoes) VALUES ('Miguel', now(), {'Receção'});
    INSERT INTO funcionarios(nome, funcID, funcoes) VALUES ('Ema', now(), {'Limpeza'});
    INSERT INTO funcionarios(nome, funcID, funcoes) VALUES ('Daniel', now(), {'Reposição'});
    INSERT INTO funcionarios(nome, funcID, funcoes) VALUES ('Francisco', now(), {'Restauro'});
    INSERT INTO funcionarios(nome, funcID, funcoes) VALUES ('João', now(), {'Receção'});
    INSERT INTO funcionarios(nome, funcID, funcoes) VALUES ('Ricardo', now(), {'Restauro'});
    INSERT INTO funcionarios(nome, funcID, funcoes) VALUES ('Abélio', now(), {'Reposição'});
    INSERT INTO funcionarios(nome, funcID, funcoes) VALUES ('José', now(), {'Receção'});
    INSERT INTO funcionarios(nome, funcID, funcoes) VALUES ('Filipe', now(), {'Contador de Histórias'});
    INSERT INTO funcionarios(nome, funcID, funcoes) VALUES ('Joaquim', now(), {'Limpeza'});
    INSERT INTO funcionarios(nome, funcID, funcoes) VALUES ('Ilídio', now(), {'Estagiário'});
    INSERT INTO funcionarios(nome, funcID, funcoes) VALUES ('Afonso', now(), {'Limpeza'});
    APPLY BATCH;

BEGIN
    BATCH
    INSERT INTO requitadosByUser (requerente, livros) VALUES (6a4264d1-1504-11ea-af61-f58bd8d3766a, ['9789898868488']);
    INSERT INTO requitadosByUser (requerente, livros) VALUES (6a4264d0-1504-11ea-af61-f58bd8d3766a, ['9789898868494']);
    INSERT INTO requitadosByUser (requerente, livros) VALUES (6a4264d8-1504-11ea-af61-f58bd8d3766a, ['9789898868488']);
    INSERT INTO requitadosByUser (requerente, livros) VALUES (6a4264d1-1504-11ea-af61-f58bd8d3766a, ['9789898868488']);
    INSERT INTO requitadosByUser (requerente, livros) VALUES (6a4264d4-1504-11ea-af61-f58bd8d3766a, ['9789898868488']);
    INSERT INTO requitadosByUser (requerente, livros) VALUES (6a4264d7-1504-11ea-af61-f58bd8d3766a, ['9789898868488']);
    INSERT INTO requitadosByUser (requerente, livros) VALUES (6a4264d5-1504-11ea-af61-f58bd8d3766a, ['9789898868488']);
    INSERT INTO requitadosByUser (requerente, livros) VALUES (6a4264d9-1504-11ea-af61-f58bd8d3766a, ['9789898868488']);
    INSERT INTO requitadosByUser (requerente, livros) VALUES (6a4264d6-1504-11ea-af61-f58bd8d3766a, ['9789898868482']);
    INSERT INTO requitadosByUser (requerente, livros) VALUES (6a4264db-1504-11ea-af61-f58bd8d3766a, ['9789898868485']);
    INSERT INTO requitadosByUser (requerente, livros) VALUES (6a4264d2-1504-11ea-af61-f58bd8d3766a, ['9789898868481']);
    INSERT INTO requitadosByUser (requerente, livros) VALUES (6a4264da-1504-11ea-af61-f58bd8d3766a, ['9789898868486']);
    APPLY BATCH;

BEGIN
    BATCH
    INSERT INTO categorias (categoria, livros)
    VALUES ('Infanto-Juvenil',
            {1: '9789898868488', 2:'9789898868494', 3:'9789898868484', 4:'9789898868487', 5: '9789898868485', 6:'9789898868481'});
    INSERT INTO categorias (categoria, livros) VALUES ('Romance', {1:'9789898868486'});
    INSERT INTO categorias (categoria, livros) VALUES ('Juvenil', {1:'9789898868482'});
    INSERT INTO categorias (categoria, livros) VALUES ('Terror', {1:'9789898868474'});
    INSERT INTO categorias (categoria, livros) VALUES ('Poesia', {1:'9789898868480'});
    INSERT INTO categorias (categoria, livros) VALUES ('Erotismo', {1:'9789898868483'});
    INSERT INTO categorias (categoria, livros) VALUES ('Romance', {1:'9789898868489'});
    APPLY BATCH;

CREATE INDEX livrosNomes ON livros (titulo);
CREATE INDEX funcoesNome ON funcionarios (funcoes);

-- Update
UPDATE funcionarios
SET funcoes = funcoes + {'Contador de histórias'}
WHERE funcID = 0b743bf6-1508-11ea-af61-f58bd8d3766a;

UPDATE requitadosByUser
SET livros = ['9789898868494', '9789898868488']
WHERE requerente = 6a4264d0-1504-11ea-af61-f58bd8d3766a;

UPDATE categorias
SET livros= livros + {2:'9789898868488'}
WHERE categoria = 'Romance';

UPDATE livros
SET quantidade = 5
WHERE isbn = '9789898868481';

UPDATE utilizadores
SET nome = 'João Abélio'
WHERE userId = 6a4264d6-1504-11ea-af61-f58bd8d3766a;

-- Delete
UPDATE categorias
SET livros = livros - {2}
WHERE categoria = 'Romance';

UPDATE funcionarios
SET funcoes = funcoes - {'Contador de histórias'}
WHERE funcID = 0b743bf6-1508-11ea-af61-f58bd8d3766a;

UPDATE requitadosByUser
SET livros = livros - ['9789898868494']
WHERE requerente = 6a4264d0-1504-11ea-af61-f58bd8d3766a;

DELETE
FROM livros
WHERE isbn = '9789898868481';

DELETE
FROM categorias
WHERE categoria = 'Romance';

-- 1)
/**
  Obter o livro com mais quantidade disponível em stock.
 */
SELECT titulo, max(quantidade) AS quantidade
FROM livros;
-- 2)
/**
  Selecionar todas as pessoas que selecionaram o livro 9789898868488.
 */
SELECT requerente
FROM requitadosByUser
WHERE livros CONTAINS '9789898868488' ALLOW FILTERING;
-- 3)
/**
  Selecionar os primeiros 5 livros.
 */
SELECT *
FROM livros
LIMIT 5;
-- 4)
/**
    Selecionar todos os que contêm o isb 9789898868494 agrupados pela categoria.
 */
SELECT *
FROM categorias
WHERE livros CONTAINS '9789898868494'
GROUP BY categoria ALLOW FILTERING;
-- 5)
/**
  Determinar a quantidade média de livros.
 */
SELECT AVG(quantidade) AS media
FROM livros ALLOW FILTERING;
-- 6)
/**
  Selecionar todos os funcionários que contém funções de limpeza
 */
select *
from funcionarios
where funcoes contains 'Limpeza';
-- 7)
/**
    Selecionar todos os titulos de livros começados por "Para"
 */
 CREATE CUSTOM INDEX nomes ON livros (titulo) USING 'org.apache.cassandra.index.sasi.SASIIndex' WITH OPTIONS = {'mode': 'CONTAINS', 'analyzer_class': 'org.apache.cassandra.index.sasi.analyzer.StandardAnalyzer', 'case_sensitive': 'false'};
 select titulo from livros where titulo like 'Para*';
-- 8)

-- 9)

-- 10)