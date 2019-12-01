CREATE KEYSPACE videos WITH replication = {'class':'SimpleStrategy', 'replication_factor':3};

USE videos;

CREATE TABLE users (
    username text,
    nome text,
    email text,
    registo timestamp,
    PRIMARY KEY(username, nome)
);

CREATE TABLE videos_nome (
    user text,
    nome text,
    descricao text,
    upload timestamp,
    tags set<text>,
    seguidores list<text>,
    PRIMARY KEY(user, nome, upload)
);

CREATE TABLE videos_autor (
    user text,
    nome text,
    descricao text,
    upload timestamp,
    tags set<text>,
    seguidores list<text>,
    PRIMARY KEY(user, upload)
);

CREATE TABLE comentarios_video (
    nome text,
    user text,
    data timestamp,
    comentario text,
    PRIMARY KEY(nome, data)
);

CREATE TABLE comentarios_user (
    nome text,
    user text,
    data timestamp,
    comentario text,
    PRIMARY KEY(user, data)
);

CREATE TABLE eventos (
    nome text,
    user text,
    tipo text,
    ocorrencia timestamp,
    tempo_video int,
    PRIMARY KEY(user, nome, ocorrencia)
);

CREATE TABLE ratings (
    nome text,
    rating int,
    PRIMARY KEY(nome,rating)
);

BEGIN BATCH
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

BEGIN BATCH
INSERT INTO videos_nome( user, nome, upload, descricao, tags, seguidores) VALUES ('u1', 'A', dateof(now()), '', {'drama', 'ação'}, ['u1', 'u2']);
INSERT INTO videos_nome( user, nome, upload, descricao, tags, seguidores) VALUES ('u2', 'B', dateof(now()), '', {'drama'}, ['u3', 'u2']);
INSERT INTO videos_nome( user, nome, upload, descricao, tags, seguidores) VALUES ('u4', 'C', dateof(now()), '', {'romance', 'comédia'}, ['u6', 'u7']);
INSERT INTO videos_nome( user, nome, upload, descricao, tags, seguidores) VALUES ('u2', 'D', dateof(now()), '', {'terror', 'drama'}, ['u1', 'u2', 'u3']);
INSERT INTO videos_nome( user, nome, upload, descricao, tags, seguidores) VALUES ('u1', 'E', dateof(now()), '', {'comédia'}, ['u5', 'u6']);
INSERT INTO videos_nome( user, nome, upload, descricao, tags, seguidores) VALUES ('u7', 'F', dateof(now()), '', {'drama', 'terror'}, ['u1', 'u2', 'u4']);
INSERT INTO videos_nome( user, nome, upload, descricao, tags, seguidores) VALUES ('u9', 'G', dateof(now()), '', {'comédia'}, ['u10', 'u9', 'u8']);
INSERT INTO videos_nome( user, nome, upload, descricao, tags, seguidores) VALUES ('u7', 'H', dateof(now()), '', {'comédia', 'romance'}, ['u4', 'u5']);
INSERT INTO videos_nome( user, nome, upload, descricao, tags, seguidores) VALUES ('u3', 'I', dateof(now()), '', {'ação'}, ['u1', 'u4', 'u2']);
INSERT INTO videos_nome( user, nome, upload, descricao, tags, seguidores) VALUES ('u8', 'J', dateof(now()), '', {'comédia'}, ['u4']);
APPLY BATCH;

BEGIN BATCH
INSERT INTO videos_autor( user, nome, upload, descricao, tags, seguidores) VALUES ('u1', 'A', dateof(now()), '', {'drama', 'drama'}, ['u1', 'u2']);
INSERT INTO videos_autor( user, nome, upload, descricao, tags, seguidores) VALUES ('u2', 'B', dateof(now()), '', {'drama'}, ['u3', 'u2']);
INSERT INTO videos_autor( user, nome, upload, descricao, tags, seguidores) VALUES ('u4', 'C', dateof(now()), '', {'romance', 'comédia'}, ['u6', 'u7']);
INSERT INTO videos_autor( user, nome, upload, descricao, tags, seguidores) VALUES ('u2', 'D', dateof(now()), '', {'terror', 'drama'}, ['u1', 'u2', 'u3']);
INSERT INTO videos_autor( user, nome, upload, descricao, tags, seguidores) VALUES ('u1', 'E', dateof(now()), '', {'comédia'}, ['u5', 'u6']);
INSERT INTO videos_autor( user, nome, upload, descricao, tags, seguidores) VALUES ('u7', 'F', dateof(now()), '', {'drama', 'terror'}, ['u1', 'u2', 'u4']);
INSERT INTO videos_autor( user, nome, upload, descricao, tags, seguidores) VALUES ('u9', 'G', dateof(now()), '', {'comédia'}, ['u10', 'u9', 'u8']);
INSERT INTO videos_autor( user, nome, upload, descricao, tags, seguidores) VALUES ('u7', 'H', dateof(now()), '', {'comédia', 'romance'}, ['u4', 'u5']);
INSERT INTO videos_autor( user, nome, upload, descricao, tags, seguidores) VALUES ('u3', 'I', dateof(now()), '', {'ação'}, ['u1', 'u4', 'u2']);
INSERT INTO videos_autor( user, nome, upload, descricao, tags, seguidores) VALUES ('u8', 'J', dateof(now()), '', {'comédia'}, ['u4']);
APPLY BATCH;

