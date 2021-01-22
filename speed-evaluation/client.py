import socket
import sys
import time

HOST = "10.0.120.101"
PORT = 6379


set1 = "SET key1 v1\n"
set2 = "SET key2 v2\n"
ping = "ping\n"

def longString(length):
    str = 'a'*length
    return str

mylongStr = longString(256*1024)

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:


    s.connect((HOST, PORT))

    startTime = time.time()
    s.sendall(set1.encode('utf-8'))
    data =s.recv(512)
    s.sendall(set2.encode('utf-8'))
    data =s.recv(512)
    endTime = time.time()
    received = str(data, "utf-8")
    print(f"received {received}")

    totalTime = endTime - startTime

    print(f"Total time {totalTime}")

    startTime = time.time()
    getReq = f"SET key3 {mylongStr}\n"
    s.sendall(getReq.encode('utf-8'))
    data =s.recv(512)
    endTime = time.time()
    totalTime = endTime - startTime
    print(f"Total time {totalTime}")
