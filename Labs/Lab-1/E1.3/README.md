# Redis - Acesso Programático

Este exercício visa a ligação entre a base de dados Redis e a linguagem de programação a usar por meio de um driver definido para a mesma.

# Setup
Uma vez que este exercício visa a ligação entre a linguagem de programação e a base de dados, para isso temos de fazer a instalação do driver do Redis para python.
O script de instalação do mesmo para `Ubuntu 18.04.1` está no diretório root.
```bash
python3 -m venv venv &&
source venv/bin/activate &&
pip install -r requirements.txt
```
Uma vez instalado temos apenas que conectar o driver no nosso ficheiro python, para isso fazemos:
```python
import redis

conn = redis.Redis()
```
Podemos neste momento começar os nossos acessos programáticos.
## Parte 1 - Inserção via lista
Dado que que queremos inserir uma lista, podemos apenas usar o `rpush` e inserir os dados associados a uma tag, no caso, `listOfUsers`.
Para usarmos o rpush de uma lista apenas temos que criar a lista, neste caso, chama-se `data`, para efeitos de ser mais organizado decidi fazer **sort** da lista antes de inserir a mesma, assim, usando o `rpush` teremos a lista inserida de forma ordenada.
Assim, deste modo, iteramos sobre a lista e adicionamos os valores na base de dados.
```python
def insertData():
	data = ["Ana", "Pedro", "Maria", "Luís"]
	data.sort()

	for i in data:
		conn.rpush("listOfUsers", i)

```
Para visualizar os dados inseridos podemos recorrer ao `lrange` que nos vai retornar uma lista.
Após isso temos apenas que iterar sobre a lista e imprimir o nome.
```python
def ifEnabled():
	db_table = conn.lrange("listOfUsers", 0, -1)
	for i in db_table:
		print(str(i, "utf-8"))
```
Saliento que coloquei o script a aceitar dois parâmetros de entrada isto é:
* `--f` permite que seja feito o flush à base de dados, por default está desativado, para ativar basta passar como argumento `python insertList.py --f 1`
* `--p` permite que a query de consulta não seja efetuada, por default está ativa mas podemos desativar passando como argumento `python insertList.py --p 0`
```python
if __name__ == "__main__":
	parser = argparse.ArgumentParser()
	parser.add_argument("--p", help="Enable printing the result of the insertion query. 0 - Disable, 1 - Enable", default="1")
	parser.add_argument("--f", help="Clean database. 0 - Disable, 1 - Enable", default="0")
	args = parser.parse_args()
	ENABLE = args.p
	FLUSH = args.f
	if (FLUSH == "1"):
		conn.flushdb()
	insertData()
	if (ENABLE == "1"):
		ifEnabled()
```
## Parte 2 - Inserção via hashmap
Para a inserção num hash map precisamos de criar uma estrutura em python que é um dicionário (similar ao comum json) e podemos inserir diretamente usando o `hmset` que associado a a chave do dicionário à key do Redis e o valor do dicionário ao valor do Redis. Apenas temos de definir uma tag a que queremos associar isso, no caso, `Users`.
```python
def insertData():
	data = {"Ana": "Braga", "Pedro": "Amarante", "Maria": "Costa Nova", "Luís": "Barra"}
	conn.hmset("Users", data)
```
No que diz respeito à query de pesquisa nesta temps de iterar sobre os valores e as chaves de modo a apresentarmos a informação de forma coerente. Para isso usamos o `hgetall` fornecendo a tag que queremos e ele vai retornar um dicionário com todas as ocorrências dessa tag. Após isso temos de iterar sobre as chaves e valores do mesmo.
```python
def ifEnabled():
	db_table = conn.hgetall("Users")

	for k, v in db_table.items():
		print(str(k, "utf-8") +", " + str(v, "utf-8"))
```