#!/bin/bash
echo "Starting benchmarks"

echo "vanilla set requests"
./client 1 512 1024
./client 1 512 2048
./client 1 512 4096
./client 1 512 8192

./client 1 1024 1024
./client 1 1024 2048
./client 1 1024 4096
./client 1 1024 8192

./client 1 2048 1024
./client 1 2048 2048
./client 1 2048 4096
./client 1 2048 8192

./client 1 4096 1024
./client 1 4096 2048

./client 1 8192 1024
./client 1 8192 2048

echo "tmemPut requests"

./client 3 512 1024
./client 3 512 2048
./client 3 512 4096
./client 3 512 8192
./client 3 512 16384

./client 3 1024 1024
./client 3 1024 2048
./client 3 1024 4096
./client 3 1024 8192
./client 3 1024 16384

./client 3 2048 1024
./client 3 2048 2048
./client 3 2048 4096
./client 3 2048 8192
./client 3 2048 16384

./client 3 4096 1024
./client 3 4096 2048
./client 3 4096 4096

./client 3 8192 1024
./client 3 8192 2048
./client 3 8192 4096

./client 3 16384 1024