BEGIN BATCH
INSERT INTO comentarios_video(nome, user, data,comentario) VALUES ('A', 'u1', dateof(now()),'iewlufewbewlkwkzjuierrlufsjkgjksvk');
INSERT INTO comentarios_video(nome, user, data,comentario) VALUES ('B', 'u2', dateof(now()),'iewlufewbewlkwkzjuierrlufsjkgjksvk');
INSERT INTO comentarios_video(nome, user, data,comentario) VALUES ('D', 'u3', dateof(now()),'iewlufewbewlkwkzjuierrlufsjkgjksvk');
INSERT INTO comentarios_video(nome, user, data,comentario) VALUES ('E', 'u4', dateof(now()),'iewlufewbewlkwkzjuierrlufsjkgjksvk');
INSERT INTO comentarios_video(nome, user, data,comentario) VALUES ('F', 'u5', dateof(now()),'iewlufewbewlkwkzjuierrlufsjkgjksvk');
INSERT INTO comentarios_video(nome, user, data,comentario) VALUES ('A', 'u6', dateof(now()),'iewlufewbewlkwkzjuierrlufsjkgjksvk');
INSERT INTO comentarios_video(nome, user, data,comentario) VALUES ('F', 'u10', dateof(now()),'iewlufewbewlkwkzjuierrlufsjkgjksvk');
INSERT INTO comentarios_video(nome, user, data,comentario) VALUES ('E', 'u7', dateof(now()),'iewlufewbewlkwkzjuierrlufsjkgjksvk');
INSERT INTO comentarios_video(nome, user, data,comentario) VALUES ('B', 'u8', dateof(now()),'iewlufewbewlkwkzjuierrlufsjkgjksvk');
INSERT INTO comentarios_video(nome, user, data,comentario) VALUES ('D', 'u9', dateof(now()),'iewlufewbewlkwkzjuierrlufsjkgjksvk');
INSERT INTO comentarios_video(nome, user, data,comentario) VALUES ('D', 'u1', dateof(now()),'iewlufewbewlkwkzjuierrlufsjkgjksvk');

INSERT INTO comentarios_user(nome, user, data,comentario) VALUES ('A', 'u1', dateof(now()),'iewlufewbewlkwkzjuierrlufsjkgjksvk');
INSERT INTO comentarios_user(nome, user, data,comentario) VALUES ('B', 'u2', dateof(now()),'iewlufewbewlkwkzjuierrlufsjkgjksvk');
INSERT INTO comentarios_user(nome, user, data,comentario) VALUES ('D', 'u3', dateof(now()),'iewlufewbewlkwkzjuierrlufsjkgjksvk');
INSERT INTO comentarios_user(nome, user, data,comentario) VALUES ('E', 'u4', dateof(now()),'iewlufewbewlkwkzjuierrlufsjkgjksvk');
INSERT INTO comentarios_user(nome, user, data,comentario) VALUES ('F', 'u5', dateof(now()),'iewlufewbewlkwkzjuierrlufsjkgjksvk');
INSERT INTO comentarios_user(nome, user, data,comentario) VALUES ('A', 'u6', dateof(now()),'iewlufewbewlkwkzjuierrlufsjkgjksvk');
INSERT INTO comentarios_user(nome, user, data,comentario) VALUES ('F', 'u10', dateof(now()),'iewlufewbewlkwkzjuierrlufsjkgjksvk');
INSERT INTO comentarios_user(nome, user, data,comentario) VALUES ('E', 'u7', dateof(now()),'iewlufewbewlkwkzjuierrlufsjkgjksvk');
INSERT INTO comentarios_user(nome, user, data,comentario) VALUES ('B', 'u8', dateof(now()),'iewlufewbewlkwkzjuierrlufsjkgjksvk');
INSERT INTO comentarios_user(nome, user, data,comentario) VALUES ('D', 'u9', dateof(now()),'iewlufewbewlkwkzjuierrlufsjkgjksvk');
INSERT INTO comentarios_user(nome, user, data,comentario) VALUES ('D', 'u1', dateof(now()),'iewlufewbewlkwkzjuierrlufsjkgjksvk');
APPLY BATCH;

BEGIN BATCH
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

BEGIN BATCH
INSERT INTO ratings(nome, rating) VALUES ('A',3);
INSERT INTO ratings(nome, rating) VALUES ('B',4);
INSERT INTO ratings(nome, rating) VALUES ('C',2);
INSERT INTO ratings(nome, rating) VALUES ('D',4);
INSERT INTO ratings(nome, rating) VALUES ('A',3);
INSERT INTO ratings(nome, rating) VALUES ('B',1);
INSERT INTO ratings(nome, rating) VALUES ('C',2);
INSERT INTO ratings(nome, rating) VALUES ('D',5);
INSERT INTO ratings(nome, rating) VALUES ('E',4);
INSERT INTO ratings(nome, rating) VALUES ('E',3);
APPLY BATCH;

SELECT JSON * FROM comentarios_video;
SELECT JSON * FROM comentarios_user;
SELECT JSON * FROM eventos;
SELECT JSON * FROM ratings;
SELECT JSON * FROM users;
SELECT JSON * FROM videos_autor;
SELECT JSON * FROM videos_nome;

SELECT * FROM videos_nome WHERE nome = 'A' allow filtering ;
SELECT * FROM comentarios_user WHERE user = 'u6' ORDER BY data DESC;
SELECT * FROM comentarios_video WHERE nome = 'A' ORDER BY data DESC ;
SELECT nome, avg(rating), COUNT(nome) FROM ratings WHERE nome='A';