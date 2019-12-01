create table if not exists comentarios_user
(
    user       text,
    data       timestamp,
    comentario text,
    nome       text,
    primary key (user, data)
)
    with caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
        and compaction = {'max_threshold': '32', 'min_threshold': '4', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
        and compression = {'class': 'org.apache.cassandra.io.compress.LZ4Compressor', 'chunk_length_in_kb': '64'}
        and dclocal_read_repair_chance = 0.1;

create table if not exists comentarios_video
(
    nome       text,
    data       timestamp,
    comentario text,
    user       text,
    primary key (nome, data)
)
    with caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
        and compaction = {'max_threshold': '32', 'min_threshold': '4', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
        and compression = {'class': 'org.apache.cassandra.io.compress.LZ4Compressor', 'chunk_length_in_kb': '64'}
        and dclocal_read_repair_chance = 0.1;

create table if not exists eventos
(
    user        text,
    nome        text,
    ocorrencia  timestamp,
    tempo_video int,
    tipo        text,
    primary key (user, nome, ocorrencia)
)
    with caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
        and compaction = {'max_threshold': '32', 'min_threshold': '4', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
        and compression = {'class': 'org.apache.cassandra.io.compress.LZ4Compressor', 'chunk_length_in_kb': '64'}
        and dclocal_read_repair_chance = 0.1;

create table if not exists ratings
(
    nome   text,
    rating int,
    primary key (nome, rating)
)
    with caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
        and compaction = {'max_threshold': '32', 'min_threshold': '4', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
        and compression = {'class': 'org.apache.cassandra.io.compress.LZ4Compressor', 'chunk_length_in_kb': '64'}
        and dclocal_read_repair_chance = 0.1;

create table if not exists users
(
    username text,
    nome     text,
    email    text,
    registo  timestamp,
    primary key (username, nome)
)
    with caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
        and compaction = {'max_threshold': '32', 'min_threshold': '4', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
        and compression = {'class': 'org.apache.cassandra.io.compress.LZ4Compressor', 'chunk_length_in_kb': '64'}
        and dclocal_read_repair_chance = 0.1;

create table if not exists videos_autor
(
    user       text,
    upload     timestamp,
    descricao  text,
    nome       text,
    seguidores list<text>,
    tags       set<text>,
    primary key (user, upload)
)
    with caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
        and compaction = {'max_threshold': '32', 'min_threshold': '4', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
        and compression = {'class': 'org.apache.cassandra.io.compress.LZ4Compressor', 'chunk_length_in_kb': '64'}
        and dclocal_read_repair_chance = 0.1;

create table if not exists videos_nome
(
    user       text,
    nome       text,
    upload     timestamp,
    descricao  text,
    seguidores list<text>,
    tags       set<text>,
    primary key (user, nome, upload)
)
    with caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
        and compaction = {'max_threshold': '32', 'min_threshold': '4', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
        and compression = {'class': 'org.apache.cassandra.io.compress.LZ4Compressor', 'chunk_length_in_kb': '64'}
        and dclocal_read_repair_chance = 0.1;