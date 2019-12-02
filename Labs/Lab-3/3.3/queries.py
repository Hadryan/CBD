from cassandra.cluster import Cluster

cluster = Cluster(['localhost'])  # Connect to our Cassandra Server Cluster
session = cluster.connect('videos')  # Connect to our Keyspace

def query1():
    nome = input("Nome: ")
    query = session.execute("SELECT seguidores FROM videos_nome WHERE nome = '" + nome + "' ALLOW FILTERING;")
    for i in query:
        print(i)

def query2():
    user = input("Utilizador: ")
    query = session.execute("SELECT * FROM comentarios_user WHERE user ='" + user + "' ORDER BY data DESC;")
    for i in query:
        print(i)

def query3():
    nome = input("Nome: ")
    query = session.execute("SELECT nome, avg(rating), COUNT(nome) FROM ratings WHERE nome = '" + nome + "'")
    for i in query:
        print(i)

def query4():
    user = input("User: ")
    upload_init = input("Upload: ")
    upload_end = input("Upload: ")

    query = session.execute("SELECT *\
    FROM videos_autor\
    WHERE user = '"+ user + "'\
    AND upload > '"+ upload_init + "'\
    AND upload <= '"+ upload_end + "';")

    for i in query:
        print(i)


if __name__ == "__main__":
    query1()
    query2()
    query3()
    query4()
