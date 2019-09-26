import os
count = 0
letter = "a"
flag = True

f = open("female-names.txt", "r")
while True:
    read = f.readline()
    try:
        comp = read[0]
    except:
        flag = False
    
    if (flag):
        if letter == comp or letter.upper() == comp:
            count +=1
        else:
            file= open("initials4redis.txt","a")
            file.write("SET " + letter.upper() + " " + str(count) + "\n")
            count = 0
            letter = comp
    else:
        file= open("initials4redis.txt","a")
        file.write("SET " + letter.upper() + " " + str(count) + "\n")
        letter = comp
        file.close()
        f.close()
        os.system("cat initials4redis.txt | redis-cli")
        exit()
