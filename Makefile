CC		:= gcc
CFLAGS	:= -std=c99 -Wall -Wextra -g

BIN		:= ./bin
SRC		:= ./src
INCL 	:= ./include
LIB		:= ./lib
OUTPUT	:= ./output
TEST	:= ./test/
TESTOUTPUT := ./test/testOutput

all: piLeib piMonte mv mm fibonacci mc-openmp

piLeib: $(SRC)/piLeib.c Makefile
	$(CC) $(CFLAGS) $(SRC)/piLeib.c -o $(BIN)/piLeib

piMonte: $(SRC)/piMonte.c Makefile
	$(CC) $(CFLAGS) $(SRC)/piMonte.c -o $(BIN)/piMonte

mc-openmp: $(SRC)/mc-openmp.c Makefile
	$(CC) $(CFLAGS) $(SRC)/mc-openmp.c -o $(BIN)/mc-openmp

mv: $(SRC)/mv.c $(LIB)/mmio.c Makefile
	$(CC) $(CFLAGS) $(SRC)/mv.c $(LIB)/mmio.c -o $(BIN)/mv

mm: $(SRC)/mm.c $(LIB)/mmio.c Makefile
	$(CC) $(CFLAGS) $(SRC)/mm.c $(LIB)/mmio.c -o $(BIN)/mm

fibonacci: $(SRC)/fibonacci.c Makefile
	$(CC) $(CFLAGS) $(SRC)/fibonacci.c -o $(BIN)/fibonacci

tests:
	-$(TEST)/unit_tests.sh test_logs.txt

clean: 
	-rm -f $(BIN)/*
	-rm -f $(OUTPUT)/*

cleanTests:
	-rm -f $(TESTOUTPUT)/*
	-rm -f diff.out
	-rm -f test_logs.txt