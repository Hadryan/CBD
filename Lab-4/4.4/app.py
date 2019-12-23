from py2neo import Graph

graph = Graph(password="neo4j")

def query1():
    for i in graph.run("MATCH(ep:Episode) return ep"):
        print(i)

def query2():
    for i in graph.run('MATCH(ep:Episode)-[:APPEARED_IN]-(p:Character {name: "Viserys Targaryen"}) return ep'):
        print(i)

def query3():
    for i in graph.run('MATCH(p:Character)-[:PARENT_OF]-(p1:Character {name: "Viserys Targaryen"}) RETURN p as Parente'):
        print(i)

def query4():
    for i in graph.run('MATCH path=shortestPath((p:Character {name:"Lord of Bones"})-[*0..2]-(p1:Character)) WHERE p.name <> p1.name RETURN p1.name as Pessoas, p.name as Lord, length(path) as Comprimento'):
        print(i)

def query5():
    for i in graph.run('MATCH (p:Character)-[:APPEARED_IN]->(ep:Episode) WHERE ep.season = 1  RETURN p.name as Nome'):
        print(i)

def query6():
    for i in graph.run('MATCH path=shortestPath((p:Character {name:"Meera Reed"})-[*0..10]-(p1:Character {name:"Jojen Reed"})) RETURN path'):
        print(i)

def query7():
    for i in graph.run('MATCH path=allshortestPaths((p:Character {name:"Meera Reed"})-[*0..10]-(p1:Character {name:"Jojen Reed"})) RETURN path'):
        print(i)

def query8():
    for i in graph.run('MATCH (p:Character)-[:PARENT_OF {type: "biological father"}]-(p1:Character) return p.name as Pai, p1.name as Filho'):
        print(i)

def query9():
    for i in graph.run('MATCH (p:Character)-[:HAS_ALLEGIANCE_TO]-(h:House {name: "House Tyrell"}) RETURN p as Personagem'):
        print(i)

def query10():
    for i in graph.run('MATCH (p:Character)-[:APPEARED_IN]->() RETURN p.name as Nome, COUNT(*) as Número ORDER BY Número DESC'):
        print(i)

print("Query: Retornar todos os episódios de Game of Thrones")
query1()
print("\n")
print("\n")
print("\n")
print("Query: Retornar todos os episódios em que apareceu a personagem Viserys Targaryen")
query2()
print("\n")
print("\n")
print("\n")
print("Query: Retornar os parentes de Viserys Targaryen")
query3()
print("\n")
print("\n")
print("\n")
print("Query: Que pessoas têm uma distância 2 para Lord ofBones (a distância entre duas pessoas é o comprimento do caminho mais curto entre eles)")
query4()
print("\n")
print("\n")
print("\n")
print("Query: Todas as personagens que entraram na primeira temporada")
query5()
print("\n")
print("\n")
print("\n")
print("Query: Caminho mais curto entre Meera Reed e Jojen Reed")
query6()
print("\n")
print("\n")
print("\n")
print("Query: Todos os caminhos mais curtos entre Meera Reed e Jojen Reed")
query7()
print("\n")
print("\n")
print("\n")
print("Query: Determinar todos os pais biológicos")
query8()
print("\n")
print("\n")
print("\n")
print("Query: Todas as personagens com ligação à House Tyrell")
query9()
print("\n")
print("\n")
print("\n")
print("Query: Número de vezes que cada personagem apareceu de forma decrescente")
query10()