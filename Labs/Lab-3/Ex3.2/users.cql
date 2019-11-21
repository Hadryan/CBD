create table users
(
    user_id      int primary key,
    created_date timestamp,
    email        text,
    nome         text,
    username     text
)
    with caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
     and compaction = {'max_threshold': '32', 'min_threshold': '4', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
     and compression = {'class': 'org.apache.cassandra.io.compress.LZ4Compressor', 'chunk_length_in_kb': '64'}
     and dclocal_read_repair_chance = 0.1;

INSERT INTO video_sharing.users (user_id, created_date, email, nome, username) VALUES (5, '2019-11-21 09:54:03.000', 'a05@ua.pt', 'Tavares', 'a05');
INSERT INTO video_sharing.users (user_id, created_date, email, nome, username) VALUES (10, '2019-11-21 09:54:12.000', 'a10@ua.pt', 'Joaquina', 'a10');
INSERT INTO video_sharing.users (user_id, created_date, email, nome, username) VALUES (1, '2019-11-21 09:53:55.000', 'a01@ua.pt', 'Rui', 'a01');
INSERT INTO video_sharing.users (user_id, created_date, email, nome, username) VALUES (8, '2019-11-21 09:54:09.000', 'a08@ua.pt', 'António', 'a08');
INSERT INTO video_sharing.users (user_id, created_date, email, nome, username) VALUES (2, '2019-11-21 09:53:57.000', 'a02@ua.pt', 'Miguel', 'a02');
INSERT INTO video_sharing.users (user_id, created_date, email, nome, username) VALUES (4, '2019-11-21 09:54:02.000', 'a04@ua.pt', 'Coelho', 'a04');
INSERT INTO video_sharing.users (user_id, created_date, email, nome, username) VALUES (7, '2019-11-21 09:54:07.000', 'a07@ua.pt', 'José', 'a07');
INSERT INTO video_sharing.users (user_id, created_date, email, nome, username) VALUES (6, '2019-11-21 09:54:05.000', 'a06@ua.pt', 'Carlos', 'a06');
INSERT INTO video_sharing.users (user_id, created_date, email, nome, username) VALUES (9, '2019-11-21 09:54:10.000', 'a09@ua.pt', 'Joaquim', 'a09');
INSERT INTO video_sharing.users (user_id, created_date, email, nome, username) VALUES (3, '2019-11-21 09:54:00.000', 'a03@ua.pt', 'Oliveira', 'a03');