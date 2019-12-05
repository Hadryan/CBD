#encoding: UTF-8

import argparse
"""
Redis drive installed on venv
The script to install redis driver
is available into the root directory.
"""
import redis

"""
Allow us to insert information into
the redis database.
Open the file, read line by line
and add the line to the database.
For this case the value is completely 
meaningless so we just define it 
as 0.
"""
def insertData():
    f = open('nomes-registados-2018.csv',"r")
    for line in f:
        conn.zadd('nomes2018', {line.strip().split(",")[0]:line.strip().split(",")[2]})

if __name__ == "__main__":
	conn = redis.Redis()
	parser = argparse.ArgumentParser()
	parser.add_argument("--f", help="Clean database. 0 - Disable, 1 - Enable", default="0")
	args = parser.parse_args()
	FLUSH = args.f
	if (FLUSH == "1"): conn.flushdb()
	insertData()