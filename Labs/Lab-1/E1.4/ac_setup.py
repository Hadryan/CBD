import redis
conn = redis.Redis()
f = open('female-names.txt',"r")

for line in f:
	conn.zadd('autocomplete', {line.strip():0})
