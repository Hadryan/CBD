create table users
(
    user_id      int,
    email        text,
    created_date timestamp,
    nome         text,
    username     text,
    primary key (user_id, email)
)
    with caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
     and compaction = {'max_threshold': '32', 'min_threshold': '4', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
     and compression = {'class': 'org.apache.cassandra.io.compress.LZ4Compressor', 'chunk_length_in_kb': '64'}
     and dclocal_read_repair_chance = 0.1;

INSERT INTO video_sharing.users (user_id, email, created_date, nome, username) VALUES (5, 'a05@ua.pt', '2019-11-21 09:54:03.000', 'Tavares', 'a05');
INSERT INTO video_sharing.users (user_id, email, created_date, nome, username) VALUES (10, 'a10@ua.pt', '2019-11-21 09:54:12.000', 'Joaquina', 'a10');
INSERT INTO video_sharing.users (user_id, email, created_date, nome, username) VALUES (1, 'a01@ua.pt', '2019-11-21 09:53:55.000', 'Rui', 'a01');
INSERT INTO video_sharing.users (user_id, email, created_date, nome, username) VALUES (8, 'a08@ua.pt', '2019-11-21 09:54:09.000', 'António', 'a08');
INSERT INTO video_sharing.users (user_id, email, created_date, nome, username) VALUES (2, 'a02@ua.pt', '2019-11-21 09:53:57.000', 'Miguel', 'a02');
INSERT INTO video_sharing.users (user_id, email, created_date, nome, username) VALUES (4, 'a04@ua.pt', '2019-11-21 09:54:02.000', 'Coelho', 'a04');
INSERT INTO video_sharing.users (user_id, email, created_date, nome, username) VALUES (7, 'a07@ua.pt', '2019-11-21 09:54:07.000', 'José', 'a07');
INSERT INTO video_sharing.users (user_id, email, created_date, nome, username) VALUES (6, 'a06@ua.pt', '2019-11-21 09:54:05.000', 'Carlos', 'a06');
INSERT INTO video_sharing.users (user_id, email, created_date, nome, username) VALUES (9, 'a09@ua.pt', '2019-11-21 09:54:10.000', 'Joaquim', 'a09');
INSERT INTO video_sharing.users (user_id, email, created_date, nome, username) VALUES (3, 'a03@ua.pt', '2019-11-21 09:54:00.000', 'Oliveira', 'a03');