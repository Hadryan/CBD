create table comments_by_user
(
    user_id    int,
    comment_id int,
    done_at    timestamp,
    comment    text,
    video_id   int,
    primary key ((user_id, comment_id), done_at)
)
    with caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
     and compaction = {'max_threshold': '32', 'min_threshold': '4', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
     and compression = {'class': 'org.apache.cassandra.io.compress.LZ4Compressor', 'chunk_length_in_kb': '64'}
     and dclocal_read_repair_chance = 0.1;

INSERT INTO video_sharing.comments_by_user (user_id, comment_id, done_at, comment, video_id) VALUES (3, 8, '2019-11-21 09:47:23.000', 'egee', 6);
INSERT INTO video_sharing.comments_by_user (user_id, comment_id, done_at, comment, video_id) VALUES (2, 2, '2019-11-21 09:47:14.000', 'ererre', 1);
INSERT INTO video_sharing.comments_by_user (user_id, comment_id, done_at, comment, video_id) VALUES (5, 7, '2019-11-21 09:47:05.000', 'ewger', 4);
INSERT INTO video_sharing.comments_by_user (user_id, comment_id, done_at, comment, video_id) VALUES (2, 6, '2019-11-21 09:47:15.000', 'reer', 6);
INSERT INTO video_sharing.comments_by_user (user_id, comment_id, done_at, comment, video_id) VALUES (1, 5, '2019-11-21 09:47:10.000', 'ewfge', 5);
INSERT INTO video_sharing.comments_by_user (user_id, comment_id, done_at, comment, video_id) VALUES (1, 2, '2019-11-21 09:47:08.000', '2fwf3w', 2);
INSERT INTO video_sharing.comments_by_user (user_id, comment_id, done_at, comment, video_id) VALUES (1, 1, '2019-11-21 09:47:07.000', 'dsfsw', 1);
INSERT INTO video_sharing.comments_by_user (user_id, comment_id, done_at, comment, video_id) VALUES (1, 9, '2019-11-21 09:47:12.000', 'erg', 2);
INSERT INTO video_sharing.comments_by_user (user_id, comment_id, done_at, comment, video_id) VALUES (4, 4, '2019-11-21 09:47:17.000', 'ege', 4);
INSERT INTO video_sharing.comments_by_user (user_id, comment_id, done_at, comment, video_id) VALUES (3, 1, '2019-11-21 09:47:21.000', 'srfr', 3);