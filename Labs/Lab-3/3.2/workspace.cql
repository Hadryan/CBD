CREATE KEYSPACE videos WITH replication = {'class':'SimpleStrategy', 'replication_factor':3};

USE videos;

CREATE TABLE users
(
    username text,
    nome     text,
    email    text,
    registo  timestamp,
    PRIMARY KEY (username, nome)
);

CREATE TABLE videos_nome
(
    user       text,
    nome       text,
    descricao  text,
    upload     timestamp,
    tags       set<text>,
    seguidores list<text>,
    PRIMARY KEY (user, nome, upload)
);

CREATE TABLE videos_autor
(
    user       text,
    nome       text,
    descricao  text,
    upload     timestamp,
    tags       set<text>,
    seguidores list<text>,
    PRIMARY KEY (user, upload)
);

CREATE TABLE comentarios_video
(
    nome       text,
    user       text,
    data       timestamp,
    comentario text,
    PRIMARY KEY (nome, data)
);

CREATE TABLE comentarios_user
(
    nome       text,
    user       text,
    data       timestamp,
    comentario text,
    PRIMARY KEY (user, data)
);

CREATE TABLE eventos
(
    nome        text,
    user        text,
    tipo        text,
    ocorrencia  timestamp,
    tempo_video int,
    PRIMARY KEY (user, nome, ocorrencia)
);

CREATE TABLE ratings
(
    nome   text,
    rating int,
    PRIMARY KEY (nome, rating)
);

BEGIN
    BATCH
    INSERT INTO users(username, nome, email, registo) VALUES ('u1', 'A', 'a@gmail.com', dateof(now()));
    INSERT INTO users(username, nome, email, registo) VALUES ('u2', 'B', 'b@gmail.com', dateof(now()));
    INSERT INTO users(username, nome, email, registo) VALUES ('u3', 'C', 'c@gmail.com', dateof(now()));
    INSERT INTO users(username, nome, email, registo) VALUES ('u4', 'D', 'd@gmail.com', dateof(now()));
    INSERT INTO users(username, nome, email, registo) VALUES ('u5', 'E', 'e@gmail.com', dateof(now()));
    INSERT INTO users(username, nome, email, registo) VALUES ('u6', 'F', 'f@gmail.com', dateof(now()));
    INSERT INTO users(username, nome, email, registo) VALUES ('u7', 'G', 'g@gmail.com', dateof(now()));
    INSERT INTO users(username, nome, email, registo) VALUES ('u8', 'H', 'h@gmail.com', dateof(now()));
    INSERT INTO users(username, nome, email, registo) VALUES ('u9', 'I', 'i@gmail.com', dateof(now()));
    INSERT INTO users(username, nome, email, registo) VALUES ('u10', 'J', 'j@gmail.com', dateof(now()));
    APPLY BATCH;

BEGIN
    BATCH
    INSERT INTO videos_nome(user, nome, upload, descricao, tags, seguidores)
    VALUES ('u1', 'A', dateof(now()), 'ewjwehfwehk1', {'drama', 'ação'}, ['u1', 'u2']);
    INSERT INTO videos_nome(user, nome, upload, descricao, tags, seguidores)
    VALUES ('u2', 'B', dateof(now()), 'ewjwehfwehk2', {'drama'}, ['u3', 'u2']);
    INSERT INTO videos_nome(user, nome, upload, descricao, tags, seguidores)
    VALUES ('u4', 'C', dateof(now()), 'ewjwehfwehk3', {'romance', 'comédia'}, ['u6', 'u7']);
    INSERT INTO videos_nome(user, nome, upload, descricao, tags, seguidores)
    VALUES ('u2', 'D', dateof(now()), 'ewjwehfwehk4', {'terror', 'drama'}, ['u1', 'u2', 'u3']);
    INSERT INTO videos_nome(user, nome, upload, descricao, tags, seguidores)
    VALUES ('u1', 'E', dateof(now()), 'ewjwehfwehk5', {'comédia'}, ['u5', 'u6']);
    INSERT INTO videos_nome(user, nome, upload, descricao, tags, seguidores)
    VALUES ('u7', 'F', dateof(now()), 'ewjwehfwehk6', {'drama', 'terror'}, ['u1', 'u2', 'u4']);
    INSERT INTO videos_nome(user, nome, upload, descricao, tags, seguidores)
    VALUES ('u9', 'G', dateof(now()), 'ewjwehfwehk7', {'comédia'}, ['u10', 'u9', 'u8']);
    INSERT INTO videos_nome(user, nome, upload, descricao, tags, seguidores)
    VALUES ('u7', 'H', dateof(now()), 'ewjwehfwehk8', {'comédia', 'romance'}, ['u4', 'u5']);
    INSERT INTO videos_nome(user, nome, upload, descricao, tags, seguidores)
    VALUES ('u3', 'I', dateof(now()), 'ewjwehfwehk9', {'ação'}, ['u1', 'u4', 'u2']);
    INSERT INTO videos_nome(user, nome, upload, descricao, tags, seguidores)
    VALUES ('u8', 'J', dateof(now()), 'ewjwehfwehk10', {'comédia'}, ['u4']);
    APPLY BATCH;

