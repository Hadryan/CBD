# Sistema de mensagens

Criação de um sistema de mensagens utilizando uma base de dado Redis e toda a comunicação usando o driver de Redis para python.

## Setup
Tal como aconteceu nos outros exerícios foi necessário instalar o driver de Redis para python. Como já o tinha instalado utilizei a mesma intalação dos exercícios anteriores. Para instalar o driver utilizei o script que se encontra no diretório root.
```bash
python3 -m venv venv &&
source venv/bin/activate &&
pip install -r requirements.txt
```
Nota: O script foi criado para a versão `18.04.1` do Ubuntu.

## Funções básicas
Numa primeira implemntação foram criadas as funções básicas pedidas.
* Adição de utilizadores (identificados pelo nome)
* Associação entre utilizadores (e.g. se userA segue userB, então userA deve ter informação sobre todas as mensagens enviadas por userB para o sistema).
* Envio de mensagens
* Leitura de mensagens

É relevante apontar que todos os `conn` que se encontram nos exemplos de código abaixo são a comunicação entre o sistema criado em python e o Redis (driver).
```python
import redis
conn = redis.Redis()
``` 
### Adição de utilizadores
Para este efeito foi criado um `hash set` que nos permite guardar o email do utilizador e o nome. O email poderá ser reaproveitado para desenvolver as restantes features.
Para a adição de utilizadores decidi criar uma função que, numa página web seria o equivalente ao sign in, em que o user introduz o seu nome, password e email.
```python
def regist(email, password, name):
    if conn.get(email) is not None:
        return "Already on db"
    else:
        conn.set(email, password)
        conn.hset("UserList:" + email, "name", name)
        return "Success"
```
Derivado disto era, assim, necessário criar um sistema de login que deixasse os utilizadores aceder à plataforma.
#### Acessos à plataforma
Foi criado uma área de login que, não é de todo segura, uma vez que o conteúdo não se encontra encriptado, mas para o efeito que era necessário para este sistema, o login é apenas de título demonstrativo.
```python
def logIn(email, password):
    try:
        if str(conn.get(email), "utf-8") == password:
            return "Success"
        else:
            return "Invalid Credentials"
    except:
        return "Invalid Credentials"
```
Tal como em qualquer sistema de login o utilizador tem de inserir a password e o seu email e garantir que ambos se relacionam na base de dados.

### Associação de utilizadores
Para os utilizadores poderem ver mensagens tinham de estar associados, só assim é que podem ver as mensagens uns dos outros. Deste modo foi criada uma forma de gestão seguidores. Esta gestão é efetuada no ficheiro `follow.py`.

#### Possíveis candidatos a serem seguidos
Numa primeira fase temos de fornecer ao utilizador todos os possíveis candidatos que ele pode seguir. Resalvo que o utilizador não se pode seguir a ele próprio nem seguir pessoas que já segue, deste modo, quando fazemos o display desta informação temos que garantir que o utilizador não se vê a ele próprio nem que veja pessoas que já segue.
```python
def getForFollow(uemail):
    lfollowing = []
    retList = []
    print("Emails to follow: ")
    for i in conn.smembers("MyFollowList:" + uemail):
        lfollowing.append(str(i, "utf-8"))
    for i in conn.keys("UserList:*"):
        if(str(i, "utf-8")[9:] != uemail):
            if str(i, "utf-8")[9:] not in lfollowing:
                retList.append(str(i, "utf-8")[9:])
                print(str(i, "utf-8")[9:])
    return retList
```
#### Adicionar pessoas para seguir
Depois de ser feito o display de toda a informação, cabe ao utilizador associar quem ele quer adicionar, para isto foi criada uma função que realiza um insert na base de dados, é de notar que devemos ter em que o utilizador não se pode adicionar a ele próprio nem adiconar quem já segue, deste modo surge:
```python
def follow(uemail, email, retList):
    if ( email == uemail):
        return "It's not possible follow yourself"
    else:
        if email not in retList:
            return "Unable to add person to follow"
        else:
            conn.sadd("MyFollowList:" + uemail, email)
            return "Success"
```
#### Pessoas que utilizador segue
Tendo em conta que podemos seguir é imperativo podermos ver quem seguimos, assim, surge que temos de procurar na base de dados pelos mesmos.
```python
def following(uemail):
    lfollowing = []
    print("My Following List:")
    for i in conn.smembers("MyFollowList:" + uemail):
        print(str(i, "utf-8"))
        lfollowing.append(str(i, "utf-8"))
    print()
    return lfollowing
```
#### Remover pessoas que segue
Da mesma forma que podemos adicionar e visualizar quem seguimos é de extra utilidade poder remover os mesmos, assim, simplesmente vamos à Follow List e removemos a pessoa que queremos.
```python
def unfollow(uemail,email, retList):
    if email not in retList:
        return email + "it's not into your following list"
    else:
        conn.srem("MyFollowList:" + uemail, email)
        return "Success"
```