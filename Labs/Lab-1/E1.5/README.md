# Sistema de mensagens

Criação de um sistema de mensagens utilizando uma base de dado Redis e toda a comunicação usando o driver de Redis para python.

## Setup
Tal como aconteceu nos outros exercícios foi necessário instalar o driver de Redis para python. Como já o tinha instalado utilizei a mesma instalação dos exercícios anteriores. Para instalar o driver utilizei o script que se encontra no diretório root.
```bash
python3 -m venv venv &&
source venv/bin/activate &&
pip install -r requirements.txt
```
Nota: O script foi criado para a versão `18.04.1` do Ubuntu.

## Funções básicas
Numa primeira implementação foram criadas as funções básicas pedidas.
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
Numa primeira fase temos de fornecer ao utilizador todos os possíveis candidatos que ele pode seguir. Ressalvo que o utilizador não se pode seguir a ele próprio nem seguir pessoas que já segue, deste modo, quando fazemos o display desta informação temos que garantir que o utilizador não se vê a ele próprio nem que veja pessoas que já segue.
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
Depois de ser feito o display de toda a informação, cabe ao utilizador associar quem ele quer adicionar, para isto foi criada uma função que realiza um insert na base de dados, é de notar que devemos ter em que o utilizador não se pode adicionar a ele próprio nem adicionar quem já segue, deste modo surge:
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

### Mensagens
Uma vez estabelecidos os princípios de como as pessoas podem comunicar, é necessário fornecer meios para enviar mensagens. Para isso foi criado o ficheiro `messages.py` que conta com 3 funções, uma para enviar mensagens e outra para listar as mesmas.

#### Enviar mensagens
Optei por aquela que me pareceu ser a solução mais simples, usar o right push para mensagens, a utilização deste permite que seja mais simples listar as mensagens posteriormente.
```python
def sendMessage(uemail, message):
    conn.rpush("Messages:" + uemail, message)
    print("Message sent")
    print()
```
#### Listar as minhas mensagens
Dado que apenas doi utilizado o right push para inserir as mensagens é fácil agora de obter as mensagens que o próprio enviou. Usamos o `lrange` e listamos as mensagens associadas ao email do utilizador.
```python
def listMyMessages(uemail):
    counter = 1
    print("List of my messages: ")
    for i in conn.lrange("Messages:" + uemail, 0, -1):
        print("Message " + str(counter) + "\t" +  str(i, "utf-8"))
        counter += 1
    print()
```
#### Listar mensagens das pessoas que segue
Para listar as mensagens das pessoas que segue o processo é bastante similar, apenas temos que ter atenção em não mostrar as mensagens de toda a gente e as mensagens do utilizador, deste modo, fazemos uma chamada à função `followingquiet` que se encontra no ficheiro `follow.py` e obtemos a lista de pessoa que o utilizador segue.
```python
def followingquiet(uemail):
    lfollowing = []
    for i in conn.smembers("MyFollowList:" + uemail):
        lfollowing.append(str(i, "utf-8"))
    return lfollowing
```
Retornada a lista de pessoas que o utilizador segue temos apenas trabalhar sobre a mesma, isto é, iteramos sobre ela de modo a obtermos as mensagens das pessoas que utilizador segue. É de notar que se o utilizador não seguir ninguém é desnecessário iterar sobre a lista, apenas retornamos uma mensagem de erro e voltamos para o menu.
```python
def listMessageSubs(uemail):
    print("Messages from people I follow: ")
    lista = followingquiet(uemail)
    if len(lista) <= 0:
        print("No messages - Following 0 persons")
        print()
        return False
    for i in lista:
        for f in conn.lrange("Messages:" + i, 0, -1):
            print("Message from: " + i + "\t\t" + str(f, "utf-8"))
    print()
```
### Extras
Uma vez criado o corpo básico do exercício tinham de ser desenvolvidas algumas funções extra (mesmo já tendo desenvolvido algumas como o login).
Deste modo implementei vários tipos de pesquisas que podem ser encontrados no `search.py`. As pesquisas definidas são:
* Mensagens associadas a um email
* Pesquisa pelo conteúdo de uma mensagem
* Encontrar todos as pessoas que seguem o utilizador

