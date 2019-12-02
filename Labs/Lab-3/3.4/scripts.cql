create table if not exists categorias
(
    categoria text,
    livros    map<int, text>,
    primary key (categoria)
)
    with caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
        and compaction = {'max_threshold': '32', 'min_threshold': '4', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
        and compression = {'class': 'org.apache.cassandra.io.compress.LZ4Compressor', 'chunk_length_in_kb': '64'}
        and dclocal_read_repair_chance = 0.1;

create table if not exists funcionarios
(
    funcid  uuid,
    funcoes set<text>,
    nome    text,
    primary key (funcid)
)
    with caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
        and compaction = {'max_threshold': '32', 'min_threshold': '4', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
        and compression = {'class': 'org.apache.cassandra.io.compress.LZ4Compressor', 'chunk_length_in_kb': '64'}
        and dclocal_read_repair_chance = 0.1;

create index if not exists funcoesnome
    on funcionarios (values (funcoes));

create table if not exists livros
(
    isbn       text,
    ano        timestamp,
    autor      text,
    editora    text,
    quantidade int,
    titulo     text,
    primary key (isbn)
)
    with caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
        and compaction = {'max_threshold': '32', 'min_threshold': '4', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
        and compression = {'class': 'org.apache.cassandra.io.compress.LZ4Compressor', 'chunk_length_in_kb': '64'}
        and dclocal_read_repair_chance = 0.1;

create index if not exists livrosnomes
    on livros (titulo);

create table if not exists requitadosbyuser
(
    requerente uuid,
    livros     list<text>,
    primary key (requerente)
)
    with caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
        and compaction = {'max_threshold': '32', 'min_threshold': '4', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
        and compression = {'class': 'org.apache.cassandra.io.compress.LZ4Compressor', 'chunk_length_in_kb': '64'}
        and dclocal_read_repair_chance = 0.1;

create table if not exists utilizadores
(
    userid uuid,
    nome   text,
    primary key (userid)
)
    with caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
        and compaction = {'max_threshold': '32', 'min_threshold': '4', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
        and compression = {'class': 'org.apache.cassandra.io.compress.LZ4Compressor', 'chunk_length_in_kb': '64'}
        and dclocal_read_repair_chance = 0.1;   