BEGIN
    BATCH
    INSERT INTO videos_autor(user, nome, upload, descricao, tags, seguidores)
    VALUES ('u1', 'A', dateof(now()), 'ewjwehfwehk1', {'drama', 'ação'}, ['u1', 'u2']);
    INSERT INTO videos_autor(user, nome, upload, descricao, tags, seguidores)
    VALUES ('u2', 'B', dateof(now()), 'ewjwehfwehk2', {'drama'}, ['u3', 'u2']);
    INSERT INTO videos_autor(user, nome, upload, descricao, tags, seguidores)
    VALUES ('u4', 'C', dateof(now()), 'ewjwehfwehk3', {'romance', 'comédia'}, ['u6', 'u7']);
    INSERT INTO videos_autor(user, nome, upload, descricao, tags, seguidores)
    VALUES ('u2', 'D', dateof(now()), 'ewjwehfwehk4', {'terror', 'drama'}, ['u1', 'u2', 'u3']);
    INSERT INTO videos_autor(user, nome, upload, descricao, tags, seguidores)
    VALUES ('u1', 'E', dateof(now()), 'ewjwehfwehk5', {'comédia'}, ['u5', 'u6']);
    INSERT INTO videos_autor(user, nome, upload, descricao, tags, seguidores)
    VALUES ('u7', 'F', dateof(now()), 'ewjwehfwehk6', {'drama', 'terror'}, ['u1', 'u2', 'u4']);
    INSERT INTO videos_autor(user, nome, upload, descricao, tags, seguidores)
    VALUES ('u9', 'G', dateof(now()), 'ewjwehfwehk7', {'comédia'}, ['u10', 'u9', 'u8']);
    INSERT INTO videos_autor(user, nome, upload, descricao, tags, seguidores)
    VALUES ('u7', 'H', dateof(now()), 'ewjwehfwehk8', {'comédia', 'romance'}, ['u4', 'u5']);
    INSERT INTO videos_autor(user, nome, upload, descricao, tags, seguidores)
    VALUES ('u3', 'I', dateof(now()), 'ewjwehfwehk9', {'ação'}, ['u1', 'u4', 'u2']);
    INSERT INTO videos_autor(user, nome, upload, descricao, tags, seguidores)
    VALUES ('u8', 'J', dateof(now()), 'ewjwehfwehk10', {'comédia'}, ['u4']);
    APPLY BATCH;