#### Mensagens associadas a um email
Para a pesquisa de de mensagens associadas a um certo email temos de ter em atenção os requisitos do sistema, o utilizador apenas pode visualizar mensagens de pessoas que segue, deste modo:
* **Se** o utilizador **não** seguir ninguém não pode ver mensagens, podemos apenas apresentar isso e não existe necessidade de correr o resto do código, redirecionamos o utilizador logo para o menu.
* **Se** o utilizador **pesquisar** por um utilizador que **não** segue não deverá conseguir ver as mensagens devendo ser apresentado um erro a informar isto e, enviar o mesmo para o menu.
* **Se** nenhum destes erros se verificar podemos então iterar sobre a lista de emails que obtemos através da função `following(uemail)` que se encontra no `follow.py`. Após a iteração apresentamos os resultados ao utilizador.
```python
def searchByEmail(uemail):
    lista = following(uemail)
    if len(lista) <= 0:
        print("You're following 0 persons")
        print()
        return False
    email = input("Email to search: ")
    if email not in lista:
        print("You're not following this person")
        print()
        return False
    else:
        for i in conn.lrange("Messages:" + email, 0, -1):
            print("Message from: " + email + "\t\t" + str(i, "utf-8"))
        print()
        return True
```
#### Pesquisa pelo conteúdo da mensagem
A pesquisa pelo conteúdo da mensagem é algo similar à pesquisa de mensagens por email. Temos de obedecer a praticamente os mesmos requisitos.
Sendo um sistema de pesquisa de conteúdo nas mensagens achei, por bem, que a pesquisa **não** devia ser case sensitive, deste modo, optei por pesquisar tudo em maiúsculas, isto é, o input inserido pelo utilizador é convertido para maiúsculas utilizando a função `upper()` do python bem como o que é retornado pelas queries deve ser passado por essa função.
Assim temos como requisitos do sistema:
* **Se** o utilizador **não** seguir ninguém não pode ver mensagens, podemos apenas apresentar isso e não existe necessidade de correr o resto do código, redirecionamos o utilizador logo para o menu.
* A pesquisa não deve ser case sensitive

Se os requisitos forem verificados, podemos assim iterar sobre o lista de emails que o utilizador segue, retornada pela função `followingquiet(uemail)` fo ficheiro `follow.py`. Aṕos iterado retornamos os resultados e apresentamos ao utilizador.
```python
def searchByContent(uemail):
    lista = followingquiet(uemail)
    if len(lista) <= 0:
        print("No messages - Following 0 persons")
        print()
        return False
    content = input("Message to search: ")
    for i in lista:
        for f in conn.lrange("Messages:" + i, 0, -1):
            if content.upper() in str(f, "utf-8").upper():
                print("Message from: " + i + "\t\t" + str(f, "utf-8"))
    print()
    return True
```
#### Encontrar todos as pessoas que seguem o utilizador
Para obter a lista de pessoas que segue o utilizador apenas temos que ir aos membros da `MyFollowList` e verificar para qual utilizador que consta nela, ocorre nos seus valores a variável `uemail` que é representativa do email do utilizador que está a usar o sistema de mensagens.
```python
def searchMyFollowers(uemail):
    allUsers = getallUsers() 
    flag = False
    for i in allUsers:
        for f in conn.smembers("MyFollowList:" + i):
            if str(f, "utf-8") == uemail:
                if not flag:
                    print("Followed by: ")
                    print(i)
                    flag = True
                else:
                    print(i)
    print()
```
Deste modo surge a necessidade de de obter uma lista de todos os utilizadores do sistema que se registaram.
Com esse efeito foi criada uma função auxiliar chamada `getallUsers()` que nos permite retornar à função `searchMyFollowers(uemail)` uma lista com todos os utilizadores do sistema de modo a que esta possa iterar sobre ela e encontrar quem segue o utilizador com o login efetuado.
```python
def getallUsers():
    lista = []
    for i in conn.keys("UserList:*" ):
        lista.append(str(i, "utf-8")[9:])
    return lista
```