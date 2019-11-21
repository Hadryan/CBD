DROP KEYSPACE IF EXISTS video_sharing;

CREATE KEYSPACE video_sharing
WITH replication = {'class':'SimpleStrategy', 'replication_factor' : 3};

USE video_sharing;

-- Alínea 1)
CREATE TABLE user_credentials (
    username text,
    nome text,
    email text,
    selo timestamp,
    PRIMARY KEY (email)
);

-- Alínea 2)
CREATE TABLE gestao_videos(
    video_id int,
    autor text,
    video_name text,
    descricao text,
    tag set<varchar>,
    upload_time timestamp,
    primary key (video_id)
);

-- Alínea 3)
CREATE TABLE comentarios(
    coment_id int,
    comentario text,
    done_at timestamp,
    autor text,
    video_id int,
    PRIMARY KEY (coment_id)
);

-- Alínea 4)
CREATE TABLE video_followers(
    video_id int,
    utilizadores set<varchar>,
    PRIMARY KEY ( video_id )
);

-- Alínea 5)
CREATE TABLE registo_eventos(
    video_id int,
    user text,
    evento text,
    inicio timestamp,
    ocorrencia timestamp,
    primary key (video_id, user)
);

-- Alínea 6)
CREATE TABLE rating(
    video_id int,
    valores list<int>,
    primary key (video_id)
);