BEGIN
    BATCH
    INSERT INTO comentarios_video(nome, user, data, comentario)
    VALUES ('A', 'u1', dateof(now()), 'iewlufewbewlkwkzjuierrlufsjkgjksvk');
    INSERT INTO comentarios_video(nome, user, data, comentario)
    VALUES ('B', 'u2', dateof(now()), 'iewlufewbewlkwkzjuierrlufsjkgjksvk');
    INSERT INTO comentarios_video(nome, user, data, comentario)
    VALUES ('D', 'u3', dateof(now()), 'iewlufewbewlkwkzjuierrlufsjkgjksvk');
    INSERT INTO comentarios_video(nome, user, data, comentario)
    VALUES ('E', 'u4', dateof(now()), 'iewlufewbewlkwkzjuierrlufsjkgjksvk');
    INSERT INTO comentarios_video(nome, user, data, comentario)
    VALUES ('F', 'u5', dateof(now()), 'iewlufewbewlkwkzjuierrlufsjkgjksvk');
    INSERT INTO comentarios_video(nome, user, data, comentario)
    VALUES ('A', 'u6', dateof(now()), 'iewlufewbewlkwkzjuierrlufsjkgjksvk');
    INSERT INTO comentarios_video(nome, user, data, comentario)
    VALUES ('F', 'u10', dateof(now()), 'iewlufewbewlkwkzjuierrlufsjkgjksvk');
    INSERT INTO comentarios_video(nome, user, data, comentario)
    VALUES ('E', 'u7', dateof(now()), 'iewlufewbewlkwkzjuierrlufsjkgjksvk');
    INSERT INTO comentarios_video(nome, user, data, comentario)
    VALUES ('B', 'u8', dateof(now()), 'iewlufewbewlkwkzjuierrlufsjkgjksvk');
    INSERT INTO comentarios_video(nome, user, data, comentario)
    VALUES ('D', 'u9', dateof(now()), 'iewlufewbewlkwkzjuierrlufsjkgjksvk');
    INSERT INTO comentarios_video(nome, user, data, comentario)
    VALUES ('D', 'u1', dateof(now()), 'iewlufewbewlkwkzjuierrlufsjkgjksvk');

    INSERT INTO comentarios_user(nome, user, data, comentario)
    VALUES ('A', 'u1', dateof(now()), 'iewlufewbewlkwkzjuierrlufsjkgjksvk');
    INSERT INTO comentarios_user(nome, user, data, comentario)
    VALUES ('B', 'u2', dateof(now()), 'iewlufewbewlkwkzjuierrlufsjkgjksvk');
    INSERT INTO comentarios_user(nome, user, data, comentario)
    VALUES ('D', 'u3', dateof(now()), 'iewlufewbewlkwkzjuierrlufsjkgjksvk');
    INSERT INTO comentarios_user(nome, user, data, comentario)
    VALUES ('E', 'u4', dateof(now()), 'iewlufewbewlkwkzjuierrlufsjkgjksvk');
    INSERT INTO comentarios_user(nome, user, data, comentario)
    VALUES ('F', 'u5', dateof(now()), 'iewlufewbewlkwkzjuierrlufsjkgjksvk');
    INSERT INTO comentarios_user(nome, user, data, comentario)
    VALUES ('A', 'u6', dateof(now()), 'iewlufewbewlkwkzjuierrlufsjkgjksvk');
    INSERT INTO comentarios_user(nome, user, data, comentario)
    VALUES ('F', 'u10', dateof(now()), 'iewlufewbewlkwkzjuierrlufsjkgjksvk');
    INSERT INTO comentarios_user(nome, user, data, comentario)
    VALUES ('E', 'u7', dateof(now()), 'iewlufewbewlkwkzjuierrlufsjkgjksvk');
    INSERT INTO comentarios_user(nome, user, data, comentario)
    VALUES ('B', 'u8', dateof(now()), 'iewlufewbewlkwkzjuierrlufsjkgjksvk');
    INSERT INTO comentarios_user(nome, user, data, comentario)
    VALUES ('D', 'u9', dateof(now()), 'iewlufewbewlkwkzjuierrlufsjkgjksvk');
    INSERT INTO comentarios_user(nome, user, data, comentario)
    VALUES ('D', 'u1', dateof(now()), 'iewlufewbewlkwkzjuierrlufsjkgjksvk');
    APPLY BATCH;

BEGIN
    BATCH
    INSERT INTO eventos (nome, user, tipo, ocorrencia, tempo_video) VALUES ('A', 'u1', 'play', dateof(now()), 60);
    INSERT INTO eventos (nome, user, tipo, ocorrencia, tempo_video) VALUES ('B', 'u2', 'stop', dateof(now()), 80);
    INSERT INTO eventos (nome, user, tipo, ocorrencia, tempo_video) VALUES ('D', 'u3', 'pause', dateof(now()), 50);
    INSERT INTO eventos (nome, user, tipo, ocorrencia, tempo_video) VALUES ('E', 'u4', 'play', dateof(now()), 100);
    INSERT INTO eventos (nome, user, tipo, ocorrencia, tempo_video) VALUES ('F', 'u5', 'stop', dateof(now()), 30);
    INSERT INTO eventos (nome, user, tipo, ocorrencia, tempo_video) VALUES ('A', 'u6', 'pause', dateof(now()), 20);
    INSERT INTO eventos (nome, user, tipo, ocorrencia, tempo_video) VALUES ('F', 'u10', 'play', dateof(now()), 120);
    INSERT INTO eventos (nome, user, tipo, ocorrencia, tempo_video) VALUES ('E', 'u7', 'stop', dateof(now()), 150);
    INSERT INTO eventos (nome, user, tipo, ocorrencia, tempo_video) VALUES ('B', 'u8', 'pause', dateof(now()), 65);
    INSERT INTO eventos (nome, user, tipo, ocorrencia, tempo_video) VALUES ('D', 'u9', 'play', dateof(now()), 45);
    APPLY BATCH;

BEGIN
    BATCH
    INSERT INTO ratings(nome, rating) VALUES ('A', 3);
    INSERT INTO ratings(nome, rating) VALUES ('B', 4);
    INSERT INTO ratings(nome, rating) VALUES ('C', 2);
    INSERT INTO ratings(nome, rating) VALUES ('D', 4);
    INSERT INTO ratings(nome, rating) VALUES ('A', 3);
    INSERT INTO ratings(nome, rating) VALUES ('B', 1);
    INSERT INTO ratings(nome, rating) VALUES ('C', 2);
    INSERT INTO ratings(nome, rating) VALUES ('D', 5);
    INSERT INTO ratings(nome, rating) VALUES ('E', 4);
    INSERT INTO ratings(nome, rating) VALUES ('E', 3);
    APPLY BATCH;

