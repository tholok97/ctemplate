#---------------------------------- VARIABLES ----------------------------------

CC=g++
CFLAGS=-Wall
INCLUDE=-Iinclude

SOURCES=$(wildcard src/*.c)
TEMP=$(patsubst %.c,%.o,$(SOURCES))
OBJECTS=$(patsubst src/%,build/%,$(TEMP))

EXE=./bin/Testprogram.out

#----------------------------------- TARGETS -----------------------------------

run: build
	$(info ######### RUNNING #########)
	@$(EXE)

tidy: build
	$(info ######### TIDYING ##########)
	clang-tidy $(SOURCES) --

build: $(EXE)

$(EXE): $(OBJECTS)
	$(info ######## BUILDING #########)
	$(CC) $(CFLAGS) $(INCLUDE) $(OBJECTS) -o $(EXE)

build/%.o: src/%.c
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

clean:
	$(info ######## CLEANING  ########)
	rm -f build/*.o
	rm -f $(EXE)

#------------------------------------ PHONY ------------------------------------

.PHONY: run tidy build clean 
