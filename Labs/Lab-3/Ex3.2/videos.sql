create table comments_by_user
(
    user_id    int,
    comment_id int,
    comment    text,
    video_id   int,
    primary key (user_id, comment_id)
)
    with caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
     and compaction = {'max_threshold': '32', 'min_threshold': '4', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
     and compression = {'class': 'org.apache.cassandra.io.compress.LZ4Compressor', 'chunk_length_in_kb': '64'}
     and dclocal_read_repair_chance = 0.1;

INSERT INTO video_sharing.comments_by_user (user_id, comment_id, comment, video_id) VALUES (5, 7, 'ewger', 4);
INSERT INTO video_sharing.comments_by_user (user_id, comment_id, comment, video_id) VALUES (1, 1, 'dsfsw', 1);
INSERT INTO video_sharing.comments_by_user (user_id, comment_id, comment, video_id) VALUES (1, 2, '2fwf3w', 2);
INSERT INTO video_sharing.comments_by_user (user_id, comment_id, comment, video_id) VALUES (1, 5, 'ewfge', 5);
INSERT INTO video_sharing.comments_by_user (user_id, comment_id, comment, video_id) VALUES (1, 9, 'erg', 2);
INSERT INTO video_sharing.comments_by_user (user_id, comment_id, comment, video_id) VALUES (2, 2, 'ererre', 1);
INSERT INTO video_sharing.comments_by_user (user_id, comment_id, comment, video_id) VALUES (2, 6, 'reer', 6);
INSERT INTO video_sharing.comments_by_user (user_id, comment_id, comment, video_id) VALUES (4, 4, 'ege', 4);
INSERT INTO video_sharing.comments_by_user (user_id, comment_id, comment, video_id) VALUES (3, 1, 'srfr', 3);
INSERT INTO video_sharing.comments_by_user (user_id, comment_id, comment, video_id) VALUES (3, 8, 'egee', 6);