SELECT JSON *
FROM comentarios_video;
SELECT JSON *
FROM comentarios_user;
SELECT JSON *
FROM eventos;
SELECT JSON *
FROM ratings;
SELECT JSON *
FROM users;
SELECT JSON *
FROM videos_autor;
SELECT JSON *
FROM videos_nome;


-- Alínea c)
-- 1)
SELECT *
FROM videos_nome
WHERE nome = 'A' ALLOW FILTERING;
-- 2)
SELECT *
FROM comentarios_user
WHERE user = 'u6'
ORDER BY data DESC;
-- 3)
SELECT *
FROM comentarios_video
WHERE nome = 'A'
ORDER BY data DESC;
-- 4)
SELECT nome, avg(rating), COUNT(nome)
FROM ratings
WHERE nome = 'A';
-- 5)

-- Alínea D)

-- 1)
SELECT *
FROM comentarios_video
WHERE nome = 'A'
ORDER BY data
LIMIT 3;
-- 2)
SELECT nome, tags
FROM videos_nome
WHERE nome = 'A' ALLOW FILTERING;
-- 3)
/**
  Como não tenho a tag Aveiro optei por colocar a tag comédia, assim,
  caso tivesse a tag Aveiro seria:
  SELECT * FROM videos_nome WHERE tags contains 'Aveiro' allow filtering ;
 */
SELECT *
FROM videos_nome
WHERE tags contains 'comédia' allow filtering;
-- 4)
SELECT *
FROM eventos
WHERE nome = 'D'
  AND user = 'u3'
LIMIT 5;
-- 5)
/**
  Como o usei o dateof(now()) para inserir os dados de modo a facilitar
  a sua inserção, o teu de diferença é bastante pequeno.
  Apesar de não ser muito expressivo podemos verificar que a query funciona.
 */
SELECT *
FROM videos_autor
WHERE user = 'u3'
  AND upload > '2019-12-01 16:16:10.860'
  AND upload <= '2019-12-01 21:57:32.195';
-- 6)
/**
  A query 6 não funciona uma vez que este tipo de pesquisas não é permitido por cassandra.
  Em cassandra, quando queremos pesquisar e ordenar a informação,
  temos de fornecer todas as partes da chave primária, sendo que a da tabela necessária
  para esta pesquisa usa (user, nome, upload) não fornecendo o user e o nome cassandra
  recusa-se a realizar esta query mesmo que usemos o allow filtering.
 */
-- 7)
SELECT seguidores
FROM videos_nome
WHERE nome = 'A' ALLOW FILTERING;
-- 8)
/**
  Esta query não funciona dado a especificidade de cassandra.
  Tendo em conta que Cassandra é uma base de dados não relacional
  pensada para escalar na horizontal, não podemos fazer joins na mesma
  por isso esta query é impossível uma vez que teríamos de observar duas tabelas.
 */
-- 9)
/**
  A query não é possível a não ser que seja criado uma tabela que armazene todos os
  dados da tabela de ratings, caso contrário o mais próximo que conseguimos chegar
  disso é executar uma query que retorna o valor de regist máximo.
 */
SELECT nome, max(rating)
FROM ratings;
--10)
/**
Nenhuma das soluções a que cheguei me agradou por isso vou optar por dar a entender aquilo que é o meu raciocínio sobre esta questão.
Numa primeira fase ao inserir tudo, como estava a usar o dateof(now()) não estava a conseguir perceber muito bem a ordenação.
Fiz drop da base de dados mas decidi inserir os dados com algum intervalo entre eles.
Inserindo manualmente verifiquei que a ordenação depende da chave primária que defini, ou seja, depende da composição de (user, nome, upload).
Numa primeira fase podemos verificar que ao inserir linhas com o user sempre diferente dos que já existem ele ordena os mesmos por
ordem decrescente.
Quando passamos a inserir valores que ele já conhece, Cassandra olha para a segunda coluna mantendo o mesmo mecanismo de ordenação,
isto é, ordena por (user, nome).
Quando já existe alguma coisa com (user,nome) igual ao que estamos a inserir ele tem em atenção o terceiro campo,
fazendo a ordenação por (user, nome, upload.)
*/
SELECT *
FROM videos_nome;

-- 11)
/**
  Dado a estrutura que eu implementei para este problema, esta query não é possível.
  Teríamos de ter uma tabela de tags em que iríamos armazenar as mesmas, ou seja:
 */
CREATE TABLE tags
(
    tag text,
    PRIMARY KEY (tag)
);
/**
  Uma outra possível implementação seria armazenar a informação das tags por vídeos
  numa tabela e depois apontar a tabela principal para esta.
 */
CREATE TABLE tags
(
    tag  text,
    nome text,
    PRIMARY KEY (nome, tag)
)