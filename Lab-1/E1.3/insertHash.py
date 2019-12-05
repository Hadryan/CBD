#encoding: UTF-8

"""
Examples used:
https://www.w3resource.com/redis/redis-hmset-key-field1-value1.php
"""

import argparse

"""
Redis drive installed on venv
The script to install redis driver
is available into the root directory.
"""
import redis

conn = redis.Redis() #Establish connection with Redis Database
def insertData():
	"""
	Data to be hashed into hashmap.
	Dict:
	     Key - Names
	     Values - Cities
	"""
	data = {"Ana": "Braga", "Pedro": "Amarante", "Maria": "Costa Nova", "Luís": "Barra"}

	"""
	Inserts all data using hset.
	Hmset uses to params, key name and fields values. 
	Example:
	>> HMSET langhash lang1 "PHP" lang2 "JavaScript" lang3 "Redis"
	OK
	"""
	conn.hmset("Users", data)

def ifEnabled():
	"""
	Gets the hashmap of the users and cities.

	Note: hgetall() only needs one parameter
	If we want hget() we must provide the key
	name and the field we want.
	Example:
	>> HGET langhash lang1
	"PHP"
	Example of getall:
	>> HGETALL langhash
	1) "lang1"
	2) "PHP"
	3) "lang2"
	4) "JavaScript"
	5) "lang3"
	6) "Redis"
	"""
	db_table = conn.hgetall("Users")
	"""
	Allow us to print the info we want.
	"""
	for k, v in db_table.items():
		print(str(k, "utf-8") +", " + str(v, "utf-8"))	

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