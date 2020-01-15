# Redis

O Redis é um armazenamento de estrutura de dados em memória (open-source licenciado pela BSD), usado como base de dados, cache e message broker. Suporta estruturas de dados como strings, hashes, listas, sets, sorted sets com consultas de intervalo, bitmaps, hiperloglogs, índices geoespaciais com consultas e fluxos de raio. O Redis possui replicação integrada, script Lua, despejo de LRU, transações e diferentes níveis de persistência em disco, e fornece alta disponibilidade via Redis Sentinel e particionamento automático com Redis Cluster.

## Setup
```shell
$ docker pull redis
$ docker run --name some-redis -d redis redis-server --appendonly yes
```

## Inserção de dados
cat initials4redis.txt | redis-cli
