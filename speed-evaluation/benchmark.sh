#!/bin/bash
echo "Starting benchmarks"

echo "vanilla set requests"
./client 1 512 1024
./client 1 512 2048
./client 1 512 4096
./client 1 512 8196

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
