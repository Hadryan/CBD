from cassandra.cluster import Cluster

cluster = Cluster(['localhost'])  # Connect to our Cassandra Server Cluster
session = cluster.connect('demo')  # Connect to our Keyspace

MENU = "3 - Pesquisar\n2 - Update\n1 - Inserir\n0 - Sair"

def inserir():
    rua = input("Rua: ")
    numero = input("Numero: ")
    codigo_postal = input("Código Postal: ")
    localidade = input("Localidade: ")
    session.execute("INSERT INTO casas(rua, numero, codigo_postal, localidade) VALUES ('" + rua + "'," + numero + ",'" + codigo_postal +"','" + localidade + "')")

def update():
    rua_atual = input("Rua: ")
    numero_atual = input("Numero: ")
    codigo_postal = input("Código postal: ")

    localidade = input("Nova localidade: ")
    
    session.execute("UPDATE casas SET localidade = '" + localidade + "' WHERE numero = " + numero_atual + " AND rua='" + rua_atual+"' AND codigo_postal ='" + codigo_postal + "'")


def pesquisar():
    menu = "3 - Localidade\n2 - Rua\n1 - Código postal"
    print(menu)
    opt = int(input("Select an option: "))
    if (opt == 1):
        val = input("Código postal: ")
        for i in session.execute("SELECT * FROM casas WHERE codigo_postal='" + val + "' allow filtering"):
            print(i[0] + ', nº ' + str(i[1]) +', ' + i[2] + ', ' + i[3])
        return
    if (opt == 2):
        val = input("Rua: ")
        for i in session.execute("SELECT * FROM casas WHERE rua='" + val + "' allow filtering"):
            print(i[0] + ', nº ' + str(i[1]) +', ' + i[2] + ', ' + i[3])
        return
    if (opt == 3):
        val = input("Localidade: ")
        for i in session.execute("SELECT * FROM casas WHERE localidade='" + val + "' allow filtering"):
            print(i[0] + ', nº ' + str(i[1]) +', ' + i[2] + ', ' + i[3])
        return
    else:
        return

if __name__ == "__main__":
    print(MENU)
    inp = int(input("Select an option: "))
    while True:
        if (inp == 0):
            exit()
        if (inp == 1):
            inserir()
            print(MENU)
            inp = int(input("Select an option: "))
        if (inp == 2):
            update()
            print(MENU)
            inp = int(input("Select an option: "))
        if (inp == 3):
            pesquisar()
            print(MENU)
            inp = int(input("Select an option: "))
        else:
            print("Operação inválida")
            print(MENU)
            inp = int(input("Select an option: "))