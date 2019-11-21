create table comments_by_video
(
    video_id   int,
    comment_id int,
    done_at    timestamp,
    comment    text,
    user_id    int,
    primary key ((video_id, comment_id), done_at)
)
    with caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
     and compaction = {'max_threshold': '32', 'min_threshold': '4', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
     and compression = {'class': 'org.apache.cassandra.io.compress.LZ4Compressor', 'chunk_length_in_kb': '64'}
     and dclocal_read_repair_chance = 0.1;

INSERT INTO video_sharing.comments_by_video (video_id, comment_id, done_at, comment, user_id) VALUES (4, 1, '2019-11-21 09:43:09.000', 'ewgwe', 6);
INSERT INTO video_sharing.comments_by_video (video_id, comment_id, done_at, comment, user_id) VALUES (2, 2, '2019-11-21 09:43:04.000', 'ewaf', 3);
INSERT INTO video_sharing.comments_by_video (video_id, comment_id, done_at, comment, user_id) VALUES (5, 1, '2019-11-21 09:43:13.000', 'wegfew', 8);
INSERT INTO video_sharing.comments_by_video (video_id, comment_id, done_at, comment, user_id) VALUES (6, 1, '2019-11-21 09:43:15.000', 'ewgersgheswew', 9);
INSERT INTO video_sharing.comments_by_video (video_id, comment_id, done_at, comment, user_id) VALUES (2, 1, '2019-11-21 09:43:01.000', 'agrewa', 3);
INSERT INTO video_sharing.comments_by_video (video_id, comment_id, done_at, comment, user_id) VALUES (2, 3, '2019-11-21 09:43:06.000', 'wegfewº', 4);
INSERT INTO video_sharing.comments_by_video (video_id, comment_id, done_at, comment, user_id) VALUES (4, 2, '2019-11-21 09:43:11.000', 'wegfewº', 7);
INSERT INTO video_sharing.comments_by_video (video_id, comment_id, done_at, comment, user_id) VALUES (1, 2, '2019-11-21 09:42:59.000', 'weagwe', 2);
INSERT INTO video_sharing.comments_by_video (video_id, comment_id, done_at, comment, user_id) VALUES (1, 1, '2019-11-21 09:42:56.000', 'ewgersghes', 1);
INSERT INTO video_sharing.comments_by_video (video_id, comment_id, done_at, comment, user_id) VALUES (3, 1, '2019-11-21 09:43:08.000', 'ewgersgheswe', 5);