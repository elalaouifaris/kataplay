#!/bin/sh
gcc -o test *.c -lcriterion
./test
rm test
