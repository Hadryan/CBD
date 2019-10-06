# Autocomplete
Criação de um autocomplete não no sentido lato, isto é, quando pesquisamos por alguma coisa temos de carregar o enter e ele complete o que nós escrevemos enquanto que um autocomplete no sentido lato não seria necessário carregar no mesmo.

## Parte 1
Numa primeira fase é nos pedido que seja criado um auto complete que nos permite pesquisar sobre a informação contida no ficheiro `female-names.txt` esta informação não se encontra local, isto é, no ficheiro mas sim na base de dados Redis.
Deste modo temos que fazer o setup do autocomplete.
### Setup
Para fazer setup do autocompelte temos de ter o driver do redis instalado, o script de instalação para o `Ubuntu 18.04.1` encontra-se no diretório root (`setup.sh`).
```bash
python3 -m venv venv &&
source venv/bin/activate &&
pip install -r requirements.txt
```
Uma vez instalado apenas precisamos de estabelecer a conexão entre o nosso ficheiro python e a base de dados, desse modo utilizamos o driver de redis para python
```python
import redis

conn = redis.Redis()
```
Após tudo instalado e configurado temos apenas que abrir o ficheiro para leitura, podemos usar a função `open()` do python para esse efeito, lemos linha a linha e adicionamos a informação pretendida na base de dados, para isso usamos `conn.zadd(tag, content)`.
Assim iremos associar toda a informação que queremos à tag, neste caso em específico à tag `autocomplete`.
```python
def insertData():
	f = open('female-names.txt',"r")
	for line in f:
		conn.zadd('autocomplete', {line.strip():0})
```
Saliento que por cima do script base tanto nesta versão como na segunda deste exercício podemos habilitar e desabilitar a função de flusb pela linha de comandos, ou seja:
* `--f` permite que seja realizada a operação de flush sobre a base de dados apagando toda a informação que reside na mesma, por default está desabilitada, para a corrermos temos apenas que fazer `python ac_setup.py --f 1`

### Trabalhar sobre os dados
Uma vez que os dados foram inseridos já podemos trabalhar sobre eles, para isso apenas temos de obter os dados através da função `zrange()` e após isso iteramos sobre essa lista.
Devo mencionar que, naquilo que é o meu entender do exercício, o autocomplete não deve ser case sensitive, apenas deve averiguar quais as palavras que começam por determinada expressão, assim, para alcançar isso recorri a duas funções do python:
* `upper()` que me permite tornar quer o input do utilizador quer o resultado do `zrange` em maiúsculas e posteriormente comparar.
* `startswith()` que me permite verificar quais as palavras que começam pelo input do utilizador.
```python
def autoComplete(inp):
	search = conn.zrange("autocomplete", 0, -1)
	for k in search:
		if str(k, "utf-8").upper().startswith(inp):
			print(str(k, "utf-8"))
	print()
```

## Parte 2
Na segunda parte deste problema foi usada a mesma lógica com apenas algumas alterações de modo a adaptar às necessidades do problema.
### Setup
No que diz respeito à inserção de dados o script é similar, foi mantida na mesma a opção de realizar flush, a única grande diferença é que neste caso não desconsideremos o valor, no exercício anterior apenas necessitávamos da key por isso mesmo é que o valor associado era indiferente, tendo colocado 0 em todos para simplificar, como, neste caso o valor é importante uma vez que é a terceira coluna do ficheiro csv temos de associar na sua inserção, deste modo, tive que fazer uma ligeira alteração ao script de inserção.
```python
def insertData():
    f = open('nomes-registados-2018.csv',"r")
    for line in f:
        conn.zadd('nomes2018', {line.strip().split(",")[0]:line.strip().split(",")[2]})

```
### Trabalhar sobre os dados