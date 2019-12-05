# Neo4j

Neo4j is a graph database management system developed by Neo4j, Inc. Described by its developers as an ACID-compliant transactional database with native graph storage and processing, Neo4j is the most popular graph database according to DB-Engines ranking, and the 22nd most popular database overall. 

## Setup
À semelhança dos outros guiões optei por uma instalação no docker.
```bash
$ docker pull neo4j
$ docker run \
    --publish=7474:7474 --publish=7687:7687 \
    --volume=$HOME/neo4j/data:/data \
    neo4j
```
Responsabilidades das portas:
* **7474** - Interface
* **7687** - Acesso aos dados