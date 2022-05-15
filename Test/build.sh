#!/usr/bin/env bash

nasm -f elf64 test.asm -o test.o

gcc -c main.c -o main.o

gcc main.o test.o -o a.out